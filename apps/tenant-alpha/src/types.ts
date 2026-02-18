import type { MenuItem } from '@jsonpages/core';
import type { HeaderData, HeaderSettings } from '@/components/header';
import type { FooterData, FooterSettings } from '@/components/footer';
import type { HeroData, HeroSettings } from '@/components/hero';
import type { FeatureGridData, FeatureGridSettings } from '@/components/feature-grid';
import type { CodeBlockData, CodeBlockSettings } from '@/components/code-block';
import type { ProblemStatementData, ProblemStatementSettings } from '@/components/problem-statement';
import type { PillarsGridData, PillarsGridSettings } from '@/components/pillars-grid';
import type { ArchLayersData, ArchLayersSettings } from '@/components/arch-layers';
import type { ProductTriadData, ProductTriadSettings } from '@/components/product-triad';
import type { PaSectionData, PaSectionSettings } from '@/components/pa-section';
import type { PhilosophyData, PhilosophySettings } from '@/components/philosophy';
import type { CtaBannerData, CtaBannerSettings } from '@/components/cta-banner';
import type { ImageBreakData, ImageBreakSettings } from '@/components/image-break';

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
  'image-break': { data: ImageBreakData; settings?: ImageBreakSettings };
};

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
    'image-break': ImageBreakData;
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
    'image-break': ImageBreakSettings;
  }
}

export * from '@jsonpages/core';
