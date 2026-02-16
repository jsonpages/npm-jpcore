import { z } from 'zod';
import type { MenuItem } from '@jsonpages/core';
// 🛡️ Importiamo i tipi dalla nuova capsula Header
import { HeaderData, HeaderSettings } from '@/components/header';

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

// 1. Tipi inferiti per i componenti ancora "Flat"
// (Verranno rimossi man mano che creiamo le capsule)
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

// 2. Definizione Settings
export type StandardSectionSettings = z.infer<typeof BaseSectionSettingsSchema>;

export interface FooterSettings { showLogo?: boolean; }
export type CodeBlockSettings = StandardSectionSettings & { showLineNumbers?: boolean };
export type FeatureGridSettings = StandardSectionSettings & {
  columns?: number;
  cardStyle?: 'plain' | 'bordered';
};

// Alias per gli altri componenti (standard)
export type HeroSettings = StandardSectionSettings;
export type ProblemStatementSettings = StandardSectionSettings;
export type PillarsGridSettings = StandardSectionSettings;
export type ArchLayersSettings = StandardSectionSettings;
export type ProductTriadSettings = StandardSectionSettings;
export type PaSectionSettings = StandardSectionSettings;
export type PhilosophySettings = StandardSectionSettings;
export type CtaBannerSettings = StandardSectionSettings;

// 3. Section component props map — SSOT per ComponentRegistry
// 🛡️ Nota: 'header' ora usa i tipi della Capsula
export type SectionComponentPropsMap = {
  'header': { data: HeaderData; settings?: HeaderSettings; menu: MenuItem[] };
  'footer': { data: FooterData; settings?: FooterSettings };
  'hero': { data: HeroData; settings?: HeroSettings };
  'feature-grid': { data: FeatureGridData; settings?: FeatureGridSettings };
  'code-block': { data: CodeBlockData; settings?: CodeBlockSettings };
  'problem-statement': { data: ProblemStatementData; settings?: ProblemStatementSettings };
  'pillars-grid': { data: PillarsGridData; settings?: PillarsGridSettings };
  'arch-layers': { data: ArchLayersData; settings?: ArchLayersSettings };
  'product-triad': { data: ProductTriadData; settings?: ProductTriadSettings };
  'pa-section': { data: PaSectionData; settings?: PaSectionSettings };
  'philosophy': { data: PhilosophyData; settings?: PhilosophySettings };
  'cta-banner': { data: CtaBannerData; settings?: CtaBannerSettings };
};

// 4. 🔥 MTRP AUGMENTATION
// Estendiamo il Core con i tipi del Tenant. 
// L'Header è il primo a essere "Capsule-driven".
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

// 5. Re-export structural types from Core
export * from '@jsonpages/core';