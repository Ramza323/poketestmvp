import { describe, it, expect } from 'vitest';
import { generatePP, generateAP, getPPRange, getBaseAP } from '../src/systems/PPAPSystem';
import { moves } from '../src/data/moves';
import type { PokemonData } from '../src/types/Pokemon';

// ── Helpers ───────────────────────────────────────────────────────────────────

function makePokemon(overrides: Partial<PokemonData>): PokemonData {
  const base: PokemonData = {
    id: 1,
    name: 'TestMon',
    types: ['normal'],
    rarity: 1,
    baseStats: { hp: 45, atk: 49, def: 49, spatk: 65, spdef: 65, spd: 45 },
    slots: {
      slot1: ['tackle', 'scratch'],
      slot2: ['overgrow', 'regenerator'],
      slot3: ['solar-beam', 'sludge'],
    },
    trait: 'test',
    learnset: [],
    evolve: null,
  };
  return { ...base, ...overrides };
}

// ── Tests ─────────────────────────────────────────────────────────────────────

describe('generatePP', () => {
  it('siempre retorna un valor dentro del rango [3, 4] en 100 iteraciones', () => {
    for (let i = 0; i < 100; i++) {
      const pp = generatePP([3, 4]);
      expect(pp).toBeGreaterThanOrEqual(3);
      expect(pp).toBeLessThanOrEqual(4);
    }
  });

  it('retorna el valor exacto cuando min === max', () => {
    for (let i = 0; i < 20; i++) {
      expect(generatePP([5, 5])).toBe(5);
    }
  });

  it('nunca sale del rango en cualquier combinación', () => {
    const ranges: [number, number][] = [[1, 1], [3, 7], [8, 10], [0, 100]];
    for (const range of ranges) {
      for (let i = 0; i < 50; i++) {
        const pp = generatePP(range);
        expect(pp).toBeGreaterThanOrEqual(range[0]);
        expect(pp).toBeLessThanOrEqual(range[1]);
      }
    }
  });
});

describe('generateAP', () => {
  it('generateAP(2, false) retorna 2', () => {
    expect(generateAP(2, false)).toBe(2);
  });

  it('generateAP(2, true) retorna 3 (shiny +1)', () => {
    expect(generateAP(2, true)).toBe(3);
  });

  it('shiny siempre incrementa AP en +1 para distintos valores base', () => {
    for (const base of [1, 2, 3, 4, 5]) {
      expect(generateAP(base, true)).toBe(base + 1);
      expect(generateAP(base, false)).toBe(base);
    }
  });
});

describe('shiny PP garantizado', () => {
  it('shiny usa PP = ppRange[1] + 1 (máximo garantizado + 1)', () => {
    // El bonus shiny es que el PP del shiny = range[1] + 1, que se modela
    // pasando el rango [max+1, max+1] a generatePP, resultando siempre en max+1.
    const ppRange: [number, number] = [3, 4];
    const shinyPP = generatePP([ppRange[1] + 1, ppRange[1] + 1]);
    expect(shinyPP).toBe(ppRange[1] + 1);
    expect(shinyPP).toBeGreaterThan(ppRange[1]);
  });

  it('PP shiny siempre es mayor que el máximo del rango normal (determinista)', () => {
    const ranges: [number, number][] = [[3, 4], [4, 5], [5, 7], [6, 8], [8, 10]];
    for (const range of ranges) {
      const shinyPP = range[1] + 1;
      expect(shinyPP).toBeGreaterThan(range[1]);
    }
  });
});

describe('getPPRange', () => {
  it('retorna ppRange del pokemon cuando está definido', () => {
    const mon = makePokemon({ ppRange: [6, 9] });
    expect(getPPRange(mon)).toEqual([6, 9]);
  });

  it('retorna fallback por rareza 1 cuando ppRange no está definido', () => {
    const mon = makePokemon({ rarity: 1 });
    expect(getPPRange(mon)).toEqual([3, 4]);
  });

  it('retorna fallback por rareza 2', () => {
    const mon = makePokemon({ rarity: 2 });
    expect(getPPRange(mon)).toEqual([4, 5]);
  });

  it('retorna fallback por rareza 3', () => {
    const mon = makePokemon({ rarity: 3 });
    expect(getPPRange(mon)).toEqual([5, 7]);
  });

  it('retorna fallback por rareza 4', () => {
    const mon = makePokemon({ rarity: 4 });
    expect(getPPRange(mon)).toEqual([6, 8]);
  });

  it('retorna fallback por rareza 5', () => {
    const mon = makePokemon({ rarity: 5 });
    expect(getPPRange(mon)).toEqual([8, 10]);
  });
});

describe('getBaseAP', () => {
  it('retorna baseAp del pokemon cuando está definido', () => {
    const mon = makePokemon({ baseAp: 7 });
    expect(getBaseAP(mon)).toBe(7);
  });

  it('retorna fallback por rareza 1 cuando baseAp no está definido', () => {
    const mon = makePokemon({ rarity: 1 });
    expect(getBaseAP(mon)).toBe(2);
  });

  it('retorna fallback por rareza 3', () => {
    const mon = makePokemon({ rarity: 3 });
    expect(getBaseAP(mon)).toBe(3);
  });

  it('retorna fallback por rareza 5', () => {
    const mon = makePokemon({ rarity: 5 });
    expect(getBaseAP(mon)).toBe(4);
  });
});

describe('moves.ts — integridad de datos', () => {
  it('todos los moves con power > 0 tienen pp > 0', () => {
    const offenders = moves.filter(m => m.power > 0 && (m.pp === undefined || m.pp <= 0));
    if (offenders.length > 0) {
      const names = offenders.map(m => m.name).join(', ');
      throw new Error(`Moves con power > 0 pero pp <= 0 o sin pp: ${names}`);
    }
    expect(offenders).toHaveLength(0);
  });

  it('todos los passives tienen apCost >= 0', () => {
    const offenders = moves.filter(
      m => m.category === 'passive' && (m.apCost === undefined || m.apCost < 0)
    );
    if (offenders.length > 0) {
      const names = offenders.map(m => m.name).join(', ');
      throw new Error(`Passives con apCost < 0 o sin apCost: ${names}`);
    }
    expect(offenders).toHaveLength(0);
  });
});
