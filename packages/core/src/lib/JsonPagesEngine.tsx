/**
 * Sovereign Shell: routing, state, and Admin layout live in the Engine.
 * Enterprise: error boundary, defensive config, and safe init to avoid black screen.
 */
import React, { useEffect, useState, useCallback, Component, ErrorInfo, ReactNode } from 'react';
import { BrowserRouter, Routes, Route, useParams } from 'react-router-dom';
import { PageRenderer } from './PageRenderer';
import { StudioProvider } from './StudioContext';
import { ConfigProvider } from './ConfigContext';
import { ThemeLoader } from './ThemeLoader';
import { AdminSidebar } from '../admin/AdminSidebar';
import { ControlBar } from '../admin/ControlBar';
import { StudioStage } from '../admin/StudioStage';
import { PreviewEntry } from '../admin/PreviewEntry';
import { AddSectionLibrary } from '../admin/AddSectionLibrary';
import { DefaultNotFound } from './DefaultNotFound';
import { themeManager } from '../utils/theme-manager';
import { STUDIO_EVENTS } from './events';
import { exportProjectJSON, exportBakedHTML } from './persistence';
import type { JsonPagesConfig } from './types-engine';
import type { PageConfig, SiteConfig, Section, MenuItem, ProjectState } from './kernel';

import defaultAdminCss from '../admin/admin-skin.css?inline';

export interface JsonPagesEngineProps {
  config: JsonPagesConfig;
}

/** Fallback admin CSS when inline import is unavailable (e.g. SSR or bundler edge case). */
const FALLBACK_ADMIN_CSS = `
:root { --background: #0f172a; --foreground: #f1f5f9; }
body { background-color: var(--background); color: var(--foreground); }
`;

/**
 * Engine-level error boundary: prevents black screen on any render error and surfaces a visible error UI.
 */
class EngineErrorBoundary extends Component<
  { children: ReactNode },
  { hasError: boolean; error: Error | null }
> {
  constructor(props: { children: ReactNode }) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error: Error) {
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error('[JsonPages Engine]', error, errorInfo);
  }

  render() {
    if (this.state.hasError && this.state.error) {
      return (
        <div
          style={{
            minHeight: '100vh',
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            padding: 24,
            backgroundColor: '#0f172a',
            color: '#e2e8f0',
            fontFamily: 'ui-sans-serif, system-ui, sans-serif',
          }}
        >
          <h1 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: 8 }}>
            JsonPages Engine Error
          </h1>
          <pre
            style={{
              maxWidth: '100%',
              overflow: 'auto',
              padding: 16,
              backgroundColor: 'rgba(0,0,0,0.3)',
              borderRadius: 8,
              fontSize: 12,
              marginTop: 8,
            }}
          >
            {this.state.error.message}
          </pre>
        </div>
      );
    }
    return this.props.children;
  }
}

