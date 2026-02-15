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

  return (
    <StudioProvider mode={isBaking ? "visitor" : "studio"}>
      <div className={isBaking ? "" : "jp-ice-active"}>
        <PageRenderer 
          pageConfig={draft} 
          siteConfig={globalDraft} 
          menuConfig={currentMenuConfig}
          selectedId={isBaking ? null : selectedId}
        />
      </div>
    </StudioProvider>
  );
};

