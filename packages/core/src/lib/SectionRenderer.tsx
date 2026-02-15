/**
 * FILE: SectionRenderer.tsx
 * STATUS: Build-Safe, Anchor-Enabled & Error-Resilient
 */

import React, { Component, ErrorInfo, ReactNode } from 'react';
import { useConfig } from './ConfigContext';
import { useStudio } from './StudioContext';
import { cn } from './utils';
import { STUDIO_EVENTS } from './events';
import type { Section, MenuItem } from './kernel';
import { AlertTriangle } from 'lucide-react';

/**
 * 🛡️ SECTION ERROR BOUNDARY
 * Prevents a single faulty component from crashing the entire site or Studio.
 */
class SectionErrorBoundary extends Component<{ children: ReactNode; type: string }, { hasError: boolean }> {
  constructor(props: { children: ReactNode; type: string }) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error(`[JsonPages] Component Crash [${this.props.type}]:`, error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="p-8 m-4 bg-amber-500/5 border-2 border-dashed border-amber-500/20 rounded-xl flex flex-col items-center text-center gap-3">
          <AlertTriangle className="text-amber-500" size={32} />
          <div className="space-y-1">
            <h4 className="text-sm font-bold text-amber-200 uppercase tracking-tight">Component Error</h4>
            <p className="text-xs text-amber-500/70 font-mono">Type: {this.props.type}</p>
          </div>
          <p className="text-xs text-zinc-400 max-w-[280px] leading-relaxed">
            This section failed to render. Check the console for details or verify the JSON data structure.
          </p>
        </div>
      );
    }
    return this.props.children;
  }
}

interface SectionRendererProps {
  section: Section;
  menu?: MenuItem[];
  selectedId?: string | null;
}

const SovereignOverlay: React.FC<{ 
  type: string; 
  scope: string; 
  isSelected: boolean; 
}> = ({ type, scope, isSelected }) => {
  return (
    <div 
      data-jp-section-overlay
      className={cn(
        "absolute inset-0 pointer-events-none transition-all duration-200 z-[50]",
        "border-2 border-transparent group-hover:border-blue-400/50 group-hover:border-dashed",
        isSelected && "border-2 border-blue-600 border-solid bg-blue-500/5"
      )}
    >
      <div className={cn(
        "absolute top-0 right-0 px-2 py-1 text-[9px] font-black uppercase tracking-widest transition-opacity",
        "bg-blue-600 text-white",
        isSelected || "group-hover:opacity-100 opacity-0"
      )}>
        {type} <span className="opacity-50">|</span> {scope}
      </div>
    </div>
  );
};

export const SectionRenderer: React.FC<SectionRendererProps> = ({ 
  section, 
  menu,
  selectedId 
}) => {
  const { mode } = useStudio();
  const { registry } = useConfig();
  const isStudio = mode === 'studio';
  const isSelected = isStudio && selectedId === section.id;

  const Component = registry[section.type];
  const scope = (section.type === 'header' || section.type === 'footer') ? 'global' : 'local';
  
  const isStickyHeader = section.type === 'header' && (section.settings as any)?.sticky;

  if (!Component) {
    return (
      <div className="p-6 m-4 bg-red-500/10 text-red-400 border border-red-500/20 rounded-lg text-sm font-mono">
        <strong>Missing Component:</strong> {section.type}
      </div>
    );
  }

  const handleSectionClick = (e: React.MouseEvent) => {
    if (!isStudio) return;
    e.preventDefault();
    e.stopPropagation();
    window.parent.postMessage({
      type: STUDIO_EVENTS.SECTION_SELECT,
      section: { id: section.id, type: section.type, scope: scope }
    }, '*');
  };

  const renderInnerComponent = () => {
    const DynamicComponent = Component as any;
    if (section.type === 'header' && menu) {
      return <DynamicComponent data={section.data} settings={section.settings} menu={menu} />;
    }
    return <DynamicComponent data={section.data} settings={section.settings} />;
  };

  const anchorId = (section.data as any)?.anchorId;

  return (
    <div 
      id={anchorId || undefined}
      data-section-id={isStudio ? section.id : undefined}
      {...(isStudio && isSelected ? { 'data-jp-selected': true } : {})}
      onClick={isStudio ? handleSectionClick : undefined}
      className={cn(
        "relative w-full",
        isStudio && "group cursor-pointer",
        isStudio && isStickyHeader ? "sticky top-0 z-[60]" : "relative z-0",
        isSelected && "z-[70]" 
      )}
    >
      <div className="relative z-0">
        <SectionErrorBoundary type={section.type}>
          {renderInnerComponent()}
        </SectionErrorBoundary>
      </div>

      {isStudio && (
        <SovereignOverlay 
          type={section.type} 
          scope={scope} 
          isSelected={!!isSelected} 
        />
      )}
    </div>
  );
};