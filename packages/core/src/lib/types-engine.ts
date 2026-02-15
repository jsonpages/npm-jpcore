/**
 * Engine contract: Core must not import from src/components or src/data.
 */
import type React from 'react';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from './kernel';

export interface ProjectState {
  page: PageConfig;
  site: SiteConfig;
  menu: MenuConfig;
  theme: ThemeConfig;
}

export interface PersistenceConfig {
  exportJSON: (state: ProjectState, slug: string) => Promise<void>;
  exportHTML: (state: ProjectState, slug: string, cleanHtml: string) => void;
}

export interface ThemeCssConfig {
  tenant: string;
  admin?: string;
}

export interface JsonPagesConfig {
  /** Unique identifier for the tenant (used for asset resolution) */
  tenantId: string;
  registry: Record<string, React.ComponentType<unknown>>;
  schemas: Record<string, { parse: (v: unknown) => unknown; shape?: Record<string, unknown> }>;
  pages: Record<string, PageConfig>;
  siteConfig: SiteConfig;
  themeConfig: ThemeConfig;
  menuConfig: MenuConfig;
  persistence?: Partial<PersistenceConfig>;
  themeCss: ThemeCssConfig;
  NotFoundComponent?: React.ComponentType;
}