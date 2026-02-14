import { z } from 'zod';
import {
  BaseSectionSettingsSchema,
  HeroSchema,
  FeatureGridSchema,
  CodeBlockSchema,
  ProblemStatementSchema,
  PillarsGridSchema,
  ArchLayersSchema,
  ProductTriadSchema,
  PaSectionSchema,
  PhilosophySchema,
  CtaBannerSchema,
  SECTION_SCHEMAS,
} from './lib/schemas';

// 1. Core types are augmented via declare module '@jsonpages/core' below.

// 2. Inferiamo i tipi Zod (Il Contenuto)
export type HeaderData = z.infer<typeof SECTION_SCHEMAS.header>;
export type FooterData = z.infer<typeof SECTION_SCHEMAS.footer>;
export type HeroData = z.infer<typeof HeroSchema>;
export type FeatureGridData = z.infer<typeof FeatureGridSchema>;
export type CodeBlockData = z.infer<typeof CodeBlockSchema>;
export type ProblemStatementData = z.infer<typeof ProblemStatementSchema>;
export type PillarsGridData = z.infer<typeof PillarsGridSchema>;
export type ArchLayersData = z.infer<typeof ArchLayersSchema>;
export type ProductTriadData = z.infer<typeof ProductTriadSchema>;
export type PaSectionData = z.infer<typeof PaSectionSchema>;
export type PhilosophyData = z.infer<typeof PhilosophySchema>;
export type CtaBannerData = z.infer<typeof CtaBannerSchema>;

// 3. Definiamo i Settings (Standard + Specifici)
export type StandardSectionSettings = z.infer<typeof BaseSectionSettingsSchema>;

export interface HeaderSettings { sticky?: boolean; }
export interface FooterSettings { showLogo?: boolean; }
export type CodeBlockSettings = StandardSectionSettings & { showLineNumbers?: boolean };

// 🔥 FIX: Ripristino delle proprietà specifiche per FeatureGrid (Legacy Component)
export type FeatureGridSettings = StandardSectionSettings & {
  columns?: number;
  cardStyle?: 'plain' | 'bordered';
};

// Alias per gli altri componenti (che usano solo settings standard)
export type HeroSettings = StandardSectionSettings;
export type ProblemStatementSettings = StandardSectionSettings;
export type PillarsGridSettings = StandardSectionSettings;
export type ArchLayersSettings = StandardSectionSettings;
export type ProductTriadSettings = StandardSectionSettings;
export type PaSectionSettings = StandardSectionSettings;
export type PhilosophySettings = StandardSectionSettings;
export type CtaBannerSettings = StandardSectionSettings;


// 4. 🔥 MTRP AUGMENTATION — augment core's registries so Section includes tenant section types
declare module '@jsonpages/core' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    'footer': FooterData;
    'hero': HeroData;
    'feature-grid': FeatureGridData;
    'code-block': CodeBlockData;
    'problem-statement': ProblemStatementData;
    'pillars-grid': PillarsGridData;
    'arch-layers': ArchLayersData;
    'product-triad': ProductTriadData;
    'pa-section': PaSectionData;
    'philosophy': PhilosophyData;
    'cta-banner': CtaBannerData;
  }

  export interface SectionSettingsRegistry {
    'header': HeaderSettings;
    'footer': FooterSettings;
    'hero': HeroSettings;
    'feature-grid': FeatureGridSettings;
    'code-block': CodeBlockSettings;
    'problem-statement': ProblemStatementSettings;
    'pillars-grid': PillarsGridSettings;
    'arch-layers': ArchLayersSettings;
    'product-triad': ProductTriadSettings;
    'pa-section': PaSectionSettings;
    'philosophy': PhilosophySettings;
    'cta-banner': CtaBannerSettings;
  }
}

// 5. Re-export structural types from Core (do not redefine here)
export * from '@jsonpages/core';

