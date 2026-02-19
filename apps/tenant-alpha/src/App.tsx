/**
 * Thin Entry Point (Tenant).
 * Data from getHydratedData (file-backed or draft); assets from public/assets/images.
 */
import { useState, useEffect } from 'react';
import { JsonPagesEngine } from '@jsonpages/core';
import type { LibraryImageEntry } from '@jsonpages/core';
import { ComponentRegistry } from '@/lib/ComponentRegistry';
import { SECTION_SCHEMAS } from '@/lib/schemas';
import { addSectionConfig } from '@/lib/addSectionConfig';
import { getHydratedData } from '@/lib/draftStorage';
import type { JsonPagesConfig, ProjectState } from '@jsonpages/core';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from '@/types';

import siteData from '@/data/config/site.json';
import themeData from '@/data/config/theme.json';
import menuData from '@/data/config/menu.json';
import homeData from '@/data/pages/home.json';

import tenantCss from './index.css?inline';

const themeConfig = themeData as unknown as ThemeConfig;
const menuConfig = menuData as unknown as MenuConfig;

const TENANT_ID = 'alpha';
const filePages: Record<string, PageConfig> = {
  home: homeData as unknown as PageConfig,
};
const fileSiteConfig = siteData as unknown as SiteConfig;

const MAX_UPLOAD_SIZE_BYTES = 5 * 1024 * 1024; // 5MB, must match server

function getInitialData() {
  return getHydratedData(TENANT_ID, filePages, fileSiteConfig);
}

function App() {
  const [{ pages, siteConfig }] = useState(getInitialData);
  const [assetsManifest, setAssetsManifest] = useState<LibraryImageEntry[]>([]);

  useEffect(() => {
    fetch('/api/list-assets')
      .then((r) => (r.ok ? r.json() : []))
      .then((list: LibraryImageEntry[]) => setAssetsManifest(Array.isArray(list) ? list : []))
      .catch(() => setAssetsManifest([]));
  }, []);

  const config: JsonPagesConfig = {
    tenantId: TENANT_ID,
    registry: ComponentRegistry as JsonPagesConfig['registry'],
    schemas: SECTION_SCHEMAS as unknown as JsonPagesConfig['schemas'],
    pages,
    siteConfig,
    themeConfig,
    menuConfig,
    themeCss: { tenant: tenantCss },
    addSection: addSectionConfig,
    persistence: {
      async saveToFile(state: ProjectState, slug: string): Promise<void> {
        const res = await fetch('/api/save-to-file', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ projectState: state, slug }),
        });
        const body = (await res.json().catch(() => ({}))) as { error?: string };
        if (!res.ok) {
          throw new Error(body.error ?? `Save to file failed: ${res.status}`);
        }
      },
    },
    assets: {
      assetsBaseUrl: '/assets',
      assetsManifest,
      async onAssetUpload(file: File): Promise<string> {
        if (!file.type.startsWith('image/')) {
          throw new Error('Invalid file type. Allowed: JPEG, PNG, WebP, GIF, SVG, AVIF.');
        }
        if (file.size > MAX_UPLOAD_SIZE_BYTES) {
          throw new Error(`File too large. Maximum size is ${MAX_UPLOAD_SIZE_BYTES / 1024 / 1024}MB.`);
        }
        const base64 = await new Promise<string>((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => {
            const dataUrl = reader.result as string;
            const b64 = dataUrl.includes(',') ? dataUrl.split(',')[1] : '';
            resolve(b64 || '');
          };
          reader.onerror = () => reject(reader.error);
          reader.readAsDataURL(file);
        });
        const res = await fetch('/api/upload-asset', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            filename: file.name,
            mimeType: file.type || undefined,
            data: base64,
          }),
        });
        const body = (await res.json().catch(() => ({}))) as { url?: string; error?: string };
        if (!res.ok) {
          throw new Error(body.error || `Upload failed: ${res.status}`);
        }
        if (typeof body.url !== 'string') {
          throw new Error('Invalid server response: missing url');
        }
        return body.url;
      },
    },
  };

  return <JsonPagesEngine config={config} />;
}

export default App;