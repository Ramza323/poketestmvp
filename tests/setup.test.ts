import { describe, it, expect } from 'vitest';
import { GAME_WIDTH, GAME_HEIGHT, MAX_TEAM_SIZE, SHINY_RATE, MAX_POKEMON_LEVEL } from '../src/data/constants';

describe('Configuración del proyecto', () => {
  it('las constantes del juego tienen los valores correctos', () => {
    expect(GAME_WIDTH).toBe(960);
    expect(GAME_HEIGHT).toBe(640);
    expect(MAX_TEAM_SIZE).toBe(3);
    expect(SHINY_RATE).toBe(512);
    expect(MAX_POKEMON_LEVEL).toBe(10);
  });
});
