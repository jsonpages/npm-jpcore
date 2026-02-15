import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import dts from 'vite-plugin-dts';
import path from 'path';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    dts({ 
      insertTypesEntry: true,
      include: ['src'],
      staticImport: true 
    })
  ],
  build: {
    lib: {
      entry: path.resolve(__dirname, 'src/index.ts'),
      name: 'JsonPagesCore',
      formats: ['es', 'umd'],
      fileName: (format) => `jsonpages-core.${format === 'es' ? 'js' : 'umd.cjs'}`,
    },
    rollupOptions: {
      // 🛡️ Non includiamo React e Zod nel pacchetto, li prenderemo dal Tenant
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