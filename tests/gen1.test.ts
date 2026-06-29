import { describe, it, expect } from 'vitest';
import { gen1Pokemon } from '../src/data/gen1';

describe('Gen 1 Pokemon data', () => {
  it('exporta exactamente 151 entradas', () => {
    expect(gen1Pokemon).toHaveLength(151);
  });

  it('los IDs van de 1 a 151 sin huecos', () => {
    const ids = gen1Pokemon.map(p => p.id);
    for (let i = 1; i <= 151; i++) {
      expect(ids).toContain(i);
    }
  });

  it('cada Pokemon tiene al menos 1 move en slot1', () => {
    for (const p of gen1Pokemon) {
      expect(p.slots.slot1.length).toBeGreaterThan(0);
    }
  });

  it('hp >= 1 para todos', () => {
    for (const p of gen1Pokemon) {
      expect(p.baseStats.hp).toBeGreaterThanOrEqual(1);
    }
  });

  it('evolve.level > 0 cuando existe cadena evolutiva', () => {
    for (const p of gen1Pokemon) {
      if (p.evolve !== null) {
        expect(p.evolve.level).toBeGreaterThan(0);
      }
    }
  });

  it('rareza está entre 1 y 5', () => {
    for (const p of gen1Pokemon) {
      expect(p.rarity).toBeGreaterThanOrEqual(1);
      expect(p.rarity).toBeLessThanOrEqual(5);
    }
  });

  it('cada Pokemon tiene al menos 3 entradas en learnset', () => {
    for (const p of gen1Pokemon) {
      expect(p.learnset.length).toBeGreaterThanOrEqual(3);
    }
  });

  it('los tipos son strings válidos', () => {
    const validTypes = ['normal','fire','water','electric','grass','ice','fighting',
      'poison','ground','flying','psychic','bug','rock','ghost','dragon','dark','steel','fairy'];
    for (const p of gen1Pokemon) {
      for (const t of p.types) {
        expect(validTypes).toContain(t);
      }
    }
  });
});
