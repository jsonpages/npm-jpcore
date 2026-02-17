/**
 * Inversion of Control: registry and schemas are provided by the Engine from Tenant config.
 * SectionRenderer and AdminSidebar consume these; they do not import ComponentRegistry or SECTION_SCHEMAS.
 */
import React, { createContext, useContext } from 'react';
import type { JsonPagesConfig } from './types-engine';

type Registry = JsonPagesConfig['registry'];
type Schemas = JsonPagesConfig['schemas'];

export interface ConfigContextValue {
  registry: Registry;
  schemas: Schemas;
  /** For asset resolution (e.g. image picker preview). */
  tenantId?: string;
}

const ConfigContext = createContext<ConfigContextValue | undefined>(undefined);

export const ConfigProvider: React.FC<{ config: Pick<JsonPagesConfig, 'registry' | 'schemas' | 'tenantId'>; children: React.ReactNode }> = ({
  config,
  children,
}) => (
  <ConfigContext.Provider value={{ registry: config.registry, schemas: config.schemas, tenantId: config.tenantId }}>
    {children}
  </ConfigContext.Provider>
);

export function useConfig(): ConfigContextValue {
  const ctx = useContext(ConfigContext);
  if (ctx === undefined) {
    throw new Error('useConfig must be used within ConfigProvider');
  }
  return ctx;
}
