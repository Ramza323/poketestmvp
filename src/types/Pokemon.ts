export type PokemonType =
  | 'normal' | 'fire' | 'water' | 'electric' | 'grass' | 'ice'
  | 'fighting' | 'poison' | 'ground' | 'flying' | 'psychic' | 'bug'
  | 'rock' | 'ghost' | 'dragon' | 'dark' | 'steel' | 'fairy';

export interface BaseStats {
  hp: number;
  atk: number;
  def: number;
  spatk: number;
  spdef: number;
  spd: number;
}

export interface SlotOptions {
  slot1: [string, string];
  slot2: [string, string];
  slot3: [string, string];
}

export interface LearnEntry {
  level: number;
  slot: 1 | 2 | 3;
  move: string;
}

export interface EvolutionData {
  into: string;
  level: number;
}

export interface PokemonData {
  id: number;
  name: string;
  types: [PokemonType] | [PokemonType, PokemonType];
  rarity: 1 | 2 | 3 | 4 | 5;
  baseStats: BaseStats;
  ppRange?: [number, number]; // [min, max] PP por batalla
  baseAp?: number;        // pool de AP por batalla (F05b lo implementa; undefined = 4 por defecto)
  slots: SlotOptions;
  trait: string;
  learnset: LearnEntry[];
  evolve: EvolutionData | null;
}
