# ADR-0001: Remove `SiteConfig.pages` — filesystem is the single source of truth

## Status

Proposed — pending implementation and verification.

## Date

2026-04-20

## Context

`@olonjs/core` exposes a public type `SiteConfig` with a required field:

```ts
export interface SitePageEntry { slug: string; label: string; }
export interface SiteConfig {
  identity: SiteIdentity;
  header?: Section;
  footer: Section;
  pages: SitePageEntry[];   // <-- this field
}
```

Every tenant therefore has to populate `"pages": [...]` in `src/data/config/site.json`, listing its pages by `slug` and `label`. Code audit of `packages/core/src` and the in-tree DNA tenant `tenant-alpha` shows:

1. The `pages` array of `SiteConfig` is **never read** by Core at runtime. The page registry consumed by routing (`VisitorRoute.tsx`), by the Studio page switcher (`StudioRoute.tsx`), and by WebMCP manifest building (`webmcp-contracts.ts` → `buildSiteManifest`) is the `pageRegistry` record passed in `JsonPagesConfig.pages`. That record is built by each tenant from `import.meta.glob('@/data/pages/**/*.json')` (`getFilePages.ts`). The filesystem is already the de-facto source of truth.
2. `SitePageEntry` is referenced **only** at its definition site in `kernel.ts`. Zero imports elsewhere, including tests.
3. The field is actively harmful:
   - Both tenants' `coerceSiteConfig` use `Array.isArray(input.pages)` as a *blocking* bootstrap guard — a required field that gates boot on data no one reads.
   - `StudioRoute.tsx` defensively re-initializes `base.pages = []` for every `globalDraft`, silently persisting an empty phantom list back to `site.json` via Studio saves.
   - Live drift already exists in production: both tenants declare `{ slug: "design-system" }` in `site.json.pages` while no `pages/design-system.json` exists on disk. Nothing surfaces this inconsistency — because nothing consumes the array.
