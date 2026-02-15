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
}