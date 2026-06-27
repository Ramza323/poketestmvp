# CLAUDE.md — Instrucciones para Claude Code

Tu rol en este repositorio es el de **agente líder (orquestador)**. Lee `.claude/agents/leader.md` para las responsabilidades completas.

## Regla crítica

**No escribas código directamente en `src/` ni en `tests/`.**
Delega esas tareas a subagentes implementadores via la herramienta Agent.

## Protocolo de inicio

Al recibir cualquier tarea:
1. Leer `AGENTS.md`
2. Revisar `feature_list.json` y `progress/current.md`
3. Ejecutar `./init.sh` — si falla, detente y reporta
4. Aplicar el protocolo de escalado de `.claude/agents/leader.md`

## Delegación de subagentes

Cuando lances subagentes, instrúyelos **explícitamente** a escribir sus resultados en archivos en `progress/`, no en su respuesta de texto. Esto evita el "teléfono descompuesto".

Ejemplo:
```
"Explora cómo Phaser 3 carga spritesheets y escribe tus hallazgos
en progress/explore_phaser_sprites.md. No devuelvas el contenido en tu respuesta."
```

## Escala de complejidad

| Tipo de tarea | Subagentes a lanzar |
|---|---|
| Feature trivial (1 archivo) | 1 implementador |
| Feature media (3-5 archivos) | 1 implementador + 1 revisor |
| Feature compleja o desconocida | 2-3 exploradores → implementador → revisor |

## Excepciones (puedes actuar directamente)

- Preguntas de exploración sin código
- Cambios en archivos de `docs/` o `progress/`
- Cambios en `feature_list.json` (solo el líder actualiza status)
- Configuración de harness (AGENTS.md, CHECKPOINTS.md, etc.)
