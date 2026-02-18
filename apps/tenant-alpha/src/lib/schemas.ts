/**
 * SECTION_SCHEMAS registry — SSOT for FormFactory.
 * Re-exports base schemas and aggregates all section schemas from TBP capsules.
 */
export {
  BaseSectionData,
  BaseArrayItem,
  BaseSectionSettingsSchema,
  CtaSchema,
} from './base-schemas';

import { HeaderSchema } from '@/components/header';
import { FooterSchema } from '@/components/footer';
import { HeroSchema } from '@/components/hero';
import { FeatureGridSchema } from '@/components/feature-grid';
import { CodeBlockSchema } from '@/components/code-block';
import { ProblemStatementSchema } from '@/components/problem-statement';
import { PillarsGridSchema } from '@/components/pillars-grid';
import { ArchLayersSchema } from '@/components/arch-layers';
import { ProductTriadSchema } from '@/components/product-triad';
import { PaSectionSchema } from '@/components/pa-section';
import { PhilosophySchema } from '@/components/philosophy';
import { CtaBannerSchema } from '@/components/cta-banner';
import { ImageBreakSchema } from '@/components/image-break';

export const SECTION_SCHEMAS = {
  'header': HeaderSchema,
  'footer': FooterSchema,
  'hero': HeroSchema,
  'feature-grid': FeatureGridSchema,
  'code-block': CodeBlockSchema,
  'problem-statement': ProblemStatementSchema,
  'pillars-grid': PillarsGridSchema,
  'arch-layers': ArchLayersSchema,
  'product-triad': ProductTriadSchema,
  'pa-section': PaSectionSchema,
  'philosophy': PhilosophySchema,
  'cta-banner': CtaBannerSchema,
  'image-break': ImageBreakSchema,
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;
