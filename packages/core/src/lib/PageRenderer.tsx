import React, { useState, useRef, useEffect } from 'react';
import { SectionRenderer } from './SectionRenderer';
import { useDocumentMeta } from '../hooks/useDocumentMeta';
import type { PageRendererProps } from './kernel';

const REORDER_DATA_KEY = 'application/json';

type Props = PageRendererProps & {
  onReorder?: (sectionId: string, newIndex: number) => void;
  /** When set, scroll this section into view (Studio full-page). */
  scrollToSectionId?: string | null;
  /** Report which section is most visible in viewport (Intersection Observer). */
  onActiveSectionChange?: (sectionId: string | null) => void;
};

export const PageRenderer: React.FC<Props> = ({
  pageConfig,
  siteConfig,
  menuConfig,
  selectedId,
  onReorder,
  scrollToSectionId,
  onActiveSectionChange,
}) => {
  useDocumentMeta(pageConfig.meta);
  const [dropIndex, setDropIndex] = useState<number | null>(null);
  const sectionRefs = useRef<Record<string, HTMLElement | null>>({});
  const onActiveSectionChangeRef = useRef(onActiveSectionChange);
  onActiveSectionChangeRef.current = onActiveSectionChange;

  const handleSectionHover = (sectionId: string) => {
    onActiveSectionChangeRef.current?.(sectionId);
  };

  useEffect(() => {
    if (!scrollToSectionId) return;
    const el = sectionRefs.current[scrollToSectionId];
    if (el) el.scrollIntoView({ behavior: 'smooth', block: 'center' });
  }, [scrollToSectionId]);

  /** Active section (green LED): stable observer, callback via ref so effect doesn't re-run every render. */
  useEffect(() => {
    const callback = onActiveSectionChangeRef.current;
    if (!callback) return;
    const ids: string[] = [
      ...(siteConfig.header ? [siteConfig.header.id] : []),
      ...pageConfig.sections.map((s) => s.id),
      ...(siteConfig.footer ? [siteConfig.footer.id] : []),
    ];
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && entry.intersectionRatio > 0.5) {
            const id = (entry.target as HTMLElement).getAttribute('data-section-id');
            if (id) onActiveSectionChangeRef.current?.(id);
          }
        });
      },
      { threshold: [0, 0.5, 1], rootMargin: '-20% 0px -20% 0px' }
    );
    let cancelled = false;
    const rafId = requestAnimationFrame(() => {
      if (cancelled) return;
      ids.forEach((id) => {
        const el = sectionRefs.current[id];
        if (el) observer.observe(el);
      });
    });
    return () => {
      cancelled = true;
      cancelAnimationFrame(rafId);
      observer.disconnect();
    };
  }, [pageConfig.sections, siteConfig.header?.id, siteConfig.footer?.id]);

  const handleDragOver = (e: React.DragEvent, index: number) => {
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
    setDropIndex(index);
  };

  const handleDragLeave = () => {
    setDropIndex(null);
  };

  const handleDrop = (e: React.DragEvent, insertIndex: number) => {
    e.preventDefault();
    setDropIndex(null);
    if (!onReorder) return;
    try {
      const raw = e.dataTransfer.getData(REORDER_DATA_KEY);
      const { sectionId } = JSON.parse(raw) as { sectionId?: string };
      if (typeof sectionId === 'string') onReorder(sectionId, insertIndex);
    } catch {
      // ignore
    }
  };

  const renderPageSections = () => {
    const reorderable = typeof onReorder === 'function';
    const sections = pageConfig.sections.map((section, index) => {
      const showDropIndicator = dropIndex === index;

      if (!reorderable) {
        return (
          <div
            key={section.id}
            ref={(el) => { sectionRefs.current[section.id] = el; }}
            data-section-id={section.id}
            onMouseEnter={() => handleSectionHover(section.id)}
          >
            <SectionRenderer section={section} selectedId={selectedId} />
          </div>
        );
      }

      return (
        <div
          key={section.id}
          ref={(el) => { sectionRefs.current[section.id] = el; }}
          data-section-id={section.id}
          style={{ position: 'relative' }}
          onMouseEnter={() => handleSectionHover(section.id)}
        >
          <div
            data-jp-drop-zone
            style={{
              position: 'absolute',
              left: 0,
              right: 0,
              top: -1,
              height: 12,
              zIndex: 55,
              pointerEvents: 'auto',
              backgroundColor: showDropIndicator ? 'rgba(59, 130, 246, 0.4)' : 'transparent',
              borderTop: showDropIndicator ? '2px solid rgb(96, 165, 250)' : '2px solid transparent',
            }}
            onDragOver={(e) => handleDragOver(e, index)}
            onDragLeave={handleDragLeave}
            onDrop={(e) => handleDrop(e, index)}
          />
          <SectionRenderer
            section={section}
            selectedId={selectedId}
            reorderable
            sectionIndex={index}
            totalSections={pageConfig.sections.length}
            onReorder={onReorder}
          />
        </div>
      );
    });

    if (reorderable && sections.length > 0) {
      const lastIndex = pageConfig.sections.length;
      const showDropIndicator = dropIndex === lastIndex;
      sections.push(
        <div
          key="jp-drop-after-last"
          data-jp-drop-zone
          style={{
            position: 'relative',
            left: 0,
            right: 0,
            height: 24,
            minHeight: 24,
            zIndex: 55,
            pointerEvents: 'auto',
            backgroundColor: showDropIndicator ? 'rgba(59, 130, 246, 0.4)' : 'transparent',
            borderTop: showDropIndicator ? '2px solid rgb(96, 165, 250)' : '2px solid transparent',
          }}
          onDragOver={(e) => handleDragOver(e, lastIndex)}
          onDragLeave={handleDragLeave}
          onDrop={(e) => handleDrop(e, lastIndex)}
        />
      );
    }

    return sections;
  };

  return (
    <div className="min-h-screen flex flex-col bg-[var(--color-background)]">
      {siteConfig.header != null && (
        <div
          ref={(el) => { sectionRefs.current[siteConfig.header!.id] = el; }}
          data-section-id={siteConfig.header.id}
          onMouseEnter={() => handleSectionHover(siteConfig.header!.id)}
        >
          <SectionRenderer
            section={siteConfig.header}
            menu={menuConfig.main}
            selectedId={selectedId}
          />
        </div>
      )}

      <main className="flex-1">{renderPageSections()}</main>

      {siteConfig.footer != null && (
        <div
          ref={(el) => { sectionRefs.current[siteConfig.footer!.id] = el; }}
          data-section-id={siteConfig.footer.id}
          onMouseEnter={() => handleSectionHover(siteConfig.footer!.id)}
        >
          <SectionRenderer section={siteConfig.footer} selectedId={selectedId} />
        </div>
      )}
    </div>
  );
};