export function JsonPagesEngine({ config }: JsonPagesEngineProps) {
  const {
    registry = {},
    schemas = {},
    pages: pageRegistry = {},
    siteConfig,
    themeConfig,
    menuConfig,
    themeCss,
    addSection: addSectionConfig,
    NotFoundComponent = DefaultNotFound,
  } = config;

  const addableSectionTypes: string[] =
    addSectionConfig?.addableSectionTypes ??
    (Object.keys(schemas).filter((t) => t !== 'header' && t !== 'footer') as string[]);

  const persistence = {
    exportJSON: config.persistence?.exportJSON ?? exportProjectJSON,
    exportHTML: config.persistence?.exportHTML ?? exportBakedHTML,
  };

  const tenantCss =
    typeof themeCss?.tenant === 'string' ? themeCss.tenant : '';
  const adminCss =
    typeof themeCss?.admin === 'string'
      ? themeCss.admin
      : typeof defaultAdminCss === 'string'
        ? defaultAdminCss
        : FALLBACK_ADMIN_CSS;

  const [isReady, setIsReady] = useState(false);
  useEffect(() => {
    try {
      if (themeConfig?.tokens) themeManager.setTheme(themeConfig);
    } catch (e) {
      console.warn('[JsonPages] setTheme failed', e);
    }
    setIsReady(true);
  }, [themeConfig]);

  const VisitorView: React.FC = () => {
    const { slug = 'home' } = useParams<{ slug: string }>();
    const [bakedState, setBakedState] = useState<ProjectState | null>(null);

    useEffect(() => {
      const bakedScript = document.getElementById('jp-baked-state');
      if (bakedScript?.textContent) {
        try {
          const state = JSON.parse(bakedScript.textContent) as ProjectState;
          setBakedState(state);
          themeManager.setTheme(state.theme);
        } catch (e) {
          console.error('Failed to parse baked state', e);
        }
      }
    }, []);

    const pageConfig = bakedState ? bakedState.page : pageRegistry[slug];
    const activeSiteConfig = bakedState ? bakedState.site : siteConfig;
    const activeMenuConfig = bakedState ? bakedState.menu : menuConfig;

    if (!pageConfig) return <NotFoundComponent />;

    return (
      <ThemeLoader mode="tenant" tenantCss={tenantCss} adminCss={adminCss}>
        <StudioProvider mode="visitor">
          <PageRenderer
            pageConfig={pageConfig}
            siteConfig={activeSiteConfig}
            menuConfig={activeMenuConfig}
          />
        </StudioProvider>
      </ThemeLoader>
    );
  };

  const StudioView: React.FC = () => {
    const { slug = 'home' } = useParams<{ slug: string }>();
    const [draft, setDraft] = useState<PageConfig | null>(null);
    const [hasChanges, setHasChanges] = useState(false);
    const [globalDraft, setGlobalDraft] = useState<SiteConfig>(() => {
      try {
        const base = JSON.parse(JSON.stringify(siteConfig ?? {})) as SiteConfig;
        if (!base.identity) base.identity = { title: 'Site' };
        if (!base.pages) base.pages = [];
        const headerData = base.header?.data as { links?: MenuItem[] } | undefined;
        if (headerData && menuConfig?.main) {
          headerData.links = JSON.parse(JSON.stringify(menuConfig.main)) as MenuItem[];
        }
        return base;
      } catch {
        return {
          identity: { title: 'Site' },
          pages: [],
        } as SiteConfig;
      }
    });
    const [selected, setSelected] = useState<{ id: string; type: string; scope: string } | null>(null);
    const [addSectionLibraryOpen, setAddSectionLibraryOpen] = useState(false);

    useEffect(() => {
      const data = pageRegistry[slug];
      if (data) setDraft(JSON.parse(JSON.stringify(data)));
      setSelected(null);
      setHasChanges(false);
    }, [slug, pageRegistry]);

    const handleReorderSection = useCallback(
      (sectionId: string, newIndex: number, currentDraft: PageConfig) => {
        const sections = [...currentDraft.sections];
        const currentIndex = sections.findIndex((s) => s.id === sectionId);
        if (currentIndex === -1 || newIndex < 0 || newIndex >= sections.length) return;
        const [removed] = sections.splice(currentIndex, 1);
        const insertIndex = newIndex > currentIndex ? newIndex - 1 : newIndex;
        sections.splice(Math.min(insertIndex, sections.length), 0, removed);
        setDraft({ ...currentDraft, sections });
        setHasChanges(true);
      },
      []
    );

    const handleBakeResponse = useCallback(
      (event: MessageEvent) => {
        if (event.origin !== window.location.origin) return;
        if (event.data.type === STUDIO_EVENTS.SECTION_SELECT) {
          setSelected(event.data.section);
        }
        if (event.data.type === STUDIO_EVENTS.SECTION_REORDER && draft) {
          const { sectionId, newIndex } = event.data as { sectionId?: string; newIndex?: number };
          if (typeof sectionId === 'string' && typeof newIndex === 'number' && newIndex >= 0) {
            handleReorderSection(sectionId, newIndex, draft);
          }
        }
        if (event.data.type === STUDIO_EVENTS.SEND_CLEAN_HTML) {
          if (!draft) return;
          const headerData = globalDraft.header?.data as { links?: MenuItem[] } | undefined;
          const projectState: ProjectState = {
            page: draft,
            site: globalDraft,
            menu: { main: headerData?.links ?? [] },
            theme: themeConfig,
          };
          persistence.exportHTML(projectState, slug, event.data.html);
          setHasChanges(false);
        }
      },
      [draft, globalDraft, slug, themeConfig, handleReorderSection]
    );

    useEffect(() => {
      window.addEventListener('message', handleBakeResponse);
      return () => window.removeEventListener('message', handleBakeResponse);
    }, [handleBakeResponse]);

    const handleUpdate = (newData: Record<string, unknown>) => {
      if (!selected || !draft) return;
      setHasChanges(true);
      if (selected.scope === 'global') {
        if (selected.type === 'header' && globalDraft.header != null) {
          setGlobalDraft({ ...globalDraft, header: { ...globalDraft.header, data: newData } as Section });
        } else if (selected.type === 'footer' && globalDraft.footer != null) {
          setGlobalDraft({ ...globalDraft, footer: { ...globalDraft.footer, data: newData } as Section });
        }
      } else {
        const updatedSections = draft.sections.map((s) =>
          s.id === selected.id ? ({ ...s, data: newData } as Section) : s
        );
        setDraft({ ...draft, sections: updatedSections });
      }
    };

    const triggerBake = () => {
      const iframe = document.querySelector('iframe');
      iframe?.contentWindow?.postMessage({ type: STUDIO_EVENTS.REQUEST_CLEAN_HTML }, '*');
    };

    const handleExportJSON = () => {
      if (!draft) return;
      const headerData = globalDraft.header?.data as { links?: MenuItem[] } | undefined;
      const projectState: ProjectState = {
        page: draft,
        site: globalDraft,
        menu: { main: headerData?.links ?? [] },
        theme: themeConfig,
      };
      persistence.exportJSON(projectState, slug);
      setHasChanges(false);
    };

    const handleAddSection = (sectionType: string) => {
      if (!draft) return;
      const defaultData =
        addSectionConfig?.getDefaultSectionData?.(sectionType) ?? {};
      const newSection = {
        id: crypto.randomUUID(),
        type: sectionType,
        data: defaultData,
        settings: undefined,
      } as Section;
      setDraft({
        ...draft,
        sections: [...draft.sections, newSection],
      });
      setHasChanges(true);
      setSelected({ id: newSection.id, type: sectionType, scope: 'local' });
    };

    if (!draft) return <div>Loading Studio...</div>;

    const sidebarData =
      selected?.scope === 'global'
        ? { sections: [globalDraft.header, globalDraft.footer].filter((s): s is Section => s != null) }
        : draft;

    return (
      <ThemeLoader mode="admin" tenantCss={tenantCss} adminCss={adminCss}>
        <StudioProvider mode="studio">
          <div className="flex flex-col h-screen w-screen bg-background text-foreground overflow-hidden">
            <ControlBar
              hasChanges={hasChanges}
              onExportJSON={handleExportJSON}
              onExportHTML={triggerBake}
              onAddSection={
                addableSectionTypes.length > 0
                  ? () => setAddSectionLibraryOpen(true)
                  : undefined
              }
            />
            <div className="flex flex-1 overflow-hidden">
              <main className="flex-1 relative bg-zinc-900/50 overflow-hidden">
                <StudioStage
                  draft={draft}
                  globalDraft={globalDraft}
                  themeConfig={themeConfig}
                  slug={slug}
                  selectedId={selected?.id}
                />
              </main>
              <AdminSidebar
                selectedSection={selected}
                pageData={sidebarData}
                onUpdate={handleUpdate}
                onClose={() => setSelected(null)}
                onReorderSection={
                  draft && selected?.scope === 'local'
                    ? (sectionId, newIndex) => handleReorderSection(sectionId, newIndex, draft)
                    : undefined
                }
              />
            </div>
            <AddSectionLibrary
              open={addSectionLibraryOpen}
              onClose={() => setAddSectionLibraryOpen(false)}
              sectionTypes={addableSectionTypes}
              sectionTypeLabels={addSectionConfig?.sectionTypeLabels}
              onSelect={handleAddSection}
            />
          </div>
        </StudioProvider>
      </ThemeLoader>
    );
  };

  const PreviewView: React.FC = () => (
    <ThemeLoader mode="tenant" tenantCss={tenantCss} adminCss={adminCss}>
      <PreviewEntry />
    </ThemeLoader>
  );

  if (!isReady) {
    return (
      <div
        style={{
          minHeight: '100vh',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          backgroundColor: '#0f172a',
          color: '#94a3b8',
          fontFamily: 'ui-sans-serif, system-ui, sans-serif',
          fontSize: 14,
        }}
      >
        Loading…
      </div>
    );
  }

  return (
    <EngineErrorBoundary>
      <ConfigProvider config={{ registry, schemas }}>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<VisitorView />} />
            <Route path="/:slug" element={<VisitorView />} />
            <Route path="/admin" element={<StudioView />} />
            <Route path="/admin/:slug" element={<StudioView />} />
            <Route path="/admin/preview/:slug" element={<PreviewView />} />
            <Route path="*" element={<NotFoundComponent />} />
          </Routes>
        </BrowserRouter>
      </ConfigProvider>
    </EngineErrorBoundary>
  );
}