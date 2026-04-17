import { EmptyTenantSchema } from '@/components/empty-tenant';
import { FormDemoSchema } from '@/components/form-demo';

export const SECTION_SCHEMAS = {
  'empty-tenant': EmptyTenantSchema,
  'form-demo': FormDemoSchema,
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;

export {
  BaseSectionData,
  BaseArrayItem,
  BaseSectionSettingsSchema,
  CtaSchema,
  ImageSelectionSchema,
} from '@/lib/base-schemas';
