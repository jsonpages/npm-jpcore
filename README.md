# JSONPages Monorepo

## Install

From the repo root (use WSL or a Unix shell when on Windows):

```bash
npm install
```

This installs dependencies for all workspaces and links `@jsonpages/core` to the app.

---

## Scripts

| Script | Description |
|--------|-------------|
| `npm run dev` | Start the tenant app dev server (Vite). |
| `npm run build` | Build the tenant app. |
| `npm run build:all` | Run `build` in every workspace that defines it (core type-checks, app builds). |
| `npm run release` | Full release: build, version patch, publish stack → core → CLI; update tenant-alpha. Requires `NPM_TOKEN` (see [docs/RELEASE_NPM.md](docs/RELEASE_NPM.md)). |

---

## Quick start

```bash
npm install
```

```bash
npm run build:all
```

```bash
npm run dev
```

---

## Development

Start the reference app (tenant-alpha):

```bash
npm run dev
```

---

## Build

Build only the tenant app:

```bash
npm run build
```

Build all workspaces (core + app):

```bash
npm run build:all
```

---

## Release (publish to npm)

One-time: add your npm token to a root `.env` (file is gitignored):

```bash
echo 'NPM_TOKEN=npm_your_token_here' > .env
```

Run the full release from root (stack → core → tenant-alpha build/dist → CLI):

```bash
npm run release
```

Dry-run (no publish, only build + version bump):

```bash
npm run release -- --dry-run
```

See [docs/RELEASE_NPM.md](docs/RELEASE_NPM.md) for the full procedure and options.

---

## CLI — new tenant

Create a new tenant project (requires `@jsonpages/cli` installed globally or via npx):

```bash
npx @jsonpages/cli new tenant my-tenant
```

```bash
cd my-tenant
```

```bash
npm install
```

```bash
npm run dev
```

The generated project includes the dev server API (save to file, upload assets). See [packages/cli](packages/cli) for more.

---

## Shipping & testing

- **Core** (`packages/core`) is the sovereign engine; it is tested in **tenant-alpha** (`apps/tenant-alpha`) via the monorepo workspace link and, for release-like validation, via **jalc** (or yalc).
- **Both are shipped:** `@jsonpages/core` is published to npm; tenant-alpha is the reference app (golden master) and is built and deployed as a first-class deliverable.
- In-repo, `tenant-alpha` depends on core via workspace so it always uses the local package; publish core first, then build or deploy the app.
