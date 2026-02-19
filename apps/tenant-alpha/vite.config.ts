import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';
import fs from 'fs';

/** Directory for uploaded images: written to disk immediately. Served at /assets/images/. */
const ASSETS_IMAGES_DIR = path.resolve(__dirname, 'public', 'assets', 'images');
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

/**
 * Sanitize filename: safe chars only, extension from mime or original.
 * Prefix with timestamp to avoid collisions.
 */
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
      '@jsonpages/core': path.resolve(__dirname, '../../packages/core/src/index.ts'),
    },
  },
});
