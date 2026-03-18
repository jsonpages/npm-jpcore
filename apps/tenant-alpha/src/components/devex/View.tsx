import React from 'react';
import type { DevexData, DevexSettings } from './types';

// The App.tsx snippet is canonical product content — not editable copy.
const APP_TSX_LINES = [
  { t: 'cm',  c: '// Your App.tsx is incredibly thin.'                 },
  { t: 'pl',  c: ''                                                     },
  { t: 'kw',  c: "import { JsonPagesEngine } from '@jsonpages/core';"  },
  { t: 'kw',  c: "import { config } from './my-config';"               },
  { t: 'pl',  c: ''                                                     },
  { t: 'kw',  c: 'export default function App() {'                     },
  { t: 'cm',  c: '  // The Engine takes over from here'                },
  { t: 'fn',  c: '  return <JsonPagesEngine config={config} />;'       },
  { t: 'pl',  c: '}'                                                    },
] as const;

const tokenClass: Record<string, string> = {
  cm: 'text-[var(--local-panel-text-faint)] italic',
  kw: 'text-[var(--local-accent)]',
  fn: 'text-[var(--local-primary)]',
  pl: 'text-[var(--local-panel-text-soft)]',
};

export const Devex: React.FC<{ data: DevexData; settings?: DevexSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg':         'var(--background)',
        '--local-text':       'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary':    'var(--primary)',
        '--local-accent':     'var(--accent)',
        '--local-border':     'var(--border)',
        '--local-radius-lg':  'var(--theme-radius-lg)',
        '--local-panel-bg':   'var(--demo-surface)',
        '--local-panel-deep': 'var(--demo-surface-deep)',
        '--local-panel-border': 'var(--demo-border-soft)',
        '--local-panel-border-strong': 'var(--demo-border-strong)',
        '--local-panel-text-soft': 'var(--demo-text-soft)',
        '--local-panel-text-faint': 'var(--demo-text-faint)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border-strong)] to-transparent" />
      <div className="max-w-[1200px] mx-auto px-8 grid grid-cols-2 gap-24 items-center">

        {/* LEFT */}
        <div>
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.68rem] font-mono font-bold uppercase tracking-[0.14em] text-[var(--local-accent)] mb-5" data-jp-field="label">
              <span className="w-6 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2
            className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black text-[var(--local-text)] leading-[1.05] tracking-tight mb-5"
            data-jp-field="title"
          >
            {data.title}
          </h2>
          {data.description && (
            <p className="text-[1.05rem] text-[var(--local-text-muted)] leading-[1.75] mb-8" data-jp-field="description">
              {data.description}
            </p>
          )}
          {data.features && data.features.length > 0 && (
            <ul className="flex flex-col">
              {data.features.map((f, idx) => (
                <li
                  key={f.id ?? idx}
                  className="flex items-center gap-3.5 text-[0.9rem] text-[var(--local-text-muted)] py-3.5 border-b border-[var(--local-panel-border)] last:border-b-0 hover:text-[var(--local-text)] hover:pl-1.5 transition-all"
                  data-jp-item-id={f.id ?? `legacy-${idx}`}
                  data-jp-item-field="features"
                >
                  <svg className="w-4 h-4 text-[var(--local-primary)] flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  {f.text}
                </li>
              ))}
            </ul>
          )}
        </div>

        {/* RIGHT — code window */}
        <div className="rounded-[var(--local-radius-lg)] overflow-hidden border border-[var(--local-panel-border)] shadow-[0_30px_60px_rgba(0,0,0,0.5),0_0_40px_rgba(59,130,246,0.06)]">
          <div className="bg-[var(--local-panel-bg)] px-4 py-2.5 flex items-center gap-1.5 border-b border-[var(--local-panel-border)]">
            <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
            <span className="ml-auto font-mono text-[0.62rem] text-[var(--local-panel-text-faint)]">src/App.tsx</span>
          </div>
          <div className="bg-[var(--local-panel-deep)] px-8 py-7 font-mono text-[0.80rem] leading-[2] overflow-x-auto">
            {APP_TSX_LINES.map((ln, i) => (
              <div key={i}>
                <span className={tokenClass[ln.t]}>{ln.c || '\u00A0'}</span>
              </div>
            ))}
          </div>
        </div>

      </div>
    </section>
  );
};
