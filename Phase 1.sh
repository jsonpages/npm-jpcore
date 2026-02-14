#!/bin/bash
set -e

echo "🧬 Phase 1: Monorepo Scaffolding & Deterministic Relocation"

# 1. Create directory structure
mkdir -p packages/core/src/lib
mkdir -p apps/tenant-alpha/src/lib

# 2. Relocate "The Brain" (Core/Admin)
echo "🧠 Moving Core logic to packages/core..."
mv src/admin packages/core/src/
mv src/lib/kernel.ts packages/core/src/lib/
mv src/lib/JsonPagesEngine.tsx packages/core/src/lib/
mv src/lib/PageRenderer.tsx packages/core/src/lib/
mv src/lib/SectionRenderer.tsx packages/core/src/lib/
mv src/lib/StudioContext.tsx packages/core/src/lib/
mv src/lib/ConfigContext.tsx packages/core/src/lib/
mv src/lib/ThemeLoader.tsx packages/core/src/lib/
mv src/lib/DefaultNotFound.tsx packages/core/src/lib/
mv src/lib/events.ts packages/core/src/lib/
mv src/lib/persistence.ts packages/core/src/lib/
mv src/lib/types-engine.ts packages/core/src/lib/

# 3. Relocate "The Body" (Tenant Implementation)
echo "body Moving Tenant logic to apps/tenant-alpha..."
mv src/components apps/tenant-alpha/src/
mv src/data apps/tenant-alpha/src/
mv src/hooks apps/tenant-alpha/src/
mv src/utils apps/tenant-alpha/src/
mv src/lib/schemas.ts apps/tenant-alpha/src/lib/
mv src/lib/ComponentRegistry.tsx apps/tenant-alpha/src/lib/
mv src/lib/IconResolver.tsx apps/tenant-alpha/src/lib/
mv src/App.tsx apps/tenant-alpha/src/
mv src/main.tsx apps/tenant-alpha/src/
mv src/index.css apps/tenant-alpha/src/
mv src/vite-env.d.ts apps/tenant-alpha/src/
mv src/types.ts apps/tenant-alpha/src/

# 4. Move Config & Tooling to Tenant (The App Shell)
mv index.html apps/tenant-alpha/
mv vite.config.ts apps/tenant-alpha/
mv tsconfig.json apps/tenant-alpha/
mv tsconfig.node.json apps/tenant-alpha/
mv components.json apps/tenant-alpha/

# 5. Cleanup empty original lib
rmdir src/lib || true
rmdir src || true

# 6. Create Root package.json
echo "📦 Creating Root package.json..."
cat << 'EOF' > "package.json"
{
  "name": "jsonpages-monorepo",
  "private": true,
  "workspaces": [
    "packages/*",
    "apps/*"
  ],
  "scripts": {
    "dev": "npm run dev -w apps/tenant-alpha",
    "build": "npm run build -w apps/tenant-alpha"
  }
}
EOF

# 7. Create Core package.json
echo "📦 Creating Core package.json..."
cat << 'EOF' > "packages/core/package.json"
{
  "name": "@jsonpages/core",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "main": "./src/lib/kernel.ts",
  "dependencies": {
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "react-router-dom": "^6.29.0",
    "zod": "^3.24.1",
    "lucide-react": "^0.474.0",
    "radix-ui": "^1.4.3",
    "file-saver": "^2.0.5",
    "jszip": "^3.10.1",
    "tailwind-merge": "^3.0.1",
    "clsx": "^2.1.1"
  }
}
EOF

# 8. Create Tenant package.json
echo "📦 Creating Tenant package.json..."
cat << 'EOF' > "apps/tenant-alpha/package.json"
{
  "name": "tenant-alpha",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "@jsonpages/core": "workspace:*",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "zod": "^3.24.1",
    "lucide-react": "^0.474.0",
    "tailwind-merge": "^3.0.1",
    "clsx": "^2.1.1"
  },
  "devDependencies": {
    "@tailwindcss/vite": "^4.0.0",
    "@types/react": "^19.0.8",
    "@types/react-dom": "^19.0.3",
    "typescript": "^5.7.3",
    "vite": "^6.0.11"
  }
}
EOF

echo "✅ Phase 1 Complete. Files relocated and workspaces established."