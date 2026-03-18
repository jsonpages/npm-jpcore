import React from 'react';
import { cn } from '@/lib/utils';
import type { ProblemStatementData, ProblemStatementSettings, SiloBlockVariant } from './types';

const variantStyles: Record<SiloBlockVariant, string> = {
  red: 'bg-[var(--local-panel-bg)] border-[var(--local-panel-border)] text-[var(--local-text-muted)]',
  amber: 'bg-[var(--local-panel-bg)] border-[var(--local-panel-border)] text-[var(--local-text-muted)]',
  green: 'bg-[var(--local-accent-soft)] border-[var(--local-panel-border-strong)] text-[var(--local-accent)]',
  blue: 'bg-[var(--local-accent-soft)] border-[var(--local-panel-border-strong)] text-[var(--local-accent)]',
};

export const ProblemStatement: React.FC<{ data: ProblemStatementData; settings?: ProblemStatementSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-surface': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-border': 'var(--border)',
        '--local-radius-md': 'var(--theme-radius-md)',
        '--local-radius-lg': 'var(--theme-radius-lg)',
        '--local-panel-bg': 'var(--demo-surface-soft)',
        '--local-panel-border': 'var(--demo-border-soft)',
        '--local-panel-border-strong': 'var(--demo-border-strong)',
        '--local-accent': 'var(--accent)',
        '--local-accent-soft': 'var(--demo-accent-soft)',
      } as React.CSSProperties}
      className="jp-problem relative z-0 py-28 bg-gradient-to-b from-[var(--local-bg)] to-[var(--local-surface)]"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          <div className="relative h-[360px] border border-[var(--local-panel-border)] rounded-[var(--local-radius-lg)] bg-[var(--local-panel-bg)] overflow-hidden flex items-center justify-center">
            <div className="text-center p-8">
              {data.siloGroups.map((group, gIdx) => (
                <div
                  key={gIdx}
                  className="mb-4"
                  data-jp-item-id={(group as { id?: string }).id ?? `legacy-${gIdx}`}
                  data-jp-item-field="siloGroups"
                >
                  <div className="flex flex-wrap justify-center gap-1.5">
                    {group.blocks.map((block, bIdx) => (
                      <span
                        key={(block as { id?: string }).id ?? bIdx}
                        className={cn(
                          'inline-block px-4 py-2 rounded-[var(--local-radius-md)] text-[0.8rem] font-semibold border',
                          variantStyles[block.variant]
                        )}
                        data-jp-item-id={(block as { id?: string }).id ?? `legacy-${bIdx}`}
                        data-jp-item-field="blocks"
                      >
                        {block.label}
                      </span>
                    ))}
                  </div>
                  <span className="text-[0.7rem] text-[var(--local-text-muted)] uppercase tracking-widest mt-2 block opacity-60">
                    {group.label}
                  </span>
                </div>
              ))}
            </div>
          </div>
          <div>
            <h3 className="text-2xl font-bold text-[var(--local-text)] mb-4" data-jp-field="title">
              {data.title}
            </h3>
            {data.paragraphs.map((p, idx) => (
              <p
                key={idx}
                className="text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed"
                data-jp-item-id={(p as { id?: string }).id ?? `legacy-${idx}`}
                data-jp-item-field="paragraphs"
              >
                {p.isBold ? <strong className="text-[var(--local-text)]">{p.text}</strong> : p.text}
              </p>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};
