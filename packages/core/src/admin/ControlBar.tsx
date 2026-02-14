import React from 'react';
import { FileJson, FileCode } from 'lucide-react';
import { cn } from '../lib/utils';

interface ControlBarProps {
  hasChanges: boolean;
  onExportJSON: () => void;
  onExportHTML: () => void;
}

export const ControlBar: React.FC<ControlBarProps> = ({ 
  hasChanges, 
  onExportJSON, 
  onExportHTML 
}) => {
  return (
    <div className="h-14 border-b border-zinc-800 bg-zinc-950 flex items-center justify-between px-6 shrink-0 z-50 relative">
      <div className="flex items-center gap-3">
        <div className="flex items-center gap-2">
          <div className={cn(
            "w-2 h-2 rounded-full transition-colors duration-300",
            hasChanges ? "bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]" : "bg-emerald-500"
          )} />
          <span className={cn(
            "text-xs font-medium transition-colors duration-300",
            hasChanges ? "text-amber-500" : "text-zinc-500"
          )}>
            {hasChanges ? "Unsaved Changes" : "All Changes Saved"}
          </span>
        </div>
      </div>

      <div className="absolute left-1/2 -translate-x-1/2 opacity-20 pointer-events-none">
        <span className="text-xs font-black tracking-[0.2em] text-zinc-100">JSONPAGES STUDIO</span>
      </div>

      <div className="flex items-center gap-2">
        <button
          onClick={onExportHTML}
          disabled={!hasChanges}
          className={cn(
            "flex items-center gap-2 px-3 py-1.5 rounded-md text-xs font-medium transition-all border",
            hasChanges 
              ? "bg-zinc-900 border-zinc-700 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600" 
              : "bg-transparent border-transparent text-zinc-600 cursor-not-allowed"
          )}
        >
          <FileCode size={14} />
          <span>Bake HTML</span>
        </button>

        <button
          onClick={onExportJSON}
          disabled={!hasChanges}
          className={cn(
            "flex items-center gap-2 px-4 py-1.5 rounded-md text-xs font-bold transition-all shadow-lg",
            hasChanges 
              ? "bg-blue-600 text-white hover:bg-blue-500 shadow-blue-900/20" 
              : "bg-zinc-900 text-zinc-600 cursor-not-allowed"
          )}
        >
          <FileJson size={14} />
          <span>Export JSON</span>
        </button>
      </div>
    </div>
  );
};


