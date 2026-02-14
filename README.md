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
