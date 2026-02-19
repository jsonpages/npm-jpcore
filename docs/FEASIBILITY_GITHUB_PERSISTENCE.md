# Fattibilità: push su GitHub per persistenza e versioning dati

Analisi della fattibilità di usare GitHub come backend di persistenza e versioning per i dati del CMS (pagine, site config, menu, theme) e per gli asset.

---

## 1. Stato attuale

### Dove vivono i dati

| Livello | Dove | Note |
|--------|------|------|
| **Sorgente (file)** | `apps/tenant-alpha/src/data/config/` (site, menu, theme), `src/data/pages/*.json` | Caricati a build/avvio; sono la “verità” su disco. |
| **Draft (Studio)** | Solo stato React nel Core (in memoria). Opzionale: `draftStorage` nel tenant legge ancora da `localStorage` con chiave `jsonpages-draft-*` (legacy). | Il Core non scrive più in localStorage; il draft è volatile se non esportato. |
| **Export** | L’utente clicca “Export JSON” → il Core chiama `persistence.exportJSON(state, slug)` → default: crea uno ZIP in memoria e **download** via `file-saver` (salva sul PC). Nessuna scrittura su repo. | |

### Flusso attuale “Export JSON”

1. Lo stato (page, site, menu, theme) viene passato a `exportProjectJSON`.
2. Il default (Core) costruisce uno ZIP con `config/site.json`, `config/theme.json`, `config/menu.json`, `pages/{slug}.json`.
3. Lo ZIP viene scaricato nel browser con `saveAs(blob, filename)`.
4. **Nessun** commit, nessun push, nessuna scrittura nel repository.

### Asset (immagini)

- Upload: file scritti in `public/assets/images/` dal dev server (Vite plugin).
- Sono già sul filesystem del repo; un `git add` li includerebbe. Non c’è oggi un “commit” automatico.

---

## 2. Obiettivo

- **Persistenza:** salvare le modifiche del CMS (JSON + eventualmente HTML baked) **nel repository**, non solo in download.
- **Versioning:** usare Git (commit + push su GitHub) per storico, diff, rollback, collaborazione.

Quindi: a “Salva” (o a “Export JSON” riconvertito in “Salva su repo”) corrisponde:

- scrittura dei JSON (e opzionalmente HTML/asset) su disco nel repo;
- `git add` dei file modificati;
- `git commit` con messaggio significativo;
- `git push` verso GitHub.

---

## 3. Opzioni e fattibilità

### Opzione A: Backend nel tenant (API + Git CLI)

**Idea:** Aggiungere al tenant (es. middleware Vite o server dedicato) un’API (es. `POST /api/persist` o `POST /api/save-and-push`) che:

1. Riceve il payload (ProjectState + slug, o solo i file modificati).
2. Scrive su disco i JSON nelle path del repo (es. `src/data/config/*.json`, `src/data/pages/*.json`).
3. Esegue `git add`, `git commit`, `git push` (tramite `child_process` o libreria Node tipo `simple-git`).

**Fattibilità:** **Alta.**

- Il dev server (Vite) ha già accesso a `fs` e alla root del repo; un plugin può esporre route API (come per upload-asset).
- In produzione servirebbe un server Node (o simile) con accesso al repo e a Git.
- **Requisiti:** Git installato, credenziali GitHub (token con `repo` o deploy key / SSH) in env (es. `GITHUB_TOKEN`), repo già clonato (es. il monorepo stesso o un repo “solo dati”).

**Pro:** Controllo totale, stesso modello dell’upload (API sotto il tenant).  
**Contro:** Credenziali e Git sul server; da gestire con attenzione (env, non committare token).

---

### Opzione B: GitHub API da browser (tramite proxy)

**Idea:** Il frontend invia lo stato a un backend (proxy) che, con un token GitHub in env, chiama le API GitHub (es. `PUT /repos/:owner/:repo/contents/:path`) per creare/aggiornare file nel repo. Un commit viene creato da GitHub per ogni update.

