import type { PokemonData } from '../types/Pokemon';

// Rangos PP por rareza (fallback cuando ppRange no está definido en gen1.ts)
const PP_BY_RARITY: Record<number, [number, number]> = {
  1: [3, 4],
  2: [4, 5],
  3: [5, 7],
  4: [6, 8],   // shiny base
  5: [8, 10],  // formas especiales
};

// AP base por rareza (fallback)
const AP_BY_RARITY: Record<number, number> = {
  1: 2,
  2: 2,
  3: 3,
  4: 3,
  5: 4,
};

/** Retorna el rango PP del Pokemon (usa ppRange del dato o fallback por rareza) */
export function getPPRange(pokemon: PokemonData): [number, number] {
  return pokemon.ppRange ?? PP_BY_RARITY[pokemon.rarity] ?? [3, 4];
}

/** Genera PP aleatorio dentro del rango */
export function generatePP(range: [number, number]): number {
  const [min, max] = range;
  return min + Math.floor(Math.random() * (max - min + 1));
}

/** Genera AP; shiny garantiza baseAp + 1 */
export function generateAP(baseAp: number, isShiny: boolean): number {
  return isShiny ? baseAp + 1 : baseAp;
}

/** Retorna el AP base del Pokemon (usa baseAp del dato o fallback por rareza) */
export function getBaseAP(pokemon: PokemonData): number {
  return pokemon.baseAp ?? AP_BY_RARITY[pokemon.rarity] ?? 2;
}
