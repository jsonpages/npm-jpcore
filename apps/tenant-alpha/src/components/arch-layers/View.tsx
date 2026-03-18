import React from 'react';
import { cn } from '@/lib/utils';
import type { ArchLayersData, ArchLayersSettings, ArchLayerLevel, SyntaxTokenType } from './types';

const layerBgStyles: Record<ArchLayerLevel, string> = {
  l0: 'bg-[var(--local-primary)]',
  l1: 'bg-[var(--local-accent-strong)]',
  l2: 'bg-[var(--local-accent-soft)]',
};

const tokenStyles: Record<SyntaxTokenType, string> = {
  plain: 'text-[var(--local-demo-text)]',
  keyword: 'text-[var(--local-accent)]',
  type: 'text-[var(--local-cyan)]',
  string: 'text-[var(--local-primary)]',
  comment: 'text-[var(--local-demo-text-faint)] italic',
  operator: 'text-[var(--local-accent)]',
};

export const ArchLayers: React.FC<{ data: ArchLayersData; settings?: ArchLayersSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--accent)',
        '--local-cyan': 'var(--secondary)',
        '--local-border': 'var(--border)',
        '--local-deep': 'var(--background)',
        '--local-radius-md': 'var(--theme-radius-md)',
        '--local-radius-lg': 'var(--theme-radius-lg)',
        '--local-panel-bg': 'var(--demo-surface-soft)',
        '--local-panel-bar': 'var(--demo-surface)',
        '--local-panel-border': 'var(--demo-border-soft)',
        '--local-panel-border-strong': 'var(--demo-border-strong)',
        '--local-accent-soft': 'var(--demo-accent-soft)',
        '--local-accent-strong': 'var(--demo-accent-strong)',
        '--local-demo-text': 'var(--demo-text-soft)',
        '--local-demo-text-faint': 'var(--demo-text-faint)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border-strong)] to-transparent" />
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border-strong)] to-transparent" />
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="text-center">
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4" data-jp-field="label">
              <span className="w-5 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4" data-jp-field="title">
            {data.title}
          </h2>
          {data.description && (
            <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed" data-jp-field="description">
              {data.description}
            </p>
          )}
        </div>
        <div className="mt-14 max-w-[740px] mx-auto">
          {data.layers.map((layer, idx) => (
            <div
              key={layer.id ?? idx}
              className="group border border-[var(--local-panel-border)] rounded-[var(--local-radius-md)] p-8 mb-4 bg-[var(--local-panel-bg)] flex items-start gap-6 transition-all duration-300 hover:border-[var(--local-panel-border-strong)] hover:translate-x-1.5"
              data-jp-item-id={layer.id ?? `legacy-${idx}`}
              data-jp-item-field="layers"
            >
              <div className={cn(
                'shrink-0 w-9 h-9 rounded-[var(--local-radius-md)] flex items-center justify-center font-mono text-[0.85rem] font-bold text-white',
                layerBgStyles[layer.layerLevel]
              )}>
                {layer.number}
              </div>
              <div>
                <h4 className="text-[1.05rem] font-bold text-[var(--local-text)] mb-1.5">
                  {layer.title}
                </h4>
                <p className="text-[0.92rem] text-[var(--local-text-muted)] leading-relaxed">
                  {layer.description}
                </p>
              </div>
            </div>
          ))}
        </div>
        {data.codeLines && data.codeLines.length > 0 && (
          <div className="mt-12 max-w-[740px] mx-auto">
            <div className="border border-[var(--local-panel-border)] rounded-[var(--local-radius-md)] overflow-hidden bg-[var(--local-deep)]">
              <div className="flex items-center gap-2 px-5 py-3 bg-[var(--local-panel-bar)] border-b border-[var(--local-panel-border)]">
                <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
                {data.codeFilename && (
                  <span className="ml-3 font-mono text-[0.75rem] text-[var(--local-text-muted)] opacity-60" data-jp-field="codeFilename">
                    {data.codeFilename}
                  </span>
                )}
              </div>
              <div className="p-6 font-mono text-[0.82rem] leading-[1.7] overflow-x-auto">
                {data.codeLines.map((line, idx) => (
                  <div key={idx} data-jp-item-id={(line as { id?: string }).id ?? `legacy-${idx}`} data-jp-item-field="codeLines">
                    <span className={tokenStyles[line.tokenType]}>
                      {line.content}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>
    </section>
  );
};
