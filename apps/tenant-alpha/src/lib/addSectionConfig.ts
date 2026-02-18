/**
 * Add-section config for the ICE admin (tenant-alpha).
 * Provides default data and labels for each addable section type.
 * Core remains agnostic; this file is tenant-specific.
 */
import type { AddSectionConfig } from '@jsonpages/core';

const addableSectionTypes = [
  'hero',
  'feature-grid',
  'code-block',
  'problem-statement',
  'pillars-grid',
  'arch-layers',
  'product-triad',
  'pa-section',
  'philosophy',
  'cta-banner',
  'image-break',
] as const;

const sectionTypeLabels: Record<string, string> = {
  'hero': 'Hero',
  'feature-grid': 'Feature Grid',
  'code-block': 'Code Block',
  'problem-statement': 'Problem Statement',
  'pillars-grid': 'Pillars Grid',
  'arch-layers': 'Architecture Layers',
  'product-triad': 'Product Triad',
  'pa-section': 'PA Section',
  'philosophy': 'Philosophy',
  'cta-banner': 'CTA Banner',
  'image-break': 'Image Break',
};

function getDefaultSectionData(sectionType: string): Record<string, unknown> {
  switch (sectionType) {
    case 'hero':
      return { title: 'New Hero', description: '' };
    case 'feature-grid':
      return { sectionTitle: 'Features', cards: [] };
    case 'code-block':
      return { lines: [] };
    case 'problem-statement':
      return { title: 'Problem Statement', siloGroups: [], paragraphs: [] };
    case 'pillars-grid':
      return { title: 'Pillars', pillars: [] };
    case 'arch-layers':
      return { title: 'Architecture', layers: [] };
    case 'product-triad':
      return { title: 'Products', products: [] };
    case 'pa-section':
      return { title: 'Section', subtitle: 'Subtitle', paragraphs: [{ text: '' }] };
    case 'philosophy':
      return { title: 'Philosophy', quote: 'Your quote here.' };
    case 'cta-banner':
      return { title: 'Call to Action', description: '' };
    case 'image-break':
      return { image: { url: '', alt: '' }, caption: '' };
    default:
      return {};
  }
}

export const addSectionConfig: AddSectionConfig = {
  addableSectionTypes: [...addableSectionTypes],
  sectionTypeLabels,
  getDefaultSectionData,
};
