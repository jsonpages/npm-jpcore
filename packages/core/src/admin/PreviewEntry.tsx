import React, { useState, useEffect } from 'react';
import { PageRenderer } from '../lib/PageRenderer';
import { StudioProvider } from '../lib/StudioContext';
import { themeManager } from '../utils/theme-manager';
import { STUDIO_EVENTS } from '../lib/events';
import type { PageConfig, SiteConfig, MenuConfig, MenuItem } from '../lib/kernel';

export const PreviewEntry: React.FC = () => {
  const [draft, setDraft] = useState<PageConfig | null>(null);
  const [globalDraft, setGlobalDraft] = useState<SiteConfig | null>(null);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [scrollToSectionId, setScrollToSectionId] = useState<string | null>(null);
  const [isBaking, setIsBaking] = useState(false);

  useEffect(() => {
    const handleMessage = (event: MessageEvent) => {
      if (event.data.type === STUDIO_EVENTS.UPDATE_DRAFTS) {
        setDraft(event.data.draft);
        setGlobalDraft(event.data.globalDraft);
        if (event.data.themeConfig) {
           themeManager.setTheme(event.data.themeConfig);
        }
      }

      if (event.data.type === STUDIO_EVENTS.SYNC_SELECTION) {
        setSelectedId(event.data.selectedId);
      }

      if (event.data.type === STUDIO_EVENTS.REQUEST_SCROLL_TO_SECTION) {
        setScrollToSectionId(event.data.sectionId ?? null);
      }

      // 🛡️ BAKE HANDSHAKE: Switch to visitor mode and send HTML back
      if (event.data.type === STUDIO_EVENTS.REQUEST_CLEAN_HTML) {
        setIsBaking(true);
        // Use setTimeout to ensure React has rendered the "Visitor" mode (no outlines)
        setTimeout(() => {
          const html = document.documentElement.outerHTML;
          window.parent.postMessage({
            type: STUDIO_EVENTS.SEND_CLEAN_HTML,
            html
          }, '*');
          setIsBaking(false);
        }, 50);
      }
    };

    window.addEventListener('message', handleMessage);
    window.parent.postMessage({ type: STUDIO_EVENTS.STAGE_READY }, '*');
    return () => window.removeEventListener('message', handleMessage);
  }, []);

  /**
   * 📍 DOCUMENT-LEVEL CLICK (iframe event propagation fix)
   * Capture clicks at document root so we always receive them regardless of
   * React tree or pointer-events. Find section + item/field and notify parent.
   */
  useEffect(() => {
    const handleDocumentClick = (e: MouseEvent) => {
      const target = e.target as HTMLElement;
      const x = e.clientX;
      const y = e.clientY;
      let sectionEl: HTMLElement | null = null;
      let el: HTMLElement | null = target;
      while (el && el !== document.body) {
        const id = el.getAttribute?.('data-section-id');
        const type = el.getAttribute?.('data-section-type');
        const scope = el.getAttribute?.('data-section-scope');
        if (id && type && scope) {
          sectionEl = el;
          break;
        }
        el = el.parentElement;
      }
      if (!sectionEl) return;
      e.preventDefault();
      e.stopPropagation();
      const sectionId = sectionEl.getAttribute('data-section-id');
      const sectionType = sectionEl.getAttribute('data-section-type');
      const sectionScope = sectionEl.getAttribute('data-section-scope');
      if (!sectionId || !sectionType || !sectionScope) return;
      const section = { id: sectionId, type: sectionType, scope: sectionScope };

      const rootAtPoint = (document.elementFromPoint(x, y) as HTMLElement) ?? target;
      if (!rootAtPoint || !sectionEl.contains(rootAtPoint)) {
        window.parent.postMessage({ type: STUDIO_EVENTS.SECTION_SELECT, section }, '*');
        return;
      }
      let itemId: string | null = null;
      let itemField: string | null = null;
      el = rootAtPoint;
      while (el && el !== sectionEl) {
        const id = el.getAttribute?.('data-jp-item-id');
        if (id) {
          itemId = id;
          itemField = el.getAttribute?.('data-jp-item-field') || 'items';
          break;
        }
        el = el.parentElement;
      }
      if (!itemField) {
        el = rootAtPoint;
        while (el && el !== sectionEl) {
          const field = el.getAttribute?.('data-jp-field');
          if (field) {
            itemField = field;
            break;
          }
          el = el.parentElement;
        }
      }
      if (!itemField && rootAtPoint) {
        let best: HTMLElement | null = null;
        const visit = (node: HTMLElement) => {
          const rect = node.getBoundingClientRect();
          if (rect.left <= x && x <= rect.right && rect.top <= y && y <= rect.bottom) {
            for (let i = 0; i < node.children.length; i++) visit(node.children[i] as HTMLElement);
            if (node.getAttribute?.('data-jp-item-id') || node.getAttribute?.('data-jp-field')) best = node;
          }
        };
        visit(rootAtPoint);
        if (best) {
          const el: HTMLElement = best;
          const id = el.getAttribute?.('data-jp-item-id');
          const field = el.getAttribute?.('data-jp-field');
          if (id) {
            itemId = id;
            itemField = field || 'items';
          } else if (field) {
            itemField = field;
          }
        }
      }
      window.parent.postMessage({
        type: STUDIO_EVENTS.SECTION_SELECT,
        section,
        ...(itemField ? { itemField, ...(itemId ? { itemId } : {}) } : {}),
      }, '*');
    };

    document.addEventListener('click', handleDocumentClick, true);
    return () => document.removeEventListener('click', handleDocumentClick, true);
  }, []);

  /** Clear scrollToSectionId after triggering scroll (must run unconditionally for Rules of Hooks). */
  useEffect(() => {
    if (!scrollToSectionId) return;
    const t = setTimeout(() => setScrollToSectionId(null), 600);
    return () => clearTimeout(t);
  }, [scrollToSectionId]);

  if (!draft || !globalDraft) {
    return (
      <div className="flex items-center justify-center h-screen w-full bg-zinc-950 text-zinc-500 font-mono text-xs uppercase tracking-widest animate-pulse">
        Waiting for Studio Signal...
      </div>
    );
  }

  const headerData = globalDraft.header?.data as { links?: MenuItem[] } | undefined;
  const currentMenuConfig: MenuConfig = {
    main: headerData?.links ?? []
  };

  const handleActiveSectionChange = (sectionId: string | null) => {
    window.parent.postMessage({
      type: STUDIO_EVENTS.ACTIVE_SECTION_CHANGED,
      activeSectionId: sectionId,
    }, '*');
  };

  return (
    <StudioProvider mode={isBaking ? "visitor" : "studio"}>
      <div className={isBaking ? "" : "jp-ice-active"}>
        <PageRenderer
          pageConfig={draft}
          siteConfig={globalDraft}
          menuConfig={currentMenuConfig}
          selectedId={isBaking ? null : selectedId}
          scrollToSectionId={scrollToSectionId}
          onActiveSectionChange={handleActiveSectionChange}
        />
      </div>
    </StudioProvider>
  );
};
