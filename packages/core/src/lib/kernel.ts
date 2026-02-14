/**
 * 🛡️ KERNEL: The Base Contract (MTRP)
 * Core is self-contained; structural types live here. Section is the computed union from the registry.
 */
export interface BaseSectionSettings {
  [key: string]: unknown;
}

export interface SectionDataRegistry {}
export interface SectionSettingsRegistry {}

export interface BaseSection<K extends keyof SectionDataRegistry> {
  id: string;
  type: K;
  data: SectionDataRegistry[K];
  settings?: K extends keyof SectionSettingsRegistry
    ? SectionSettingsRegistry[K]
    : BaseSectionSettings;
}

/** Structural shape used when no tenant has augmented the registries (core builds in isolation). */
export interface FallbackSection {
  id: string;
  type: string;
  data: Record<string, unknown>;
  settings?: Record<string, unknown>;
}

/** Computed union of all registered section types (augmented by Tenant via declare module). */
export type Section =
  keyof SectionDataRegistry extends never
    ? FallbackSection
    : { [K in keyof SectionDataRegistry]: BaseSection<K> }[keyof SectionDataRegistry];

export type SectionType = keyof SectionDataRegistry extends never ? string : keyof SectionDataRegistry;

// =============================================================================
// STRUCTURAL TYPES (Base; no dependency on @/types)
// =============================================================================

export interface MenuItem {
  label: string;
  href: string;
  icon?: string;
  external?: boolean;
  isCta?: boolean;
  children?: MenuItem[];
}

export interface MenuConfig {
  main: MenuItem[];
}

export interface PageMeta {
  title: string;
  description: string;
}

export interface PageConfig {
  id: string;
  slug: string;
  meta: PageMeta;
  sections: Section[];
}

export interface SiteIdentity {
  title: string;
  logoUrl?: string;
}

export interface SitePageEntry {
  slug: string;
  label: string;
}

export interface SiteConfig {
  identity: SiteIdentity;
  header: Section;
  footer: Section;
  pages: SitePageEntry[];
}

export interface ThemeColors {
  primary: string;
  secondary: string;
  accent: string;
  background: string;
  surface: string;
  surfaceAlt: string;
  text: string;
  textMuted: string;
  border: string;
}

export interface ThemeTypography {
  fontFamily: {
    primary: string;
    mono: string;
    display?: string;
  };
}

export interface ThemeBorderRadius {
  sm: string;
  md: string;
  lg: string;
}

export interface ThemeTokens {
  colors: ThemeColors;
  typography: ThemeTypography;
  borderRadius: ThemeBorderRadius;
}

export interface ThemeConfig {
  name: string;
  tokens: ThemeTokens;
}

export interface PageRendererProps {
  pageConfig: PageConfig;
  siteConfig: SiteConfig;
  menuConfig: MenuConfig;
  selectedId?: string | null;
}


