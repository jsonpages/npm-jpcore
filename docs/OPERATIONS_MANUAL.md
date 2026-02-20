# 📘 JsonPages: Internal Operations Manual (V2.8.5)

**Status:** Confidential (Tech-Founder Only)  
**Objective:** Management, Development, and Distribution of the JsonPages Ecosystem.

---

## 1. Monorepo Architecture
The project is divided into three distinct areas of responsibility:
*   `packages/core`: The engine (**Sovereign Shell**). Headless, agnostic, and distributable via NPM. **Shipped** as `@jsonpages/core`.
*   `packages/cli`: The scaffolding tool. Used to project new Tenants.
*   `apps/tenant-alpha`: The **Golden Master**. The reference site used to test and validate new features. **Shipped** as the reference app (enterprise deliverable). Core is tested here via the monorepo workspace and, for release-like validation, via **jalc** (or yalc).

---

## 2. Quick Commands (Root)
Always run these from the main monorepo directory.

| Command | Action |
| :--- | :--- |
| `npm install` | Installs dependencies for the entire monorepo and creates internal workspace links. |
| `npm run dev` | Launches **Tenant-Alpha** in development mode. |
| `npm run build:all` | Runs type-checking for the Core and builds the Tenant. |

---

## 3. Core Development Cycle
When you modify code inside `packages/core`, you must "notify" the rest of the ecosystem.

### A. Internal Development (Monorepo)
Thanks to NPM Workspaces, changes to the Core are usually seen in real-time by `tenant-alpha`. If they aren't:
```bash
npm install # Forces a refresh of the symbolic links
```

### B. SDK Distribution (Jalc / Yalc Loop)
To test the Core in a project **outside** the monorepo (or for release-like validation), use the jalc/yalc protocol:

```bash
# 1. Enter the core package
cd packages/core

# 2. Build the engine (generates the /dist folder)
npm run build

# 3. Publish to the local store and push updates to linked consumers
yalc publish --push
```

---

## 4. CLI Management (Scaffolding)
The CLI is your right hand for creating new sites in 60 seconds.

### Updating the CLI
If you modify the injection logic in `packages/cli/src/index.js`:
```bash
cd packages/cli
# Remove Windows line endings (if working on Linux/WSL)
sed -i 's/\r$//' src/index.js
# Update the global system link
npm link --force
```

### Creating a New Tenant
Exit the monorepo and run:
```bash
jsonpages new tenant "project-name"
```

---

## 5. Maintenance Protocols (The Laws)

### 🔴 Rule 1: Never touch the Kernel for a single Tenant
If a client requests a specific feature, **do not** add it to `packages/core`. 
*   Add the schema to `tenant/src/lib/schemas.ts`.
*   Add the component to `tenant/src/components/`.
*   The Core must remain "pure" and agnostic.

### 🔴 Rule 2: Peer Dependencies
If you add a library to the Core (e.g., a new animation utility), ensure it is listed in `peerDependencies` in the Core's `package.json` and in `dependencies` in the Tenant. This prevents version conflicts.

### 🔴 Rule 3: Deterministic IDs
Every time you create a new Zod schema for an array, ensure it extends `BaseArrayItem`. This guarantees that the `FormFactory` generates the IDs required for Admin stability.

---

## 6. Troubleshooting (What to do if...)

**"Vite cannot find @jsonpages/core/style.css"**
*   **Cause:** The Core no longer exports a physical CSS file (it injects it inline).
*   **Fix:** Remove the CSS import line in the Tenant's `App.tsx`.

**"I modified the Core but the standalone Tenant isn't updating"**
*   **Fix:** Go back to the Core and run `yalc publish --push`. Then, in the Tenant, run `yalc update`.

**"Error node\r: No such file or directory"**
*   **Cause:** Windows file format (CRLF) on a Linux/Unix system.
*   **Fix:** Run `sed -i 's/\r$//' packages/cli/src/index.js`.

---

