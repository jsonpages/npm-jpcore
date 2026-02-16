#!/usr/bin/env node
import { Command } from 'commander';
import chalk from 'chalk';
import fs from 'fs-extra';
import path from 'path';
import { execa } from 'execa';
import ora from 'ora';
import { fileURLToPath } from 'url';

// 🛡️ Risoluzione path per rendere la CLI shippable
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const program = new Command();

program
  .name('jsonpages')
  .description('JsonPages CLI - Sovereign Projection Engine')
  .version('2.2.0');

program
  .command('new')
  .argument('<type>', 'Type of artifact (tenant)')
  .argument('<name>', 'Name of the new tenant')
  .option('--script <path>', 'Override default deterministic script path')
  .action(async (type, name, options) => {
    if (type !== 'tenant') {
      console.log(chalk.red('❌ Error: Only "tenant" type is supported.'));
      return;
    }

    const targetDir = path.join(process.cwd(), name);
    
    // 🔍 Logica Asset Interno: 
    // Se l'utente non fornisce uno script, usa quello dentro packages/cli/assets/
    const defaultScriptPath = path.resolve(__dirname, '../assets/src_tenant_alpha.sh');
    const scriptPath = options.script ? path.resolve(process.cwd(), options.script) : defaultScriptPath;

    if (!fs.existsSync(scriptPath)) {
      console.log(chalk.red(`❌ Error: Deterministic script not found at ${scriptPath}`));
      console.log(chalk.yellow(`Expected internal asset at: ${defaultScriptPath}`));
      return;
    }

    console.log(chalk.blue.bold(`\n🚀 Projecting Sovereign Tenant: ${name}\n`));
    const spinner = ora();

    try {
      // 1. SCAFFOLDING INFRA
      spinner.start('Setting up environment (Vite + TS)...');
      await fs.ensureDir(targetDir);
      await execa('npm', ['create', 'vite@latest', '.', '--', '--template', 'react-ts'], { cwd: targetDir });
      spinner.succeed('Environment scaffolded.');

      // 2. CLEANUP (Piazza pulita per il determinismo)
      spinner.start('Wiping default boilerplate...');
      await fs.emptyDir(path.join(targetDir, 'src'));
      const junk = ['App.css', 'App.tsx', 'main.tsx', 'vite-env.d.ts', 'favicon.ico', 'index.html'];
      for (const file of junk) {
        await fs.remove(path.join(targetDir, file)).catch(() => {});
        await fs.remove(path.join(targetDir, 'src', file)).catch(() => {});
      }
      spinner.succeed('Clean slate achieved.');

      // 3. INJECTION
      spinner.start('Injecting Sovereign Configurations...');
      await injectInfraFiles(targetDir, name);
      spinner.succeed('Infrastructure configured.');

      // 4. DETERMINISTIC SRC (Proiezione dal DNA interno)
      spinner.start('Executing deterministic src projection...');
      const localScript = path.join(targetDir, 'setup_src.sh');
      await fs.copy(scriptPath, localScript);
      await fs.chmod(localScript, '755');
      
      // Esecuzione dello script (che ora crea anche index.html se incluso)
      await execa('./setup_src.sh', [], { cwd: targetDir, shell: true });
      await fs.remove(localScript);
      spinner.succeed('Source code and assets projected successfully.');

      // 5. DEPENDENCY RESOLUTION (Green Build Enforcement)
      spinner.start('Installing dependencies (this may take a minute)...');
      
      // 5a. Runtime Dependencies (Risolve Radix, CVA e Animations)
      await execa('npm', ['install', 
        'react', 
        'react-dom', 
        'zod', 
        'react-router-dom', 
        'lucide-react', 
        'radix-ui',                 // 🛡️ Risolve TS2307
        '@base-ui/react',           // Supporto componenti headless
        'class-variance-authority', // Supporto varianti componenti
        'tailwind-merge', 
        'clsx', 
        'tw-animate-css',           // Supporto animazioni tenant
        'file-saver', 
        'jszip'
      ], { cwd: targetDir });
      
      // 5b. Dev Dependencies
      await execa('npm', ['install', '-D', 
        'vite', 
        '@vitejs/plugin-react', 
        'typescript', 
        '@tailwindcss/vite', 
        'tailwindcss', 
        '@types/node', 
        '@types/react', 
        '@types/react-dom', 
        '@types/file-saver'
      ], { cwd: targetDir });

      // 5c. Linking Core via yalc
      spinner.text = 'Linking @jsonpages/core via yalc...';
      try {
        await execa('yalc', ['add', '@jsonpages/core'], { cwd: targetDir });
      } catch (e) {
        spinner.warn(chalk.yellow('Yalc link failed. Ensure "@jsonpages/core" is published in yalc.'));
      }
      
      spinner.succeed(chalk.green.bold('✨ Tenant Ready!'));

      console.log(`\n${chalk.white.bgBlue(' NEXT STEPS ')}`);
      console.log(`  ${chalk.cyan(`cd ${name}`)}`);
      console.log(`  ${chalk.cyan(`npm run dev`)}   <- Start development`);
      console.log(`  ${chalk.cyan(`npm run build`)} <- Validate Green Build`);
      console.log(`\nGovernance enforced. Build is now safe.\n`);

    } catch (error) {
      spinner.fail(chalk.red('Projection failed.'));
      console.error(error);
    }
  });

async function injectInfraFiles(targetDir, name) {
  const pkg = {
    name: name,
    private: true,
    version: "1.0.0",
    type: "module",
    scripts: {
      "dev": "vite",
      "build": "tsc && vite build",
      "preview": "vite preview"
    }
  };
  await fs.writeJson(path.join(targetDir, 'package.json'), pkg, { spaces: 2 });

  const viteConfig = `
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
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
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"]
}`;
  await fs.writeFile(path.join(targetDir, 'tsconfig.json'), tsConfig.trim());

  const shadcnConfig = {
    "$schema": "https://ui.shadcn.com/schema.json",
    "style": "radix-nova",
    "rsc": false,
    "tsx": true,
    "tailwind": {
      "config": "",
      "css": "src/index.css",
      "baseColor": "zinc",
      "cssVariables": true,
      "prefix": ""
    },
    "aliases": {
      "components": "@/components",
      "utils": "@/lib/utils",
      "ui": "@/components/ui",
      "lib": "@/lib",
      "hooks": "@/hooks"
    }
  };
  await fs.writeJson(path.join(targetDir, 'components.json'), shadcnConfig, { spaces: 2 });
}

program.parse();