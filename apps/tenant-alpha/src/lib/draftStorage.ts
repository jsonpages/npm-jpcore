/**
 * Tenant draft storage — same key and shape as @jsonpages/core autosave.
 * Load from localStorage when present, otherwise use file-backed data.
 */

import type { PageConfig, SiteConfig } from '@/types';

const DRAFT_KEY_PREFIX = 'jsonpages-draft';

export function getDraftStorageKey(tenantId: string, slug: string): string {
  return `${DRAFT_KEY_PREFIX}-${tenantId}-${slug}`;
}

export interface StoredDraft {
  page?: PageConfig;
  site?: SiteConfig;
}

export function readDraftFromStorage(
  tenantId: string,
  slug: string
): StoredDraft | null {
  if (typeof window === 'undefined') return null;
  try {
    const key = getDraftStorageKey(tenantId, slug);
    const raw = localStorage.getItem(key);
    if (!raw) return null;
    return JSON.parse(raw) as StoredDraft;
  } catch {
    return null;
  }
}

export interface HydratedData {
  pages: Record<string, PageConfig>;
  siteConfig: SiteConfig;
}

/**
 * Build pages and siteConfig from localStorage when a draft exists for a slug,
 * otherwise use file-backed data. Uses the same storage key as Core autosave.
 */
export function getHydratedData(
  tenantId: string,
  filePages: Record<string, PageConfig>,
  fileSiteConfig: SiteConfig
): HydratedData {
  let siteConfig = fileSiteConfig;
  const pages: Record<string, PageConfig> = {};

  for (const slug of Object.keys(filePages)) {
    const stored = readDraftFromStorage(tenantId, slug);
    if (stored?.page) {
      pages[slug] = stored.page;
      if (stored?.site) siteConfig = stored.site;
    } else {
      pages[slug] = filePages[slug];
    }
  }

  return { pages, siteConfig };
}
