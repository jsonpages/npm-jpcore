# Release su npm — sequenza

Eseguire **dalla root** del monorepo (`~/npm-jpcore`).

## Automazione (consigliata)

Uno script unico gestisce build, version bump e publish per **@jsonpages/stack**, **@jsonpages/core** e **@jsonpages/cli**, usando il token npm per l’autenticazione (nessun login interattivo).

### Prerequisiti

- **NPM_TOKEN**: token di accesso npm (Automation o Auth-only, es. 90 giorni). Creabile da [npm → Access Tokens](https://www.npmjs.com/settings/~youruser/tokens).

### Esecuzione

**Opzione consigliata (una volta sola):** crea un file `.env` nella root del repo con il token. Il file è già in `.gitignore`, non viene committato.

```bash
echo 'NPM_TOKEN=npm_il_tuo_token_qui' > .env
```

Da quel momento basta:

```bash
npm run release
```

**Alternativa:** passare il token a ogni esecuzione:

```bash
export NPM_TOKEN=your_npm_token
npm run release
```

### Opzioni

| Opzione | Descrizione |
|--------|-------------|
| `--dry-run` | Esegue build e `npm version patch` in tutti i package; **non** pubblica su npm e **non** fa commit. Utile per verificare che tutto giri. |
| `--skip-git-check` | Salta il controllo “working tree pulito”. Da usare solo se si è consapevoli di rilasciare con modifiche non committate. |

Esempi:

```bash
NPM_TOKEN=xxx npm run release -- --dry-run
NPM_TOKEN=xxx npm run release -- --skip-git-check
```

### Cosa fa lo script (ordine)

1. **Validazione**: root monorepo, `NPM_TOKEN` impostato, working tree pulito (a meno di `--skip-git-check`).
2. **Build**: `npm run build:all`.
3. **Stack**: `npm version patch` (solo in `package.json`), `npm publish --access public`.
4. **Core**: `npm run build`, `npm version patch`, `npm publish --access public`.
5. **tenant-alpha**: aggiorna la dipendenza `@jsonpages/core` alla versione appena pubblicata, `npm install`, `npm run build`, `npm run dist`.
6. **CLI**: `npm run build`, `npm version patch`, `npm publish --access public`.

I `version patch` sono eseguiti con `--no-git-tag-version`: nessun commit/tag automatico; puoi revisionare i file e fare un unico commit a mano.

---

## Procedura manuale (senza script)

Se preferisci eseguire i passi a mano:

### 1. Build di tutto

```bash
npm run build:all
```

### 2. Stack

```bash
cd packages/stack
npm version patch
npm publish --access public
cd ../..
```

### 3. Core

```bash
cd packages/core
npm run build
npm version patch
npm publish --access public
cd ../..
```

### 4. Tenant-alpha (aggiorna core e dist)

Aggiorna in `apps/tenant-alpha/package.json` la dipendenza `@jsonpages/core` alla versione appena pubblicata, poi:

```bash
cd apps/tenant-alpha
npm install
npm run build
npm run dist
cd ../..
```

### 5. CLI

```bash
cd packages/cli
npm run build
npm version patch
npm publish --access public
```

---

**Ordine:** stack → core → tenant-alpha (build + dist) → cli.
