/**
 * Conceptual public surface for runtime and studio concerns.
 *
 * This keeps the engine-facing API grouped even before we physically
 * split packages.
 */
export { PageRenderer } from '../lib/PageRenderer';
export { SectionRenderer } from '../lib/SectionRenderer';
export { JsonPagesEngine } from '../lib/JsonPagesEngine';
export { StudioProvider, useStudio } from '../studio/StudioContext';
export { ConfigProvider, useConfig, type ConfigContextValue } from '../lib/ConfigContext';
export { ThemeLoader } from '../lib/ThemeLoader';
export { DefaultNotFound } from '../lib/DefaultNotFound';
export { STUDIO_EVENTS } from '../studio/events';
export * from './engine';
