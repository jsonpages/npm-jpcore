import React, { useState, useEffect, useRef } from 'react';
import { z } from 'zod';
import { useConfig } from '../lib/ConfigContext';
import { cn } from '../lib/utils';
import { FormFactory } from './FormFactory';
import type { PageConfig, Section } from '../lib/kernel';
import { MousePointerClick, SlidersHorizontal, Save, Layers, ChevronUp, ChevronDown, GripVertical, Type, Settings, Trash2, AlertCircle, X, PlusSquare, FileCode, FileJson } from 'lucide-react';

interface SelectedSectionInfo {
  id: string;
  type: string;
  scope: string;
}

export interface LayerItem {
  id: string;
  type: string;
  scope: string;
  title?: string;
}

interface AdminSidebarProps {
  selectedSection: SelectedSectionInfo | null;
  pageData: PageConfig | { sections: Section[] };
  onUpdate: (newData: Record<string, unknown>) => void;
  onClose: () => void;
  /** Root-to-leaf path for deep focus (e.g. silos -> blocks). When null, no canvas selection. */
  expandedItemPath?: Array<{ fieldKey: string; itemId?: string }> | null;
  onReorderSection?: (sectionId: string, newIndex: number) => void;
  allLayers?: LayerItem[];
  activeSectionId?: string | null;
  onRequestScrollToSection?: (sectionId: string) => void;
  onDeleteSection?: (sectionId: string) => void;
  /** When provided, shows an "Add section" button in the inspector header that opens the section library. */
  onAddSection?: () => void;
  /** Whether there are unsaved changes (disables Bake HTML / Export JSON when false). */
  hasChanges?: boolean;
  /** Trigger Bake HTML (same as ControlBar). */
  onExportHTML?: () => void;
  /** Trigger Export JSON (same as ControlBar). */
  onExportJSON?: () => void;
}

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
      <h4 className="text-[10px] font-bold uppercase tracking-widest text-zinc-600 mb-4">How it works</h4>
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

const SETTINGS_KEYS = new Set(['anchorId', 'paddingTop', 'paddingBottom', 'theme', 'container']);

