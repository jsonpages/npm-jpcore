import React from 'react';
import type { GitSectionData, GitSectionSettings } from './types';

export const GitSection: React.FC<{ data: GitSectionData; settings?: GitSectionSettings }> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg':         'var(--card)',
        '--local-text':       'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary':    'var(--primary)',
        '--local-accent':     'var(--accent)',
        '--local-cyan':       'var(--secondary)',
        '--local-border':     'var(--border)',
        '--local-radius-sm':  'var(--theme-radius-sm)',
        '--local-radius-lg':  'var(--theme-radius-lg)',
        '--local-panel-bg': 'var(--demo-surface-soft)',
        '--local-panel-bar': 'var(--demo-surface)',
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

        {/* LEFT — copy */}
        <div>
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.68rem] font-mono font-bold uppercase tracking-[0.14em] text-[var(--local-accent)] mb-5" data-jp-field="label">
              <span className="w-6 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black text-[var(--local-text)] leading-[1.05] tracking-tight mb-4" data-jp-field="title">
            {data.title}
            {data.titleHighlight && (
              <>
                <br />
                <em className="not-italic bg-gradient-to-br from-[var(--local-accent)] to-[var(--local-cyan)] bg-clip-text text-transparent" data-jp-field="titleHighlight">
                  {data.titleHighlight}
                </em>
              </>
            )}
          </h2>
          {data.description && (
            <p className="text-[1.05rem] text-[var(--local-text-muted)] leading-[1.8] mb-8" data-jp-field="description">
              {data.description}
            </p>
          )}
          {data.points && data.points.length > 0 && (
            <ul className="flex flex-col">
              {data.points.map((p, idx) => (
                <li
                  key={p.id ?? idx}
                  className="flex items-start gap-3.5 text-[0.9rem] text-[var(--local-text-muted)] py-3.5 border-b border-[var(--local-panel-border)] last:border-b-0 hover:text-[var(--local-text)] transition-colors leading-[1.5]"
                  data-jp-item-id={p.id ?? `legacy-${idx}`}
                  data-jp-item-field="points"
                >
                  <span className="font-mono text-[var(--local-primary)] text-[0.75rem] flex-shrink-0 mt-0.5">→</span>
                  {p.text}
                </li>
              ))}
            </ul>
          )}
        </div>

        {/* RIGHT — git diff panel (decorative, content-driven commits) */}
        <div className="rounded-[var(--local-radius-lg)] overflow-hidden border border-[var(--local-panel-border)] shadow-[0_30px_60px_rgba(0,0,0,0.5)]">
          <div className="bg-[var(--local-panel-bar)] px-4 py-2.5 flex items-center gap-1.5 border-b border-[var(--local-panel-border)]">
            <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
            <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
            <span className="ml-auto font-mono text-[0.62rem] text-[var(--local-panel-text-faint)]">src/data/pages/home.json</span>
          </div>
          {/* Tabs */}
          <div className="bg-[var(--local-panel-bg)] border-b border-[var(--local-panel-border)] flex">
            <div className="font-mono text-[0.60rem] px-4 py-2 text-[var(--local-text)] border-b-2 border-[var(--local-primary)]">Changes</div>
            <div className="font-mono text-[0.60rem] px-4 py-2 text-[var(--local-panel-text-faint)]">History</div>
            <div className="font-mono text-[0.60rem] px-4 py-2 text-[var(--local-panel-text-faint)]">Blame</div>
          </div>
          {/* Diff */}
          <div className="bg-[var(--local-panel-deep)] px-4 py-4 font-mono text-[0.73rem] leading-[1.9] overflow-x-auto">
            {[
              { t: 'ctx', g: '12', s: ' ', c: '  "type": "hero",'                                },
              { t: 'ctx', g: '13', s: ' ', c: '  "data": {'                                       },
              { t: 'del', g: '14', s: '-', c: '    "title": "Local Authoring.hh",'                },
              { t: 'add', g: '14', s: '+', c: '    "title": "The Sovereign Shell.",'              },
              { t: 'del', g: '15', s: '-', c: '    "titleHighlight": "Global Governance.",'       },
              { t: 'add', g: '15', s: '+', c: '    "titleHighlight": "Zero Runtime Overhead.",'   },
              { t: 'ctx', g: '16', s: ' ', c: '    "badge": "Architecture v1.2",'                },
              { t: 'ctx', g: '17', s: ' ', c: '  }'                                               },
            ].map((ln, i) => (
              <div key={i} className={`flex gap-3 px-1 rounded-[var(--local-radius-sm)] ${
                ln.t === 'add' ? 'bg-[var(--local-panel-bg)]' :
                ln.t === 'del' ? 'bg-[var(--local-panel-bg)]' :
                'opacity-45'}`}
              >
                <span className="text-[var(--local-panel-text-faint)] min-w-[18px] text-right select-none">{ln.g}</span>
                <span className={`min-w-[12px] ${ln.t === 'add' ? 'text-[var(--local-primary)]' : ln.t === 'del' ? 'text-[var(--local-accent)]' : 'text-[var(--local-panel-text-faint)]'}`}>{ln.s}</span>
                <span className={`whitespace-pre ${ln.t === 'add' ? 'text-[var(--local-primary)]' : ln.t === 'del' ? 'text-[var(--local-accent)]' : 'text-[var(--local-panel-text-soft)]'}`}>{ln.c}</span>
              </div>
            ))}
          </div>
          {/* Commits */}
          <div className="bg-[var(--local-panel-bg)] border-t border-[var(--local-panel-border)] px-4 py-3 flex flex-col gap-2.5">
            {[
              { hash: 'a3f9c12', msg: 'feat(home): update hero headline copy',      time: '2m ago',  op: 1   },
              { hash: '8b21e04', msg: 'content(home): add 3 metrics to hero',        time: '1h ago',  op: 0.6 },
              { hash: 'cc70a91', msg: 'feat(home): initial page structure',           time: '2d ago',  op: 0.4 },
            ].map(({ hash, msg, time, op }) => (
              <div key={hash} className="flex items-center gap-3" style={{ opacity: op }}>
                <span className="font-mono text-[0.58rem] text-[var(--local-accent)] min-w-[52px]">{hash}</span>
                <span className="font-sans text-[0.70rem] text-[var(--local-panel-text-soft)] flex-1 truncate">{msg}</span>
                <span className="font-mono text-[0.56rem] text-[var(--local-panel-text-faint)]">{time}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};
