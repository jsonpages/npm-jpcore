import React, { useState, useEffect, useRef, useDeferredValue } from 'react';
import { z } from 'zod';
import { useConfig } from '../lib/ConfigContext';
import { cn } from '../lib/utils';
import { FormFactory } from './FormFactory';
import type { PageConfig, Section } from '../lib/kernel';
import { Layers, ChevronUp, ChevronDown, GripVertical, Settings, Trash2, AlertCircle, X, Plus, FileCode, Save, FileText } from 'lucide-react';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../components/ui/select';

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

/** Used by the section-settings modal to update a section without changing Inspector selection. */
export type OnUpdateSection = (
  sectionId: string,
  scope: 'global' | 'local',
  sectionType: string,
  newData: Record<string, unknown>
) => void;

interface AdminSidebarProps {
  selectedSection: SelectedSectionInfo | null;
  pageData: PageConfig | { sections: Section[] };
  /** All sections (header + page sections + footer) for resolving modal section data. */
  allSectionsData?: Section[];
  onUpdate: (newData: Record<string, unknown>) => void;
  /** Update a section by id/scope (e.g. from settings modal). When provided with allSectionsData, gear opens modal. */
  onUpdateSection?: OnUpdateSection;
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
  /** Save to file (writes JSON to repo via server). Replaces Export JSON in sidebar when provided. */
  onSaveToFile?: () => void;
  /** When true, show "Salvato" in the status bar (e.g. for 2s after save-to-file succeeds). */
  saveSuccessFeedback?: boolean;
  /** Restore page from file (resets in-memory draft for current slug). Hidden by default; set showResetToFile to display. */
  onResetToFile?: () => void;
  /** When true, shows the "Ripristina da file" button (default false = hidden). */
  showResetToFile?: boolean;
  /** Available page slugs. When length > 0 and onPageChange set, shows page selector under Inspector header. */
  pageSlugs?: string[];
  /** Current page slug. */
  currentSlug?: string;
  /** Called when user selects another page; engine should navigate to /admin/:slug. */
  onPageChange?: (slug: string) => void;
}

const SETTINGS_KEYS = new Set(['anchorId', 'paddingTop', 'paddingBottom', 'theme', 'container']);

