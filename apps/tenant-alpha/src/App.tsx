/**
 * Thin Entry Point (Tenant).
 */
import { useState, useEffect } from 'react';
import { JsonPagesEngine } from '@jsonpages/core';
import type { LibraryImageEntry } from '@jsonpages/core';
import { ComponentRegistry } from '@/lib/ComponentRegistry';
import { SECTION_SCHEMAS } from '@/lib/schemas';
import { addSectionConfig } from '@/lib/addSectionConfig';
import type { JsonPagesConfig } from '@jsonpages/core';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from '@/types';

// Tenant data
import siteData from '@/data/config/site.json';
import themeData from '@/data/config/theme.json';
import menuData from '@/data/config/menu.json';
import homeData from '@/data/pages/home.json';

// Tenant CSS
import tenantCss from './index.css?inline';

const siteConfig = siteData as unknown as SiteConfig;
const themeConfig = themeData as unknown as ThemeConfig;
const menuConfig = menuData as unknown as MenuConfig;

const pages: Record<string, PageConfig> = {
  home: homeData as unknown as PageConfig,
};

function App() {
  const [assetsManifest, setAssetsManifest] = useState<LibraryImageEntry[]>([]);

  // #region agent log
  useEffect(() => {
    fetch('http://127.0.0.1:7588/ingest/86d71502-47e1-433c-9b6d-5a1390d00813',{method:'POST',headers:{'Content-Type':'application/json','X-Debug-Session-Id':'34bba5'},body:JSON.stringify({sessionId:'34bba5',location:'App.tsx',message:'App mounted',data:{},timestamp:Date.now(),hypothesisId:'H1,H3'})}).catch(()=>{});
    const onSubmit = (e: Event) => {
      fetch('http://127.0.0.1:7588/ingest/86d71502-47e1-433c-9b6d-5a1390d00813',{method:'POST',headers:{'Content-Type':'application/json','X-Debug-Session-Id':'34bba5'},body:JSON.stringify({sessionId:'34bba5',location:'App.tsx:submit',message:'form submit captured',data:{targetTag:(e.target as HTMLElement)?.tagName},timestamp:Date.now(),hypothesisId:'H4'})}).catch(()=>{});
    };
    document.addEventListener('submit', onSubmit, true);
    return () => document.removeEventListener('submit', onSubmit, true);
  }, []);
  // #endregion

  useEffect(() => {
    fetch('/api/list-assets')
      .then((r) => (r.ok ? r.json() : []))
      .then((list: LibraryImageEntry[]) => setAssetsManifest(Array.isArray(list) ? list : []))
      .catch(() => setAssetsManifest([]));
  }, []);

  const config: JsonPagesConfig = {
    tenantId: 'alpha',
    registry: ComponentRegistry as JsonPagesConfig['registry'],
    schemas: SECTION_SCHEMAS as unknown as JsonPagesConfig['schemas'],
    pages,
    siteConfig,
    themeConfig,
    menuConfig,
    themeCss: { tenant: tenantCss },
    addSection: addSectionConfig,
    persistence: {
      async flushUploadedAssets(urls: string[]): Promise<Record<string, string>> {
        const res = await fetch('/api/flush-uploaded-assets', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ urls }),
        });
        if (!res.ok) throw new Error(`Flush failed: ${res.status}`);
        const { urlMap } = (await res.json()) as { urlMap?: Record<string, string> };
        return urlMap ?? {};
      },
    },
    assets: {
      assetsBaseUrl: '/assets',
      assetsManifest,
      async onAssetUpload(file: File): Promise<string> {
      // #region agent log
      fetch('http://127.0.0.1:7588/ingest/86d71502-47e1-433c-9b6d-5a1390d00813',{method:'POST',headers:{'Content-Type':'application/json','X-Debug-Session-Id':'34bba5'},body:JSON.stringify({sessionId:'34bba5',location:'App.tsx:onAssetUpload',message:'onAssetUpload entry',data:{fileName:file.name},timestamp:Date.now(),hypothesisId:'H2,H5'})}).catch(()=>{});
      // #endregion
      const base64 = await new Promise<string>((resolve, reject) => {
        const reader = new FileReader();
        reader.onload = () => {
          const dataUrl = reader.result as string;
          const base64 = dataUrl.includes(',') ? dataUrl.split(',')[1] : '';
          resolve(base64 || '');
        };
        reader.onerror = () => reject(reader.error);
        reader.readAsDataURL(file);
      });
      const res = await fetch('/api/upload-asset', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ filename: file.name, mimeType: file.type || undefined, data: base64 }),
      });
      if (!res.ok) {
        const err = await res.json().catch(() => ({}));
        throw new Error((err as { error?: string }).error || `Upload failed: ${res.status}`);
      }
      const { url } = (await res.json()) as { url: string };
      // In-memory upload only: do not update assetsManifest here to avoid reload.
      // Preview in Upload tab uses this URL; Library tab will get new items on next list-assets load.
      // Disk write can be added later on Save.
      return url;
    },
  },
  };

  return <JsonPagesEngine config={config} />;
}

export default App;