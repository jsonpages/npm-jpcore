import React, { useLayoutEffect } from 'react';

interface ThemeLoaderProps {
  /** Which mode is active; determines which CSS is injected. */
  mode: 'tenant' | 'admin';
  /** CSS string for tenant (visitor) mode. */
  tenantCss: string;
  /** CSS string for admin (studio) mode. Engine provides default if not passed. */
  adminCss: string;
  children: React.ReactNode;
}

/**
 * Theme Loader: injects the required CSS into the <head> and removes it on unmount.
 * CSS strings are passed as props so the Engine controls injection; Tenant does not manage Admin CSS.
 */
export const ThemeLoader: React.FC<ThemeLoaderProps> = ({ mode, tenantCss, adminCss, children }) => {
  useLayoutEffect(() => {
    const styleId = `jp-theme-${mode}`;
    const css = mode === 'tenant' ? tenantCss : adminCss;

    if (!document.getElementById(styleId) && css) {
      const style = document.createElement('style');
      style.id = styleId;
      style.innerHTML = css;
      document.head.appendChild(style);
    }

    return () => {
      const style = document.getElementById(styleId);
      if (style) style.remove();
    };
  }, [mode, tenantCss, adminCss]);

  return <>{children}</>;
};



