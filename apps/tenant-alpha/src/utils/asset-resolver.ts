/**
 * 🛡️ SMART ASSET RESOLVER
 * Distinguishes between internal routes and static assets.
 */
export const resolveAssetUrl = (path: string, tenantId: string = 'default'): string => {
  // 1. Absolute URLs, Data URIs, and Anchors are returned as is
  if (path.startsWith('http') || path.startsWith('data:') || path.startsWith('#')) {
    return path;
  }

  // 2. Detect if it's a Route or an Asset
  // If it starts with / and not /assets, it's a page route.
  const isExplicitAsset = path.includes('assets/') || path.startsWith('assets/');
  const hasFileExtension = /\.(jpg|jpeg|png|gif|svg|pdf|webp|mp4|webm|ogg)$/i.test(path);

  if (!isExplicitAsset && !hasFileExtension) {
    // It's a route (e.g., "/about" or "contact")
    return path.startsWith('/') ? path : `/${path}`;
  }

  // 3. It's an asset: Normalize and prepend tenant path
  const cleanPath = path.replace(/^\//, '').replace(/^assets\//, '');
  return `/assets/${tenantId}/${cleanPath}`;
};
