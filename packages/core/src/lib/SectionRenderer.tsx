
/**
 * FILE: SectionRenderer.tsx
 * STATUS: Build-Safe & Anchor-Enabled
 */

import React from 'react';
import { useConfig } from './ConfigContext';
import { useStudio } from './StudioContext';
import { cn } from './utils';
import { STUDIO_EVENTS } from './events';
import type { Section, MenuItem } from './kernel';

interface SectionRendererProps {
  // 🛡️ FIX: Use the Discriminated Union 'Section' instead of the loose 'BaseSection<SectionType>'
  // This ensures strict correlation between section.type and section.data
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

  // 1. Component Lookup (from config; no direct import of ComponentRegistry)
  const Component = registry[section.type];
  const scope = (section.type === 'header' || section.type === 'footer') ? 'global' : 'local';
  
  // 🛡️ Safe Access: We cast to any for the settings check because TypeScript 
  // cannot easily verify that 'sticky' exists on ALL section settings types.
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
    // 2. Runtime Dispatch
    // We cast to 'any' because React Props cannot dynamically map over a Discriminated Union 
    // without complex overload signatures. The 'Section' type guard at the prop level 
    // guarantees we have valid data.
    const DynamicComponent = Component as any;

    if (section.type === 'header' && menu) {
      return <DynamicComponent data={section.data} settings={section.settings} menu={menu} />;
    }
    return <DynamicComponent data={section.data} settings={section.settings} />;
  };

  // 3. Anchor ID Management
  const anchorId = (section.data as any)?.anchorId;

  return (
    <div 
      id={anchorId || undefined}
      data-section-id={isStudio ? section.id : undefined} 
      onClick={isStudio ? handleSectionClick : undefined}
      className={cn(
        "relative w-full",
        isStudio && "group cursor-pointer",
        isStudio && isStickyHeader ? "sticky top-0 z-[60]" : "relative z-0",
        isSelected && "z-[70]" 
      )}
    >
      <div className="relative z-10">
        {renderInnerComponent()}
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

