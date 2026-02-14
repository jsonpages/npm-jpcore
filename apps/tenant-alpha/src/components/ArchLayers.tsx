import React from 'react';
import { cn } from '@/lib/utils';
import type { ArchLayersData, BaseSectionSettings } from '@/types';

interface ArchLayersProps {
  data: ArchLayersData;
  settings?: BaseSectionSettings;
}

const layerBgStyles: Record<string, string> = {
  l0: 'bg-[#3b82f6]',
  l1: 'bg-[rgba(59,130,246,0.6)]',
  l2: 'bg-[rgba(59,130,246,0.35)]',
};

const tokenStyles: Record<string, string> = {
  plain: 'text-[#cbd5e1]',
  keyword: 'text-[#60a5fa]',
  type: 'text-[#22d3ee]',
  string: 'text-[#4ade80]',
  comment: 'text-[#64748b] italic',
  operator: 'text-[#f472b6]',
};

export const ArchLayers: React.FC<ArchLayersProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'var(--border)',
        '--local-deep': 'var(--background)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      {/* Top/Bottom dividers */}
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />

      <div className="max-w-[1200px] mx-auto px-8">
        {/* Section Header */}
        <div className="text-center">
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
              <span className="w-5 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
            {data.title}
          </h2>
          {data.description && (
            <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed">
              {data.description}
            </p>
          )}
        </div>

        {/* Layers */}
        <div className="mt-14 max-w-[740px] mx-auto">
          {data.layers.map((layer, idx) => (
            <div
              key={idx}
              className="group border border-[rgba(255,255,255,0.06)] rounded-[7px] p-8 mb-4 bg-[rgba(255,255,255,0.015)] flex items-start gap-6 transition-all duration-300 hover:border-[rgba(59,130,246,0.2)] hover:translate-x-1.5"
            >
              <div className={cn(
                'shrink-0 w-9 h-9 rounded-lg flex items-center justify-center font-mono text-[0.85rem] font-bold text-white',
                layerBgStyles[layer.layerLevel] || layerBgStyles.l0
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

        {/* Code Showcase */}
        {data.codeLines && data.codeLines.length > 0 && (
          <div className="mt-12 max-w-[740px] mx-auto">
            <div className="border border-[rgba(255,255,255,0.08)] rounded-[7px] overflow-hidden bg-[var(--local-deep)]">
              {/* Code Header */}
              <div className="flex items-center gap-2 px-5 py-3 bg-[rgba(255,255,255,0.03)] border-b border-[rgba(255,255,255,0.06)]">
                <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
                {data.codeFilename && (
                  <span className="ml-3 font-mono text-[0.75rem] text-[var(--local-text-muted)] opacity-60">
                    {data.codeFilename}
                  </span>
                )}
              </div>
              {/* Code Body */}
              <div className="p-6 font-mono text-[0.82rem] leading-[1.7] overflow-x-auto">
                {data.codeLines.map((line, idx) => (
                  <div key={idx}>
                    <span className={tokenStyles[line.tokenType] || tokenStyles.plain}>
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


