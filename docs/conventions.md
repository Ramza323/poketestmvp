# Convenciones de código

La IA predice mejor cuando el repositorio se parece a sí mismo en todas partes.
Estas convenciones garantizan homogeneidad extrema.

---

## TypeScript

- **Versión:** TypeScript 5.x con `strict: true` en tsconfig
- **Comillas:** simples `'` para strings
- **Punto y coma:** siempre al final de cada sentencia
- **Longitud de línea:** máximo 100 caracteres
- **Indentación:** 2 espacios (no tabs)

---

## Nombres

| Elemento | Convención | Ejemplo |
|---|---|---|
| Archivos de sistema | `PascalCase.ts` | `BattleEngine.ts` |
| Archivos de datos | `camelCase.ts` | `gen1.ts`, `moves.ts` |
| Archivos de test | `kebab-case.test.ts` | `battle-engine.test.ts` |
| Interfaces/Types | `PascalCase` | `PokemonData`, `BattleEvent` |
| Clases | `PascalCase` | `BattleEngine`, `SaveSystem` |
| Funciones/métodos | `camelCase` | `calculateDamage()`, `generateMap()` |
| Variables | `camelCase` | `currentNode`, `teamA` |
| Constantes | `UPPER_SNAKE_CASE` | `MAX_TEAM_SIZE`, `SHINY_RATE` |
| Escenas Phaser | `PascalCase + Scene` | `BattleScene`, `MapScene` |
| Componentes UI | `PascalCase` | `HPBar`, `SlotSelector` |

---

## Estructura de archivos en `src/`

Cada archivo en `src/systems/` o `src/data/` sigue este patrón:

```typescript
// BattleEngine.ts
import type { PokemonInstance, BattleConfig } from '../types/Pokemon';
import { BACK_ROW_SPEED_PENALTY } from '../data/constants';

export class BattleEngine {
  // ...
}

export type { BattleEvent }; // exportar tipos al final
```

---

## Interfaces vs Classes

- `src/types/` → **solo interfaces** (sin `class`, sin `new`)
- `src/data/` → **solo objetos/arrays** (sin lógica)
- `src/systems/` → **clases o funciones puras** (sin estado global)

---

## Exports

- Preferir **named exports** sobre default exports
- Un export principal por archivo (la clase o función principal)
- Los tipos secundarios se exportan al final del archivo

---

## Tests (Vitest)

```typescript
// tests/battle-engine.test.ts
import { describe, it, expect } from 'vitest';
import { BattleEngine } from '../src/systems/BattleEngine';
import { mockPokemon } from './helpers';

describe('BattleEngine', () => {
  it('actua en orden de velocidad descendente', () => {
    const fast = mockPokemon({ spd: 100 });
    const slow = mockPokemon({ spd: 50 });
    // ...
    expect(events[0].attacker.id).toBe(fast.id);
  });
});
```

Cada suite de tests:
1. Un `describe` por módulo
2. Nombres de test en español, describiendo el comportamiento esperado
3. Helpers en `tests/helpers.ts` (factories de objetos de prueba)
4. Sin mocks de Phaser (los sistemas son Phaser-free)

---

## Datos en `src/data/`

```typescript
// gen1.ts
import type { PokemonData } from '../types/Pokemon';

export const gen1Pokemon: PokemonData[] = [
  {
    id: 1,
    name: 'Bulbasaur',
    types: ['grass', 'poison'],
    rarity: 1,
    baseStats: { hp: 45, atk: 49, def: 49, spatk: 65, spdef: 65, spd: 45 },
    slots: {
      slot1: ['tackle', 'vine-whip', 'razor-leaf'],
      slot2: ['growl', 'sleep-powder'],
      slot3: ['solar-beam', 'leech-seed'],
    },
    trait: 'overgrow',
    learnset: [
      { level: 1, slot: 1, move: 'tackle' },
      { level: 7, slot: 1, move: 'vine-whip' },
    ],
    evolve: { into: 'ivysaur', level: 16 },
  },
  // ...
];
```

---

## Comentarios

No escribir comentarios que expliquen QUÉ hace el código.
Solo escribir comentarios cuando expliquen POR QUÉ una decisión no obvia fue tomada.

```typescript
// MAL: incrementa el contador de capturas
captureCount++;

// BIEN: +1 aquí porque el roll ya confirmó la captura antes de llamar esta función
captureCount++;
```
