import JSZip from 'jszip';
import { saveAs } from 'file-saver';
import type { PageConfig, SiteConfig, MenuConfig, ThemeConfig } from './kernel';

interface ProjectState {
  page: PageConfig;
  site: SiteConfig;
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
 * Now accepts the cleanHtml string captured from the Iframe.
 */
export const exportBakedHTML = (state: ProjectState, slug: string, cleanHtml: string) => {
  // 1. Create the State Payload for hydration
  const payload = JSON.stringify(state);
  const injectionScript = `<script id="jp-baked-state" type="application/json">${payload}</script>`;

  // 2. Inject the payload into the captured <head>
  const bakedHtml = cleanHtml.replace(
    '</head>', 
    `${injectionScript}</head>`
  );

  // 3. Create Blob & Download
  const blob = new Blob([`<!DOCTYPE html>${bakedHtml}`], { type: "text/html;charset=utf-8" });
  saveAs(blob, `${slug}.html`);
};

