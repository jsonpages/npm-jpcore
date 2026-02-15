/**
 * Engine contract: Core must not import from src/components or src/data.
 */
import type React from 'react';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig, ProjectState } from './kernel';

/** Persistence API; defaults provided by Core, overridable by Tenant. */
export interface PersistenceConfig {
  exportJSON: (state: ProjectState, slug: string) => Promise<void>;
  exportHTML: (state: ProjectState, slug: string, cleanHtml: string) => void;
}

/** Theme CSS: tenant (required), admin (optional). */
export interface ThemeCssConfig {
  tenant: string;
  admin?: string;
}

/**
 * Optional config for the "Add section" library (tenant-agnostic).
 * Section types are derived from registry/schemas; tenant can customize labels and defaults.
 */
export interface AddSectionConfig {
  /** Section types that can be added to a page (order preserved). If omitted, derived from schemas excluding header/footer. */
  addableSectionTypes?: string[];
  /** Display label per section type. If omitted, type id is humanized (e.g. "feature-grid" → "Feature grid"). */
  sectionTypeLabels?: Record<string, string>;
  /** Default data for a new section of the given type. Required for add-section to produce valid sections. */
  getDefaultSectionData?: (sectionType: string) => Record<string, unknown>;
}

/** Single entry point configuration for the JsonPages Engine. */
export interface JsonPagesConfig {
  /** Unique identifier for the tenant (used for asset resolution) */
  tenantId: string;
  /** Component map: section type -> React component. */
  registry: Record<string, React.ComponentType<unknown>>;
  /** Zod schemas map: section type -> schema. */
  schemas: Record<string, { parse: (v: unknown) => unknown; shape?: Record<string, unknown> }>;
  /** Page slug -> page config. */
  pages: Record<string, PageConfig>;
  siteConfig: SiteConfig;
  themeConfig: ThemeConfig;
  menuConfig: MenuConfig;
  /** Optional persistence; Core provides defaults if omitted. */
  persistence?: Partial<PersistenceConfig>;
  /** CSS strings for ThemeLoader. */
  themeCss: ThemeCssConfig;
  /** Optional 404 component. */
  NotFoundComponent?: React.ComponentType;
  /** Optional "Add section" library config (labels, addable types, default data). */
  addSection?: AddSectionConfig;
}