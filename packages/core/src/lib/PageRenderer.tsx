import React from 'react';
import { SectionRenderer } from './SectionRenderer';
import { useDocumentMeta } from '../hooks/useDocumentMeta';
import type { PageRendererProps } from './kernel';

export const PageRenderer: React.FC<PageRendererProps> = ({ 
  pageConfig, 
  siteConfig, 
  menuConfig,
  selectedId
}) => {
  useDocumentMeta(pageConfig.meta);

  return (
    <div className="min-h-screen flex flex-col bg-[var(--color-background)]">
      {siteConfig.header != null && (
        <SectionRenderer
          section={siteConfig.header}
          menu={menuConfig.main}
          selectedId={selectedId}
        />
      )}

      <main className="flex-1">
        {pageConfig.sections.map((section) => (
          <SectionRenderer
            key={section.id}
            section={section}
            selectedId={selectedId}
          />
        ))}
      </main>

      {siteConfig.footer != null && (
        <SectionRenderer
          section={siteConfig.footer}
          selectedId={selectedId}
        />
      )}
    </div>
  );
};



