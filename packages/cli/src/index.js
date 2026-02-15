#!/usr/bin/env node
import { Command } from 'commander';
import chalk from 'chalk';
import fs from 'fs-extra';
import path from 'path';
import { execa } from 'execa';
import ora from 'ora';

const program = new Command();

program
  .name('jsonpages')
  .description('CLI to manage JsonPages Ecosystem')
  .version('1.0.0');

program
  .command('new')
  .argument('<type>', 'Type of artifact (tenant)')
  .argument('<name>', 'Name of the new tenant')
  .action(async (type, name) => {
    if (type !== 'tenant') {
      console.log(chalk.red('Error: Only "tenant" type is supported for now.'));
      return;
    }

    const targetDir = path.join(process.cwd(), name);
    const spinner = ora(`Creating Golden Master Tenant: ${name}...`).start();

    try {
      await fs.ensureDir(targetDir);

      // 1. Vite Scaffold
      spinner.text = 'Scaffolding Vite + React + TS...';
      await execa('npm', ['create', 'vite@latest', '.', '--', '--template', 'react-swc-ts'], { cwd: targetDir });

      // 2. Iniezione File
      spinner.text = 'Injecting Golden Master Logic...';
      await injectGoldenMasterFiles(targetDir, name);

      // 3. Installazione Base
      spinner.text = 'Installing base dependencies...';
      await execa('npm', ['install'], { cwd: targetDir });
      
      // 4. Linking Core
      spinner.text = 'Linking @jsonpages/core...';
      try {
        await execa('yalc', ['add', '@jsonpages/core'], { cwd: targetDir });
      } catch (e) {
        spinner.warn(chalk.yellow('Yalc link failed. Make sure you ran "yalc publish" in packages/core.'));
      }
      
      // 5. Peer Dependencies (Runtime)
      spinner.text = 'Installing runtime dependencies...';
      await execa('npm', ['install', 'zod', 'react-router-dom', 'lucide-react', 'tailwind-merge', 'clsx'], { cwd: targetDir });

      // 6. Dev Dependencies (Build Tools - FIX: Tailwind v4)
      spinner.text = 'Installing build tools (Tailwind v4)...';
      await execa('npm', ['install', '-D', '@tailwindcss/vite', 'tailwindcss', '@types/node'], { cwd: targetDir });

      spinner.succeed(chalk.green(`Golden Master Tenant ${name} created successfully!`));
      console.log(`\nTo start developing:\n  ${chalk.cyan(`cd ${name}`)}\n  ${chalk.cyan(`npm run dev`)}\n`);

    } catch (error) {
      spinner.fail(chalk.red('Failed to create tenant.'));
      console.error(error);
    }
  });

