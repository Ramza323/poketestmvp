# AGENTS.md — Mapa de navegación para agentes IA

Este documento es el **punto de entrada** para cualquier agente que trabaje en este repositorio.
Lee esto primero. Luego consulta los docs específicos según lo que necesites.

---

## Contexto del proyecto

Fan game roguelite web de Pokemon, inspirado en:
- **PokeRogue** (pokerogue.net): mecánicas roguelite, Pokédex persistente, biomas, waves
- **Pokemon Overlord** (itch.io/jab-lao): sistema de batalla por filas, slots pre-configurados, auto-battle

**Stack:** Phaser 3 + TypeScript + Vite | **Sprites:** carpetas `Pokemon/` y `Shiny/` en la raíz | **Tests:** Vitest

---

## Protocolo de inicio de sesión

```
1. Ejecutar ./init.sh  →  debe mostrar "[OK] Entorno listo"
2. Leer progress/current.md  →  ¿hay trabajo en curso?
3. Leer feature_list.json  →  seleccionar la siguiente feature "pending" de menor ID
4. Documentar el plan en progress/current.md ANTES de escribir código
```

Si `init.sh` falla → revisar el error, no continuar hasta resolverlo.

---

## Estructura del repositorio

```
AGENTS.md              ← estás aquí
CLAUDE.md              ← rol del agente líder (orquestador)
CHECKPOINTS.md         ← criterios de "trabajo correcto"
feature_list.json      ← lista de features con estado
init.sh                ← verificación de entorno
progress/
  current.md           ← plan vivo de la sesión actual (se vacía al cerrar)
  history.md           ← bitácora permanente (append-only)
docs/
  architecture.md      ← decisiones de diseño del juego y código
  conventions.md       ← TypeScript/Phaser, nombres, estilo
  verification.md      ← cómo demostrar que algo funciona
.claude/
  agents/              ← definiciones de líder, implementador, revisor
  settings.json        ← hooks automáticos
src/
  data/                ← Pokemon, moves, items, eventos (datos puros)
  scenes/              ← Escenas de Phaser (BootScene, BattleScene, MapScene...)
  systems/             ← Lógica de negocio (BattleEngine, SaveSystem, MapGenerator...)
  ui/                  ← Componentes UI reutilizables
  types/               ← Interfaces y tipos TypeScript
  main.ts              ← Entry point del juego
public/
  assets/
    pokemon/           ← sprites normales (copiados desde Pokemon/ raíz)
    shiny/             ← sprites shiny (copiados desde Shiny/ raíz)
tests/                 ← Tests de Vitest (un archivo por módulo de src/systems/)
Pokemon/               ← sprites originales (fuente de verdad, no editar)
Shiny/                 ← sprites shiny originales (fuente de verdad, no editar)
```

---

## Reglas no negociables

1. **Una feature a la vez.** Si `feature_list.json` ya tiene algo "in_progress", termínalo o bloqueéalo antes de empezar otro.
2. **Los tests mandan.** No marques una feature como "done" hasta que `npm test` pase.
3. **El estado vive en disco.** Escribe decisiones, hallazgos y resultados en archivos de `progress/`. No los dejes solo en el chat.
4. **No improvises la arquitectura.** Consulta `docs/architecture.md` antes de crear capas nuevas.
5. **Verificación real.** Lee `docs/verification.md`. "Funciona" significa que los tests lo confirman, no que el modelo lo afirma.

---

## Selección de feature

```
1. Abrir feature_list.json
2. Filtrar features con status == "pending"
3. Seleccionar la de menor ID
4. Cambiar su status a "in_progress"
5. Documentar el plan en progress/current.md
```

---

## Cierre de sesión

```
1. npm test  →  todos los tests pasan
2. Actualizar status en feature_list.json ("done" o "blocked")
3. Mover notas de progress/current.md a progress/history.md
4. Resetear progress/current.md a la plantilla vacía
5. Eliminar archivos temporales de exploración (progress/explore_*.md)
```

---

## Protocolo de bloqueo

Si estás atascado:
1. Documenta el bloqueo en `progress/current.md` bajo "Bloqueadores"
2. Cambia el status de la feature a "blocked" en `feature_list.json`
3. Describe exactamente qué necesitas para desbloquearlo
4. **No improvises.** No inventes soluciones sin entender el problema.
