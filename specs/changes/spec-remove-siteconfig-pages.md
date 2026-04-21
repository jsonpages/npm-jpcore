# Spec: Remove `SiteConfig.pages` from the core contract

- Status: Draft — pending approval
- Owner: Guido Serio
- Related ADR: `docs/decisions/ADR-0001-remove-siteconfig-pages.md`
- Protocol impact: JSP v1.9 (JsonPages Site Protocol)

## Objective

Make the filesystem (`src/data/pages/**/*.json`) the single, normative source of truth for the page registry of a OlonJS tenant, and remove the parallel `SiteConfig.pages` array from the core contract that nobody reads at runtime.

**Why now.** The field already creates silent drift in production: both `tenant-alpha` and `olonjs.io` declare `{ slug: "design-system" }` in `site.json.pages` while no matching `pages/design-system.json` exists on the filesystem. The runtime ignores the array entirely — `pageRegistry` (built from the filesystem via `getFilePages()`) is the real source of truth. Keeping the field alive costs us:

1. A phantom contract field in the public `@olonjs/core` API.
2. A blocking validator in every tenant's `coerceSiteConfig` that fails bootstrap if the array is missing.
3. A defensive auto-init in Studio (`base.pages = []`).
4. A violation of **JSP v1.9** ("the filesystem is the ontology") and of the CLAUDE.md principle *"la struttura dati JSON è il contratto"* — the current contract is not respected by the runtime.

## Tech Stack

- TypeScript 5, React 19, Vite 6
- `@olonjs/core` (packages/core) — the contract we are narrowing
- `apps/tenant-alpha` — the DNA source tenant, in-tree, affected
- CLI DNA at `packages/cli/assets/templates/alpha/` — derived from `tenant-alpha`, requires regeneration
- `apps/olonjs.io` — **out of scope**. It is the project marketing site, a consumer of the published `@olonjs/core` at a pinned version (`^1.0.115`), not a workspace link. It lives on its own release cadence and is unaffected until it bumps the dependency. Not touched by this change.

## Commands

- Type check core: `npm --workspace @olonjs/core run build`
- Type check alpha: `npm --workspace apps/tenant-alpha run build`
- Core tests: `npm --workspace @olonjs/core test`
- Regenerate CLI DNA: `npm run dist:dna:all`
- Validate templates: `npm run check:templates`

## Scope — files touched

### Core (contract narrowing)
- `packages/core/src/contract/kernel.ts`
  - Remove `interface SitePageEntry`
  - Remove `pages: SitePageEntry[]` from `interface SiteConfig`
- `packages/core/src/runtime/engine/StudioRoute.tsx`
  - Remove the defensive line `if (!base.pages) base.pages = [];` inside the `globalDraft` initializer

### Tenant (coercer cleanup)
- `apps/tenant-alpha/src/App.tsx`
  - Remove `if (!Array.isArray(input.pages)) return null;` from `coerceSiteConfig`

### Data hygiene (non-blocking, recommended)
- `apps/tenant-alpha/src/data/config/site.json`
  - Remove the `"pages": [...]` block (dead data, already drifting)

### Explicitly out of scope
- `apps/olonjs.io` — out-of-tree consumer of published `@olonjs/core`, independent version cadence. No file in this app is modified by this change.

### DNA regeneration
- Run `npm run dist:dna:all` to sync `packages/cli/assets/templates/alpha/` from the updated `tenant-alpha`.

## Code Style

Surgical deletions only. No renames, no reorders, no formatting. Preserve the rest of the file byte-for-byte.

Example of the tenant coercer after the change:

```ts
function coerceSiteConfig(value: unknown): SiteConfig | null {
  let input = value;
  if (typeof input === 'string') {
    try { input = JSON.parse(input) as unknown; } catch { return null; }
  }
  if (!isObjectRecord(input)) return null;
  if (!isObjectRecord(input.identity)) return null;
  return input as unknown as SiteConfig;
}
```

## Testing Strategy

- **Type check gate.** `npm --workspace @olonjs/core run build` must pass — catches any remaining `SitePageEntry` / `siteConfig.pages` reference we missed.
- **Tenant type check gate.** `npm --workspace apps/tenant-alpha run build` must pass.
- **Core tests.** `npm --workspace @olonjs/core test` — no test currently references `SitePageEntry` (grep-confirmed), so no test edits expected.
- **Runtime smoke.** Start `tenant-alpha` dev server, open `/admin` and `/`, confirm the page selector still lists `home` and the visitor route still resolves `/`.
- **Drift smoke.** Temporarily add `src/data/pages/about.json`, confirm it appears in the page selector and routes correctly — without touching `site.json`.

## Boundaries

### Always
- Update the ADR with outcome of verification.
- Run `npm run dist:dna:all` before committing tenant-alpha changes.
- Keep diffs minimal — one file, one intent.

### Ask first
- Any collateral change to Studio persistence or the save envelope (`ProjectState.site`).
- Any change to WebMCP manifest output shape (`buildSiteManifest`).
- Whether to strip the dead `"pages": [...]` block from the two `site.json` files in the same PR or as a follow-up.

### Never
- Touch `pageRegistry` / `getFilePages()` semantics — they are already the SoT and must stay unchanged.
- Introduce a replacement field on `SiteConfig` (e.g. `pageOrder`, `navLabel`) in this change. If ordering or labels become a real need, that is a separate spec.
- Modify out-of-tree tenants (`temp/llms`, `temp/santa13`, `temp/gumlon`, ecc.) — they are downstream; they self-heal at runtime because JSON is not type-checked.

## Success Criteria

- [ ] `SitePageEntry` is not defined or exported anywhere in `@olonjs/core`.
- [ ] `SiteConfig` in `kernel.ts` has no `pages` field.
- [ ] `tenant-alpha` builds with zero TypeScript errors after the change.
- [ ] Studio page switcher in `tenant-alpha` still lists every `.json` file under `src/data/pages/` (currently: `home`).
- [ ] Visitor route `/` in `tenant-alpha` renders `home` with no console error.
- [ ] Removing `"pages": [...]` from `site.json` does not break boot.
- [ ] `npm run check:templates` passes after `npm run dist:dna:all`.
- [ ] WebMCP manifest for `tenant-alpha` still contains the `home` page entry (unchanged — it is built from `pageRegistry`, not from `siteConfig.pages`).

## Open Questions

1. Should the dead `"pages": [...]` block in the two `site.json` files be removed in the same commit, in a follow-up, or left as-is (harmless excess data)?
2. Do we version this as a JSP v1.9 revision (e.g. v1.9.1) or as a breaking bump to v2.0? The field is public in `@olonjs/core` types; removing a required field is technically breaking even if no one reads it.
3. Do we need a codemod / release note for downstream tenants, or is a CHANGELOG entry sufficient?
