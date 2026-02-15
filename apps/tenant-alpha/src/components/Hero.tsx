import React from 'react';
import { cn } from '@/lib/utils';
import type { HeroData, HeroSettings } from '@/types';

interface HeroProps {
  data: HeroData;
  settings?: HeroSettings;
}

export const Hero: React.FC<HeroProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-cyan': 'var(--color-secondary, #22d3ee)',
        '--local-border': 'var(--border)',
      } as React.CSSProperties}
      className="jp-hero relative min-h-screen flex items-center overflow-hidden pt-24 bg-[var(--local-bg)]"
    >
      {/* Radial Gradient Overlays */}
      <div className="absolute -top-[40%] -right-[20%] w-[70vw] h-[70vw] rounded-full bg-[radial-gradient(circle,rgba(59,130,246,0.06)_0%,transparent_70%)] pointer-events-none" />
      <div className="absolute -bottom-[10%] -left-[10%] w-[50vw] h-[50vw] rounded-full bg-[radial-gradient(circle,rgba(34,211,238,0.03)_0%,transparent_60%)] pointer-events-none" />

      <div className="relative max-w-[1200px] mx-auto px-8 w-full">
        <div className="max-w-[820px]">
          {/* Badge */}
          {data.badge && (
            <div className="inline-flex items-center gap-2 bg-[rgba(59,130,246,0.08)] border border-[rgba(59,130,246,0.2)] px-4 py-1.5 rounded-full text-[0.78rem] font-semibold text-[var(--local-accent)] mb-8 tracking-wide jp-animate-in">
              <span className="w-1.5 h-1.5 rounded-full bg-[var(--local-accent)] jp-pulse-dot" />
              {data.badge}
            </div>
          )}

          {/* Title */}
          <h1 className="font-display text-[clamp(2.8rem,6vw,4.8rem)] font-black text-[var(--local-text)] leading-[1.08] tracking-tight mb-6 jp-animate-in jp-d1">
            {data.title}
            {data.titleHighlight && (
              <>
                <br />
                <em className="not-italic bg-gradient-to-br from-[var(--local-accent)] to-[var(--local-cyan)] bg-clip-text text-transparent">
                  {data.titleHighlight}
                </em>
              </>
            )}
          </h1>

          {/* Description */}
          {data.description && (
            <p className="text-xl text-[var(--local-text-muted)] max-w-[600px] leading-relaxed mb-10 jp-animate-in jp-d2">
              {data.description}
            </p>
          )}

          {/* CTA Buttons */}
          {data.ctas && data.ctas.length > 0 && (
            <div className="flex gap-4 flex-wrap jp-animate-in jp-d3">
              {data.ctas.map((cta, idx) => (
                <a
                  key={idx}
                  href={cta.href}
                  className={cn(
                    "inline-flex items-center gap-2 px-8 py-3.5 rounded-[5px] font-semibold text-base transition-all duration-200 no-underline",
                    cta.variant === 'primary'
                      ? "bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-0.5 hover:shadow-[0_8px_30px_rgba(59,130,246,0.3)]"
                      : "bg-transparent text-[var(--local-text)] border border-[rgba(255,255,255,0.12)] hover:border-[rgba(255,255,255,0.3)] hover:bg-[rgba(255,255,255,0.04)]"
                  )}
                >
                  {cta.label}
                </a>
              ))}
            </div>
          )}

          {/* Metrics */}
          {data.metrics && data.metrics.length > 0 && (
            <div className="flex gap-12 mt-16 pt-12 border-t border-[rgba(255,255,255,0.06)] flex-wrap jp-animate-in jp-d4">
              {data.metrics.map((metric, idx) => (
                <div key={idx}>
                  <div className="text-[2rem] font-bold text-[var(--local-text)] font-display">
                    {metric.val}
                  </div>
                  <div className="text-[0.82rem] text-[var(--muted-foreground)] mt-0.5 opacity-70">
                    {metric.label}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </section>
  );
};


