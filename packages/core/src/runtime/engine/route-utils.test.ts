import { describe, expect, it } from 'vitest';

import { resolveSlugFromPathname } from './route-utils';

describe('resolveSlugFromPathname', () => {
  it('resolves home for root pathname', () => {
    expect(resolveSlugFromPathname('/')).toBe('home');
  });

  it('supports prefixed pathnames', () => {
    expect(resolveSlugFromPathname('/core/', 'core')).toBe('home');
    expect(resolveSlugFromPathname('/core/platform/overview', 'core')).toBe('platform/overview');
  });
});
