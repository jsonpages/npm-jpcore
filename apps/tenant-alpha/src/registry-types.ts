/**
 * 🧠 REGISTRY TYPES (The Bridge)
 * Questo file centralizza l'augmentation del Core importando i tipi
 * direttamente dalle capsule dei componenti.
 */

import { HeaderData, HeaderSettings } from '@/components/header';

// 1. 🔥 MTRP AUGMENTATION
// Qui diciamo al Core: "Guarda che il tipo 'header' ha questa struttura"
declare module '@jsonpages/core' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    // I prossimi componenti verranno aggiunti qui sotto...
  }

  export interface SectionSettingsRegistry {
    'header': HeaderSettings;
  }
}

// 2. Riesportiamo tutto il Core per comodità del Tenant
export * from '@jsonpages/core';