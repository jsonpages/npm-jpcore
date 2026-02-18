/**
 * Sync Core's peerDependencies from @jsonpages/stack.
 * Run before pack/publish so published Core declares the same versions as the stack.
 */
import { readFileSync, writeFileSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const coreRoot = join(__dirname, '..');
const pkgPath = join(coreRoot, 'package.json');

let stack;
try {
  const stackModule = await import('@jsonpages/stack');
  stack = stackModule.default ?? stackModule;
} catch (e) {
  console.warn('sync-peers-from-stack: @jsonpages/stack not found, skipping sync.', e.message);
  process.exit(0);
}

if (!stack?.peerDependencies) {
  console.warn('sync-peers-from-stack: no peerDependencies in stack, skipping.');
  process.exit(0);
}

const pkg = JSON.parse(readFileSync(pkgPath, 'utf8'));
pkg.peerDependencies = { ...stack.peerDependencies };
writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');
console.log('sync-peers-from-stack: Core peerDependencies synced from @jsonpages/stack.');