export const AdminSidebar: React.FC<AdminSidebarProps> = ({
  selectedSection,
  pageData,
  allSectionsData = [],
  onUpdate,
  onUpdateSection,
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
  onSaveToFile,
  saveSuccessFeedback = false,
  onResetToFile,
  showResetToFile = false,
  pageSlugs = [],
  currentSlug = 'home',
  onPageChange,
}) => {
  const { schemas } = useConfig();
  const [layersOpen, setLayersOpen] = useState(true);
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [draggedId, setDraggedId] = useState<string | null>(null);
  const [dragOverId, setDragOverId] = useState<string | null>(null);
  const [sidebarExpandedItem, setSidebarExpandedItem] = useState<{ fieldKey: string; itemId?: string } | null>(null);
  /** When set, the section-settings modal is open for this section id (avoids Inspector tab/selection state freeze). */
  const [settingsModalSectionId, setSettingsModalSectionId] = useState<string | null>(null);
  const contentScrollRef = useRef<HTMLDivElement>(null);
  const modalContentRef = useRef<HTMLDivElement>(null);

  /** Defer heavy form render so first-time open + edit doesn't freeze the UI (enterprise-grade UX). */
  const deferredSection = useDeferredValue(selectedSection);
  const isFormPending = selectedSection != null && deferredSection?.id !== selectedSection.id;

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

  // When engine clears path (e.g. user clicked section on canvas), clear sidebar expansion too.
  const prevPathRef = useRef(expandedItemPath);
  useEffect(() => {
    if (prevPathRef.current != null && expandedItemPath == null) setSidebarExpandedItem(null);
    prevPathRef.current = expandedItemPath;
  }, [expandedItemPath]);

  /** When a section is selected (from Stage preview click or from Page Layers click), collapse the list so behaviour is the same. */
  useEffect(() => {
    if (selectedSection?.id != null) setLayersOpen(false);
  }, [selectedSection?.id]);

  /** Scroll sidebar content to top. Double rAF so it runs after layout (fixes scroll not moving). */
  const scrollSidebarToTop = () => {
    const id = requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        const el = contentScrollRef.current;
        if (el) {
          el.scrollTo({ top: 0, behavior: 'smooth' });
        }
      });
    });
    return () => cancelAnimationFrame(id);
  };

  /** Scroll sidebar to top when Page Layers list is opened via chevron (effect runs after commit). */
  const prevLayersOpenRef = useRef(layersOpen);
  useEffect(() => {
    if (layersOpen && !prevLayersOpenRef.current) {
      const cancel = scrollSidebarToTop();
      prevLayersOpenRef.current = layersOpen;
      return cancel;
    }
    prevLayersOpenRef.current = layersOpen;
  }, [layersOpen]);

  /** Defer scroll to next frame to avoid blocking main thread when form mounts (enterprise-grade UX). */
  useEffect(() => {
    if (!effectiveExpandedItem) return;
    const scrollEl = contentScrollRef.current;
    if (!scrollEl) return;
    const id = requestAnimationFrame(() => {
      const el = scrollEl.querySelector('[data-jp-expanded-item]') ?? scrollEl.querySelector('[data-jp-focused-field]');
      if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
    return () => cancelAnimationFrame(id);
  }, [effectiveExpandedItem]);

  const handleLayerClick = (sectionId: string) => {
    setLayersOpen(false);
    onRequestScrollToSection?.(sectionId);
  };

  /** Toggle Page Layers list (header or chevron); scroll to top when opening so list is in view. */
  const handlePageLayersToggle = () => {
    setLayersOpen((prev) => {
      const next = !prev;
      if (next) scrollSidebarToTop();
      return next;
    });
  };

  /** Open the section-settings modal for the given section (no Inspector tab/selection change to avoid UI freeze). */
  const handleOpenSectionSettings = (sectionId: string, e: React.MouseEvent) => {
    e.stopPropagation();
    if (allSectionsData.length > 0 && onUpdateSection) {
      setSettingsModalSectionId(sectionId);
    } else {
      setLayersOpen(false);
      onRequestScrollToSection?.(sectionId);
    }
  };

  // ESC closes the section-settings modal.
  useEffect(() => {
    if (settingsModalSectionId == null) return;
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setSettingsModalSectionId(null);
    };
    window.addEventListener('keydown', onKeyDown);
    return () => window.removeEventListener('keydown', onKeyDown);
  }, [settingsModalSectionId]);

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

  const section = selectedSection
    ? pageData.sections.find((s: Section) => s.id === selectedSection.id)
    : undefined;
  /** Section/schema for the form only: deferred so heavy FormFactory doesn't block the main thread. */
  const formSection = deferredSection
    ? pageData.sections.find((s: Section) => s.id === deferredSection.id)
    : undefined;
  const formSchema = deferredSection
    ? (schemas[deferredSection.type] as z.ZodObject<z.ZodRawShape> | undefined)
    : undefined;

  /** When no section is selected, Page Layers list is always shown (open); otherwise use accordion state. */
  const showLayersList = allLayers.length > 0 && (layersOpen || !selectedSection);

  return (
    <aside className="relative w-full h-full bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 min-w-0 animate-in slide-in-from-right duration-300">
      {/* Sticky: Section header (Inspector + type) + Page Layers header (and section summary when collapsed). */}
      <div className="sticky top-0 z-10 flex flex-col shrink-0 bg-zinc-950 border-b border-zinc-800">
        <div className="py-2 px-3 flex justify-between items-center bg-zinc-900/50">
          <div className="flex items-center gap-2 min-w-0">
            <div>
              <h3 className="text-sm font-bold text-white leading-tight">Inspector</h3>
              <p className="text-[10px] font-mono uppercase tracking-wider flex items-center gap-1.5 leading-tight mt-0.5">
                {selectedSection ? (
                  <>
                    {onReorderSection && selectedSection.scope === 'local' && (
                      <span className="text-zinc-500 shrink-0" title="Reorder section on page">
                        <GripVertical size={12} strokeWidth={2} />
                      </span>
                    )}
                    <span className="text-blue-400">{selectedSection.type}</span>
                    <span className="text-zinc-600">|</span>
                    <span className="text-zinc-500">{selectedSection.scope}</span>
                  </>
                ) : (
                  <span className="text-zinc-500">Waiting for Selection...</span>
                )}
              </p>
            </div>
          </div>
          <div className="flex items-center gap-1 shrink-0">
            <button
              type="button"
              onClick={onClose}
              className="p-1 rounded text-zinc-500 hover:text-white hover:bg-zinc-800 transition-colors"
              title="Close Inspector"
              aria-label="Close Inspector"
            >
              <X size={16} />
            </button>
          </div>
        </div>
        {pageSlugs.length > 0 && onPageChange && (
          <div className="py-2 px-3 border-b border-zinc-800/80 bg-zinc-900/30">
            <div className="flex items-center gap-2 min-w-0">
              <FileText size={14} className="shrink-0 text-zinc-400" aria-hidden />
              <Select value={currentSlug} onValueChange={onPageChange}>
                <SelectTrigger className="h-8 text-xs font-medium text-white border-zinc-700 bg-zinc-800/60 hover:bg-zinc-800 flex-1 min-w-0">
                  <SelectValue placeholder="Page" />
                </SelectTrigger>
                <SelectContent className="dark min-w-[12rem]">
                  {pageSlugs.map((slug) => (
                    <SelectItem key={slug} value={slug} className="text-xs capitalize">
                      {slug}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <span className="text-zinc-500 text-xs shrink-0 tabular-nums">
                {allLayers.length} section{allLayers.length !== 1 ? 's' : ''}
              </span>
            </div>
          </div>
        )}
        {allLayers.length > 0 && (
          <div className="bg-zinc-900/20 opacity-100">
            <div className="flex items-center justify-between gap-2 py-3 px-4">
              <button
                type="button"
                onClick={handlePageLayersToggle}
                className="flex-1 flex items-center justify-between min-w-0 hover:bg-zinc-800/30 transition-colors cursor-pointer text-left rounded py-1 pr-1 border-0 bg-transparent"
                aria-expanded={showLayersList}
                aria-label={showLayersList ? 'Collapse Page Layers' : 'Expand Page Layers'}
              >
                <span className="flex items-center gap-2 min-w-0">
                  <Layers size={14} className="text-primary shrink-0" />
                  <span className="text-xs font-bold text-white">Page Layers</span>
                  <span className="text-[10px] text-zinc-500">({allLayers.length})</span>
                </span>
                <span className="text-zinc-500 shrink-0 pointer-events-none" aria-hidden>
                  {showLayersList ? <ChevronUp size={14} /> : <ChevronDown size={14} />}
                </span>
              </button>
              {onAddSection != null && (
                <button
                  type="button"
                  onClick={(e) => { e.stopPropagation(); onAddSection(); }}
                  className="flex items-center gap-1.5 text-zinc-500 hover:text-white transition-colors p-1.5 hover:bg-zinc-800 rounded shrink-0"
                  title="Add section"
                  aria-label="Add section"
                >
                  <Plus size={14} />
                  <span className="text-xs font-medium">Add</span>
                </button>
              )}
            </div>
            {!showLayersList && selectedSection && (() => {
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
                  <button
                    type="button"
                    onClick={(e) => handleOpenSectionSettings(activeLayer.id, e)}
                    className="p-1 rounded shrink-0 text-zinc-500 hover:text-primary transition-colors"
                    title={`Open settings for ${activeLayer.type}`}
                    aria-label={`Open settings for ${activeLayer.type} section`}
                  >
                    <Settings size={12} />
                  </button>
                </div>
              );
            })()}
          </div>
        )}
      </div>

      <div ref={contentScrollRef} className="flex-1 min-h-0 overflow-y-auto flex flex-col custom-scrollbar">
        {showLayersList && (
          <div className="border-b border-zinc-800 bg-zinc-900/20 px-3 pb-3 pt-1">
            {allLayers.map((layer) => {
                  const isSelected = selectedSection?.id === layer.id;
                  const isActive = activeSectionId === layer.id;
                  const isDragging = draggedId === layer.id;
                  const isDragOver = dragOverId === layer.id;
                  const canDelete = layer.scope === 'local' && onDeleteSection;
                  const isLocal = layer.scope === 'local';
                  const canReorder = isLocal && !!onReorderSection;
                  return (
                    <div
                      key={layer.id}
                      draggable={canReorder}
                      onDragStart={(e) => canReorder && handleDragStart(e, layer.id)}
                      onDragOver={(e) => canReorder && handleDragOver(e, layer.id)}
                      onDragLeave={() => setDragOverId(null)}
                      onDrop={(e) => canReorder && handleDrop(e, layer.id)}
                      onDragEnd={() => { setDraggedId(null); setDragOverId(null); }}
                      className={cn(
                        'flex items-center gap-2 py-2.5 px-2 rounded-sm border-t transition-colors',
                        isDragOver && 'border-t-2 border-dashed border-primary bg-primary/5',
                        !isDragOver && isSelected && 'border-primary/30 bg-primary/10',
                        !isDragOver && !isSelected && 'border-zinc-800/90 hover:bg-zinc-800/40',
                        isDragging && 'opacity-40',
                        canReorder ? 'cursor-grab active:cursor-grabbing' : 'cursor-default'
                      )}
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
                      <button
                        type="button"
                        onClick={(e) => handleOpenSectionSettings(layer.id, e)}
                        className="p-1 rounded shrink-0 text-zinc-500 hover:text-primary transition-colors"
                        title={`Open settings for ${layer.type}`}
                        aria-label={`Open settings for ${layer.type} section`}
                      >
                        <Settings size={12} />
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

        <div
          className="flex-1 p-4"
          onFocusCapture={() => selectedSection != null && setLayersOpen(false)}
        >
          {!selectedSection ? (
            <p className="text-xs text-zinc-500 text-center py-8">
              Select a layer above or on the stage to edit.
            </p>
          ) : isFormPending ? (
            <div className="space-y-4 animate-pulse" role="status" aria-label="Loading form">
              <div className="h-4 w-3/4 rounded bg-zinc-800" />
              <div className="h-10 rounded bg-zinc-800/80" />
              <div className="h-10 rounded bg-zinc-800/80" />
              <div className="h-20 rounded bg-zinc-800/80" />
              <div className="h-10 rounded bg-zinc-800/60" />
            </div>
          ) : !formSchema ? (
            <div className="text-xs text-red-400 p-4 border border-dashed border-red-900/30 rounded bg-red-900/10">
              No schema found for {deferredSection?.type ?? selectedSection.type}
            </div>
          ) : (() => {
            const shapeKeys = Object.keys(formSchema.shape);
            const contentKeys = shapeKeys.filter((k) => !SETTINGS_KEYS.has(k));
            const data = (formSection?.data as Record<string, unknown>) || {};
            if (contentKeys.length === 0) {
              return (
                <p className="text-xs text-zinc-500">No content fields in schema.</p>
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
                schema={formSchema}
                data={data}
                onChange={(newData) => onUpdate(newData)}
                keys={contentKeys}
                expandedItemPath={effectiveExpandedItemPath}
                expandedItemIdByField={expandedItemIdByField}
                focusedFieldKey={focusedFieldKey}
                onSidebarExpandedItemChange={setSidebarExpandedItem}
              />
            );
          })()}
        </div>
      </div>

      <div className="px-4 py-2.5 border-t border-zinc-800 bg-zinc-900/50 flex items-center gap-3 opacity-100 flex-wrap">
        {(onExportHTML != null || onSaveToFile != null || onResetToFile != null) && (
          <>
            <div className={cn(
              'w-2 h-2 rounded-full transition-colors duration-300 shrink-0',
              hasChanges ? 'bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]' : 'bg-emerald-500'
            )} />
            <span className={cn(
              'text-xs font-medium transition-colors duration-300 shrink-0',
              saveSuccessFeedback ? 'text-emerald-400' : hasChanges ? 'text-amber-500' : 'text-zinc-500'
            )}>
              {saveSuccessFeedback ? 'Salvato' : hasChanges ? 'Unsaved Changes' : 'All Changes Saved'}
            </span>
            {onExportHTML != null && (
              <button
                type="button"
                onClick={onExportHTML}
                className="shrink-0 flex items-center gap-1.5 px-2 py-1 rounded text-[11px] font-medium transition-all border border-zinc-700 bg-zinc-900 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600"
              >
                <FileCode size={12} className="shrink-0" />
                <span>HTML</span>
              </button>
            )}
            {onSaveToFile != null && (
              <button
                type="button"
                onClick={(e) => {
                  e.preventDefault();
                  e.stopPropagation();
                  onSaveToFile();
                }}
                disabled={!hasChanges}
                className={cn(
                  'shrink-0 flex items-center gap-1.5 px-2 py-1 rounded text-[11px] font-medium transition-all',
                  hasChanges
                    ? 'bg-blue-600 text-white hover:bg-blue-500 shadow-blue-900/20'
                    : 'bg-zinc-900 text-zinc-600 cursor-not-allowed'
                )}
                title="Salva le modifiche sui file JSON del repo"
              >
                <Save size={12} className="shrink-0" />
                <span>Save</span>
              </button>
            )}
            {onResetToFile != null && showResetToFile && (
              <button
                type="button"
                onClick={onResetToFile}
                className="shrink-0 flex items-center gap-1.5 px-2 py-1 rounded text-[11px] font-medium transition-all border border-zinc-700 bg-zinc-900 text-zinc-400 hover:bg-zinc-800 hover:border-zinc-600 hover:text-zinc-300"
                title="Ripristina la pagina dal file (elimina le modifiche in memoria)"
              >
                <span>Ripristina da file</span>
              </button>
            )}
          </>
        )}
      </div>

      {/* Section settings modal: centered, close via X or Escape to avoid Inspector state freeze. */}
      {settingsModalSectionId != null && allSectionsData.length > 0 && onUpdateSection != null && (() => {
        const modalSection = allSectionsData.find((s) => s.id === settingsModalSectionId);
        const layer = allLayers.find((l) => l.id === settingsModalSectionId);
        if (!modalSection) return null;
        const scope = (layer?.scope === 'global' ? 'global' : 'local') as 'global' | 'local';
        const sectionType = modalSection.type;
        const schema = schemas[sectionType] as z.ZodObject<z.ZodRawShape> | undefined;
        const shapeKeys = schema ? Object.keys(schema.shape) : [];
        const settingsKeys = shapeKeys.filter((k) => SETTINGS_KEYS.has(k));
        const data = (modalSection.data as Record<string, unknown>) ?? {};

        if (settingsKeys.length === 0) {
          return (
            <div
              className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 p-4"
              role="dialog"
              aria-modal="true"
              aria-labelledby="section-settings-modal-title"
              onClick={() => setSettingsModalSectionId(null)}
            >
              <div
                ref={modalContentRef}
                className="relative rounded-lg border border-zinc-700 bg-zinc-900 shadow-xl max-w-md w-full overflow-hidden"
                onClick={(e) => e.stopPropagation()}
              >
                <div className="flex items-center justify-between px-4 py-3 border-b border-zinc-800">
                  <h2 id="section-settings-modal-title" className="text-sm font-bold text-white">
                    Settings — {sectionType}
                  </h2>
                  <button
                    type="button"
                    onClick={() => setSettingsModalSectionId(null)}
                    className="p-1.5 rounded text-zinc-500 hover:text-white hover:bg-zinc-800 transition-colors"
                    aria-label="Close settings"
                  >
                    <X size={18} />
                  </button>
                </div>
                <div className="p-4">
                  <p className="text-xs text-zinc-500">No settings fields for this section.</p>
                </div>
              </div>
            </div>
          );
        }

        return (
          <div
            className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 p-4"
            role="dialog"
            aria-modal="true"
            aria-labelledby="section-settings-modal-title"
            onClick={(e) => e.target === e.currentTarget && setSettingsModalSectionId(null)}
          >
            <div
              ref={modalContentRef}
              className="relative rounded-lg border border-zinc-700 bg-zinc-900 shadow-xl max-w-md w-full max-h-[85vh] flex flex-col overflow-hidden"
              onClick={(e) => e.stopPropagation()}
            >
              <div className="flex items-center justify-between px-4 py-3 border-b border-zinc-800 shrink-0">
                <h2 id="section-settings-modal-title" className="text-sm font-bold text-white">
                  Settings — {sectionType}
                </h2>
                <button
                  type="button"
                  onClick={() => setSettingsModalSectionId(null)}
                  className="p-1.5 rounded text-zinc-500 hover:text-white hover:bg-zinc-800 transition-colors"
                  aria-label="Close settings (Escape)"
                >
                  <X size={18} />
                </button>
              </div>
              <div className="flex-1 overflow-y-auto p-4 custom-scrollbar">
                <FormFactory
                  schema={schema!}
                  data={data}
                  onChange={(newData) => {
                    const merged = { ...(modalSection.data as Record<string, unknown>), ...newData };
                    onUpdateSection(settingsModalSectionId, scope, sectionType, merged);
                  }}
                  keys={settingsKeys}
                />
              </div>
            </div>
          </div>
        );
      })()}
    </aside>
  );
};
