import React, { useState, useEffect, useRef, useDeferredValue, useMemo } from 'react';
import { z } from 'zod';
import { useConfig } from '../lib/ConfigContext';
import { cn } from '../lib/utils';
import { FormFactory } from './FormFactory';
import type { PageConfig, Section } from '../lib/kernel';
import { Layers, ChevronUp, ChevronDown, GripVertical, Settings, Trash2, AlertCircle, X, Plus, FileCode, Save, FileText } from 'lucide-react';
import { Button } from '../components/ui/button';
import { Tooltip, TooltipTrigger, TooltipContent, TooltipProvider } from '../components/ui/tooltip';
import { Popover, PopoverTrigger, PopoverContent } from '../components/ui/popover';
import { ScrollArea } from '../components/ui/scroll-area';

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

function renderLayerRow(
  layer: LayerItem,
  opts: {
    isSelected: boolean;
    isActive: boolean;
    isDragging: boolean;
    canReorder: boolean;
    canDelete: boolean;
    deleteConfirm: boolean;
    onSelect: () => void;
    onDragStart: (e: React.DragEvent) => void;
    onDragOver: (e: React.DragEvent) => void;
    onDragLeave: () => void;
    onDrop: (e: React.DragEvent) => void;
    onDragEnd: () => void;
    onDelete: () => void;
    onOpenSettings: (e: React.MouseEvent) => void;
  }
) {
  const {
    isSelected,
    isActive,
    isDragging,
    canReorder,
    canDelete,
    deleteConfirm,
    onSelect,
    onDragStart,
    onDragOver,
    onDragLeave,
    onDrop,
    onDragEnd,
    onDelete,
    onOpenSettings,
  } = opts;
  return (
    <div
      key={layer.id}
      draggable={canReorder}
      onDragStart={canReorder ? onDragStart : undefined}
      onDragOver={onDragOver}
      onDragLeave={onDragLeave}
      onDrop={onDrop}
      onDragEnd={onDragEnd}
      className={cn(
        'group flex items-center gap-2 pl-1 pr-2 py-2.5 rounded-lg text-left transition-all duration-100 cursor-pointer border-l-2',
        isSelected ? 'bg-primary/[0.08] border-primary' : isActive ? 'bg-zinc-800/30 border-emerald-500/60' : 'border-transparent hover:bg-zinc-800/40',
        isDragging && 'opacity-40',
        canReorder ? 'cursor-grab active:cursor-grabbing' : 'cursor-default'
      )}
    >
      <span className="shrink-0 w-5 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-150 cursor-grab">
        <GripVertical size={12} className="text-zinc-600" />
      </span>
      <button type="button" onClick={onSelect} className="flex-1 min-w-0 text-left">
        <div className="flex items-center gap-1.5">
          <span className={cn('text-xs font-bold uppercase tracking-[0.06em] truncate', isSelected ? 'text-primary' : 'text-zinc-500')}>
            {layer.type}
          </span>
          {isActive && <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" aria-hidden />}
        </div>
        <span className="text-[11px] text-zinc-600 block truncate leading-snug mt-0.5">
          {layer.title ?? `${layer.type} section`}
        </span>
      </button>
      <div className="flex items-center gap-0.5 opacity-0 group-hover:opacity-100 transition-opacity duration-150">
        <Tooltip>
          <TooltipTrigger asChild>
            <Button variant="ghost" size="icon-xs" className="text-zinc-600 hover:text-zinc-300" onClick={(e) => { e.stopPropagation(); onOpenSettings(e); }}>
              <Settings size={12} />
            </Button>
          </TooltipTrigger>
          <TooltipContent>Settings</TooltipContent>
        </Tooltip>
        {canDelete && (
          <Tooltip>
            <TooltipTrigger asChild>
              <Button variant="ghost" size="icon-xs" className="text-zinc-600 hover:text-destructive" onClick={(e) => { e.stopPropagation(); onDelete(); }}>
                <Trash2 size={12} />
              </Button>
            </TooltipTrigger>
            <TooltipContent>Delete section</TooltipContent>
          </Tooltip>
        )}
      </div>
    </div>
  );
}

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
    const draggedLayer = allLayers.find((l) => l.id === draggedId);
    if (!draggedLayer || draggedLayer.scope !== 'local') return;
    const from = allLayers.findIndex((l) => l.id === draggedId);
    const to = allLayers.findIndex((l) => l.id === targetId);
    if (from === -1 || to === -1) return;
    onReorderSection(draggedId, to);
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

  /** Page switcher: current page label (slug if no labels map). */
  const currentPageLabel = currentSlug ? currentSlug.charAt(0).toUpperCase() + currentSlug.slice(1) : 'Select page';

  /** Live reorder: during drag, show list in the order it would be after drop. */
  const displayOrder = useMemo(() => {
    if (!draggedId || !dragOverId || draggedId === dragOverId) return allLayers;
    const from = allLayers.findIndex((l) => l.id === draggedId);
    const to = allLayers.findIndex((l) => l.id === dragOverId);
    if (from === -1 || to === -1) return allLayers;
    const next = [...allLayers];
    const [item] = next.splice(from, 1);
    const insertAt = from < to ? to - 1 : to;
    next.splice(insertAt, 0, item);
    return next;
  }, [allLayers, draggedId, dragOverId]);

  /** Render list in displayOrder with separators only when type changes (header→content, content→footer). Single list = drag preview works across all positions. */
  const layerRowsWithSeparators = useMemo(() => {
    const rows: Array<{ layer: LayerItem; showSeparatorAbove: boolean }> = [];
    let prevType: string | null = null;
    for (const layer of displayOrder) {
      const type = layer.type.toUpperCase();
      const showSeparatorAbove =
        prevType !== null &&
        ((prevType === 'HEADER' && type !== 'HEADER') ||
          (prevType !== 'HEADER' && prevType !== 'FOOTER' && type === 'FOOTER'));
      rows.push({ layer, showSeparatorAbove });
      prevType = type;
    }
    return rows;
  }, [displayOrder]);

  return (
    <TooltipProvider>
      <aside className="relative w-full h-full bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 min-w-0 animate-in slide-in-from-right duration-300">
        {/* Header: Inspector + page context or type|scope */}
        <div className="flex items-center justify-between px-4 py-3 border-b border-zinc-800 shrink-0">
          <div className="min-w-0">
            <h2 className="text-sm font-bold text-white">Inspector</h2>
            <p className="text-[10px] tracking-[0.06em] text-zinc-600 mt-0.5">
              {selectedSection ? (
                <>
                  <span className="text-primary font-bold">{selectedSection.type}</span>
                  <span className="text-zinc-700 mx-1.5">|</span>
                  <span className="uppercase">{selectedSection.scope}</span>
                </>
              ) : (
                <span className="text-zinc-600">
                  {currentPageLabel} · {allLayers.length} sections
                </span>
              )}
            </p>
          </div>
          <Button variant="ghost" size="icon-sm" onClick={onClose} aria-label="Close Inspector">
            <X size={14} />
          </Button>
        </div>

        {/* Page Switcher: rounded, transparent when closed; open dropdown = sidebar bg */}
        {pageSlugs.length > 0 && onPageChange && (
          <Popover>
            <PopoverTrigger asChild>
              <button
                type="button"
                className={cn(
                  'flex items-center gap-2 w-full mx-3 mt-2 mb-1 pl-3 pr-4 py-2 rounded-lg border text-left transition-all duration-150 cursor-pointer',
                  'bg-transparent border-zinc-800 text-zinc-400 hover:text-zinc-200 hover:bg-zinc-800/50 hover:border-zinc-700',
                  'data-[state=open]:bg-zinc-950 data-[state=open]:border-zinc-800 data-[state=open]:text-zinc-100'
                )}
              >
                <FileText size={14} className="shrink-0 text-zinc-500" aria-hidden />
                <span className="text-xs font-medium flex-1 truncate">{currentPageLabel}</span>
                <ChevronDown size={13} className="shrink-0 text-zinc-500" />
              </button>
            </PopoverTrigger>
            <PopoverContent align="start" sideOffset={4} className="min-w-[var(--radix-popover-trigger-width)] bg-zinc-950 border-zinc-800">
              {pageSlugs.map((slug) => {
                const isActive = slug === currentSlug;
                const label = slug.charAt(0).toUpperCase() + slug.slice(1);
                return (
                  <button
                    key={slug}
                    type="button"
                    onClick={() => {
                      onPageChange(slug);
                    }}
                    className={cn(
                      'flex items-center justify-between w-full px-2.5 py-2 rounded-md text-xs transition-colors cursor-pointer',
                      isActive ? 'bg-primary/10 text-primary font-semibold' : 'text-zinc-400 hover:bg-zinc-800 hover:text-zinc-200'
                    )}
                  >
                    <span>{label}</span>
                    <span className="text-[10px] text-zinc-600 tabular-nums">{allLayers.length}s</span>
                  </button>
                );
              })}
              <div className="border-t border-zinc-800 mt-1 pt-1">
                <button
                  type="button"
                  className="flex items-center gap-1.5 w-full px-2.5 py-2 rounded-md text-[11px] text-zinc-600 hover:text-zinc-300 hover:bg-zinc-800 transition-colors cursor-pointer"
                  aria-label="New page (not implemented)"
                >
                  <Plus size={12} />
                  <span>New page</span>
                </button>
              </div>
            </PopoverContent>
          </Popover>
        )}

        {/* Page Layers header */}
        {allLayers.length > 0 && (
          <div className="flex items-center gap-2 px-4 py-2 border-t border-zinc-800/50">
            <button
              type="button"
              onClick={handlePageLayersToggle}
              className="flex items-center gap-2 flex-1 cursor-pointer min-w-0 text-left"
              aria-expanded={showLayersList}
              aria-label={showLayersList ? 'Collapse Page Layers' : 'Expand Page Layers'}
            >
              <Layers size={14} className="text-zinc-500 shrink-0" />
              <span className="text-[11px] font-semibold tracking-[0.04em] text-zinc-400">Page Layers</span>
              <span className="text-[10px] text-zinc-600">({allLayers.length})</span>
              <ChevronUp
                size={13}
                className={cn('ml-auto text-zinc-600 transition-transform duration-200 shrink-0', !layersOpen && 'rotate-180')}
              />
            </button>
            {onAddSection != null && (
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button variant="ghost" size="icon-sm" className="text-zinc-500 hover:text-primary" onClick={onAddSection}>
                    <Plus size={14} />
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Add section</TooltipContent>
              </Tooltip>
            )}
          </div>
        )}

      <ScrollArea className="flex-1 min-h-0 flex flex-col">
        <div ref={contentScrollRef} className="flex flex-col min-h-0">
        {showLayersList && (
          <div className="py-1">
            <div className="px-2 space-y-0.5">
              {layerRowsWithSeparators.map(({ layer, showSeparatorAbove }) => (
                <React.Fragment key={layer.id}>
                  {showSeparatorAbove && <div className="mx-3 border-t border-zinc-800/60 my-1" />}
                  {renderLayerRow(layer, {
                    isSelected: selectedSection?.id === layer.id,
                    isActive: activeSectionId === layer.id,
                    isDragging: draggedId === layer.id,
                    canReorder: layer.scope === 'local' && !!onReorderSection,
                    canDelete: layer.scope === 'local' && !!onDeleteSection,
                    deleteConfirm: deleteConfirm === layer.id,
                    onSelect: () => handleLayerClick(layer.id),
                    onDragStart: (e) => handleDragStart(e, layer.id),
                    onDragOver: (e) => handleDragOver(e, layer.id),
                    onDragLeave: () => setDragOverId(null),
                    onDrop: (e) => handleDrop(e, layer.id),
                    onDragEnd: () => { setDraggedId(null); setDragOverId(null); },
                    onDelete: () => handleDelete(layer.id),
                    onOpenSettings: (e) => handleOpenSectionSettings(layer.id, e),
                  })}
                </React.Fragment>
              ))}
            </div>
            {deleteConfirm && (
              <div className="flex items-center gap-2 py-2 px-3 mt-1 mx-2 rounded-md bg-amber-500/10 border border-amber-500/30">
                <AlertCircle size={12} className="text-amber-500 shrink-0" />
                <p className="text-[10px] text-amber-500 font-medium">Click delete again to confirm</p>
              </div>
            )}
          </div>
        )}

        </div>
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
            <p className="text-xs text-zinc-600 text-center py-10">
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
      </ScrollArea>

      <div className="px-4 py-2.5 border-t border-zinc-800 bg-zinc-900/50 flex items-center gap-3 opacity-100 flex-wrap shrink-0">
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
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button variant="outline" size="sm" className="gap-1.5" onClick={onExportHTML}>
                    <FileCode size={12} />
                    <span>Bake HTML</span>
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Generate static HTML output</TooltipContent>
              </Tooltip>
            )}
            {onSaveToFile != null && (
              <Tooltip>
                <TooltipTrigger asChild>
                  <Button
                    size="sm"
                    disabled={!hasChanges}
                    className="gap-1.5"
                    onClick={(e) => {
                      e.preventDefault();
                      e.stopPropagation();
                      onSaveToFile();
                    }}
                  >
                    <Save size={12} />
                    <span>Save</span>
                  </Button>
                </TooltipTrigger>
                <TooltipContent>Save (export JSON)</TooltipContent>
              </Tooltip>
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
    </TooltipProvider>
  );
};
