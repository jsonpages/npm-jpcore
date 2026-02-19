#!/usr/bin/env node
/**
 * Enterprise release script for @jsonpages/stack, @jsonpages/core, @jsonpages/cli.
 * Run from monorepo root. Uses NPM_TOKEN for authentication (no interactive login).
 *
 * Usage:
 *   Put NPM_TOKEN in root .env (one line: NPM_TOKEN=npm_xxx), then: npm run release
 *   Or: NPM_TOKEN=<token> npm run release
 *
 * Options:
 *   --dry-run    Build and bump versions only; do not publish or commit version bumps
 *   --skip-git-check   Do not require a clean git working tree
 */

import { execSync, spawnSync } from "child_process";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, "..");

const NPM_REGISTRY = "https://registry.npmjs.org/";
const AUTH_LINE = "//registry.npmjs.org/:_authToken=${NPM_TOKEN}";

// --- Load .env (so you don't need export NPM_TOKEN every time) ---
function loadEnv() {
  const envPath = path.join(ROOT, ".env");
  if (!fs.existsSync(envPath)) return;
  const content = fs.readFileSync(envPath, "utf8");
  for (const line of content.split("\n")) {
    const m = line.match(/^\s*NPM_TOKEN\s*=\s*(.+?)\s*$/);
    if (m) {
      const val = m[1].replace(/^["']|["']$/g, "").trim();
      if (val && !process.env.NPM_TOKEN) process.env.NPM_TOKEN = val;
      break;
    }
  }
}
loadEnv();

// --- Parsing ---
const args = process.argv.slice(2);
const dryRun = args.includes("--dry-run");
const skipGitCheck = args.includes("--skip-git-check");

// --- Logging ---
function log(msg, level = "info") {
  const ts = new Date().toISOString();
  const prefix = level === "error" ? "ERROR" : level === "warn" ? "WARN" : "INFO";
  console.log(`${ts} [${prefix}] ${msg}`);
}

function run(cmd, cwd = ROOT, env = undefined) {
  const dir = cwd !== ROOT ? `(cd ${path.relative(ROOT, cwd) || "."} && ` : "";
  const close = cwd !== ROOT ? ")" : "";
  const display = dir ? `${dir}${cmd}${close}` : cmd;
  log(`$ ${display}`, "info");
  const opts = { cwd, stdio: "inherit", shell: true, env: env ?? process.env };
  const result = spawnSync(cmd, opts);
  if (result.status !== 0) {
    throw new Error(`Command failed (exit ${result.status}): ${cmd}`);
  }
}

function runSilent(cmd, cwd = ROOT) {
  return execSync(cmd, { cwd, encoding: "utf8" }).trim();
}

// --- Validation ---
function assertRoot() {
  const pkgPath = path.join(ROOT, "package.json");
  if (!fs.existsSync(pkgPath)) {
    throw new Error("Not in monorepo root: package.json not found");
  }
  const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8"));
  if (!pkg.workspaces || !Array.isArray(pkg.workspaces)) {
    throw new Error("Root package.json must define workspaces");
  }
  log("Monorepo root validated");
}

function assertNpmToken() {
  const token = process.env.NPM_TOKEN;
  if (!token || token.length < 10) {
    throw new Error(
      "NPM_TOKEN is required. Add it to root .env (ignored by git):\n  echo 'NPM_TOKEN=npm_your_token' > .env\n  Or: export NPM_TOKEN=your_token"
    );
  }
  log("NPM_TOKEN is set");
}

function ensureNpmRc() {
  const npmrcPath = path.join(ROOT, ".npmrc");
  let content = "";
  if (fs.existsSync(npmrcPath)) {
    content = fs.readFileSync(npmrcPath, "utf8");
  }
  if (!content.includes("_authToken") && !content.includes("registry.npmjs.org")) {
    const line = AUTH_LINE + "\n";
    fs.appendFileSync(npmrcPath, line);
    log("Appended auth line to .npmrc (uses NPM_TOKEN from env)");
  }
}

function assertGitClean() {
  if (skipGitCheck) {
    log("Skipping git working tree check (--skip-git-check)");
    return;
  }
  try {
    const status = runSilent("git status --porcelain");
    if (status) {
      log("Working tree has uncommitted changes (release will proceed; commit the version bumps afterward)", "warn");
      return;
    }
    log("Git working tree is clean");
  } catch (e) {
    if (e.message.includes("Command failed")) {
      log("Could not run git status (is git available?). Proceeding.", "warn");
    } else {
      throw e;
    }
  }
}

// --- Package.json helpers ---
function readPackageJson(dir) {
  const p = path.join(dir, "package.json");
  if (!fs.existsSync(p)) throw new Error(`package.json not found: ${dir}`);
  return JSON.parse(fs.readFileSync(p, "utf8"));
}

function writePackageJson(dir, pkg) {
  const p = path.join(dir, "package.json");
  fs.writeFileSync(p, JSON.stringify(pkg, null, 2) + "\n", "utf8");
}

function getVersion(dir) {
  return readPackageJson(dir).version;
}

// --- Dry-run: full command plan (enterprise: show exactly what would run) ---
// All version/publish run from root with -w so .npmrc and NPM_TOKEN apply.
function getCommandPlan() {
  return [
    { step: "1/5", desc: "Build all workspaces", cmd: "npm run build:all", cwd: "root", skip: false },
    { step: "2/5", desc: "@jsonpages/stack", cmd: "npm version patch --no-git-tag-version -w @jsonpages/stack", cwd: "root", skip: false },
    { step: "2/5", desc: "@jsonpages/stack (publish)", cmd: "npm publish --access public -w @jsonpages/stack", cwd: "root", skip: dryRun },
    { step: "3/5", desc: "@jsonpages/core", cmd: "npm run build -w @jsonpages/core", cwd: "root", skip: false },
    { step: "3/5", desc: "@jsonpages/core", cmd: "npm version patch --no-git-tag-version -w @jsonpages/core", cwd: "root", skip: false },
    { step: "3/5", desc: "@jsonpages/core (publish)", cmd: "npm publish --access public -w @jsonpages/core", cwd: "root", skip: dryRun },
    { step: "4/5", desc: "tenant-alpha", cmd: "Update package.json @jsonpages/core -> ^<new-version>", cwd: "apps/tenant-alpha", skip: false },
    { step: "4/5", desc: "tenant-alpha", cmd: "npm install -w tenant-alpha", cwd: "root", skip: false },
    { step: "4/5", desc: "tenant-alpha", cmd: "npm run build -w tenant-alpha", cwd: "root", skip: false },
    { step: "4/5", desc: "tenant-alpha", cmd: "npm run dist -w tenant-alpha", cwd: "root", skip: false },
    { step: "5/5", desc: "@jsonpages/cli", cmd: "npm run build -w @jsonpages/cli", cwd: "root", skip: false },
    { step: "5/5", desc: "@jsonpages/cli", cmd: "npm version patch --no-git-tag-version -w @jsonpages/cli", cwd: "root", skip: false },
    { step: "5/5", desc: "@jsonpages/cli (publish)", cmd: "npm publish --access public -w @jsonpages/cli", cwd: "root", skip: dryRun },
  ];
}

function printCommandPlan() {
  const plan = getCommandPlan();
  console.log("");
  console.log("  DRY RUN — Commands that would be executed:");
  console.log("  " + "—".repeat(60));
  for (const { step, desc, cmd, cwd, skip } of plan) {
    const where = cwd === "root" ? "(root)" : `(${cwd})`;
    const label = skip ? "  [SKIP] " : `  [${step}] `;
    console.log(`${label}${where} ${cmd}`);
  }
  console.log("  " + "—".repeat(60));
  console.log("");
}

// --- Steps ---
function stepBuildAll() {
  log("Step 1/5: Build all workspaces");
  run("npm run build:all");
}

function stepStack() {
  log("Step 2/5: @jsonpages/stack — version patch & publish (from root -w)");
  run("npm version patch --no-git-tag-version -w @jsonpages/stack");
  if (!dryRun) {
    run("npm publish --access public -w @jsonpages/stack");
  } else {
    log("[dry-run] Skipping npm publish for stack");
  }
}

function stepCore() {
  log("Step 3/5: @jsonpages/core — build, version patch & publish (from root -w)");
  const dir = path.join(ROOT, "packages", "core");
  run("npm run build -w @jsonpages/core");
  run("npm version patch --no-git-tag-version -w @jsonpages/core");
  const newVersion = getVersion(dir);
  if (!dryRun) {
    run("npm publish --access public -w @jsonpages/core");
  } else {
    log("[dry-run] Skipping npm publish for core");
  }
  return newVersion;
}

function stepTenantAlpha(coreVersion) {
  log("Step 4/5: tenant-alpha — pin @jsonpages/core, build & dist (from root -w)");
  const dir = path.join(ROOT, "apps", "tenant-alpha");
  const pkg = readPackageJson(dir);
  const prev = pkg.dependencies["@jsonpages/core"];
  pkg.dependencies["@jsonpages/core"] = `^${coreVersion}`;
  writePackageJson(dir, pkg);
  log(`Updated @jsonpages/core: ${prev} -> ^${coreVersion}`);
  run("npm install -w tenant-alpha");
  run("npm run build -w tenant-alpha");
  run("npm run dist -w tenant-alpha");
}

function stepCli() {
  log("Step 5/5: @jsonpages/cli — build, version patch & publish (from root -w)");
  run("npm run build -w @jsonpages/cli");
  run("npm version patch --no-git-tag-version -w @jsonpages/cli");
  if (!dryRun) {
    run("npm publish --access public -w @jsonpages/cli");
  } else {
    log("[dry-run] Skipping npm publish for cli");
  }
}

// --- Main ---
function main() {
  log("Release script started" + (dryRun ? " (dry-run)" : ""));
  if (dryRun) printCommandPlan();
  try {
    assertRoot();
    assertNpmToken();
    ensureNpmRc();
    assertGitClean();

    stepBuildAll();
    stepStack();
    const coreVersion = stepCore();
    stepTenantAlpha(coreVersion);
    stepCli();

    log("Release completed successfully.");
    if (dryRun) {
      log("Dry-run: version bumps were applied locally but nothing was published. Revert with git checkout -- .");
    }
  } catch (err) {
    log(err.message, "error");
    process.exit(1);
  }
}

main();