async function injectGoldenMasterFiles(targetDir, name) {
  const srcDir = path.join(targetDir, 'src');
  const libDir = path.join(srcDir, 'lib');
  const componentsDir = path.join(srcDir, 'components');
  const dataConfigDir = path.join(srcDir, 'data/config');
  const dataPagesDir = path.join(srcDir, 'data/pages');

  await fs.ensureDir(libDir);
  await fs.ensureDir(componentsDir);
  await fs.ensureDir(dataConfigDir);
  await fs.ensureDir(dataPagesDir);

  // --- 1. VITE CONFIG ---
  const viteConfig = `
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';

export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
});`;
  await fs.writeFile(path.join(targetDir, 'vite.config.ts'), viteConfig.trim());

  // --- 2. TSCONFIG ---
  const tsConfig = `
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}`;
  await fs.writeFile(path.join(targetDir, 'tsconfig.json'), tsConfig.trim());

  // --- 3. INDEX.CSS ---
  const cssContent = `
@import "tailwindcss";
@source "./**/*.tsx";
@theme {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-primary: var(--primary);
  --color-accent: var(--accent);
  --color-border: var(--border);
  --font-primary: var(--theme-font-primary);
  --font-display: var(--theme-font-display, 'Playfair Display', Georgia, serif);
}
:root {
  --background: var(--theme-background);
  --foreground: var(--theme-text);
  --card: var(--theme-surface);
  --primary: var(--theme-primary);
  --border: var(--theme-border);
  --accent: var(--theme-accent, var(--theme-primary));
}
@layer base {
  * { border-color: var(--border); }
  body {
    background-color: var(--background);
    color: var(--foreground);
    font-family: var(--font-primary);
    line-height: 1.7;
    @apply antialiased;
  }
}
.font-display { font-family: var(--font-display, var(--font-primary)); }
html { scroll-behavior: smooth; }`;
  await fs.writeFile(path.join(srcDir, 'index.css'), cssContent.trim());

  // --- 4. TYPES.TS ---
  const typesContent = `
import { z } from 'zod';
import { SECTION_SCHEMAS, HeroSchema, FeatureGridSchema, ProblemStatementSchema, PillarsGridSchema, ArchLayersSchema, ProductTriadSchema, PaSectionSchema, PhilosophySchema, CtaBannerSchema, CodeBlockSchema } from './lib/schemas';

export type HeaderData = z.infer<typeof SECTION_SCHEMAS.header>;
export type FooterData = z.infer<typeof SECTION_SCHEMAS.footer>;
export type HeroData = z.infer<typeof HeroSchema>;
export type FeatureGridData = z.infer<typeof FeatureGridSchema>;
export type ProblemStatementData = z.infer<typeof ProblemStatementSchema>;
export type PillarsGridData = z.infer<typeof PillarsGridSchema>;
export type ArchLayersData = z.infer<typeof ArchLayersSchema>;
export type ProductTriadData = z.infer<typeof ProductTriadSchema>;
export type PaSectionData = z.infer<typeof PaSectionSchema>;
export type PhilosophyData = z.infer<typeof PhilosophySchema>;
export type CtaBannerData = z.infer<typeof CtaBannerSchema>;
export type CodeBlockData = z.infer<typeof CodeBlockSchema>;

declare module '@jsonpages/core' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    'footer': FooterData;
    'hero': HeroData;
    'feature-grid': FeatureGridData;
    'problem-statement': ProblemStatementData;
    'pillars-grid': PillarsGridData;
    'arch-layers': ArchLayersData;
    'product-triad': ProductTriadData;
    'pa-section': PaSectionData;
    'philosophy': PhilosophyData;
    'cta-banner': CtaBannerData;
    'code-block': CodeBlockData;
  }
}
export * from '@jsonpages/core';`;
  await fs.writeFile(path.join(srcDir, 'types.ts'), typesContent.trim());

  // --- 5. LIB/SCHEMAS.TS ---
  const schemasContent = `
import { z } from 'zod';
const BaseSectionData = z.object({ anchorId: z.string().optional().describe('ui:text') });
const BaseArrayItem = z.object({ id: z.string().optional() });

export const HeroSchema = BaseSectionData.extend({
  badge: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  titleHighlight: z.string().optional().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  ctas: z.array(z.object({ label: z.string().describe('ui:text'), href: z.string().describe('ui:text'), variant: z.enum(['primary', 'secondary']).default('primary').describe('ui:select') })).optional().describe('ui:list'),
});

export const FeatureGridSchema = BaseSectionData.extend({
  sectionTitle: z.string().describe('ui:text'),
  cards: z.array(BaseArrayItem.extend({ icon: z.string().optional().describe('ui:icon-picker'), title: z.string().describe('ui:text'), description: z.string().describe('ui:textarea') })).describe('ui:list'),
});

export const ProblemStatementSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  siloGroups: z.array(z.object({ label: z.string().describe('ui:text'), blocks: z.array(BaseArrayItem.extend({ label: z.string().describe('ui:text'), variant: z.string().describe('ui:text') })) })).describe('ui:list'),
  paragraphs: z.array(z.object({ text: z.string().describe('ui:textarea'), isBold: z.boolean().default(false).describe('ui:checkbox') })).describe('ui:list'),
});

export const PillarsGridSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  pillars: z.array(BaseArrayItem.extend({ icon: z.string().describe('ui:text'), title: z.string().describe('ui:text'), description: z.string().describe('ui:textarea'), tag: z.string().describe('ui:text') })).describe('ui:list'),
});

export const ArchLayersSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  layers: z.array(BaseArrayItem.extend({ number: z.string().describe('ui:text'), title: z.string().describe('ui:text'), description: z.string().describe('ui:textarea') })).describe('ui:list'),
});

export const ProductTriadSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  products: z.array(BaseArrayItem.extend({ name: z.string().describe('ui:text'), price: z.string().describe('ui:text'), features: z.array(z.object({ text: z.string().describe('ui:text') })) })).describe('ui:list'),
});

export const PaSectionSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  subtitle: z.string().describe('ui:text'),
  paragraphs: z.array(z.object({ text: z.string().describe('ui:textarea') })),
});

export const PhilosophySchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  quote: z.string().describe('ui:textarea'),
});

export const CtaBannerSchema = BaseSectionData.extend({
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

export const CodeBlockSchema = BaseSectionData.extend({
  label: z.string().describe('ui:text'),
  lines: z.array(z.object({ content: z.string().describe('ui:text'), isComment: z.boolean().default(false).describe('ui:checkbox') })),
});

export const SECTION_SCHEMAS = {
  'hero': HeroSchema,
  'feature-grid': FeatureGridSchema,
  'problem-statement': ProblemStatementSchema,
  'pillars-grid': PillarsGridSchema,
  'arch-layers': ArchLayersSchema,
  'product-triad': ProductTriadSchema,
  'pa-section': PaSectionSchema,
  'philosophy': PhilosophySchema,
  'cta-banner': CtaBannerSchema,
  'code-block': CodeBlockSchema,
  'header': z.object({ logoText: z.string().describe('ui:text'), links: z.array(z.object({ label: z.string().describe('ui:text'), href: z.string().describe('ui:text') })) }),
  'footer': z.object({ brandText: z.string().describe('ui:text'), copyright: z.string().describe('ui:text') }),
} as const;`;
  await fs.writeFile(path.join(libDir, 'schemas.ts'), schemasContent.trim());

  // --- 6. LIB/COMPONENTREGISTRY.TSX ---
  const registryContent = `
import { Hero } from '../components/Hero';
import { FeatureGrid } from '../components/FeatureGrid';
import { ProblemStatement } from '../components/ProblemStatement';
import { PillarsGrid } from '../components/PillarsGrid';
import { ArchLayers } from '../components/ArchLayers';
import { ProductTriad } from '../components/ProductTriad';
import { PaSection } from '../components/PaSection';
import { Philosophy } from '../components/Philosophy';
import { CtaBanner } from '../components/CtaBanner';
import { CodeBlock } from '../components/CodeBlock';

const Header = ({ data }: any) => <header className="p-6 bg-black text-white flex justify-between"><div>{data.logoText}</div></header>;
const Footer = ({ data }: any) => <footer className="p-10 bg-zinc-900 text-zinc-500 text-center">{data.copyright}</footer>;

export const ComponentRegistry = {
  'hero': Hero,
  'feature-grid': FeatureGrid,
  'problem-statement': ProblemStatement,
  'pillars-grid': PillarsGrid,
  'arch-layers': ArchLayers,
  'product-triad': ProductTriad,
  'pa-section': PaSection,
  'philosophy': Philosophy,
  'cta-banner': CtaBanner,
  'code-block': CodeBlock,
  'header': Header,
  'footer': Footer,
};`;
  await fs.writeFile(path.join(libDir, 'ComponentRegistry.tsx'), registryContent.trim());

  // --- 7. COMPONENTS (Hero) ---
  const heroContent = `
import { cn } from '../lib/utils';
export const Hero = ({ data }: any) => (
  <section className="relative py-32 px-10 bg-[var(--background)] overflow-hidden">
    <div className="max-w-4xl mx-auto relative z-10">
      {data.badge && <span className="inline-block px-4 py-1.5 mb-6 text-xs font-bold tracking-widest uppercase bg-primary/10 text-primary rounded-full">{data.badge}</span>}
      <h1 className="text-7xl font-black tracking-tighter leading-none mb-8">
        {data.title} <br/>
        <span className="text-primary">{data.titleHighlight}</span>
      </h1>
      <p className="text-xl text-zinc-500 max-w-2xl mb-10">{data.description}</p>
      <div className="flex gap-4">
        {data.ctas?.map((cta: any, i: number) => (
          <a key={i} href={cta.href} className={cn("px-8 py-4 rounded-lg font-bold transition-all", cta.variant === 'primary' ? "bg-primary text-white hover:scale-105" : "border border-zinc-800 hover:bg-zinc-900")}>
            {cta.label}
          </a>
        ))}
      </div>
    </div>
  </section>
);`;
  await fs.writeFile(path.join(componentsDir, 'Hero.tsx'), heroContent.trim());

  // --- 8. DATA ---
  const siteJson = { identity: { title: name }, header: { id: 'h1', type: 'header', data: { logoText: 'JSONPAGES', links: [] } }, footer: { id: 'f1', type: 'footer', data: { brandText: 'JsonPages', copyright: '© 2026' } }, pages: [{ slug: 'home', label: 'Home' }] };
  const themeJson = { name: 'Golden Master', tokens: { colors: { primary: '#3b82f6', background: '#060d1b', text: '#e2e8f0', border: '#162a4d', surface: '#0b1529', surfaceAlt: '#101e38', textMuted: '#94a3b8', accent: '#60a5fa', secondary: '#22d3ee' }, typography: { fontFamily: { primary: 'sans-serif', mono: 'monospace' } }, borderRadius: { sm: '4px', md: '8px', lg: '12px' } } };
  const homeJson = { id: 'p1', slug: 'home', meta: { title: 'Home', description: 'Golden Master' }, sections: [{ id: 's1', type: 'hero', data: { badge: 'V2.8.5 READY', title: 'Global Authoring.', titleHighlight: 'Global Governance.', description: 'Scaffolded via JsonPages CLI.' } }] };

  await fs.writeJson(path.join(dataConfigDir, 'site.json'), siteJson, { spaces: 2 });
  await fs.writeJson(path.join(dataConfigDir, 'theme.json'), themeJson, { spaces: 2 });
  await fs.writeJson(path.join(dataConfigDir, 'menu.json'), { main: [] }, { spaces: 2 });
  await fs.writeJson(path.join(dataPagesDir, 'home.json'), homeJson, { spaces: 2 });

  // --- 9. UTILS & APP.TSX ---
  await fs.writeFile(path.join(libDir, 'utils.ts'), `import { clsx } from 'clsx'; import { twMerge } from 'tailwind-merge'; export function cn(...inputs: any[]) { return twMerge(clsx(inputs)); }`);
  
  const appContent = `
import { JsonPagesEngine } from '@jsonpages/core';
import { ComponentRegistry } from './lib/ComponentRegistry';
import { SECTION_SCHEMAS } from './lib/schemas';
import './index.css';

import siteData from './data/config/site.json';
import themeData from './data/config/theme.json';
import menuData from './data/config/menu.json';
import homeData from './data/pages/home.json';
import tenantCss from './index.css?inline';

const config: any = {
  tenantId: '${name}',
  registry: ComponentRegistry,
  schemas: SECTION_SCHEMAS,
  pages: { home: homeData },
  siteConfig: siteData,
  themeConfig: themeData,
  menuConfig: menuData,
  themeCss: { tenant: tenantCss },
};

export default function App() {
  return <JsonPagesEngine config={config} />;
}
`;
  await fs.writeFile(path.join(srcDir, 'App.tsx'), appContent.trim());

  // --- 10. PLACEHOLDERS ---
  const placeholder = (name) => `export const ${name} = () => <div className="p-20 border border-dashed border-zinc-800 text-center text-zinc-500">${name} Component Placeholder</div>;`;
  const comps = ['FeatureGrid', 'ProblemStatement', 'PillarsGrid', 'ArchLayers', 'ProductTriad', 'PaSection', 'Philosophy', 'CtaBanner', 'CodeBlock'];
  for (const c of comps) {
    await fs.writeFile(path.join(componentsDir, `${c}.tsx`), placeholder(c));
  }
}

program.parse();