**Fattibilità:** **Media.**

- Nessun Git installato sul server; basta HTTP + token.
- Il browser non vede il token (resta nel proxy).
- **Contro:** Limitazioni API (dimensione file, rate limit), gestione conflitti (contenuto attuale da leggere prima di aggiornare), struttura repo da definire (un repo “dati” o il monorepo stesso).

**Pro:** Nessuna dipendenza da Git sul server.  
**Contro:** Più complesso per multi-file e conflitti; adatto a pochi file per commit.

---

### Opzione C: Workflow manuale (Export + Git a mano)

**Idea:** Nessun cambiamento codice. L’utente: (1) Export JSON → scarica ZIP; (2) estrae nello stesso repo (sovrascrivendo `src/data/...`); (3) `git add`, `git commit`, `git push` da terminale o da client Git.

**Fattibilità:** **Già fattibile.**

- Zero implementazione; solo documentazione (es. in OPERATIONS_MANUAL o README).
- **Pro:** Nessun rischio credenziali nel codice, nessuna API da mantenere.  
**Contro:** Non è “un click”; poco adatto a utenti non tecnici.

---

### Opzione D: Repo monorepo come target (scrittura locale + push)

**Idea:** Come A, ma il target è esplicitamente il **monorepo** (o una sua cartella): le API scrivono in `apps/tenant-alpha/src/data/` (e opzionalmente `public/assets/images/`). Il backend esegue `git add` su quelle path, `commit`, `push` verso `origin` (es. GitHub).

**Fattibilità:** **Alta** se si ha un backend (stesso plugin Vite in dev; in prod un server Node che monta il repo o ha accesso a una clone).

- Coerente con l’architettura attuale: dati e codice nello stesso repo, versionati insieme.
- **Requisiti:** Come in A (Git, credenziali, repo clonato con remote GitHub).

---

## 4. Raccomandazione

- **Fase 1 (rapida):** Introdurre **Opzione C** in documentazione (es. “Persistenza e versioning: Export JSON → estrai nel repo → git add/commit/push”) per chi vuole subito storico su GitHub senza toccare codice.
- **Fase 2 (obiettivo principale):** Implementare **Opzione A/D**:
  - **Tenant (es. tenant-alpha):**  
    - `config.persistence.exportJSON` custom: invece di (o in aggiunta a) download ZIP, fare `POST /api/persist` con `ProjectState` + slug.  
    - Backend (middleware Vite in dev + server Node in prod): scrive `site.json`, `menu.json`, `theme.json`, `pages/{slug}.json` (e opz. HTML) su disco; esegue `git add`, `git commit -m "..."`, `git push` (con `GITHUB_TOKEN` o SSH).
  - **Core:** Nessuna modifica obbligatoria; la persistence è già sostituibile tramite `config.persistence.exportJSON`. Opzionale: bottone “Salva su repo” che chiama la stessa API, lasciando “Export JSON” per il download ZIP.

Credenziali: solo in variabili d’ambiente (es. `GITHUB_TOKEN`), mai in repo. In produzione, il processo che esegue il push deve avere accesso in scrittura al remote (token con scope `repo` o deploy key).

---

## 5. Riepilogo fattibilità

| Criterio | Valutazione |
|----------|-------------|
| **Fattibilità tecnica** | Alta (backend + Git o GitHub API). |
| **Compatibilità Core** | Buona: il Core espone già `persistence.exportJSON` sostituibile; nessun cambio architetturale. |
| **Rischi** | Credenziali (mitigabili con env e buone pratiche); conflitti se più utenti pushano (workflow da definire). |
| **Efforto** | Medio: API persist + script Git (o integrazione `simple-git`) + configurazione env e documentazione. |

In sintesi: **sì, è fattibile** usare il push su GitHub per persistenza e versioning; l’approccio più lineare è un backend nel tenant che scrive i JSON (e opz. asset) su disco e esegue `git add` / `commit` / `push`, con credenziali in env e repo già clonato (monorepo o repo dati).
