import React from 'react';
import type { FooterData, FooterSettings } from '@/types';

interface FooterProps {
  data: FooterData;
  settings?: FooterSettings;
}

export const Footer: React.FC<FooterProps> = ({ data }) => {
  return (
    <footer
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'rgba(255,255,255,0.05)',
      } as React.CSSProperties}
      className="py-12 border-t border-[var(--local-border)] bg-[var(--local-bg)] relative z-0"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="flex flex-col md:flex-row items-center justify-between gap-4">
          {/* Brand */}
          <div className="flex items-center gap-2 font-bold text-[0.9rem] text-[var(--local-text-muted)]">
            {data.brandText}
            {data.brandHighlight && (
              <span className="text-[var(--local-accent)]">{data.brandHighlight}</span>
            )}
          </div>

          {/* Links */}
          {data.links && data.links.length > 0 && (
            <nav className="flex gap-6">
              {data.links.map((link, idx) => (
                <a
                  key={idx}
                  href={link.href}
                  className="text-[0.82rem] text-[var(--local-text-muted)] hover:text-[var(--local-accent)] transition-colors no-underline"
                >
                  {link.label}
                </a>
              ))}
            </nav>
          )}

          {/* Copyright */}
          <div className="text-[0.8rem] text-[var(--local-text-muted)] opacity-60">
            {data.copyright}
          </div>
        </div>
      </div>
    </footer>
  );
};


