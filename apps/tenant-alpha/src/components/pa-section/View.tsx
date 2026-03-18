import React from 'react';
import type { PaSectionData, PaSectionSettings } from './types';

export const PaSection: React.FC<{ data: PaSectionData; settings?: PaSectionSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--accent)',
        '--local-deep': 'var(--background)',
        '--local-radius-md': 'var(--theme-radius-md)',
        '--local-radius-lg': 'var(--theme-radius-lg)',
        '--local-panel-bg': 'var(--demo-surface-soft)',
        '--local-panel-border': 'var(--demo-border-soft)',
        '--local-panel-border-strong': 'var(--demo-border-strong)',
        '--local-accent-soft': 'var(--demo-accent-soft)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border-strong)] to-transparent" />
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border-strong)] to-transparent" />
      <div className="max-w-[1200px] mx-auto px-8">
        {data.label && (
          <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4" data-jp-field="label">
            <span className="w-5 h-px bg-[var(--local-primary)]" />
            {data.label}
          </div>
        )}
        <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4" data-jp-field="title">
          {data.title}
        </h2>
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center mt-12">
          <div>
            <h3 className="text-2xl font-bold text-[var(--local-text)] mb-4" data-jp-field="subtitle">
              {data.subtitle}
            </h3>
            {data.paragraphs.map((p, idx) => (
              <p key={idx} className="text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed" data-jp-item-id={(p as { id?: string }).id ?? `legacy-${idx}`} data-jp-item-field="paragraphs">
                {p.text}
              </p>
            ))}
            {data.badges && data.badges.length > 0 && (
              <div className="flex gap-2.5 flex-wrap mt-4">
                {data.badges.map((badge, idx) => (
                  <span
                    key={idx}
                    className="inline-flex items-center gap-1.5 bg-[var(--local-accent-soft)] border border-[var(--local-panel-border-strong)] text-[var(--local-accent)] px-3 py-1.5 rounded-[var(--local-radius-md)] text-[0.78rem] font-semibold"
                    data-jp-item-id={(badge as { id?: string }).id ?? `legacy-${idx}`}
                    data-jp-item-field="badges"
                  >
                    {badge.label}
                  </span>
                ))}
              </div>
            )}
          </div>
          <div className="border border-[var(--local-panel-border)] rounded-[var(--local-radius-lg)] p-12 bg-[var(--local-panel-bg)] text-center">
            {data.engines && data.engines.length >= 2 && (
              <div className="flex items-center justify-center gap-6 mb-8">
                {data.engines.map((engine, idx) => (
                  <React.Fragment key={idx}>
                    {idx > 0 && (
                      <span className="text-[var(--local-text-muted)] text-2xl opacity-50">⇄</span>
                    )}
                    <div
                      className={
                        engine.variant === 'tailwind'
                          ? 'px-6 py-4 rounded-[var(--local-radius-md)] font-bold text-[0.95rem] border bg-[var(--local-accent-soft)] border-[var(--local-panel-border-strong)] text-[var(--local-accent)]'
                          : 'px-6 py-4 rounded-[var(--local-radius-md)] font-bold text-[0.95rem] border bg-[var(--local-panel-bg)] border-[var(--local-panel-border)] text-[var(--local-primary)]'
                      }
                      data-jp-item-id={(engine as { id?: string }).id ?? `legacy-${idx}`}
                      data-jp-item-field="engines"
                    >
                      {engine.label}
                    </div>
                  </React.Fragment>
                ))}
              </div>
            )}
            {data.codeSnippet && (
              <div className="font-mono text-[0.85rem] text-[var(--local-text-muted)] bg-[var(--local-deep)] p-4 rounded-[var(--local-radius-lg)] text-left border border-[var(--local-panel-border)]" data-jp-field="codeSnippet">
                <pre className="whitespace-pre-wrap m-0">{data.codeSnippet}</pre>
                <div className="mt-4 text-[0.75rem] text-center opacity-50">
                  Same JSON. Different Render Engine.
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
};
