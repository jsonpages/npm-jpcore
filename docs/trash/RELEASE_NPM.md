# Procedura di release su npm

Questa guida descrive come pubblicare i tre package npm del monorepo (**@jsonpages/stack**, **@jsonpages/core**, **@jsonpages/cli**) e aggiornare l’app **tenant-alpha** che dipende da core.

Tutti i comandi vanno eseguiti **dalla root** del monorepo (`~/npm-jpcore`).

---

## 1. Prerequisiti

### 1.1 Token npm

Serve un **token di accesso npm** con permesso di pubblicazione (Publish). Puoi crearlo da:

**npm.com → Il tuo profilo → Access Tokens**  
([https://www.npmjs.com/settings/~youruser/tokens](https://www.npmjs.com/settings/~youruser/tokens))

- Tipo consigliato: **Automation** o **Publish** (es. validità 90 giorni).
- Il token inizia con `npm_`.

### 1.2 Configurazione del token (una volta sola)

Per non dover inserire il token a ogni release, mettilo in un file **`.env`** nella **root** del repo. Il file è già in `.gitignore`, quindi non viene committato.

```bash
echo 'NPM_TOKEN=npm_il_tuo_token_qui' > .env
```

Sostituisci `npm_il_tuo_token_qui` con il token reale.

**Alternativa:** passare il token a ogni esecuzione:

```bash
export NPM_TOKEN=npm_il_tuo_token_qui
npm run release
```

### 1.3 File `.npmrc` (opzionale)

Lo script può aggiungere in automatico, nella root, una riga per l’autenticazione che usa la variabile d’ambiente:

```ini
//registry.npmjs.org/:_authToken=${NPM_TOKEN}
```

Se questa riga non c’è, lo script la aggiunge. In questo modo `npm publish` usa il token senza scriverlo in chiaro nei file.

---

## 2. Esecuzione della release (automatizzata)

Dalla root del monorepo:

```bash
npm run release
```

Lo script:

1. Verifica di essere nella root e che `NPM_TOKEN` sia impostato.
2. Assicura che in `.npmrc` ci sia la riga di auth (vedi sopra).
3. Se il working tree git non è pulito, stampa un **avviso** ma **procede** (puoi committare i cambi dopo la release).
4. Esegue in sequenza tutti i passi descritti nella sezione 3.

Non serve fare `cd` in nessuna sottocartella: tutto viene eseguito dalla root usando i workspace npm (`-w`).

---

## 3. Passaggi eseguiti dallo script (in ordine)

L’ordine è importante perché **core** e **cli** dipendono da **stack**, e **tenant-alpha** dipende da **core**.

### Step 1 — Build di tutto

- **Comando:** `npm run build:all`
- **Cosa fa:** Esegue il comando `build` in tutti i workspace che lo definiscono (inclusi core e le app).
- **Perché:** Assicura che tutto compili prima di fare version bump e publish.

### Step 2 — @jsonpages/stack

- **Comandi (dalla root):**
  - `npm version patch --no-git-tag-version -w @jsonpages/stack`
  - `npm publish --access public -w @jsonpages/stack`
- **Cosa fa:** Incrementa la versione patch in `packages/stack/package.json` e pubblica il package su npm. `--access public` è necessario per i package con scope (`@jsonpages/...`) su registry pubblico.
- **Perché per primo:** È il “manifest” delle versioni condivise; core e cli lo usano (come dipendenza/devDependency).

### Step 3 — @jsonpages/core

- **Comandi (dalla root):**
  - `npm run build -w @jsonpages/core` → genera `packages/core/dist/`
  - `npm version patch --no-git-tag-version -w @jsonpages/core`
  - `npm publish --access public -w @jsonpages/core`
- **Cosa fa:** Build del package core (Vite), incremento versione patch, publish su npm. Lo script tiene da parte la **nuova versione** (es. `1.0.12`) per lo step successivo.
- **Nota:** In `core` è definito uno script `prepack` che sincronizza i peer da stack prima del pack.

### Step 4 — tenant-alpha (aggiornamento e build)

- **Cosa fa lo script:**
  1. Legge `apps/tenant-alpha/package.json`.
  2. Imposta la dipendenza `@jsonpages/core` alla versione appena pubblicata (es. `^1.0.12`).
  3. Scrive il `package.json` aggiornato.
  4. Esegue dalla root:
     - `npm install -w tenant-alpha`
     - `npm run build -w tenant-alpha`
     - `npm run dist -w tenant-alpha`
- **Perché:** tenant-alpha deve usare la versione di core appena pubblicata e il “dist” (output della proiezione) deve essere generato con quella versione.

### Step 5 — @jsonpages/cli

- **Comandi (dalla root):**
  - `npm run build -w @jsonpages/cli` (es. `tsc`)
  - `npm version patch --no-git-tag-version -w @jsonpages/cli`
  - `npm publish --access public -w @jsonpages/cli`
- **Cosa fa:** Build della CLI, incremento versione patch, publish su npm.

### Dopo la release

- I **version bump** sono solo nei file `package.json` (e in tenant-alpha la dipendenza da core); **nessun** commit o tag git viene creato automaticamente.
- Puoi revisionare le modifiche e fare un unico commit, ad es.:
  - `packages/stack/package.json`
  - `packages/core/package.json`
  - `packages/cli/package.json`
  - `apps/tenant-alpha/package.json` (e eventuale lockfile)

---

## 4. Opzioni dello script

Passa le opzioni **dopo** `--` così npm le inoltra allo script:

```bash
npm run release -- --dry-run
npm run release -- --skip-git-check
```

| Opzione | Descrizione |
|--------|-------------|
| `--dry-run` | Esegue build e `npm version patch` per stack, core e cli; aggiorna tenant-alpha e ne esegue build e dist. **Non** esegue nessun `npm publish`. All’inizio stampa l’elenco dei comandi che verrebbero eseguiti. Utile per verificare che tutto funzioni senza pubblicare. |
| `--skip-git-check` | Non esegue il controllo sullo stato del working tree; lo script non mostrerà neanche l’avviso se ci sono modifiche non committate. |

---

## 5. Dry-run: vedere i comandi

Con `--dry-run` lo script stampa subito la lista dei comandi che verrebbero eseguiti (inclusi quelli che in dry-run vengono saltati, marcati con `[SKIP]`). Esempio:

```bash
npm run release -- --dry-run
```

Output iniziale (sintetico):

```
  DRY RUN — Commands that would be executed:
  ————————————————————————————————————————————
  [1/5] (root) npm run build:all
  [2/5] (root) npm version patch --no-git-tag-version -w @jsonpages/stack
  [SKIP] (root) npm publish --access public -w @jsonpages/stack
  ...
```

Poi lo script procede davvero con build e version patch, ma senza publish.

---

## 6. Procedura manuale (senza script)

Se preferisci eseguire i passi a mano (stesso ordine):

1. **Build di tutto**  
   `npm run build:all`

2. **Stack**  
   Dalla root:  
   `npm version patch --no-git-tag-version -w @jsonpages/stack`  
   `npm publish --access public -w @jsonpages/stack`

3. **Core**  
   Dalla root:  
   `npm run build -w @jsonpages/core`  
   `npm version patch --no-git-tag-version -w @jsonpages/core`  
   `npm publish --access public -w @jsonpages/core`  
   Annota la nuova versione (es. `1.0.12`).

4. **tenant-alpha**  
   In `apps/tenant-alpha/package.json` imposta `"@jsonpages/core": "^<nuova_versione>"` (es. `^1.0.12`).  
   Poi dalla root:  
   `npm install -w tenant-alpha`  
   `npm run build -w tenant-alpha`  
   `npm run dist -w tenant-alpha`

5. **CLI**  
   Dalla root:  
   `npm run build -w @jsonpages/cli`  
   `npm version patch --no-git-tag-version -w @jsonpages/cli`  
   `npm publish --access public -w @jsonpages/cli`

---

## 7. Riepilogo ordine e dipendenze

| Ordine | Package / app | Dipende da |
|--------|----------------|------------|
| 1 | Build all | — |
| 2 | @jsonpages/stack | — |
| 3 | @jsonpages/core | @jsonpages/stack (dev) |
| 4 | tenant-alpha (build + dist) | @jsonpages/core |
| 5 | @jsonpages/cli | @jsonpages/stack |

Tutti i comandi `npm version` e `npm publish` sono eseguiti **dalla root** con `-w <workspace>` così che vengano usati la `.npmrc` e il `NPM_TOKEN` (da `.env` o da ambiente) della root.
