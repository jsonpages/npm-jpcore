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
    assets: {
      assetsBaseUrl: '/assets',
      assetsManifest,
      async onAssetUpload(file: File): Promise<string> {
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
      const id = url.split('/').pop() ?? url;
      setAssetsManifest((prev) => [...prev, { id, url, alt: file.name, tags: [] }]);
      return url;
    },
  },
  };

  return <JsonPagesEngine config={config} />;
}

export default App;