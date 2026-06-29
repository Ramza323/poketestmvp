export interface IVSet {
  hp: number;
  atk: number;
  def: number;
  spatk: number;
  spdef: number;
  spd: number;
}

/**
 * Genera IVs aleatorios, cada valor en [0, 31]
 */
export function generateIVs(): IVSet {
  return {
    hp: Math.floor(Math.random() * 32),
    atk: Math.floor(Math.random() * 32),
    def: Math.floor(Math.random() * 32),
    spatk: Math.floor(Math.random() * 32),
    spdef: Math.floor(Math.random() * 32),
    spd: Math.floor(Math.random() * 32),
  };
}

/**
 * Calcula el stat final (no HP) dado stat base, IV y nivel (max nivel = 10).
 * Fórmula adaptada del juego oficial escalada a nivel máximo 10:
 *   Math.floor(((2 * base + iv) * level) / 20 + 5)
 */
export function calculateStat(base: number, iv: number, level: number): number {
  return Math.floor(((2 * base + iv) * level) / 20 + 5);
}

/**
 * Calcula el stat de HP dado stat base, IV y nivel (max nivel = 10).
 * Fórmula adaptada:
 *   Math.floor(((2 * base + iv) * level) / 20 + level + 10)
 */
export function calculateHP(base: number, iv: number, level: number): number {
  return Math.floor(((2 * base + iv) * level) / 20 + level + 10);
}
