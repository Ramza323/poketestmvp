import { describe, it, expect } from 'vitest';
import { generateIVs, calculateStat, calculateHP } from '../src/systems/IVSystem';

describe('generateIVs', () => {
  it('retorna un objeto con 6 stats en el rango [0, 31]', () => {
    for (let i = 0; i < 20; i++) {
      const ivs = generateIVs();
      const stats: (keyof typeof ivs)[] = ['hp', 'atk', 'def', 'spatk', 'spdef', 'spd'];

      for (const stat of stats) {
        expect(ivs[stat]).toBeGreaterThanOrEqual(0);
        expect(ivs[stat]).toBeLessThanOrEqual(31);
        expect(Number.isInteger(ivs[stat])).toBe(true);
      }
    }
  });

  it('retorna exactamente las 6 claves esperadas', () => {
    const ivs = generateIVs();
    expect(Object.keys(ivs).sort()).toEqual(['atk', 'def', 'hp', 'spatk', 'spd', 'spdef']);
  });
});

describe('calculateStat', () => {
  it('es determinista — mismos inputs producen el mismo output', () => {
    const result1 = calculateStat(45, 15, 10);
    const result2 = calculateStat(45, 15, 10);
    expect(result1).toBe(result2);
  });

  it('stat calculado crece con el nivel (nivel 10 > nivel 5)', () => {
    const base = 50;
    const iv = 20;
    const statLv10 = calculateStat(base, iv, 10);
    const statLv5 = calculateStat(base, iv, 5);
    expect(statLv10).toBeGreaterThan(statLv5);
  });

  it('IV=31 siempre da stat mayor que IV=0 (mismo base y nivel)', () => {
    const base = 45;
    const level = 10;
    const statIV31 = calculateStat(base, 31, level);
    const statIV0 = calculateStat(base, 0, level);
    expect(statIV31).toBeGreaterThan(statIV0);
  });
});

describe('calculateHP', () => {
  it('es determinista — mismos inputs producen el mismo output', () => {
    const result1 = calculateHP(45, 15, 10);
    const result2 = calculateHP(45, 15, 10);
    expect(result1).toBe(result2);
  });

  it('HP calculado crece con el nivel (nivel 10 > nivel 5)', () => {
    const base = 45;
    const iv = 20;
    const hpLv10 = calculateHP(base, iv, 10);
    const hpLv5 = calculateHP(base, iv, 5);
    expect(hpLv10).toBeGreaterThan(hpLv5);
  });

  it('calculateHP siempre da valor mayor que calculateStat (mismo base, iv, level)', () => {
    // HP tiene bonus de +level+10 vs +5 para stat normal
    const testCases = [
      { base: 45, iv: 0, level: 1 },
      { base: 45, iv: 31, level: 5 },
      { base: 80, iv: 15, level: 10 },
      { base: 1, iv: 0, level: 1 },
    ];

    for (const { base, iv, level } of testCases) {
      const hp = calculateHP(base, iv, level);
      const stat = calculateStat(base, iv, level);
      expect(hp).toBeGreaterThan(stat);
    }
  });
});
