# Verificación — Cómo demostrar que el trabajo funciona

El agente no dice "funciona". Lo demuestra con tests ejecutables y salidas reales.

---

## Principio

Toda feature tiene `acceptance_criteria` en `feature_list.json`.
Cada criterio debe estar cubierto por al menos un test en `tests/`.

---

## Tres niveles de verificación

### Nivel 1 — Tests unitarios (obligatorio para toda feature de systems/)

```bash
npm test
```

- Cada función pública de `src/systems/` tiene test de caso exitoso + al menos un caso de error
- Los tests son deterministas (misma entrada → misma salida)
- Sin efectos secundarios entre tests

### Nivel 2 — Build sin errores (obligatorio para todo)

```bash
npm run build
```

- TypeScript compila sin errores (strict mode)
- No hay `any` explícito sin justificación documentada
- Todos los imports resuelven correctamente

### Nivel 3 — Verificación en navegador (obligatorio para features de UI/scenes)

```bash
npm run dev
# abrir http://localhost:5173
```

- La escena renderiza sin errores en consola
- Los elementos interactivos responden al click
- No hay flickering ni glitches visuales

---

## Prácticas prohibidas

- Marcar una feature "done" sin haber ejecutado `npm test` y pasado todos los tests
- Tests que solo verifican que no lanza excepción (sin `expect` con valor real)
- Afirmar "funciona" sin evidencia ejecutable en el chat
- Usar `as any` para esquivar errores de TypeScript

---

## Validación final antes de cerrar

```bash
./init.sh
# debe imprimir: "[OK] Entorno listo"
```

Si falla:
1. Leer el error exacto
2. Documentar en `progress/current.md` bajo "Bloqueadores"
3. No cerrar la sesión hasta resolverlo

---

## Template de reporte de verificación

Al completar una feature, el implementador escribe en `progress/current.md`:

```markdown
## Verificación F0X — [Nombre de la feature]

### Tests
- npm test: PASS (X tests, X ms)
- Cobertura de acceptance_criteria: X/X

### Build
- npm run build: OK (sin errores TS)

### Navegador (si aplica)
- Escena carga: ✅
- Interacción funciona: ✅
- Sin errores en consola: ✅

### Notas
[cualquier comportamiento esperado que no sea obvio]
```
