import { z } from 'zod';
import { BaseSectionData } from '@/lib/base-schemas';

const ImageSelectionSchema = z.object({
  url: z.string(),
  alt: z.string().optional(),
}).describe('ui:image-picker');

export const ImageBreakSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  image: ImageSelectionSchema.default({ url: '', alt: '' }),
  caption: z.string().optional().describe('ui:textarea'),
});
