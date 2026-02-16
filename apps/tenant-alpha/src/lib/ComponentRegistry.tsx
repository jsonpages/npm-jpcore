import React from 'react';
// 🛡️ Importiamo l'Header dalla sua nuova capsula (TBP Protocol)
import { Header } from '@/components/header';

// Gli altri componenti rimangono temporaneamente flat fino alla loro capsulizzazione
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
// 🛡️ Usiamo la mappa dei tipi aggiornata dal nostro bridge
import type { SectionComponentPropsMap } from '@/types';

export const ComponentRegistry: {
  [K in SectionType]: React.FC<SectionComponentPropsMap[K]>;
} = {
  'header': Header, // 🛂 Collegato alla Capsula
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