# Menu hardening — TODO

## Problema osservato (tenant olon.it / admin)

- **`site.json`** definisce `header.data.links` (nav completa).
- **`menu.json`** può avere `"main": []` (array vuoto).
- In **`packages/core/src/lib/JsonPagesEngine.tsx`** (init `globalDraft`), la logica attuale è:

```ts
if (headerData && menuConfig?.main) {
  headerData.links = JSON.parse(JSON.stringify(menuConfig.main)) as MenuItem[];
}
```

- In JavaScript **`[]` è truthy**, quindi con `main: []` la condizione è vera e **`header.data.links` viene sostituito con un array vuoto** → in admin il menu/header sembra “non caricare” anche se i link esistono in `site.json`.
- **`PageRenderer`** usa `menuConfig.main` per la sidebar; con `main` vuoto anche lì non compaiono voci.

Non è un bug “cerca menu.json dentro header”: è **sovrascrittura dell’header da `menu.main`**, e un **`main` vuoto non dovrebbe essere trattato come sorgente valida**.

## TODO (core)

- [ ] Cambiare la condizione in `JsonPagesEngine.tsx` per applicare la merge **solo se il menu ha almeno una voce**, es.:
  - `Array.isArray(menuConfig?.main) && menuConfig.main.length > 0`
- [ ] Verificare altri punti che assumono `menuConfig.main` “presente” vs “vuoto” (coerenza con JSP: `menu.json` come opzionale o come SoT solo quando popolato).
- [ ] Aggiungere test/regression: `main: []` non altera `header.data.links` copiati da `siteConfig`.

## TODO (documentazione / tenant)

- [ ] Documentare in skill o README tenant: se `menu.json` è presente con `main: []`, oggi (pre-fix) può azzerare i link header in admin; workaround: popolare `main` o allineare a `site.json` fino al fix core.

## Riferimenti file

- Core: `packages/core/src/lib/JsonPagesEngine.tsx` (~righe 214–222, stato iniziale `globalDraft`).
- Core: `packages/core/src/lib/PageRenderer.tsx` (`menu={menuConfig.main}`).

## Data nota

2026-03-23 — emerso da analisi tenant `temp/olon.it` (`menu.json` minimale + `site.json` con header links ricchi).
