import React from 'react';
import type { CliSectionData, CliSectionSettings } from './types';

export const CliSection: React.FC<{ data: CliSectionData; settings?: CliSectionSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg':         'var(--card)',
        '--local-text':       'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary':    'var(--primary)',
        '--local-accent':     'var(--accent)',
        '--local-border':     'var(--border)',
        '--local-radius-sm':  'var(--theme-radius-sm)',
        '--local-radius-lg':  'var(--theme-radius-lg)',
        '--local-panel-bg':   'var(--demo-surface-strong)',
        '--local-panel-deep': 'var(--demo-surface-deep)',
        '--local-panel-bar':  'var(--demo-surface)',
        '--local-panel-border': 'var(--demo-border-soft)',
        '--local-panel-text-soft': 'var(--demo-text-soft)',
        '--local-panel-text-faint': 'var(--demo-text-faint)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[var(--local-panel-border)] to-transparent" />
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
            <p className="text-[1.05rem] text-[var(--local-text-muted)] leading-[1.8] mb-8" data-jp-field="description">
              {data.description}
            </p>
          )}
          {data.steps && data.steps.length > 0 && (
            <div className="flex flex-col">
              {data.steps.map((step, idx) => (
                <div
                  key={step.id ?? idx}
                  className="grid grid-cols-[32px_1fr] gap-4 py-6 border-b border-[var(--local-panel-border)] last:border-b-0 items-start"
                  data-jp-item-id={step.id ?? `legacy-${idx}`}
                  data-jp-item-field="steps"
                >
                  <div className="font-display text-[1.25rem] font-black text-[var(--local-panel-text-faint)] leading-none mt-0.5">{step.num}</div>
                  <div>
                    <div className="font-display font-bold text-[1rem] text-[var(--local-text)] mb-1">{step.title}</div>
                    <p className="text-[0.85rem] text-[var(--local-text-muted)] leading-[1.6]">{step.description}</p>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* RIGHT — terminal */}
        <div className="rounded-[var(--local-radius-lg)] overflow-hidden border border-[var(--local-panel-border)] shadow-[0_30px_60px_rgba(0,0,0,0.5)]">
          <div className="bg-[var(--local-panel-bar)] px-4 py-2.5 flex items-center gap-1.5 border-b border-[var(--local-panel-border)]">
            <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
            <span className="mx-auto font-mono text-[0.60rem] text-[var(--local-panel-text-faint)]">Terminal</span>
          </div>
          <div className="bg-[var(--local-panel-deep)] px-7 py-6 font-mono text-[0.78rem] leading-[2.1] overflow-x-auto">
            <div><span className="text-[var(--local-panel-text-faint)] italic"># Step 1 — install CLI globally</span></div>
            <div><span className="text-[var(--local-accent)]">$</span> <span className="text-[var(--local-text)]">npm install -g </span><span className="text-[var(--local-panel-text-soft)]">@jsonpages/cli@latest</span></div>
            <div><span className="text-[var(--local-panel-text-faint)]">added 1 package in 2.3s</span></div>
            <div><span className="text-[var(--local-primary)]">✓ @jsonpages/cli@1.2.0 installed</span></div>
            <div>&nbsp;</div>
            <div><span className="text-[var(--local-panel-text-faint)] italic"># Step 2 — scaffold a new tenant</span></div>
            <div><span className="text-[var(--local-accent)]">$</span> <span className="text-[var(--local-panel-text-soft)]">npx @jsonpages/cli@latest</span> <span className="text-[var(--local-text)]">new my-tenant</span></div>
            <div><span className="text-[var(--local-primary)]">  ✓ src/components/hero/</span></div>
            <div><span className="text-[var(--local-primary)]">  ✓ src/lib/schemas.ts</span></div>
            <div><span className="text-[var(--local-primary)]">  ✓ src/lib/ComponentRegistry.tsx</span></div>
            <div><span className="text-[var(--local-primary)]">  ✓ src/data/pages/home.json</span></div>
            <div><span className="text-[var(--local-primary)]">  ✓ Done in 1.8s</span></div>
            <div>&nbsp;</div>
            <div><span className="text-[var(--local-panel-text-faint)] italic"># Step 3 — start Studio</span></div>
            <div><span className="text-[var(--local-accent)]">$</span> <span className="text-[var(--local-text)]">cd my-tenant && npm run dev</span></div>
            <div><span className="text-[var(--local-primary)]">  ➜ Studio ready at </span><span className="text-[var(--local-accent)]">http://localhost:5173</span><span className="inline-block w-2 h-[1em] bg-[var(--local-primary)] ml-1 align-text-bottom animate-pulse" /></div>
          </div>
        </div>

      </div>
    </section>
  );
};
