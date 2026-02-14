/**
 * Thin Entry Point (Tenant).
 * Only imports the Engine and local implementation data; passes everything via config.
 * No routing or Admin UI logic here — that lives in JsonPagesEngine.
 */
import { JsonPagesEngine } from '@jsonpages/core';
import { ComponentRegistry } from '@/lib/ComponentRegistry';
import { SECTION_SCHEMAS } from '@/lib/schemas';
import type { JsonPagesConfig } from '@jsonpages/core';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from '@/types';

// Tenant data (implementation)
import siteData from '@/data/config/site.json';
import themeData from '@/data/config/theme.json';
import menuData from '@/data/config/menu.json';
import homeData from '@/data/pages/home.json';

// Tenant CSS for ThemeLoader (Engine injects it; Tenant does not manage Admin CSS)
import tenantCss from './index.css?inline';

const siteConfig = siteData as unknown as SiteConfig;
const themeConfig = themeData as unknown as ThemeConfig;
const menuConfig = menuData as unknown as MenuConfig;

const pages: Record<string, PageConfig> = {
  home: homeData as unknown as PageConfig,
};

const config: JsonPagesConfig = {
  registry: ComponentRegistry as JsonPagesConfig['registry'],
  schemas: SECTION_SCHEMAS as unknown as JsonPagesConfig['schemas'],
  pages,
  siteConfig,
  themeConfig,
  menuConfig,
  themeCss: { tenant: tenantCss },
};

function App() {
  return <JsonPagesEngine config={config} />;
}

export default App;
