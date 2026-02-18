/**
 * 🛡️ SOVEREIGN ASSET RESOLVER
 * Centralized logic to distinguish between routes and static assets.
 * Moved to Core to allow Standard Blocks to resolve assets consistently.
 */
export const resolveAssetUrl = (path: string, tenantId: string = 'default'): string => {
    // 1. Absolute URLs, Data URIs, and Anchors are returned as is
    if (path.startsWith('http') || path.startsWith('data:') || path.startsWith('#')) {
      return path;
    }
  
  // 2. Path already points at tenant root assets (e.g. /assets/filename from upload): return as-is
  if (path.startsWith('/assets/')) return path;
  if (path.startsWith('assets/')) return `/${path}`;

  // 3. Detect route vs asset by extension
  const hasFileExtension = /\.(jpg|jpeg|png|gif|svg|pdf|webp|mp4|webm|ogg)$/i.test(path);
  if (!hasFileExtension) {
    return path.startsWith('/') ? path : `/${path}`;
  }

  // 4. Relative asset path: prepend tenant segment
  const cleanPath = path.replace(/^\//, '');
  return `/assets/${tenantId}/${cleanPath}`;
};