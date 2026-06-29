# Bitácora histórica (append-only)

> Solo agregar entradas, nunca borrar. Cada sesión completada agrega una entrada al final.

---

## 2026-06-27 — Setup del harness

- Definido el plan de desarrollo completo: 20 features en 7 fases
- Aplicado harness multi-agente basado en ejemplo-harness-subagentes
- Creados todos los archivos de configuración del harness
- Sprites organizados: 942 normales + 1424 shinies en carpetas Pokemon/ y Shiny/
- Stack decidido: Phaser 3 + TypeScript + Vite + Vitest
- Siguiente paso: implementar F01 (setup del proyecto)

---

## 2026-06-28 — F01: Setup del proyecto

- Inicializado proyecto Vite 5 + Phaser 3.87 + TypeScript 5.x + Vitest 2
- Archivos creados: package.json, vite.config.ts, tsconfig.json, index.html, src/main.ts, src/scenes/BootScene.ts, src/data/constants.ts, tests/setup.test.ts
- tsconfig.json con strict: true y moduleResolution: "bundler" (sin baseUrl deprecated)
- Alias @/* configurado en tsconfig.json y vite.config.ts (resolve.alias)
- src/main.ts usa GAME_WIDTH/GAME_HEIGHT desde constants.ts (sin números mágicos)
- Tests: 1 PASS. Build: OK (warning chunk size esperado por peso de Phaser ~1.4 MB)
- Siguiente paso: F02 (sistema de assets: carga de sprites Pokemon)

---

## 2026-06-28 — F02: Sistema de assets

- Creados: `src/systems/AssetLoader.ts`, `tests/asset-loader.test.ts`
- `getSpritePath(id, form?)` — constructor de rutas puro (Phaser-free), cubre base, shiny, mega, mega-x/y, gmax, form-N, nombre libre
- Fallback a `000.png` para IDs fuera de rango (0, negativos, >MAX_POKEMON_ID)
- `MAX_POKEMON_ID = 10000` agregado a `constants.ts` para eliminar número mágico
- Tests: 19 PASS (18 nuevos + 1 pre-existente). Build: OK
- Siguiente paso: F03 (datos Gen 1: 151 Pokemon)
