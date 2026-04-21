# Implementation Plan: OlonJS Form Submission Schemas (Core)

Status: **Ready for implementation** — pending user greenlight
Decision record: [ADR-0002](../decisions/ADR-0002-form-submission-schemas.md)
Owner: `@olonjs/core`
Downstream consumer (out of scope here): `jsonpages-platform` — future `submit-form` MCP tool

## Overview

Add an opt-in `submissionSchemas` surface to `@olonjs/core` so that tenant sections which accept user input expose a machine-readable Zod schema of their submission fields. The schema emerges in the existing page contract (via `buildPageContract`) as `sectionSubmissionSchemas`, serialized through the existing `zodToJsonSchema` utility. MCP agents reading the page contract will discover form contracts without any additional tool call. No breaking change.

This plan does **not** implement the platform-side `submit-form` MCP tool. That is a separate intervention in `jsonpages-platform`, tracked under its own ADR.

## Architecture decisions

All architectural decisions are in [ADR-0002](../decisions/ADR-0002-form-submission-schemas.md). Do not re-litigate them here. This plan executes against that decision. Summary (for navigation only):

- Additive; no rename, no removal.
- Separate `submissionSchemas` registry on `JsonPagesConfig`, not nested in UI-config Zod.
- Serialized with the existing `zodToJsonSchema`.
- Emission is page-scoped: only section types actually present on the page AND with a registered submission schema.
- Tenant convention documented as spec, enforced by types.

Resolved refinements (from ADR-0002 Decision log, 2026-04-21):

- **Dates:** ISO 8601 — `z.string().regex(/^\d{4}-\d{2}-\d{2}$/)` for calendar dates, `z.string().datetime()` for datetime.
- **Helper:** no `defineSubmissionSchema` helper ships with core; tenants use `z.object` directly.

## Non-goals

To keep scope disciplined (see `incremental-implementation` Rule 0.5):