export const AdminSidebar: React.FC<AdminSidebarProps> = ({
  selectedSection,
  pageData,
  onUpdate,
  onClose,
  expandedItemPath = null,
  onReorderSection,
  allLayers = [],
  activeSectionId,
  onRequestScrollToSection,
  onDeleteSection,
  onAddSection,
  hasChanges = false,
  onExportHTML,
  onExportJSON,
}) => {
  const { schemas } = useConfig();
  const [layersOpen, setLayersOpen] = useState(true);
  const [activeTab, setActiveTab] = useState<'content' | 'settings'>('content');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [draggedId, setDraggedId] = useState<string | null>(null);
  const [dragOverId, setDragOverId] = useState<string | null>(null);
  const [sidebarExpandedItem, setSidebarExpandedItem] = useState<{ fieldKey: string; itemId?: string } | null>(null);
  const contentScrollRef = useRef<HTMLDivElement>(null);

  // Canvas path takes precedence; otherwise single-level sidebar expansion.
  const effectiveExpandedItemPath =
    expandedItemPath && expandedItemPath.length > 0
      ? expandedItemPath
      : sidebarExpandedItem
        ? [sidebarExpandedItem]
        : null;
  const effectiveExpandedItem =
    effectiveExpandedItemPath?.length
      ? {
          fieldKey: effectiveExpandedItemPath[effectiveExpandedItemPath.length - 1].fieldKey,
          itemId: effectiveExpandedItemPath[effectiveExpandedItemPath.length - 1].itemId,
        }
      : null;

  useEffect(() => {
    if (selectedSection) setLayersOpen(false);
  }, [selectedSection?.id]);

  // When engine clears path (e.g. user clicked section on canvas), clear sidebar expansion too.
  const prevPathRef = useRef(expandedItemPath);
  useEffect(() => {
    if (prevPathRef.current != null && expandedItemPath == null) setSidebarExpandedItem(null);
    prevPathRef.current = expandedItemPath;
  }, [expandedItemPath]);

  useEffect(() => {
    if (!effectiveExpandedItem) return;
    setActiveTab('content');
    const scrollEl = contentScrollRef.current;
    if (!scrollEl) return;
    const el = scrollEl.querySelector('[data-jp-expanded-item]') ?? scrollEl.querySelector('[data-jp-focused-field]');
    if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }, [effectiveExpandedItem]);

  const handleLayerClick = (sectionId: string) => {
    setLayersOpen(false);
    onRequestScrollToSection?.(sectionId);
  };

  const handleDelete = (sectionId: string) => {
    if (deleteConfirm === sectionId) {
      onDeleteSection?.(sectionId);
      setDeleteConfirm(null);
    } else {
      setDeleteConfirm(sectionId);
      setTimeout(() => setDeleteConfirm(null), 3000);
    }
  };

  const handleDragStart = (e: React.DragEvent, sectionId: string) => {
    setDraggedId(sectionId);
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('application/json', JSON.stringify({ sectionId }));
  };

  const handleDragOver = (e: React.DragEvent, sectionId: string) => {
    e.preventDefault();
    if (draggedId !== sectionId) setDragOverId(sectionId);
  };

  const handleDrop = (e: React.DragEvent, targetId: string) => {
    e.preventDefault();
    setDraggedId(null);
    setDragOverId(null);
    if (!draggedId || draggedId === targetId || !onReorderSection) return;
    const list = allLayers.filter((l) => l.scope === 'local');
    const draggedIndex = list.findIndex((l) => l.id === draggedId);
    const targetIndex = list.findIndex((l) => l.id === targetId);
    if (draggedIndex === -1 || targetIndex === -1) return;
    onReorderSection(draggedId, targetIndex);
  };

  if (!selectedSection) {
    return (
      <aside className="relative w-full h-full bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 min-w-0">
        <div className="py-2 px-3 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
          <div>
            <h3 className="text-sm font-bold text-white leading-tight">Inspector</h3>
            <p className="text-[10px] font-mono text-zinc-500 uppercase tracking-wider leading-tight mt-0.5">
              Waiting for Selection...
            </p>
          </div>
          {onAddSection != null && (
            <button
              type="button"
              onClick={onAddSection}
              className="flex items-center gap-2 px-3 py-1.5 rounded-md text-xs font-medium border border-zinc-700 bg-zinc-900 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600 transition-colors shrink-0"
              title="Add section"
              aria-label="Add section"
            >
              <PlusSquare size={14} />
              <span>Add section</span>
            </button>
          )}
        </div>
        <ZeroStateContent />
      </aside>
    );
  }

  const section = pageData.sections.find((s: Section) => s.id === selectedSection.id);
  const schema = schemas[selectedSection.type] as z.ZodObject<z.ZodRawShape> | undefined;

  return (
    <aside className="relative w-full h-full bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 min-w-0 animate-in slide-in-from-right duration-300">
      <div className="py-2 px-3 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
        <div className="flex items-center gap-2 min-w-0">
          <div>
            <h3 className="text-sm font-bold text-white leading-tight">Inspector</h3>
            <p className="text-[10px] font-mono text-blue-400 uppercase tracking-wider flex items-center gap-1.5 leading-tight mt-0.5">
              {onReorderSection && selectedSection.scope === 'local' && (
                <span className="text-zinc-500 shrink-0" title="Reorder section on page">
                  <GripVertical size={12} strokeWidth={2} />
                </span>
              )}
              {selectedSection.type} <span className="text-zinc-600">|</span> {selectedSection.scope}
            </p>
          </div>
        </div>
        <div className="flex items-center gap-1 shrink-0">
          {onAddSection != null && (
            <button
              type="button"
              onClick={onAddSection}
              className="flex items-center gap-2 px-2.5 py-1.5 rounded-md text-xs font-medium border border-zinc-700 bg-zinc-900 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600 transition-colors"
              title="Add section"
              aria-label="Add section"
            >
              <PlusSquare size={12} />
              <span>Add section</span>
            </button>
          )}
          <button
            type="button"
            onClick={onClose}
            className="text-zinc-500 hover:text-white transition-colors p-1 hover:bg-zinc-800 rounded"
            aria-label="Close inspector"
          >
            <X size={16} />
          </button>
        </div>
      </div>

      <div className="border-b border-zinc-800 bg-zinc-900/30 flex">
        <button
          type="button"
          onClick={() => setActiveTab('content')}
          className={`flex-1 py-3 px-4 text-xs font-semibold flex items-center justify-center gap-2 transition-colors ${
            activeTab === 'content' ? 'text-white bg-zinc-950 border-b-2 border-primary' : 'text-zinc-500 hover:text-zinc-300'
          }`}
        >
          <Type size={14} />
          Content
        </button>
        <button
          type="button"
          onClick={() => setActiveTab('settings')}
          className={`flex-1 py-3 px-4 text-xs font-semibold flex items-center justify-center gap-2 transition-colors ${
            activeTab === 'settings' ? 'text-white bg-zinc-950 border-b-2 border-primary' : 'text-zinc-500 hover:text-zinc-300'
          }`}
        >
          <Settings size={14} />
          Settings
        </button>
      </div>

      <div ref={contentScrollRef} className="flex-1 overflow-y-auto flex flex-col custom-scrollbar">
        {allLayers.length > 0 && (
          <div
            className={`border-b border-zinc-800 bg-zinc-900/20 transition-opacity duration-200 ${effectiveExpandedItem ? 'opacity-10' : 'opacity-100'}`}
          >
            <button
              type="button"
              onClick={() => setLayersOpen(!layersOpen)}
              className="w-full py-3 px-4 flex items-center justify-between text-left hover:bg-zinc-800/30 transition-colors"
            >
              <div className="flex items-center gap-2">
                <Layers size={14} className="text-primary" />
                <span className="text-xs font-bold text-white">Page Layers</span>
                <span className="text-[10px] text-zinc-500">({allLayers.length})</span>
              </div>
              {layersOpen ? <ChevronUp size={14} className="text-zinc-500" /> : <ChevronDown size={14} className="text-zinc-500" />}
            </button>
            {!layersOpen && selectedSection && (() => {
              const activeLayer = allLayers.find((l) => l.id === selectedSection.id);
              if (!activeLayer) return null;
              const isActive = activeSectionId === selectedSection.id;
              return (
                <div className="px-3 py-2 flex items-center gap-2 bg-primary/10 border-t border-zinc-800/50">
                  <GripVertical size={12} className="text-primary shrink-0" />
                  <div className="flex-1 min-w-0">
                    <p className="text-[10px] font-mono uppercase tracking-wider text-primary truncate flex items-center gap-1">
                      {activeLayer.type}
                      {isActive && (
                        <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" aria-hidden />
                      )}
                    </p>
                    <p className="text-xs text-white font-medium truncate">
                      {activeLayer.title ?? `${activeLayer.type} section`}
                    </p>
                  </div>
                </div>
              );
            })()}
            {layersOpen && (
              <div className="px-3 pb-3 space-y-1">
                {allLayers.map((layer) => {
                  const isSelected = selectedSection.id === layer.id;
                  const isActive = activeSectionId === layer.id;
                  const isDragging = draggedId === layer.id;
                  const isDragOver = dragOverId === layer.id;
                  const canDelete = layer.scope === 'local' && onDeleteSection;
                  return (
                    <div
                      key={layer.id}
                      draggable={layer.scope === 'local' && !!onReorderSection}
                      onDragStart={(e) => layer.scope === 'local' && handleDragStart(e, layer.id)}
                      onDragOver={(e) => layer.scope === 'local' && handleDragOver(e, layer.id)}
                      onDragLeave={() => setDragOverId(null)}
                      onDrop={(e) => layer.scope === 'local' && handleDrop(e, layer.id)}
                      onDragEnd={() => { setDraggedId(null); setDragOverId(null); }}
                      className={`flex items-center gap-2 py-2 px-2 rounded-md cursor-grab border transition-colors ${
                        isSelected ? 'bg-primary/10 border-primary/30' : 'border-transparent hover:bg-zinc-800/50'
                      } ${isDragOver ? 'border-dashed border-primary' : ''} ${isDragging ? 'opacity-40' : ''}`}
                    >
                      <GripVertical size={12} className={`shrink-0 ${isSelected ? 'text-primary' : 'text-zinc-500'}`} />
                      <button
                        type="button"
                        onClick={() => handleLayerClick(layer.id)}
                        className="flex-1 min-w-0 text-left"
                      >
                        <p className="text-[10px] font-mono uppercase tracking-wider text-zinc-400 truncate flex items-center gap-1">
                          {layer.type}
                          {isActive && (
                            <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" aria-hidden />
                          )}
                        </p>
                        <p className={`text-xs truncate ${isSelected ? 'text-white font-medium' : 'text-zinc-500'}`}>
                          {layer.title ?? `${layer.type} section`}
                        </p>
                      </button>
                      {canDelete && (
                        <button
                          type="button"
                          onClick={(e) => { e.stopPropagation(); handleDelete(layer.id); }}
                          className={`p-1 rounded shrink-0 ${deleteConfirm === layer.id ? 'bg-red-500/20 text-red-400' : 'text-zinc-500 hover:text-red-400'}`}
                          title="Delete section"
                        >
                          <Trash2 size={12} />
                        </button>
                      )}
                    </div>
                  );
                })}
                {deleteConfirm && (
                  <div className="flex items-center gap-2 py-2 px-3 mt-1 rounded-md bg-amber-500/10 border border-amber-500/30">
                    <AlertCircle size={12} className="text-amber-500 shrink-0" />
                    <p className="text-[10px] text-amber-500 font-medium">Click delete again to confirm</p>
                  </div>
                )}
              </div>
            )}
          </div>
        )}

        {effectiveExpandedItem && section && (() => {
          const data = (section.data as Record<string, unknown>) || {};
          let label: string;
          if (effectiveExpandedItemPath && effectiveExpandedItemPath.length > 0) {
            let current: unknown = data;
            for (const seg of effectiveExpandedItemPath) {
              const next = (current as Record<string, unknown>)?.[seg.fieldKey];
              if (seg.itemId != null && Array.isArray(next)) {
                const item = (next as Record<string, unknown>[]).find(
                  (i) => String((i as Record<string, unknown>)?.id) === String(seg.itemId)
                );
                current = item ?? null;
              } else {
                current = next;
              }
            }
            const rec = (current as Record<string, unknown>) || {};
            const fieldKey = effectiveExpandedItem.fieldKey;
            label =
              (typeof rec.name === 'string' ? rec.name : null) ??
              (typeof rec.title === 'string' ? rec.title : null) ??
              (typeof rec.label === 'string' ? rec.label : null) ??
              fieldKey.charAt(0).toUpperCase() + fieldKey.slice(1).replace(/([A-Z])/g, ' $1').trim();
          } else {
            const fieldKey = effectiveExpandedItem.fieldKey;
            if (effectiveExpandedItem.itemId != null) {
              const arr = Array.isArray(data[fieldKey]) ? (data[fieldKey] as Record<string, unknown>[]) : [];
              const item = arr.find((i) => String(i?.id) === String(effectiveExpandedItem!.itemId));
              const rec = (item as Record<string, unknown>) || {};
              label =
                (typeof rec.name === 'string' ? rec.name : null) ??
                (typeof rec.title === 'string' ? rec.title : null) ??
                (typeof rec.label === 'string' ? rec.label : null) ??
                fieldKey;
            } else {
              label = fieldKey.charAt(0).toUpperCase() + fieldKey.slice(1).replace(/([A-Z])/g, ' $1').trim();
            }
          }
          return (
            <div className="px-4 py-2 border-b border-zinc-800 bg-zinc-900/50">
              <p className="text-[10px] font-bold uppercase tracking-widest text-zinc-500">Editing</p>
              <p className="text-xs font-medium text-white truncate mt-0.5">{label}</p>
            </div>
          );
        })()}

        <div className="flex-1 p-4">
          {!schema ? (
            <div className="text-xs text-red-400 p-4 border border-dashed border-red-900/30 rounded bg-red-900/10">
              No schema found for {selectedSection.type}
            </div>
          ) : (() => {
            const shapeKeys = Object.keys(schema.shape);
            const contentKeys = shapeKeys.filter((k) => !SETTINGS_KEYS.has(k));
            const settingsKeys = shapeKeys.filter((k) => SETTINGS_KEYS.has(k));
            const data = (section?.data as Record<string, unknown>) || {};
            const keys = activeTab === 'content' ? contentKeys : settingsKeys;
            if (keys.length === 0) {
              return (
                <p className="text-xs text-zinc-500">
                  {activeTab === 'content' ? 'No content fields in schema.' : 'No settings fields in schema.'}
                </p>
              );
            }
            const firstSeg = effectiveExpandedItemPath?.[0];
            const expandedItemIdByField =
              firstSeg?.itemId != null
                ? { [firstSeg.fieldKey]: firstSeg.itemId }
                : effectiveExpandedItem?.itemId != null
                  ? { [effectiveExpandedItem.fieldKey]: effectiveExpandedItem.itemId }
                  : undefined;
            const focusedFieldKey = firstSeg?.fieldKey ?? effectiveExpandedItem?.fieldKey ?? null;
            return (
              <FormFactory
                schema={schema}
                data={data}
                onChange={(newData) => onUpdate(newData)}
                keys={keys}
                expandedItemPath={effectiveExpandedItemPath}
                expandedItemIdByField={expandedItemIdByField}
                focusedFieldKey={focusedFieldKey}
                onSidebarExpandedItemChange={setSidebarExpandedItem}
              />
            );
          })()}
        </div>
      </div>

      <div className="p-4 border-t border-zinc-800 bg-zinc-900/50 flex flex-col gap-2 opacity-100">
        {(onExportHTML != null || onExportJSON != null) && (
          <div className="flex items-center gap-2 mb-1">
            <div className={cn(
              'w-2 h-2 rounded-full transition-colors duration-300 shrink-0',
              hasChanges ? 'bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]' : 'bg-emerald-500'
            )} />
            <span className={cn(
              'text-xs font-medium transition-colors duration-300',
              hasChanges ? 'text-amber-500' : 'text-zinc-500'
            )}>
              {hasChanges ? 'Unsaved Changes' : 'All Changes Saved'}
            </span>
          </div>
        )}
        {onExportHTML != null && (
          <button
            type="button"
            onClick={onExportHTML}
            disabled={!hasChanges}
            className={cn(
              'w-full flex items-center justify-center gap-2 px-3 py-2.5 rounded-md text-xs font-medium transition-all border',
              hasChanges
                ? 'opacity-100 bg-zinc-900 border-zinc-700 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600'
                : 'opacity-100 bg-transparent border-zinc-800 text-zinc-600 cursor-not-allowed'
            )}
          >
            <FileCode size={14} />
            Bake HTML
          </button>
        )}
        {onExportJSON != null && (
          <button
            type="button"
            onClick={onExportJSON}
            disabled={!hasChanges}
            className={cn(
              'w-full flex items-center justify-center gap-2 px-3 py-2.5 rounded-md text-xs font-bold transition-all shadow-lg',
              hasChanges
                ? 'opacity-100 bg-blue-600 text-white hover:bg-blue-500 shadow-blue-900/20'
                : 'opacity-100 bg-zinc-900 text-zinc-600 cursor-not-allowed'
            )}
          >
            <FileJson size={14} />
            Export JSON
          </button>
        )}
      </div>
    </aside>
  );
};
