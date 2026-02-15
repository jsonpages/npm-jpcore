import React from 'react';
import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';
import { Hero } from '@/components/Hero';
import { FeatureGrid } from '@/components/FeatureGrid';
import { CodeBlock } from '@/components/CodeBlock';
import { ProblemStatement } from '@/components/ProblemStatement';
import { PillarsGrid } from '@/components/PillarsGrid';
import { ArchLayers } from '@/components/ArchLayers';
import { ProductTriad } from '@/components/ProductTriad';
import { PaSection } from '@/components/PaSection';
import { Philosophy } from '@/components/Philosophy';
import { CtaBanner } from '@/components/CtaBanner';
import type { SectionType } from '@jsonpages/core';
import type { SectionComponentPropsMap } from '@/types';

export const ComponentRegistry: {
  [K in SectionType]: React.FC<SectionComponentPropsMap[K]>;
} = {
  'header': Header,
  'footer': Footer,
  'hero': Hero,
  'feature-grid': FeatureGrid,
  'code-block': CodeBlock,
  'problem-statement': ProblemStatement,
  'pillars-grid': PillarsGrid,
  'arch-layers': ArchLayers,
  'product-triad': ProductTriad,
  'pa-section': PaSection,
  'philosophy': Philosophy,
  'cta-banner': CtaBanner,
};


