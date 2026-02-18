import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';
import fs from 'fs';

const ASSETS_DIR = path.resolve(__dirname, 'public', 'assets');
const IMAGE_EXT = new Set(['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg', '.avif']);

/** Sanitize filename: keep only safe chars, add extension from mime or name. */
function safeFilename(original: string, mimeType?: string): string {
  const base = original.replace(/\.[^.]+$/, '').replace(/[^a-zA-Z0-9-_]/g, '_') || 'image';
  const ext = original.includes('.') ? path.extname(original).toLowerCase() : (mimeType?.startsWith('image/') ? `.${mimeType.split('/')[1]?.replace('jpeg', 'jpg') || 'png'}` : '.png');
  return `${Date.now()}-${base}${ext}`;
}

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    {
      name: 'upload-asset-api',
      configureServer(server) {
        server.middlewares.use((req, res, next) => {
          if (req.method === 'GET' && req.url === '/api/list-assets') {
            try {
              const list: { id: string; url: string; alt: string; tags: string[] }[] = [];
              if (fs.existsSync(ASSETS_DIR)) {
                const names = fs.readdirSync(ASSETS_DIR);
                for (const name of names) {
                  const ext = path.extname(name).toLowerCase();
                  if (IMAGE_EXT.has(ext)) {
                    list.push({ id: name, url: `/assets/${name}`, alt: name, tags: [] });
                  }
                }
              }
              res.writeHead(200, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify(list));
            } catch (e) {
              res.writeHead(500, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify({ error: e instanceof Error ? e.message : 'List failed' }));
            }
            return;
          }
          if (req.method !== 'POST' || req.url !== '/api/upload-asset') return next();

          const chunks: Buffer[] = [];
          req.on('data', (chunk: Buffer) => chunks.push(chunk));
          req.on('end', () => {
            try {
              const body = JSON.parse(Buffer.concat(chunks).toString('utf8')) as { filename: string; mimeType?: string; data: string };
              const { filename, mimeType, data } = body;
              if (!filename || typeof data !== 'string') {
                res.writeHead(400, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: 'Missing filename or data' }));
                return;
              }
              if (!fs.existsSync(ASSETS_DIR)) fs.mkdirSync(ASSETS_DIR, { recursive: true });
              const name = safeFilename(filename, mimeType);
              const filePath = path.join(ASSETS_DIR, name);
              const buf = Buffer.from(data, 'base64');
              fs.writeFileSync(filePath, buf);
              const url = `/assets/${name}`;
              res.writeHead(200, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify({ url }));
            } catch (e) {
              res.writeHead(500, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify({ error: e instanceof Error ? e.message : 'Upload failed' }));
            }
          });
          req.on('error', () => {
            res.writeHead(500, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ error: 'Request error' }));
          });
        });
      },
    },
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@jsonpages/core': path.resolve(__dirname, '../../packages/core/src/index.ts'),
    },
  },
});



