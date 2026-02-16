import { z } from 'zod';
// 🛡️ Importiamo lo schema dalla capsula Header
import { HeaderSchema } from '@/components/header';

// =============================================================================
// 0. BASE SCHEMAS (Governance)
// =============================================================================
const BaseSectionData = z.object({
  anchorId: z.string().optional().describe('ui:text'),
});

const BaseArrayItem = z.object({
  id: z.string().optional(), 
});

// =============================================================================
// 1. SETTINGS SCHEMAS (CIP v1.2) — 🔴 IMMUTABLE
// =============================================================================
export const BaseSectionSettingsSchema = z.object({
  paddingTop: z.enum(['none', 'sm', 'md', 'lg', 'xl', '2xl']).default('md').describe('ui:select'),
  paddingBottom: z.enum(['none', 'sm', 'md', 'lg', 'xl', '2xl']).default('md').describe('ui:select'),
  theme: z.enum(['dark', 'light', 'accent']).default('dark').describe('ui:select'),
  container: z.enum(['boxed', 'fluid']).default('boxed').describe('ui:select'),
});

// =============================================================================
// 2. SHARED SUB-SCHEMAS
// =============================================================================
const CtaSchema = z.object({
  label: z.string().describe('ui:text'),
  href: z.string().describe('ui:text'),
  variant: z.enum(['primary', 'secondary']).default('primary').describe('ui:select'),
});

// =============================================================================
// 3. HERO
// =============================================================================
const HeroMetricSchema = z.object({
  val: z.string().describe('ui:text'),
  label: z.string().describe('ui:text'),
});

export const HeroSchema = BaseSectionData.extend({
  badge: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  titleHighlight: z.string().optional().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  ctas: z.array(CtaSchema).optional().describe('ui:list'),
  metrics: z.array(HeroMetricSchema).optional().describe('ui:list'),
});

// =============================================================================
// 4. FEATURE GRID
// =============================================================================
export const FeatureCardSchema = BaseArrayItem.extend({
  icon: z.string().optional().describe('ui:icon-picker'),
  emoji: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

export const FeatureGridSchema = BaseSectionData.extend({
  sectionTitle: z.string().describe('ui:text'),
  cards: z.array(FeatureCardSchema).describe('ui:list'),
});

// =============================================================================
// 5. CODE BLOCK
// =============================================================================
export const LegacyCodeLineSchema = z.object({
  content: z.string().describe('ui:text'),
  isComment: z.boolean().default(false).describe('ui:checkbox'),
});

export const CodeBlockSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  lines: z.array(LegacyCodeLineSchema).describe('ui:list'),
});

// =============================================================================
// 6. PROBLEM STATEMENT
// =============================================================================
const SiloBlockVariantSchema = z.enum(['red', 'amber', 'green', 'blue']);
export type SiloBlockVariant = z.infer<typeof SiloBlockVariantSchema>;

const SiloBlockSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
  variant: SiloBlockVariantSchema.describe('ui:select'),
});

const SiloGroupSchema = z.object({
  blocks: z.array(SiloBlockSchema).describe('ui:list'),
  label: z.string().describe('ui:text'),
});

const ProblemParagraphSchema = z.object({
  text: z.string().describe('ui:textarea'),
  isBold: z.boolean().default(false).describe('ui:checkbox'),
});

export const ProblemStatementSchema = BaseSectionData.extend({
  siloGroups: z.array(SiloGroupSchema).describe('ui:list'),
  title: z.string().describe('ui:text'),
  paragraphs: z.array(ProblemParagraphSchema).describe('ui:list'),
  highlight: z.string().optional().describe('ui:text'),
});

// =============================================================================
// 7. PILLARS GRID
// =============================================================================
const PillarIconVariantSchema = z.enum(['split', 'registry', 'federation']);
export type PillarIconVariant = z.infer<typeof PillarIconVariantSchema>;
const PillarTagVariantSchema = z.enum(['core', 'pattern', 'enterprise']);
export type PillarTagVariant = z.infer<typeof PillarTagVariantSchema>;

