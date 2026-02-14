/**
 * Engine contract: Core must not import from src/components or src/data.
 * All tenant-specific data and components are received via this config.
 */
import type React from 'react';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from './kernel';

/** Project state shape used by persistence (export JSON / bake HTML). */
export interface ProjectState {
  page: PageConfig;
  site: SiteConfig;
  menu: MenuConfig;
  theme: ThemeConfig;
}

/** Persistence API; defaults provided by Core, overridable by Tenant. */
export interface PersistenceConfig {
  exportJSON: (state: ProjectState, slug: string) => Promise<void>;
  exportHTML: (state: ProjectState, slug: string, cleanHtml: string) => void;
}

/** Theme CSS: tenant (required), admin (optional; Core can provide default). */
export interface ThemeCssConfig {
  tenant: string;
  admin?: string;
}

/** Single entry point configuration for the JsonPages Engine. */
export interface JsonPagesConfig {
  /** Component map: section type -> React component. */
  registry: Record<string, React.ComponentType<unknown>>;
  /** Zod schemas map: section type -> schema (for FormFactory / AdminSidebar). */
  schemas: Record<string, { parse: (v: unknown) => unknown; shape?: Record<string, unknown> }>;
  /** Page slug -> page config. */
  pages: Record<string, PageConfig>;
  siteConfig: SiteConfig;
  themeConfig: ThemeConfig;
  menuConfig: MenuConfig;
  /** Optional persistence; Core provides defaults if omitted. */
  persistence?: Partial<PersistenceConfig>;
  /** CSS strings for ThemeLoader; Engine injects admin CSS if admin not provided. */
  themeCss: ThemeCssConfig;
  /** Optional 404 component; Core provides default if omitted. */
  NotFoundComponent?: React.ComponentType;
}
