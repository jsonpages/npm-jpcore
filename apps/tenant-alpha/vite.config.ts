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

function listImagesInDir(dir: string, urlPrefix: string): { id: string; url: string; alt: string; tags: string[] }[] {
  const list: { id: string; url: string; alt: string; tags: string[] }[] = [];
  if (!fs.existsSync(dir)) return list;
  const names = fs.readdirSync(dir);
  for (const name of names) {
    const ext = path.extname(name).toLowerCase();
    if (IMAGE_EXT.has(ext)) {
      list.push({ id: name, url: `${urlPrefix}/${name}`, alt: name, tags: [] });
    }
  }
  return list;
}

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    {
      name: 'upload-asset-api',
      configureServer(server) {
        // In-memory only (no disk write) so dev server watcher never triggers a full reload.
        // Image shows in Upload tab via /uploaded-assets/:name. Disk write can be added on Save later.
        const devUploads = new Map<string, { buf: Buffer; mime: string }>();
        server.middlewares.use((req, res, next) => {
          if (req.method === 'GET' && req.url === '/api/list-assets') {
            try {
              const fromPublic = listImagesInDir(ASSETS_DIR, '/assets');
              const fromMemory = Array.from(devUploads.keys()).map((name) => ({
                id: name,
                url: `/uploaded-assets/${name}`,
                alt: name,
                tags: [] as string[],
              }));
              const list = [...fromPublic, ...fromMemory];
              res.writeHead(200, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify(list));
            } catch (e) {
              res.writeHead(500, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify({ error: e instanceof Error ? e.message : 'List failed' }));
            }
            return;
          }
          if (req.method === 'GET' && req.url?.startsWith('/uploaded-assets/')) {
            const name = req.url.slice('/uploaded-assets/'.length).replace(/[^a-zA-Z0-9._-]/g, '');
            if (!name) return next();
            const entry = devUploads.get(name);
            if (!entry) return next();
            res.writeHead(200, { 'Content-Type': entry.mime });
            res.end(entry.buf);
            return;
          }
          if (req.method === 'POST' && req.url === '/api/flush-uploaded-assets') {
            const chunks: Buffer[] = [];
            req.on('data', (chunk: Buffer) => chunks.push(chunk));
            req.on('end', () => {
              try {
                const body = JSON.parse(Buffer.concat(chunks).toString('utf8')) as { urls?: string[] };
                const urls = Array.isArray(body?.urls) ? body.urls : [];
                const urlMap: Record<string, string> = {};
                if (!fs.existsSync(ASSETS_DIR)) fs.mkdirSync(ASSETS_DIR, { recursive: true });
                for (const url of urls) {
                  if (typeof url !== 'string' || !url.startsWith('/uploaded-assets/')) continue;
                  const name = url.slice('/uploaded-assets/'.length).replace(/[^a-zA-Z0-9._-]/g, '');
                  if (!name) continue;
                  const entry = devUploads.get(name);
                  if (!entry) continue;
                  const filePath = path.join(ASSETS_DIR, name);
                  fs.writeFileSync(filePath, entry.buf);
                  urlMap[url] = `/assets/${name}`;
                }
                res.writeHead(200, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ urlMap }));
              } catch (e) {
                res.writeHead(500, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: e instanceof Error ? e.message : 'Flush failed' }));
              }
            });
            req.on('error', () => {
              res.writeHead(500, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify({ error: 'Request error' }));
            });
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
              const name = safeFilename(filename, mimeType);
              const buf = Buffer.from(data, 'base64');
              const ext = path.extname(name).toLowerCase();
              const mime = ext === '.png' ? 'image/png' : ext === '.jpg' || ext === '.jpeg' ? 'image/jpeg' : ext === '.webp' ? 'image/webp' : ext === '.gif' ? 'image/gif' : 'application/octet-stream';
              devUploads.set(name, { buf, mime });
              const url = `/uploaded-assets/${name}`;
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



