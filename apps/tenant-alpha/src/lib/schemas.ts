import { HeaderSchema }        from '@/components/header';
import { FooterSchema }        from '@/components/footer';
import { HeroSchema }          from '@/components/hero';
import { FeatureGridSchema }   from '@/components/feature-grid';
import { ContactSchema }       from '@/components/contact';
import { LoginSchema }         from '@/components/login';
import { DesignSystemSchema }         from '@/components/design-system';
import { CloudAiNativeGridSchema }    from '@/components/cloud-ai-native-grid';
import { PageHeroSchema }             from '@/components/page-hero';
import { TiptapSchema }           from '@/components/tiptap';

export const SECTION_SCHEMAS = {
  'header':                HeaderSchema,
  'footer':                FooterSchema,
  'hero':                  HeroSchema,
  'feature-grid':          FeatureGridSchema,
  'contact':               ContactSchema,
  'login':                 LoginSchema,
  'design-system':         DesignSystemSchema,
  'cloud-ai-native-grid':  CloudAiNativeGridSchema,
  'page-hero':             PageHeroSchema,
  'tiptap':            TiptapSchema,
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;

export {
  BaseSectionData,
  BaseArrayItem,
  BaseSectionSettingsSchema,
  CtaSchema,
  ImageSelectionSchema,
} from '@/lib/base-schemas';
