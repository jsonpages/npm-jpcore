# 💎 OlonJS Sovereign Tenant

> **Status:** Production Ready  
> **Stack:** React 19 + Vite + Tailwind v4 + TypeScript  
> **Architecture:** Sovereign Core (v1.2)

Questo non è un semplice template. È un **Sistema Operativo Locale** per siti web.
Hai appena scaricato un'architettura completa con CMS integrato, type-safety rigorosa e persistenza su file system.

---

## 🚀 Quick Start (30 Secondi)

1.  **Installa le dipendenze:**
    ```bash
    npm install
    ```

2.  **Accendi i motori:**
    ```bash
    npm run dev
    ```

3.  **La Magia:**
    *   Vai su `http://localhost:5173` per vedere il sito.
    *   Vai su `http://localhost:5173/admin` (o aggiungi `/admin` all'URL).
    *   Modifica un testo. Clicca **Save**.
    *   **Guarda il tuo editor di codice:** Il file JSON in `src/data/pages` è cambiato davvero.

---

## 📚 Onboarding & Guide

Abbiamo incluso la documentazione operativa direttamente nel progetto, nella cartella `/docs`. Scegli il tuo percorso:

### 🎨 1. Percorso "Client" (Grafica & Dati)
Se devi solo impaginare il sito, modificare i CSS o cambiare i contenuti JSON senza toccare la logica del CMS.
👉 **[Leggi: docs/01-Onboarding_Client.md](./docs/01-Onboarding_Client_completo_aggiornato.md)**

### 🏛️ 2. Percorso "Governance" (Architettura)
Se sei il Lead Developer e devi creare nuovi Componenti (Capsule), definire Schemi Zod e configurare l'Editor per il cliente.
👉 **[Leggi: docs/02-Onboarding_Governance.md](./docs/02-Onboarding_Governance_completo_aggiornato.md)**

---

## 📂 Anatomia del Progetto (JSP Protocol)

La struttura non è casuale. Segue il **OlonJS Site Protocol (legacy alias: JsonPages Site Protocol)**. Non spostare i file a caso.

```text
src/
├── components/       # 🧱 TBP Capsules. Ogni cartella è un componente isolato (View + Schema).
├── data/
│   ├── config/       # ⚙️ Globals: site.json (Header/Footer), menu.json, theme.json.
│   └── pages/        # 📄 Locals: Un file JSON per ogni pagina (es. home.json).
├── lib/              # 🧠 Wiring: Registry, Schemas, Configurazione.
├── types.ts          # 🛡️ TypeScript Definitions (Single Source of Truth).
└── App.tsx           # 🚀 Entry Point & Cloud Bridge.
```

---

## ☁️ Deployment (Vercel & Netlify)

Questo progetto è **Statico**. L'output di `npm run build` è puro HTML/JS/CSS.
Puoi deployarlo ovunque.

### ▲ Vercel (Consigliato)
1.  Installa la Vercel CLI: `npm i -g vercel`
2.  Lancia il deploy: `npx vercel`
3.  Segui le istruzioni (accetta i default).

### ⚡ Netlify
Il progetto include già il file `public/_redirects` per gestire il routing SPA.
1.  Collega il repo a Netlify.
2.  Build command: `npm run build`
3.  Publish directory: `dist`

---

## 💾 Persistenza: Locale vs Cloud

Il sistema usa una **Strategia Ibrida** definita in `src/App.tsx`.

1.  **In Locale (Development):**
    Il CMS scrive direttamente sul tuo Hard Disk (`fs`). È veloce e gratuito. I dati sono tuoi.

2.  **In Produzione (Vercel/Netlify):**
    Il File System è di sola lettura. Il tasto "Save" non funzionerebbe.
    Per abilitare l'editing online, il progetto supporta il **OlonJS Cloud Bridge (legacy alias: JsonPages Cloud Bridge)**.
    
    *Configurazione (Environment Variables):*
    *   `VITE_OLONJS_CLOUD_URL` (fallback: `VITE_JSONPAGES_CLOUD_URL`): L'endpoint delle API.
    *   `VITE_OLONJS_API_KEY` (fallback: `VITE_JSONPAGES_API_KEY`): La tua chiave di progetto.

    *Quando configurato, il CMS committa le modifiche direttamente sul tuo repository Git.*

---

**Built with OlonJS** *(legacy alias: JsonPages)*.  
*Busy is the new Boring.*

