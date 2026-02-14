import type { ThemeConfig } from '../lib/kernel';

export const themeManager = {
  setTheme: (theme: ThemeConfig): void => {
    const root = document.documentElement;
    const { tokens } = theme;
    const mappings: Record<string, string> = {
      '--theme-primary': tokens.colors.primary,
      '--theme-secondary': tokens.colors.secondary,
      '--theme-accent': tokens.colors.accent,
      '--theme-background': tokens.colors.background,
      '--theme-surface': tokens.colors.surface,
      '--theme-surface-alt': tokens.colors.surfaceAlt,
      '--theme-text': tokens.colors.text,
      '--theme-text-muted': tokens.colors.textMuted,
      '--theme-border': tokens.colors.border,
      '--theme-font-primary': tokens.typography.fontFamily.primary,
      '--theme-font-mono': tokens.typography.fontFamily.mono,
      '--theme-radius-sm': tokens.borderRadius.sm,
      '--theme-radius-md': tokens.borderRadius.md,
      '--theme-radius-lg': tokens.borderRadius.lg,
    };
    Object.entries(mappings).forEach(([key, value]) => {
      root.style.setProperty(key, value);
    });
  },
};
