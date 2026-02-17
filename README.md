# JSONPages Monorepo

## Install

From the repo root (use WSL or a Unix shell when on Windows):

```bash
npm install
```

This installs dependencies for all workspaces and links `@jsonpages/core` to the app.

## Scripts

| Script       | Description |
|-------------|-------------|
| `npm run dev`       | Start the tenant app dev server (Vite). |
| `npm run build`     | Build the tenant app. |
| `npm run build:all` | Run `build` in every workspace that defines it (core type-checks, app builds). |

## Quick start

```bash
npm install
npm run build:all   # type-check core + build app
npm run dev         # run app
```

## Shipping & testing

- **Core** (`packages/core`) is the sovereign engine; it is tested in **tenant-alpha** (`apps/tenant-alpha`) via the monorepo workspace link and, for release-like validation, via **jalc** (or yalc).
- **Both are shipped:** `@jsonpages/core` is published to npm; tenant-alpha is the reference app (golden master) and is built and deployed as a first-class deliverable.
- In-repo, `tenant-alpha` depends on core with `workspace:*` so it always uses the local package; publish core first, then build or deploy the app.