4. The contract violates **JSP v1.9** (the JsonPages Site Protocol's filesystem-as-ontology principle) and the project's own statement in `CLAUDE.md` that *"la struttura dati JSON è il contratto"*. Here, the contract is detached from the runtime.

## Decision

Remove `SitePageEntry` and `SiteConfig.pages` from `@olonjs/core`.

Concretely:

1. In `packages/core/src/contract/kernel.ts`:
   - delete `export interface SitePageEntry { ... }`;
   - delete the `pages: SitePageEntry[]` field of `SiteConfig`.
2. In `packages/core/src/runtime/engine/StudioRoute.tsx`:
   - delete `if (!base.pages) base.pages = [];` from the `globalDraft` initializer.
3. In `apps/tenant-alpha/src/App.tsx`:
   - delete `if (!Array.isArray(input.pages)) return null;` from `coerceSiteConfig`.
4. Regenerate the CLI DNA template: `npm run dist:dna:all`, then `npm run check:templates`.
5. Optional data hygiene (recommended): remove the now-dead `"pages": [...]` block from `tenant-alpha/src/data/config/site.json`. Since JSON is not type-checked at runtime, existing tenants with the field present will continue to work — the field simply becomes ignored excess data.

**Explicitly out of scope.** `apps/olonjs.io` is the project marketing site. It is a consumer of published `@olonjs/core` at a pinned version (`^1.0.115`), not a workspace-linked tenant. It has its own release cadence and is not modified by this change. When it eventually bumps `@olonjs/core`, its own `coerceSiteConfig` guard on `input.pages` will continue to compile (the guard runs against `unknown` via `Array.isArray`) and continues to work at runtime as long as its `site.json` still carries the field. No migration required on that side.

The filesystem discovery helper `getFilePages()` stays unchanged: it already produces the canonical `Record<string, PageConfig>` keyed by slug, with the `home`-first ordering convention baked in. It remains the sole producer of the page registry.

## Alternatives Considered

### A. Make `SiteConfig.pages` optional (`pages?: SitePageEntry[]`)

- **Pros:** Backward compatible. Downstream tenants do not need to change anything.
- **Cons:** Keeps the phantom field alive. The coercers and the Studio defensive init still need to be removed to match the new semantics, or they become even more misleading (a guard for an optional field is a design smell). Drift stays invisible. Does not fix the root cause: the contract continues to advertise a field the runtime ignores.
- **Rejected** because the goal is to make the contract honest, not to tolerate dishonesty more comfortably.

### B. Make `SiteConfig.pages` the real source of truth, kill `getFilePages()`

- **Pros:** Explicit, declarative site map. Ordering and labels live in one place.
- **Cons:** Inverts the current working system. Every page add now requires two writes (`site.json` plus a new file under `pages/`). Loses the ergonomics of drop-a-file-and-it-works. Breaks the design of nested slugs (`pages/blog/post-x.json`) which are cleanly expressed in the filesystem and awkward in a flat array. Would require Studio to persist to two files per page mutation. Higher drift surface, not lower.
- **Rejected.** The existing filesystem convention is the more OlonJS-native design: filesystem-first, JSON-first, agent-native.

### C. Move labels/ordering to `menu.json`

- **Pros:** Consistent with JSP v1.9 which already designates `menu.json` as the source of truth for navigation structure. `menu.json` is the correct home for human-facing ordering and labels.
- **Cons:** Separate concern from this decision. A page does not require a menu entry (think legal pages, drafts, preview-only routes). Conflating "discoverable pages" with "navigation items" would be a regression.
- **Deferred.** If a tenant wants curated labels or order in the sidebar or the public nav, `menu.json` already supports that — no change to core needed for it.

### D. Derive labels from `page.meta.title`

- **Pros:** No new field, no new file, no drift. Uses data that already exists and that Studio already edits.
- **Cons:** Mixes concerns — `meta.title` is SEO/document title, not nav label. Sometimes they differ ("Contact Us" nav vs. "Get in touch — Contacts" SEO title).
- **Status:** Neither decided nor rejected. If a future need arises for labels in the Studio page switcher, `page.meta.navLabel` or `menu.json` are both candidates. Not part of this ADR.

## Consequences

### Positive

- The public `SiteConfig` contract matches actual runtime consumption. One less place to lie.
- `site.json` becomes smaller, simpler, and stops drifting against `pages/`.
- Tenants stop shipping a field that nobody reads. Template DNA gets cleaner.
- The tenant coercer's bootstrap check becomes a single meaningful guard (`identity` present), not a multi-step validation of dead data.
- Studio stops writing phantom `pages: []` into saved `site.json` documents.

### Negative / trade-offs

- **Public type breaking change.** Any downstream TypeScript code that destructures `siteConfig.pages` or declares a variable of type `SitePageEntry` will fail to compile. Grep of this monorepo shows zero internal uses outside of `kernel.ts` itself. External consumers, including this repo's own marketing site `apps/olonjs.io` (pinned to `@olonjs/core@^1.0.115`), continue to work because their coercers guard `input.pages` via `Array.isArray` on an `unknown`, which remains valid after the type narrows.
- **Protocol revision.** This is a narrowing of JSP v1.9's `site.json` schema. The `specs/olonjsSpecs_V_1_6.md` document must be updated in a follow-up. Treating the change as JSP v1.9.1 (narrowing a field no one read) or as part of a broader v2.0 cut is an open question (see the spec).
- **No migration needed for data.** Existing tenant `site.json` files that still contain `"pages": [...]` continue to work — JSON carries excess fields silently. A later cleanup pass is optional.

### Risk mitigation

- Two in-tree type-check runs (`@olonjs/core`, `tenant-alpha`, `olonjs.io`) are the primary gate; they would surface any missed internal consumer.
- `npm run check:templates` after DNA regeneration prevents shipping a broken CLI template.
- The Studio smoke test (page selector still lists filesystem pages) confirms no regression in the one user-visible surface that exposes the registry.

## Compliance mapping

- **JSP v1.9:** reinforced. The filesystem remains the ontology for pages; this change removes an incoherence with the protocol, not a conformant feature.
- **ECIP v1.6 / Form Factory:** unaffected. `SiteConfig.pages` was not rendered by any inspector form.
- **IDAC v1.2:** unaffected. No DOM attributes depended on `pages`.
- **Studio / JAP v1.3:** affected only in that the defensive `base.pages = []` init disappears. `ProjectState.site` shape narrows by one field.

## References

- Spec: `specs/changes/spec-remove-siteconfig-pages.md`
- Code references at decision time:
  - `packages/core/src/contract/kernel.ts` (lines 75-85)
  - `packages/core/src/runtime/engine/StudioRoute.tsx` (line 103)
  - `packages/core/src/contract/webmcp-contracts.ts` (`buildSiteManifest` reads from `pages` record, not `siteConfig.pages`)
  - `apps/tenant-alpha/src/App.tsx` (line 175)
  - `apps/tenant-alpha/src/lib/getFilePages.ts`
