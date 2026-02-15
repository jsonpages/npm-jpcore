import React, { useState } from 'react';
import { SectionRenderer } from './SectionRenderer';
import { useDocumentMeta } from '../hooks/useDocumentMeta';
import type { PageRendererProps } from './kernel';

const REORDER_DATA_KEY = 'application/json';

export const PageRenderer: React.FC<PageRendererProps> = ({
  pageConfig,
  siteConfig,
  menuConfig,
  selectedId,
  onReorder,
}) => {
  useDocumentMeta(pageConfig.meta);
  const [dropIndex, setDropIndex] = useState<number | null>(null);

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
          <SectionRenderer
            key={section.id}
            section={section}
            selectedId={selectedId}
          />
        );
      }

      return (
        <div key={section.id} style={{ position: 'relative' }}>
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
        <SectionRenderer
          section={siteConfig.header}
          menu={menuConfig.main}
          selectedId={selectedId}
        />
      )}

      <main className="flex-1">{renderPageSections()}</main>

      {siteConfig.footer != null && (
        <SectionRenderer
          section={siteConfig.footer}
          selectedId={selectedId}
        />
      )}
    </div>
  );
};



