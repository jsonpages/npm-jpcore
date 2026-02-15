import JSZip from 'jszip';
import { saveAs } from 'file-saver';
import type { PageConfig, SiteConfig, MenuConfig, ThemeConfig, ProjectState } from './kernel';

/**
 * 🍞 BAKED STATE (Optimized subset for the static HTML artifact)
 */
export interface BakedState {
  page: PageConfig;
  site: Omit<SiteConfig, 'pages'>; 
  menu: MenuConfig;
  theme: ThemeConfig;
}

/**
 * 💾 EXPORT JSON (The Developer Handover)
 */
export const exportProjectJSON = async (state: ProjectState, slug: string) => {
  const zip = new JSZip();
  const config = zip.folder("config");
  config?.file("site.json", JSON.stringify(state.site, null, 2));
  config?.file("theme.json", JSON.stringify(state.theme, null, 2));
  config?.file("menu.json", JSON.stringify(state.menu, null, 2));

  const pages = zip.folder("pages");
  pages?.file(`${slug}.json`, JSON.stringify(state.page, null, 2));

  const content = await zip.generateAsync({ type: "blob" });
  saveAs(content, `jsonpages-project-${slug}-${Date.now()}.zip`);
};

/**
 * 🍞 BAKE HTML (The Single File Artifact)
 */
export const exportBakedHTML = (state: ProjectState, slug: string, cleanHtml: string) => {
  const { pages, ...siteWithoutSitemap } = state.site;
  
  const bakedState: BakedState = {
    page: state.page,
    site: siteWithoutSitemap,
    menu: state.menu,
    theme: state.theme,
  };

  const payload = JSON.stringify(bakedState);
  const injectionScript = `<script id="jp-baked-state" type="application/json">${payload}</script>`;

  const bakedHtml = cleanHtml.replace(
    '</head>', 
    `${injectionScript}</head>`
  );

  const blob = new Blob([`<!DOCTYPE html>${bakedHtml}`], { type: "text/html;charset=utf-8" });
  saveAs(blob, `${slug}.html`);
};