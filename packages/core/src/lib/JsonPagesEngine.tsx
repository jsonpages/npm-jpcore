/**
 * Sovereign Shell: routing, state, and Admin layout live in the Engine.
 */
import React, { useEffect, useState, useCallback } from 'react';
import { BrowserRouter, Routes, Route, useParams } from 'react-router-dom';
import { PageRenderer } from './PageRenderer';
import { StudioProvider } from './StudioContext';
import { ConfigProvider } from './ConfigContext';
import { ThemeLoader } from './ThemeLoader';
import { AdminSidebar } from '../admin/AdminSidebar';
import { ControlBar } from '../admin/ControlBar';
import { StudioStage } from '../admin/StudioStage';
import { PreviewEntry } from '../admin/PreviewEntry';
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

export function JsonPagesEngine({ config }: JsonPagesEngineProps) {
  const {
    registry,
    schemas,
    pages: pageRegistry,
    siteConfig,
    themeConfig,
    menuConfig,
    themeCss,
    NotFoundComponent = DefaultNotFound,
  } = config;

  const persistence = {
    exportJSON: config.persistence?.exportJSON ?? exportProjectJSON,
    exportHTML: config.persistence?.exportHTML ?? exportBakedHTML,
  };

  const tenantCss = themeCss.tenant;
  const adminCss = themeCss.admin ?? defaultAdminCss;

  const [isReady, setIsReady] = useState(false);
  useEffect(() => {
    themeManager.setTheme(themeConfig);
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
      const base = JSON.parse(JSON.stringify(siteConfig)) as SiteConfig;
      const headerData = base.header?.data as { links?: MenuItem[] } | undefined;
      if (headerData) {
        headerData.links = JSON.parse(JSON.stringify(menuConfig.main)) as MenuItem[];
      }
      return base;
    });
    const [selected, setSelected] = useState<{ id: string; type: string; scope: string } | null>(null);

    useEffect(() => {
      const data = pageRegistry[slug];
      if (data) setDraft(JSON.parse(JSON.stringify(data)));
      setSelected(null);
      setHasChanges(false);
    }, [slug, pageRegistry]);

    const handleBakeResponse = useCallback(
      (event: MessageEvent) => {
        if (event.origin !== window.location.origin) return;
        if (event.data.type === STUDIO_EVENTS.SECTION_SELECT) {
          setSelected(event.data.section);
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
      [draft, globalDraft, slug, themeConfig]
    );

    useEffect(() => {
      window.addEventListener('message', handleBakeResponse);
      return () => window.removeEventListener('message', handleBakeResponse);
    }, [handleBakeResponse]);

    const handleUpdate = (newData: Record<string, unknown>) => {
      if (!selected || !draft) return;
      setHasChanges(true);
      if (selected.scope === 'global') {
        if (selected.type === 'header') {
          setGlobalDraft({ ...globalDraft, header: { ...globalDraft.header!, data: newData } as Section });
        } else if (selected.type === 'footer') {
          setGlobalDraft({ ...globalDraft, footer: { ...globalDraft.footer!, data: newData } as Section });
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

    if (!draft) return <div>Loading Studio...</div>;

    const sidebarData =
      selected?.scope === 'global'
        ? { sections: [globalDraft.header!, globalDraft.footer!] }
        : draft;

    return (
      <ThemeLoader mode="admin" tenantCss={tenantCss} adminCss={adminCss}>
        <StudioProvider mode="studio">
          <div className="flex flex-col h-screen w-screen bg-background text-foreground overflow-hidden">
            <ControlBar
              hasChanges={hasChanges}
              onExportJSON={handleExportJSON}
              onExportHTML={triggerBake}
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
              />
            </div>
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

  if (!isReady) return null;

  return (
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
  );
}