import { describe, it, expect } from 'vitest';
import { moves } from '../src/data/moves';
import { gen1Pokemon } from '../src/data/gen1';

describe('moves catalog', () => {
  it('exports at least 120 moves', () => {
    expect(moves.length).toBeGreaterThanOrEqual(120);
  });

  it('all ids are unique', () => {
    const ids = moves.map(m => m.id);
    expect(new Set(ids).size).toBe(ids.length);
  });

  it('status and passive moves have power === 0', () => {
    const statusPassive = moves.filter(m => m.category === 'status' || m.category === 'passive');
    statusPassive.forEach(m => {
      expect(m.power, `${m.name} debe tener power 0`).toBe(0);
    });
  });

  it('all move names referenced in gen1.ts slots exist in moves', () => {
    const moveNames = new Set(moves.map(m => m.name.toLowerCase().replace(/ /g, '-')));

    const allSlotMoves: string[] = [];
    gen1Pokemon.forEach(p => {
      allSlotMoves.push(...p.slots.slot1, ...p.slots.slot2, ...p.slots.slot3);
    });
    const unique = [...new Set(allSlotMoves)];
    unique.forEach(name => {
      expect(moveNames.has(name), `Move "${name}" no está en moves.ts`).toBe(true);
    });
  });

  it('all move names referenced in gen1.ts learnsets exist in moves', () => {
    const moveNames = new Set(moves.map(m => m.name.toLowerCase().replace(/ /g, '-')));
    const learnsetMoves: string[] = [];
    gen1Pokemon.forEach(p => {
      p.learnset.forEach(l => learnsetMoves.push(l.move));
    });
    const unique = [...new Set(learnsetMoves)];
    unique.forEach(name => {
      expect(moveNames.has(name), `Learnset move "${name}" no está en moves.ts`).toBe(true);
    });
  });

  it('physical and special moves have power > 0', () => {
    const attacking = moves.filter(m => m.category === 'physical' || m.category === 'special');
    attacking.forEach(m => {
      expect(m.power, `${m.name} debe tener power > 0`).toBeGreaterThan(0);
    });
  });

  it('effects con chance tienen chance entre 0 y 100', () => {
    moves.forEach(m => {
      (m.effects ?? []).forEach(e => {
        if (e.chance !== undefined) {
          expect(e.chance, `${m.name} tiene chance inválido`).toBeGreaterThanOrEqual(0);
          expect(e.chance, `${m.name} tiene chance inválido`).toBeLessThanOrEqual(100);
        }
      });
    });
  });

  it('moves con recoil tienen value > 0', () => {
    moves
      .filter(m => m.effects?.some(e => e.tag === 'recoil'))
      .forEach(m => {
        const recoil = m.effects!.find(e => e.tag === 'recoil')!;
        expect(recoil.value, `${m.name} recoil sin value`).toBeGreaterThan(0);
      });
  });
});
