import React from 'react';

/**
 * 🧩 StageCSSProperties
 * Estende React.CSSProperties per includere le variabili custom del protocollo JSP.
 */
interface StageCSSProperties extends React.CSSProperties {
  '--background'?: string;
  '--foreground'?: string;
  '--card'?: string;
  '--card-foreground'?: string;
  '--primary'?: string;
  '--primary-foreground'?: string;
  '--secondary'?: string;
  '--secondary-foreground'?: string;
  '--muted'?: string;
  '--muted-foreground'?: string;
  '--border'?: string;
  '--input'?: string;
  '--ring'?: string;
  '--radius'?: string;
}

/**
 * 🛡️ STAGE ISOLATION WRAPPER
 * Questo componente agisce come confine. Resetta le variabili CSS funzionali
 * ai Brand Token del Tenant, neutralizzando le variabili [data-jp-studio] per i figli.
 */
export const StageWrapper: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const isolationStyles: StageCSSProperties = {
    '--background': 'var(--theme-background)',
    '--foreground': 'var(--theme-text)',
    '--card': 'var(--theme-surface)',
    '--card-foreground': 'var(--theme-text)',
    '--primary': 'var(--theme-primary)',
    '--primary-foreground': 'oklch(0.98 0 0)',
    '--secondary': 'var(--theme-secondary)',
    '--secondary-foreground': 'var(--theme-text)',
    '--muted': 'var(--theme-surface-alt)',
    '--muted-foreground': 'var(--theme-text-muted)',
    '--border': 'var(--theme-border)',
    '--input': 'var(--theme-border)',
    '--ring': 'var(--theme-primary)',
    '--radius': '0.45rem',
  };

  return (
    <div 
      id="jp-stage-isolation-root"
      className="relative w-full h-full overflow-auto bg-[var(--background)] text-[var(--foreground)]"
      style={isolationStyles}
    >
      {children}
    </div>
  );
};



