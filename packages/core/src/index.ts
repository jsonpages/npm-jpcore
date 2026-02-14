/**
 * @jsonpages/core — Public API
 * Export everything from lib and admin so the tenant can use them.
 */

// Lib: kernel, types, engine, renderers, context, persistence, events, utils, shared-types
export * from './lib/kernel';
export * from './lib/types-engine';
export * from './lib/events';
export * from './lib/persistence';
export * from './lib/utils';
export * from './lib/shared-types';
export { PageRenderer } from './lib/PageRenderer';
export { SectionRenderer } from './lib/SectionRenderer';
export { JsonPagesEngine } from './lib/JsonPagesEngine';
export { StudioProvider, useStudio } from './lib/StudioContext';
export { ConfigProvider, useConfig } from './lib/ConfigContext';
export { ThemeLoader } from './lib/ThemeLoader';
export { DefaultNotFound } from './lib/DefaultNotFound';

// Admin
export { AdminSidebar } from './admin/AdminSidebar';
export { ControlBar } from './admin/ControlBar';
export { StudioStage } from './admin/StudioStage';
export { PreviewEntry } from './admin/PreviewEntry';
export { FormFactory } from './admin/FormFactory';
export { InputWidgets, type WidgetType } from './admin/InputRegistry';
