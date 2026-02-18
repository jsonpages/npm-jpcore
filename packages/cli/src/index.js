#!/usr/bin/env node
import { Command } from 'commander';
import chalk from 'chalk';
import fs from 'fs-extra';
import path from 'path';
import { execa } from 'execa';
import ora from 'ora';
import { fileURLToPath } from 'url';

// 🛡️ Risoluzione path ESM
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const program = new Command();

program
  .name('jsonpages')
  .description('JsonPages CLI - Sovereign Projection Engine')
  .version('2.0.6'); // Bump version

/**
 * 🧠 THE UNIVERSAL INTERPRETER
 */
async function processScriptInNode(scriptPath, targetDir) {
  const content = await fs.readFile(scriptPath, 'utf-8');
  const lines = content.split('\n');
  
  let captureMode = false;
  let delimiter = '';
  let currentFile = '';
  let fileBuffer = [];

  for (const line of lines) {
    const trimmed = line.trim();

    if (captureMode) {
      if (trimmed === delimiter) {
        const filePath = path.join(targetDir, currentFile);
        await fs.outputFile(filePath, fileBuffer.join('\n'));
        captureMode = false;
        fileBuffer = [];
      } else {
        fileBuffer.push(line);
      }
      continue;
    }

    if (trimmed.startsWith('mkdir -p')) {
      const match = trimmed.match(/"([^"]+)"/) || trimmed.match(/\s+([^\s]+)/); 
      const dirPath = match ? match[1].replace(/"/g, '') : null;
      if (dirPath) {
        await fs.ensureDir(path.join(targetDir, dirPath));
      }
    }
    else if (trimmed.startsWith('cat <<')) {
      const match = trimmed.match(/<<\s*'([^']+)'\s*>\s*"([^"]+)"/);
      if (match) {
        delimiter = match[1];
        currentFile = match[2];
        captureMode = true;
      }
    }
  }
}

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
    const defaultScriptPath = path.resolve(__dirname, '../assets/src_tenant_alpha.sh');
    const scriptPath = options.script ? path.resolve(process.cwd(), options.script) : defaultScriptPath;

    if (!fs.existsSync(scriptPath)) {
      console.log(chalk.red(`❌ Error: DNA script not found at ${scriptPath}`));
      return;
    }

    console.log(chalk.blue.bold(`\n🚀 Projecting Sovereign Tenant: ${name}\n`));
    const spinner = ora();

    try {
      // 1. SCAFFOLDING
      spinner.start('Setting up environment (Vite + TS)...');
      await fs.ensureDir(targetDir);
      const npmCmd = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      
      await execa(npmCmd, ['create', 'vite@latest', '.', '--', '--template', 'react-ts'], { cwd: targetDir });
      spinner.succeed('Environment scaffolded.');

      // 2. CLEANUP
      spinner.start('Wiping default boilerplate...');
      await fs.emptyDir(path.join(targetDir, 'src'));
      const junk = ['App.css', 'App.tsx', 'main.tsx', 'vite-env.d.ts', 'favicon.ico', 'index.html', 'package.json', 'package-lock.json'];
      for (const file of junk) {
        await fs.remove(path.join(targetDir, file)).catch(() => {});
        await fs.remove(path.join(targetDir, 'src', file)).catch(() => {});
      }
      spinner.succeed('Clean slate achieved.');

      // 3. INJECTION
      spinner.start('Injecting Sovereign Configurations...');
      await injectInfraFiles(targetDir, name);
      spinner.succeed('Infrastructure configured.');

      // 4. DETERMINISTIC PROJECTION
      spinner.start('Executing deterministic src projection...');
      await processScriptInNode(scriptPath, targetDir);
      spinner.succeed('Source code and assets projected successfully.');

      // 5. INSTALLATION
      spinner.start('Installing dependencies (this may take a minute)...');
      await execa(npmCmd, ['install'], { cwd: targetDir });
      
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
    },
    dependencies: {
      "react": "^19.0.0",
      "react-dom": "^19.0.0",
      "react-router-dom": "^6.30.0",
      "zod": "^3.24.1",
      "lucide-react": "^0.474.0",
      "radix-ui": "^1.0.1",
      "@base-ui/react": "^1.0.0-alpha.1",
      "class-variance-authority": "^0.7.0",
      "tailwind-merge": "^2.2.0",
      "clsx": "^2.1.0",
      "tailwindcss-animate": "^1.0.7", // 👈 FIX: Pacchetto corretto
      "file-saver": "^2.0.5",
      "jszip": "^3.10.1",
      "@jsonpages/core": "latest"
    },
    devDependencies: {
      "vite": "^6.0.0",
      "@vitejs/plugin-react": "^4.2.1",
      "typescript": "^5.7.3",
      "@tailwindcss/vite": "^4.0.0",
      "tailwindcss": "^4.0.0",
      "@types/node": "^20.0.0",
      "@types/react": "^19.0.0",
      "@types/react-dom": "^19.0.0",
      "@types/file-saver": "^2.0.7"
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