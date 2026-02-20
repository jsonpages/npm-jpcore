/**
 * Vite config for CLI-generated tenants.
 * Includes dev server API: /api/save-to-file, /api/upload-asset, /api/list-assets.
 * Keep in sync with apps/tenant-alpha/vite.config.ts (without monorepo-specific alias).
 */
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const ASSETS_IMAGES_DIR = path.resolve(__dirname, 'public', 'assets', 'images');
const DATA_CONFIG_DIR = path.resolve(__dirname, 'src', 'data', 'config');
const DATA_PAGES_DIR = path.resolve(__dirname, 'src', 'data', 'pages');
const IMAGE_EXT = new Set(['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg', '.avif']);
const IMAGE_MIMES = new Set([
  'image/jpeg',
  'image/png',
  'image/webp',
  'image/gif',
  'image/svg+xml',
  'image/avif',
]);
const MAX_FILE_SIZE_BYTES = 5 * 1024 * 1024; // 5MB

function safeFilename(original: string, mimeType?: string): string {
  const base = original
    .replace(/\.[^.]+$/, '')
    .replace(/[^a-zA-Z0-9-_]/g, '_')
    .slice(0, 128) || 'image';
  const ext = original.includes('.')
    ? path.extname(original).toLowerCase()
    : mimeType?.startsWith('image/')
      ? `.${mimeType.split('/')[1]?.replace('jpeg', 'jpg') || 'png'}`
      : '.png';
  const safeExt = IMAGE_EXT.has(ext) ? ext : '.png';
  return `${Date.now()}-${base}${safeExt}`;
}

function listImagesInDir(
  dir: string,
  urlPrefix: string
): { id: string; url: string; alt: string; tags: string[] }[] {
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

function sendJson(res: import('http').ServerResponse, status: number, body: object) {
  res.writeHead(status, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify(body));
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
              const list = listImagesInDir(ASSETS_IMAGES_DIR, '/assets/images');
              sendJson(res, 200, list);
            } catch (e) {
              sendJson(res, 500, {
                error: e instanceof Error ? e.message : 'List failed',
              });
            }
            return;
          }

          const pathname = (req.url ?? '').split('?')[0];
          if (req.method === 'POST' && pathname === '/api/save-to-file') {
            const chunks: Buffer[] = [];
            req.on('data', (chunk: Buffer) => chunks.push(chunk));
            req.on('end', () => {
              try {
                const raw = Buffer.concat(chunks).toString('utf8');
                if (!raw.trim()) {
                  sendJson(res, 400, { error: 'Empty body' });
                  return;
                }
                const body = JSON.parse(raw) as {
                  projectState?: { site?: object; theme?: object; menu?: object; page?: object };
                  slug?: string;
                };
                const { projectState, slug } = body;
                if (!projectState || typeof slug !== 'string') {
                  sendJson(res, 400, { error: 'Missing projectState or slug' });
                  return;
                }
                if (!fs.existsSync(DATA_CONFIG_DIR)) fs.mkdirSync(DATA_CONFIG_DIR, { recursive: true });
                if (!fs.existsSync(DATA_PAGES_DIR)) fs.mkdirSync(DATA_PAGES_DIR, { recursive: true });
                const writtenPaths: string[] = [];
                if (projectState.site != null) {
                  const p = path.join(DATA_CONFIG_DIR, 'site.json');
                  fs.writeFileSync(p, JSON.stringify(projectState.site, null, 2), 'utf8');
                  writtenPaths.push(p);
                }
                if (projectState.theme != null) {
                  const p = path.join(DATA_CONFIG_DIR, 'theme.json');
                  fs.writeFileSync(p, JSON.stringify(projectState.theme, null, 2), 'utf8');
                  writtenPaths.push(p);
                }
                if (projectState.menu != null) {
                  const p = path.join(DATA_CONFIG_DIR, 'menu.json');
                  fs.writeFileSync(p, JSON.stringify(projectState.menu, null, 2), 'utf8');
                  writtenPaths.push(p);
                }
                if (projectState.page != null) {
                  const safeSlug = slug.replace(/[^a-zA-Z0-9-_]/g, '_') || 'page';
                  const p = path.join(DATA_PAGES_DIR, `${safeSlug}.json`);
                  fs.writeFileSync(p, JSON.stringify(projectState.page, null, 2), 'utf8');
                  writtenPaths.push(p);
                }
                for (const filePath of writtenPaths) {
                  const fd = fs.openSync(filePath, 'r');
                  fs.fsyncSync(fd);
                  fs.closeSync(fd);
                }
                sendJson(res, 200, { ok: true });
              } catch (e) {
                sendJson(res, 500, {
                  error: e instanceof Error ? e.message : 'Save to file failed',
                });
              }
            });
            req.on('error', () => sendJson(res, 500, { error: 'Request error' }));
            return;
          }

          if (req.method !== 'POST' || req.url !== '/api/upload-asset') return next();

          const chunks: Buffer[] = [];
          req.on('data', (chunk: Buffer) => chunks.push(chunk));
          req.on('end', () => {
            try {
              const body = JSON.parse(Buffer.concat(chunks).toString('utf8')) as {
                filename?: string;
                mimeType?: string;
                data?: string;
              };
              const { filename, mimeType, data } = body;

              if (!filename || typeof data !== 'string') {
                sendJson(res, 400, { error: 'Missing filename or data' });
                return;
              }

              const buf = Buffer.from(data, 'base64');
              if (buf.length > MAX_FILE_SIZE_BYTES) {
                sendJson(res, 413, {
                  error: `File too large. Maximum size is ${MAX_FILE_SIZE_BYTES / 1024 / 1024}MB.`,
                });
                return;
              }

              const allowedMime = mimeType && IMAGE_MIMES.has(mimeType);
              if (mimeType && !allowedMime) {
                sendJson(res, 400, {
                  error: 'Invalid file type. Allowed: JPEG, PNG, WebP, GIF, SVG, AVIF.',
                });
                return;
              }

              const name = safeFilename(filename, mimeType);
              if (!fs.existsSync(ASSETS_IMAGES_DIR)) {
                fs.mkdirSync(ASSETS_IMAGES_DIR, { recursive: true });
              }
              const filePath = path.join(ASSETS_IMAGES_DIR, name);
              fs.writeFileSync(filePath, buf);

              const url = `/assets/images/${name}`;
              sendJson(res, 200, { url });
            } catch (e) {
              sendJson(res, 500, {
                error: e instanceof Error ? e.message : 'Upload failed',
              });
            }
          });
          req.on('error', () => {
            sendJson(res, 500, { error: 'Request error' });
          });
        });
      },
    },
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
});
