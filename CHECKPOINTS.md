# CHECKPOINTS — Criterios de "estado final correcto"

Un agente revisor valida estos checkpoints antes de cerrar cualquier sesión.
Si alguno falla, la sesión no puede cerrarse.

---

## C1 — Completitud del harness

- [ ] Existen: `AGENTS.md`, `CLAUDE.md`, `CHECKPOINTS.md`, `feature_list.json`, `init.sh`
- [ ] Existen: `docs/architecture.md`, `docs/conventions.md`, `docs/verification.md`
- [ ] Existen: `.claude/agents/leader.md`, `.claude/agents/implementer.md`, `.claude/agents/reviewer.md`
- [ ] `./init.sh` ejecuta sin errores (exit 0)
- [ ] `progress/current.md` y `progress/history.md` existen

---

## C2 — Coherencia de estado

- [ ] `feature_list.json` tiene **máximo 1** feature en status "in_progress"
- [ ] Todas las features en status "done" tienen sus archivos correspondientes creados
- [ ] `progress/current.md` no contiene notas de sesiones anteriores (limpio o con sesión activa)
- [ ] `npm test` pasa para todas las features marcadas como "done"

---

## C3 — Cumplimiento de arquitectura

- [ ] Los módulos en `src/systems/` son lógica pura (sin referencias a Phaser)
- [ ] Las escenas en `src/scenes/` no contienen lógica de negocio directa (delegan a systems/)
- [ ] Los tipos en `src/types/` son solo interfaces (sin lógica)
- [ ] Los datos en `src/data/` son solo datos (sin imports de Phaser ni systems)
- [ ] No existen `console.log` de debug en `src/` (solo en tests permitido)
- [ ] Ningún archivo de `src/` tiene más de 200 líneas (dividir si supera)

---

## C4 — Verificación real

- [ ] Cada módulo en `src/systems/` tiene su archivo de test en `tests/`
- [ ] Los tests usan datos reales del proyecto, no mocks genéricos
- [ ] Todos los acceptance_criteria de la feature están cubiertos por al menos un test
- [ ] `npm run build` genera `dist/` sin errores de TypeScript
- [ ] `npm run dev` levanta el servidor y Phaser carga en el navegador

---

## C5 — Cierre de sesión

- [ ] No hay archivos `progress/explore_*.md` huérfanos
- [ ] `progress/history.md` tiene entrada documentada con fecha y feature completada
- [ ] `progress/current.md` está reseteado a la plantilla vacía
- [ ] No hay archivos `.tmp`, `.bak` u otros temporales en `src/`
- [ ] `feature_list.json` refleja el status real de cada feature

---

## Cómo usar este documento

El **agente revisor** lee estos checkpoints y marca cada uno como ✅ o ❌.
Si cualquier checkpoint del C1 al C5 está en ❌, documenta el problema en `progress/current.md`
y bloquea el cierre de la sesión hasta que se resuelva.
