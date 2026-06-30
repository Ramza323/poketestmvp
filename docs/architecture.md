# Arquitectura del juego

Este documento define qué es "buen código" en este proyecto.
Los revisores usan esto para evaluar el trabajo. Lo que no está aquí no es obligatorio.

---

## Capas del proyecto (estrictas)

```
src/data/       → Datos puros (arrays/objetos JSON-like). Sin imports de Phaser ni de systems.
src/types/      → Solo interfaces TypeScript. Sin lógica. Sin imports externos.
src/systems/    → Lógica de negocio pura. Sin Phaser. Testeable con Vitest puro.
src/ui/         → Componentes Phaser reutilizables (GameObjects). Sin lógica de negocio.
src/scenes/     → Escenas Phaser. Orquestan systems/ y ui/. Sin lógica de dominio propia.
src/main.ts     → Entry point. Solo inicializa Phaser con las escenas.
```

**Regla de importación:**
- `data` no importa nada interno
- `types` no importa nada interno
- `systems` importa solo `data` y `types`
- `ui` importa `types` y `systems` (para leer estado), nunca escribe estado directamente
- `scenes` importa todo lo anterior

---

## Diseño del sistema de batalla

### Pre-batalla
1. `PreBattleScene` muestra el equipo rival
2. El jugador configura 3 slots por Pokemon (elige move de las opciones disponibles)
3. La configuración se pasa a `BattleEngine`

### Durante la batalla
1. `BattleEngine.simulate(teamA, teamB, config)` → retorna `BattleEvent[]`
2. Los eventos son: `{type: 'attack'|'damage'|'faint'|'end', ...}`
3. `BattleScene` consume los eventos y los anima con tweens de Phaser
4. **La lógica nunca toca Phaser. Phaser nunca ejecuta lógica.**

### Post-batalla
1. `CaptureSystem.roll(enemyTeam)` → determina si hay captura y cuál
2. `SaveSystem.addToPokedex(pokemon)` → persiste en localStorage

---

## Sistema de estadísticas

```typescript
// Fórmula de daño simplificada (basada en Gen 3+)
damage = Math.floor((2 * level / 5 + 2) * power * atk / def / 50 + 2) * typeMultiplier

// Cálculo de stat real
realStat = Math.floor((2 * baseStat + iv) * level / 100 + 5)
// HP es diferente: + level + 10 en lugar de + 5
```

### IVs
- Cada Pokemon tiene 6 IVs generados al capturar (0-31 por stat)
- Se guardan en el SaveSystem junto al Pokemon
- No cambian después de la captura

### Rareza y items
- Rareza 1 (común) → items le dan +20% bonus
- Rareza 2 (poco común) → items le dan +15%
- Rareza 3 (raro) → items le dan +10%
- Rareza 4 (muy raro) → items le dan +5%
- Rareza 5 (legendario) → items le dan +2%
- Esto nivela el campo entre Pokemon fuertes y débiles

---

## Sistema de filas

```
Fila frontal: puede recibir daño, actúa con speed normal
Fila trasera: protegida mientras haya alguien en el frente, speed * 0.7

Targets de ataque:
- Ataques normales: apuntan a la fila frontal del rival
- Ataques de área: dañan ambas filas
- Ataques de fila trasera: solo cuando la frontal está vacía
```

---

## Mapa roguelite

- Generado con seed al inicio del run (para reproducibilidad)
- 5 filas de nodos, con bifurcaciones
- Nodo actual visible, siguientes visibles, anteriores oscurecidos
- El estado del mapa (nodo actual, nodos visitados) se guarda en el SaveSystem del run

---

## Persistencia

### Run (temporal, se pierde si falla el run)
```typescript
interface RunState {
  seed: number;
  team: CapturedPokemon[];
  mapState: MapState;
  runCurrency: number;
  nodeHistory: string[];
}
```

### Permanente (localStorage, nunca se pierde)
```typescript
interface SaveData {
  version: number;
  pokedex: Record<number, PokedexEntry>;
  shiniesFound: number[];
  metaCurrency: number;
  achievements: string[];
  unlocks: string[];
  stats: RunStats;
}
```

---

## Prohibiciones explícitas

- `console.log` en `src/` (solo en `tests/` y temporalmente durante dev)
- Lógica de juego dentro de escenas de Phaser
- Llamadas a Phaser dentro de `src/systems/`
- Archivos de más de 200 líneas (dividir en módulos)
- Números mágicos sin constante nombrada (usar `src/data/constants.ts`)
