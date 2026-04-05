/**
 * Conceptual public surface for OlonJS kernel/contract concerns.
 *
 * This barrel is intentionally package-local for now: it lets us
 * converge imports around the future split without breaking the current
 * @olonjs/core entrypoint.
 */
export * from '../lib/kernel';
export * from '../lib/types-engine';
export * from '../lib/shared-types';
export {
  resolveHeaderMenuItems,
  resolveRuntimeConfig,
  resolveSectionMenuItems,
} from '../lib/config-resolver';
