import React from 'react';
import { z } from 'zod';
import { useConfig } from '../lib/ConfigContext';
import { FormFactory } from './FormFactory';
import type { PageConfig, Section } from '../lib/kernel';
import { MousePointerClick, SlidersHorizontal, Save, Layers } from 'lucide-react';

/**
 * 🧩 SelectedSectionInfo
 */
interface SelectedSectionInfo {
  id: string;
  type: string;
  scope: string;
}

/**
 * 🧩 AdminSidebarProps
 */
interface AdminSidebarProps {
  selectedSection: SelectedSectionInfo | null;
  pageData: PageConfig | { sections: Section[] };
  onUpdate: (newData: Record<string, unknown>) => void;
  onClose: () => void;
}

/**
 * 🛡️ ZERO STATE COMPONENT
 */
const ZeroStateContent: React.FC = () => (
  <div className="flex flex-col h-full">
    <div className="flex-1 flex flex-col items-center justify-center p-8 text-center space-y-6">
      <div className="relative">
        <div className="absolute inset-0 bg-blue-500/20 blur-xl rounded-full" />
        <div className="relative w-20 h-20 rounded-2xl bg-zinc-900 border border-zinc-800 flex items-center justify-center shadow-2xl">
          <Layers className="text-zinc-400" size={40} strokeWidth={1.5} />
        </div>
      </div>
      
      <div className="space-y-2 max-w-[200px]">
        <h3 className="text-sm font-semibold text-zinc-100">Welcome to Studio</h3>
        <p className="text-xs text-zinc-500 leading-relaxed">
          The canvas is ready. Select an element to begin editing.
        </p>
      </div>
    </div>

    <div className="p-6 border-t border-zinc-800/50 bg-zinc-900/20">
      <h4 className="text-[10px] font-bold uppercase tracking-widest text-zinc-600 mb-4">
        How it works
      </h4>
      <ul className="space-y-4">
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <MousePointerClick size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Select</p>
            <p className="text-[10px] text-zinc-500">Click any section on the stage.</p>
          </div>
        </li>
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <SlidersHorizontal size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Edit</p>
            <p className="text-[10px] text-zinc-500">Tweak content and settings.</p>
          </div>
        </li>
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <Save size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Save</p>
            <p className="text-[10px] text-zinc-500">Persist changes to JSON.</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
);

/**
 * 🛠️ AdminSidebar (Inspector)
 */
export const AdminSidebar: React.FC<AdminSidebarProps> = ({ 
  selectedSection, 
  pageData, 
  onUpdate,
  onClose 
}) => {
  if (!selectedSection) {
    return (
      <aside className="relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0">
        <div className="p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
          <div>
            <h3 className="text-sm font-bold text-white">Inspector</h3>
            <p className="text-[10px] font-mono text-zinc-500 uppercase tracking-wider">
              Waiting for Selection...
            </p>
          </div>
        </div>
        <ZeroStateContent />
      </aside>
    );
  }

  const section = pageData.sections.find((s: Section) => s.id === selectedSection.id);
  const { schemas } = useConfig();
  const schema = schemas[selectedSection.type] as z.ZodObject<z.ZodRawShape> | undefined;

  return (
    <aside className="relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 animate-in slide-in-from-right duration-300">
      <div className="p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
        <div>
          <h3 className="text-sm font-bold text-white">Inspector</h3>
          <p className="text-[10px] font-mono text-blue-400 uppercase tracking-wider">
            {selectedSection.type} <span className="text-zinc-600">|</span> {selectedSection.scope}
          </p>
        </div>
        <button 
          onClick={onClose} 
          className="text-zinc-500 hover:text-white transition-colors p-1 hover:bg-zinc-800 rounded"
        >
          ✕
        </button>
      </div>

      <div className="flex-1 overflow-y-auto p-6 custom-scrollbar">
        {!schema ? (
          <div className="text-xs text-red-400 p-4 border border-dashed border-red-900/30 rounded bg-red-900/10">
            No schema found for {selectedSection.type}
          </div>
        ) : (
          <FormFactory 
            schema={schema}
            data={(section?.data as Record<string, unknown>) || {}} 
            onChange={(newData) => onUpdate(newData)} 
          />
        )}
      </div>

      <div className="p-4 border-t border-zinc-800 bg-zinc-900/50">
        <button className="w-full bg-blue-600 hover:bg-blue-500 text-white text-xs font-bold py-2.5 rounded shadow-lg shadow-blue-900/20 transition-all active:scale-[0.98] flex items-center justify-center gap-2">
          <Save size={14} />
          Save Changes
        </button>
      </div>
    </aside>
  );
};


