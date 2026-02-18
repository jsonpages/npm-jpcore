# @jsonpages/stack

**Single source of truth** for JsonPages tenant dependency versions (enterprise stack manifest).

## Purpose

- **Core** syncs its `peerDependencies` from this manifest (via `prepack` script).
- **CLI** uses this manifest when projecting a new tenant so `npm install` gets the exact versions defined here.
- No version drift: one file to change when upgrading React, Vite, React Router, etc.

## Workflow

1. **Upgrade stack:** Edit `stack-versions.json` (dependencies, devDependencies, peerDependencies). Keep `peerDependencies` in sync with what Core supports.
2. **Publish order:** Publish `@jsonpages/stack` first, then `@jsonpages/core`, then `@jsonpages/cli`.
3. **From repo:** Run `npm install` at monorepo root so workspace deps resolve; then build/publish Core and CLI as needed.

## Consumers

| Package        | Use |
|----------------|-----|
| @jsonpages/core | `prepack` runs `scripts/sync-peers-from-stack.js` → copies `peerDependencies` into Core’s package.json. |
| @jsonpages/cli  | On `jsonpages new tenant <name>`, installs deps with `name@version` from `dependencies` and `devDependencies`. |

## File layout

- `stack-versions.json` — canonical versions (peerDependencies, dependencies, devDependencies).
- `index.js` — ESM export for Node (used by Core sync script and CLI).