- No change to the existing `schemas` / `sectionSchemas` meaning. UI-configuration schemas stay as they are.
- No change to `apps/tenant-alpha/src/App.tsx`, `coerceSiteConfig`, or any other surface not directly required by the convention.
- No change to the platform side (`jsonpages-platform`). The `submit-form` MCP tool and the validation pipeline it will run are out of scope.
- No new build-time lint that fails the tenant build when `.describe` is missing. This is a future hardening step, not part of v1. Missing `.describe` produces a suboptimal agent experience but does not break anything.
- No runtime validation of submission payloads inside core. Validation happens platform-side.
- No cleanup of pre-existing unrelated issues noticed in passing (note them, don't fix them).

## Dependency graph

```
Slice 1 (types)
   │
   └── Slice 2 (emission in buildPageContract + tests)
           │
           └── Slice 3 (tenant-alpha adopts convention end-to-end)
                   │
                   ├── Slice 4 (DNA regeneration + template check)
                   │
                   └── Slice 5 (README: tenant convention docs)
```

Slices 4 and 5 are independent of each other after Slice 3 completes and can run in either order.

---

## Task list

Each slice is a vertical increment. After each slice the repo MUST build, MUST type-check, MUST pass the existing test suite. No slice is allowed to leave the tree in a broken state. See `incremental-implementation` Rules 1–5.

### Slice 1: Extend the contract shape (types only)

**Description.** Add the optional types on both the config input and the contract output. No runtime behavior change — `buildPageContract` still compiles and works identically because both new fields are optional. This slice is rollback-friendly: pure additive.

**Acceptance criteria:**
- [ ] `JsonPagesConfig` in `packages/core/src/contract/types-engine.ts` has an optional field `submissionSchemas?: Record<string, z.ZodTypeAny>` with JSDoc that references ADR-0002.
- [ ] `OlonJsPageContract` in `packages/core/src/contract/webmcp-contracts.ts` has an optional field `sectionSubmissionSchemas?: Record<string, Record<string, unknown>>` with JSDoc that cites ADR-0002 for the emission contract.
- [ ] Both types are exported from the existing barrel (`packages/core/src/index.ts` if `JsonPagesConfig` is exported there, and `packages/core/src/webmcp/index.ts` for the contract type) without introducing new top-level symbols that could clash.

**Verification:**
- [ ] `npx tsc --noEmit` in `packages/core` passes.
- [ ] `npm test -w @olonjs/core -- webmcp-contracts` still passes unchanged (no behavior change expected).
- [ ] `npm run build -w @olonjs/core` succeeds.
- [ ] Grep for the new field names (`submissionSchemas`, `sectionSubmissionSchemas`) shows only the definition sites and JSDoc — no accidental call sites yet.

**Dependencies:** None.

**Files likely touched:**
- `packages/core/src/contract/types-engine.ts`
- `packages/core/src/contract/webmcp-contracts.ts` (type declaration only, no logic change in this slice)

**Estimated scope:** XS (2 files, type additions only).

**Commit message convention:** `feat(core): add submissionSchemas / sectionSubmissionSchemas types (ADR-0002)`

---

### Slice 2: Emit `sectionSubmissionSchemas` from `buildPageContract`

**Description.** Wire the emission logic: `buildPageContract` accepts `submissionSchemas`, filters to section types present on the page, serializes each via the existing `zodToJsonSchema`, and produces `sectionSubmissionSchemas` on the returned contract. When `submissionSchemas` is absent or every matching key is missing, the field is omitted (not set to `{}`) to keep the contract tight. Extend `buildPageManifest` and `buildSiteManifest` consistently so the site-level manifest carries the same information per page.

**Acceptance criteria:**
- [ ] `buildPageContract` accepts `submissionSchemas?: Record<string, z.ZodTypeAny>` in its input and emits `sectionSubmissionSchemas` scoped to section types actually present on the page.
- [ ] If no section on the page has a registered submission schema, `sectionSubmissionSchemas` is absent (not `{}`) on the returned contract.
- [ ] `buildPageManifest` and `buildSiteManifest` thread `submissionSchemas` through to `buildPageContract` unchanged. Their own API surface gains the same optional field.
- [ ] `zodToJsonSchema` is reused as-is. No new serializer is introduced.
- [ ] New unit tests in `packages/core/src/webmcp/webmcp-contracts.test.ts` covering at minimum:
  - A page that contains a section with a registered submission schema emits `sectionSubmissionSchemas` with exactly that key.
  - A page with sections that have no registered submission schema does NOT emit the field.
  - A page that has BOTH a UI-config schema AND a submission schema for the same section type emits both, in their respective maps, with different shapes (proves separation).
  - Field `.describe` descriptions appear in the serialized JSON Schema (so the agent can render them as labels).

**Verification:**
- [ ] `npm test -w @olonjs/core -- webmcp-contracts` passes including the new cases.
- [ ] `npm run build -w @olonjs/core` succeeds.
- [ ] Manual inspection of a test-printed contract confirms JSON Schema includes `description` fields from Zod's `.describe()`.

**Dependencies:** Slice 1.

**Files likely touched:**
- `packages/core/src/contract/webmcp-contracts.ts` (logic)
- `packages/core/src/webmcp/webmcp-contracts.test.ts` (new tests)

**Estimated scope:** S (2 files, pure additive logic in one function plus 2 thin caller updates).

**Commit message convention:** `feat(core): emit sectionSubmissionSchemas from buildPageContract (ADR-0002)`

### Checkpoint after Slice 2

- [ ] `npx tsc --noEmit` clean across `packages/core`.
- [ ] `npm test -w @olonjs/core` green (existing + new tests).
- [ ] `npm run build -w @olonjs/core` clean.
- [ ] No consumer of `@olonjs/core` has broken. Specifically: `apps/tenant-alpha` still builds without any change (proves backward compatibility).
- [ ] Review the diff: zero unrelated changes (Rule 0.5).

**STOP HERE and wait for user review before Slice 3.** This is the natural half-point — core is done, tenant adoption is a separate concern.

---

### Slice 3: Reference tenant (`tenant-alpha`) adopts the convention

**Description.** Demonstrate the convention end-to-end on a real tenant. Pick one existing section as the carrier (contact-form is the natural candidate, if present in `tenant-alpha`; otherwise the nearest form-shaped section or a new minimal one). This is the first place the convention is exercised outside tests, so it is also the acceptance test for the DX of the tenant-facing spec.

**Preflight (inside this slice, before any edit):**
1. Confirm which section(s) in `apps/tenant-alpha/src/components/` make sense as the carrier. If no form-shaped section exists, the slice is descoped to "define an example in the README only" and pushed to Slice 5 — do NOT invent a fake section just to have one.
2. Confirm the exact section-type string used in `pages/*.json` for that section.
3. Confirm where `JsonPagesConfig` is composed in the tenant (likely `src/lib/schemas.ts` + `src/App.tsx` or equivalent).

**Acceptance criteria:**
- [ ] One section capsule in `apps/tenant-alpha/src/components/<section>/schema.ts` exports a `<SectionName>SubmissionSchema` following the ADR-0002 convention (all fields `.describe()`'d; ISO date where applicable).
- [ ] `apps/tenant-alpha/src/lib/schemas.ts` (or equivalent) exports a `SECTION_SUBMISSION_SCHEMAS` map keyed by section type.
- [ ] `apps/tenant-alpha`'s `JsonPagesConfig` is composed with `submissionSchemas: SECTION_SUBMISSION_SCHEMAS`.
- [ ] Running the tenant build produces a page contract (JSON sidecar or equivalent) that contains `sectionSubmissionSchemas.<section-type>` with the expected keys and `description` fields.
- [ ] No change to section `View.tsx` (UI stays identical; this is a pure schema addition).

**Verification:**
- [ ] `npm run build -w tenant-alpha` succeeds.
- [ ] Inspect the generated page JSON for the page that contains the section. Confirm `sectionSubmissionSchemas` is present with the expected shape.
- [ ] `npm run dev` renders the tenant identically to before (visual sanity check).
- [ ] Grep the resulting JSON Schema for at least one `"description"` string — proves `.describe()` flows end-to-end.

**Dependencies:** Slice 2.

**Files likely touched:**
- `apps/tenant-alpha/src/components/<section>/schema.ts`
- `apps/tenant-alpha/src/lib/schemas.ts` (or wherever the schema registry lives)
- `apps/tenant-alpha/src/App.tsx` (only if `JsonPagesConfig` is composed there and needs a one-line addition)

**Estimated scope:** S–M (2–3 files).

**Commit message convention:** `feat(tenant-alpha): adopt submissionSchemas convention for <section> (ADR-0002)`

### Checkpoint after Slice 3

- [ ] Reference tenant builds.
- [ ] Generated JSON sidecar contains `sectionSubmissionSchemas` and the JSON Schema shape matches expectations.
- [ ] Visual output of the tenant is unchanged.

**STOP for user review** — this is the second natural review point. From here onward, remaining work (DNA regeneration, docs) is mechanical and does not reshape the feature.

---

### Slice 4: DNA regeneration + CLI template check

**Description.** The reference tenant is the source of truth for the CLI template. Any schema additions must be projected into the DNA so newly scaffolded tenants inherit the convention.

**Acceptance criteria:**
- [ ] `npm run dist:dna:all` from repo root completes without errors.
- [ ] The regenerated CLI template (under `packages/cli/` — path to confirm during Slice 1 preflight; the plan does not hardcode it) contains the new `<Section>SubmissionSchema` and the `SECTION_SUBMISSION_SCHEMAS` registry.
- [ ] `npm run check:templates` passes.

**Verification:**
- [ ] CLI template regenerated and committed as part of this slice.
- [ ] `check:templates` exit code is 0.
- [ ] Optional spot-check: `npx @olonjs/cli new tenant /tmp/test --template alpha` locally, then build `/tmp/test`, and confirm `sectionSubmissionSchemas` appears in its page output. (Only if CLI test scaffolding is cheap; otherwise skip.)

**Dependencies:** Slice 3.

**Files likely touched:**
- Generated files under the CLI's template source. No manual edits; the whole point is that the script does the projection.

**Estimated scope:** XS (zero manual file edits; run two scripts, commit the diff).

**Commit message convention:** `chore(cli): regenerate DNA template for submissionSchemas (ADR-0002)`

---

### Slice 5: Tenant convention documentation (`packages/core/README.md`)

**Description.** Document the convention where tenant developers (and future agents) will look first. The ADR explains *why*; the README explains *how* with a full worked example. Cross-link both directions.

**Acceptance criteria:**
- [ ] `packages/core/README.md` gains a section "Submission schemas for agent-fillable sections" (or similar) that includes:
  - The 4-rule tenant convention from ADR-0002, verbatim or with minor rephrasing for reading flow.
  - A complete before/after example for a section capsule (both the `schema.ts` change and the `JsonPagesConfig` wiring).
  - The ISO-date rule with an example.
  - The explicit non-goals: no helper, no runtime validation inside core.
  - A "For agents" subsection pointing to `sectionSubmissionSchemas` on the page contract as the discovery surface.
- [ ] The section links to ADR-0002 ("Rationale and alternatives considered: see ADR-0002").
- [ ] ADR-0002's `References` section is updated (if needed) to point to the new README section.
- [ ] Root README's Documentation Index gains a link to `docs/decisions/` (low-effort, high-value for discoverability).

**Verification:**
- [ ] Manual read-through: the README example compiles mentally. A tenant dev can follow it without needing to read the ADR.
- [ ] All internal links resolve (`[text](./path)`).
- [ ] No lint errors on the changed Markdown files.

**Dependencies:** Slice 3 (so the README example mirrors a real, working tenant).

**Files likely touched:**
- `packages/core/README.md`
- `docs/decisions/ADR-0002-form-submission-schemas.md` (reference touch-up only, if needed)
- `README.md` (root, one-line addition to Documentation Index)

**Estimated scope:** S (prose-only; 1–3 files).

**Commit message convention:** `docs(core): document submissionSchemas tenant convention (ADR-0002)`

### Final checkpoint (all slices complete)

- [ ] Every slice was committed individually (5 commits minimum, 1 per slice; more if sub-commits made sense during implementation).
- [ ] `npm test` green across the workspace.
- [ ] `npm run build:all` (or the closest equivalent) green.
- [ ] `npm run check:templates` green.
- [ ] `apps/tenant-alpha` produces a page contract with `sectionSubmissionSchemas`, verified by inspection.
- [ ] ADR-0002, README, and the plan itself form a consistent documentation set.
- [ ] No unrelated changes slipped into any commit.
- [ ] Ready for a follow-up intervention on `jsonpages-platform` to implement the MCP `submit-form` tool.

---

## Risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Zod version skew between `@olonjs/core` and tenant apps produces `z.ZodTypeAny` incompatibility at the `Record<string, z.ZodTypeAny>` boundary. | High — would block Slice 3. | Confirm Zod version parity (`packages/core/package.json` vs `apps/tenant-alpha/package.json` vs `packages/stack`) at the very start of Slice 1. If they diverge, align before touching types. |
| `zodToJsonSchema` produces `$ref`-heavy output that is hard for an agent to consume. | Medium — ugly contract, not broken. | Slice 2 tests inspect the serialized output. If `$ref` explosion is bad, configure the serializer with `target: 'openApi3'` or an inline-refs option. Decision deferred to test evidence, not speculation. |
| `buildPageContract` has callers beyond the two currently known (`buildPageManifest`, `buildSiteManifest`). Missing a caller would silently drop the new emission on some code path. | Medium. | Explicit grep for `buildPageContract(` under `packages/core/src` at the start of Slice 2 — list all callers, update each, add coverage for any call site that produces a contract consumed elsewhere. |
| `apps/tenant-alpha` may not have a form-shaped section suitable as the carrier for Slice 3. | Low — descoping path already defined. | Slice 3 preflight step 1 handles this explicitly. If no section fits, Slice 3 becomes "wire `submissionSchemas: {}` through config to prove the plumbing" and the real example lives only in the README. |
| DNA regeneration has unrelated drift (DNA out of sync from a previous change). | Low — noise during Slice 4. | Run `npm run dist:dna:all` as the FIRST thing in Slice 4 on a clean tree. If the diff contains unrelated changes, stop and escalate rather than bundling them. |
| The added field in `OlonJsPageContract` breaks a downstream consumer that does exhaustive destructuring. | Very low — field is optional; downstream code uses `Record`-keyed access per existing patterns. | None beyond tests. If it breaks `apps/olonjs.io` (pinned version, not workspace-linked), that is a non-event until they bump. |

## Rollback plan

Every slice is rollback-friendly because every change is additive:

- Slice 1: revert is a type removal. No runtime consumers.
- Slice 2: revert is a function-signature narrowing. Tests added in this slice roll back with it.
- Slice 3: revert is a tenant-side deletion. Core remains fine.
- Slice 4: DNA regeneration is idempotent. Re-running after a revert produces the pre-state.
- Slice 5: pure prose revert.

Rollback unit is the git commit. This is why Slice 1 must not be squashed into Slice 2.

## Open questions

None at this stage. The two open questions from ADR-0002 were resolved in its Decision log (2026-04-21). If new questions surface during implementation, they are to be raised immediately and either resolved in the ADR (for decisions of substance) or in this plan (for tactical discoveries).

## For the implementing agent

When you start, follow `incremental-implementation` discipline:

1. Work one slice at a time. Commit at the end of each slice.
2. Do not expand scope. If you notice something fixable outside the current slice, write it in a `NOTICED:` note at the bottom of this plan and keep going.
3. Stop at each checkpoint and surface the diff for review. Do not chain slices without a beat.
4. After every file change, re-run the relevant test command. Do not accumulate changes before testing.
5. If a verification step fails, STOP. Debug and either fix or surface blocker — do not "come back to it later".

---

## Noticed during implementation (fill in as needed)

### 2026-04-21, during Slice 1

**N-1 — Type signature of `submissionSchemas` aligned to existing duck typing.**
`JsonPagesConfig.schemas` is duck-typed (`{ parse, shape? }`), not `z.ZodTypeAny` as ADR-0002 literally said. Aligned the new field to the same shape for architectural consistency; casting to `z.ZodTypeAny` happens at the serializer boundary (Slice 2) exactly like `schemas` already does. Refinement recorded in ADR-0002 Decision log (2026-04-21 entry).
**Action taken:** implemented duck-typed signature; updated ADR. No change to the tenant-facing convention.
