import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import dts from 'vite-plugin-dts';
import path from 'path';
import { fileURLToPath } from 'url';
import tailwindcss from '@tailwindcss/vite';

// 🛡️ ESM Shim per __dirname
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    dts({ 
      insertTypesEntry: true,
      include: ['src'],
      // Genera file .d.ts puliti senza import circolari
      rollupTypes: true 
    })
  ],
  build: {
    lib: {
      // Punto di ingresso della libreria
      entry: path.resolve(__dirname, 'src/index.ts'),
      name: 'JsonPagesCore',
      formats: ['es', 'umd'],
      fileName: (format) => `jsonpages-core.${format === 'es' ? 'js' : 'umd.cjs'}`,
    },
    rollupOptions: {
      // 🛡️ Peer Dependencies: non includerle nel bundle finale
      external: ['react', 'react-dom', 'react-router-dom', 'zod'],
      output: {
        globals: {
          react: 'React',
          'react-dom': 'ReactDOM',
          'zod': 'z',
          'react-router-dom': 'ReactRouterDOM'
        },
      },
    },
  },
});