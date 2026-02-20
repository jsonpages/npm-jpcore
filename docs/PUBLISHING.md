# Pubblicazione pacchetti JsonPages

Istruzioni per pubblicare **@jsonpages/stack**, **@jsonpages/core** e **@jsonpages/cli** su npm.

---

## Prerequisiti

1. **Account npm** con accesso in scrittura all’organizzazione `@jsonpages`.
2. **Login:** dalla root del monorepo o da qualsiasi package:
   ```bash
   npm login
   ```
   (Oppure uso di token da [npmjs.com → Access Tokens](https://www.npmjs.com/).)
3. **Registry:** deve essere quello pubblico:
   ```bash
   npm config get registry
   # https://registry.npmjs.org/
   ```
4. Se è la **prima pubblicazione** di un pacchetto scoped, usare `--access public` dove indicato.

---

## Ordine di pubblicazione

Pubblicare **sempre** in questo ordine:

1. **@jsonpages/stack**
2. **@jsonpages/core**
3. **@jsonpages/cli**

Core e CLI dipendono dalla manifest dello stack; il template del tenant (in CLI) deve usare la versione di Core appena pubblicata.

---

## 1. Pubblicare @jsonpages/stack

Dalla **root del monorepo** (`~/npm-jpcore`):

```bash
npm publish -w @jsonpages/stack --access public
```

Oppure, se il workspace è indicato per path:

```bash
npm publish -w packages/stack --access public
```

Non è necessario un build: il pacchetto contiene solo `index.js` e `stack-versions.json`.

---

## 2. Pubblicare @jsonpages/core

Dalla **root del monorepo**:

```bash
# Build (genera dist/). Il prepack sincronizza i peerDependencies da stack.
npm run build -w @jsonpages/core

# Pubblica
npm publish -w @jsonpages/core --access public
```

Oppure:

```bash
npm run build -w packages/core
npm publish -w packages/core --access public
```

**Nota:** allo script `prepack` del Core viene eseguito prima del publish e allinea i `peerDependencies` a `@jsonpages/stack`. Pubblicare prima lo stack.

---

## 3. Aggiornare tenant-alpha e preparare il CLI

Prima di pubblicare il CLI, il template di tenant (tenant-alpha) deve usare la **nuova versione** di Core e il contenuto di `apps/tenant-alpha` deve essere riversato nel pacchetto CLI.

### 3.1 Aggiornare la dipendenza Core in tenant-alpha

In **`apps/tenant-alpha/package.json`** imposta la versione di `@jsonpages/core` uguale a quella appena pubblicata (es. `1.0.12`):

```json
"dependencies": {
  "@jsonpages/core": "^1.0.12",
  ...
}
```

Sostituisci `1.0.12` con la versione effettiva di Core che hai pubblicato.

### 3.2 Eseguire `npm run dist` da tenant-alpha

Da **dentro** la cartella `apps/tenant-alpha`:

```bash
cd apps/tenant-alpha
npm run dist
cd ../..
```

Lo script **`dist`**:

- esegue `src2Code.sh` e copia `src/` e `index.html` nel pacchetto CLI (template per i nuovi tenant);
- normalizza i fine riga in `packages/cli/src/index.js` (`sed` per CRLF);
- esegue `npm link --force` per il CLI (utile per test locali).

Dopo questo passaggio il pacchetto CLI contiene il template aggiornato e riferito alla nuova versione di Core.

---

## 4. Pubblicare @jsonpages/cli

Dalla **root del monorepo**:

```bash
npm publish -w @jsonpages/cli --access public
```

Oppure:

```bash
npm publish -w packages/cli --access public
```

I nuovi tenant creati con `jsonpages new tenant <nome>` useranno il template aggiornato e installeranno la versione di Core indicata nel template (quella impostata al passo 3.1).

---

## Riepilogo comandi (dalla root)

```bash
# 1. Stack
npm publish -w @jsonpages/stack --access public

# 2. Core
npm run build -w @jsonpages/core
npm publish -w @jsonpages/core --access public

# 3. Aggiorna tenant-alpha e prepara CLI
#    - Modifica a mano apps/tenant-alpha/package.json: @jsonpages/core alla nuova versione
#    - Poi:
cd apps/tenant-alpha && npm run dist && cd ../..

# 4. CLI
npm publish -w @jsonpages/cli --access public
```

---

## Errori comuni

| Messaggio | Causa | Soluzione |
|-----------|--------|-----------|
| `Access token expired or revoked` | Sessione npm non valida | `npm login` (o nuovo token). |
| `404 Not Found - PUT ... @jsonpages/...` | Token scaduto o nessun permesso sull’org | Rifare login; verificare di essere member dell’org `@jsonpages` con permesso di publish. |
| `node\r: No such file or directory` (CLI) | CRLF in `packages/cli/src/index.js` | Lo script `dist` esegue già `sed -i 's/\r$//' ...`; rieseguire `npm run dist` da `apps/tenant-alpha`. |

---

## Bump versioni

Prima di ogni publish, aggiornare la versione nel rispettivo `package.json`:

- **packages/stack/package.json** → `version` (es. `1.0.1` → `1.0.2`)
- **packages/core/package.json** → `version` (es. `1.0.11` → `1.0.12`)
- **packages/cli/package.json** → `version` (es. `3.0.28` → `3.0.29`)

E in **apps/tenant-alpha/package.json** usare la stessa versione di Core che si sta per pubblicare (come descritto al passo 3.1).