const PillarCardSchema = BaseArrayItem.extend({
  icon: z.string().describe('ui:text'),
  iconVariant: PillarIconVariantSchema.describe('ui:select'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  tag: z.string().describe('ui:text'),
  tagVariant: PillarTagVariantSchema.describe('ui:select'),
});

export const PillarsGridSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  pillars: z.array(PillarCardSchema).describe('ui:list'),
});

// =============================================================================
// 8. ARCH LAYERS
// =============================================================================
const ArchLayerLevelSchema = z.enum(['l0', 'l1', 'l2']);
export type ArchLayerLevel = z.infer<typeof ArchLayerLevelSchema>;
const SyntaxTokenTypeSchema = z.enum(['plain', 'keyword', 'type', 'string', 'comment', 'operator']);
export type SyntaxTokenType = z.infer<typeof SyntaxTokenTypeSchema>;

const ArchLayerItemSchema = BaseArrayItem.extend({
  number: z.string().describe('ui:text'),
  layerLevel: ArchLayerLevelSchema.describe('ui:select'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

const SyntaxLineSchema = z.object({
  content: z.string().describe('ui:text'),
  tokenType: SyntaxTokenTypeSchema.default('plain').describe('ui:select'),
});

export const ArchLayersSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  layers: z.array(ArchLayerItemSchema).describe('ui:list'),
  codeFilename: z.string().optional().describe('ui:text'),
  codeLines: z.array(SyntaxLineSchema).optional().describe('ui:list'),
});

// =============================================================================
// 9. PRODUCT TRIAD
// =============================================================================
const ProductFeatureSchema = z.object({
  text: z.string().describe('ui:text'),
});

const ProductCardSchema = BaseArrayItem.extend({
  tier: z.string().describe('ui:text'),
  name: z.string().describe('ui:text'),
  price: z.string().describe('ui:text'),
  priceSuffix: z.string().optional().describe('ui:text'),
  delivery: z.string().describe('ui:text'),
  features: z.array(ProductFeatureSchema).describe('ui:list'),
  featured: z.boolean().default(false).describe('ui:checkbox'),
  ctaLabel: z.string().optional().describe('ui:text'),
  ctaHref: z.string().optional().describe('ui:text'),
  ctaVariant: z.enum(['primary', 'secondary']).default('secondary').describe('ui:select'),
});

export const ProductTriadSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  products: z.array(ProductCardSchema).describe('ui:list'),
});

// =============================================================================
// 10. PA SECTION
// =============================================================================
const PaBadgeSchema = z.object({
  label: z.string().describe('ui:text'),
});

const PaEngineSchema = z.object({
  label: z.string().describe('ui:text'),
  variant: z.enum(['tailwind', 'bootstrap']).describe('ui:select'),
});

export const PaSectionSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  subtitle: z.string().describe('ui:text'),
  paragraphs: z.array(z.object({ text: z.string().describe('ui:textarea') })).describe('ui:list'),
  badges: z.array(PaBadgeSchema).optional().describe('ui:list'),
  engines: z.array(PaEngineSchema).optional().describe('ui:list'),
  codeSnippet: z.string().optional().describe('ui:textarea'),
});

// =============================================================================
// 11. PHILOSOPHY
// =============================================================================
export const PhilosophySchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  quote: z.string().describe('ui:textarea'),
  quoteHighlightWord: z.string().optional().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
});

// =============================================================================
// 12. CTA BANNER
// =============================================================================
export const CtaBannerSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  ctas: z.array(CtaSchema).optional().describe('ui:list'),
});

// =============================================================================
// 13. SECTION_SCHEMAS REGISTRY (SSOT for FormFactory)
// =============================================================================
export const SECTION_SCHEMAS = {
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
  'header': HeaderSchema, // 🛡️ Ora punta allo schema della capsula
  'footer': z.object({
    brandText: z.string().describe('ui:text'),
    brandHighlight: z.string().optional().describe('ui:text'),
    copyright: z.string().describe('ui:text'),
    links: z.array(z.object({
      label: z.string().describe('ui:text'),
      href: z.string().describe('ui:text'),
    })).optional().describe('ui:list'),
  }),
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;