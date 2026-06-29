import { describe, it, expect } from 'vitest';
import { getSpritePath, getFallbackSpritePath, SPRITE_BASE_PATH } from '../src/systems/AssetLoader';

describe('AssetLoader', () => {
  describe('getSpritePath — forma base', () => {
    it('retorna la ruta base cuando no se pasa forma', () => {
      expect(getSpritePath(1)).toBe('assets/pokemon/1.png');
    });

    it('retorna la ruta base cuando se pasa "base" explícitamente', () => {
      expect(getSpritePath(1, 'base')).toBe('assets/pokemon/1.png');
    });
  });

  describe('getSpritePath — forma shiny', () => {
    it('retorna la ruta shiny correcta', () => {
      expect(getSpritePath(1, 'shiny')).toBe('assets/pokemon/1-shiny.png');
    });
  });

  describe('getSpritePath — mega evoluciones', () => {
    it('retorna la ruta mega-x correcta', () => {
      expect(getSpritePath(150, 'mega-x')).toBe('assets/pokemon/150-mega-x.png');
    });

    it('retorna la ruta mega-y correcta', () => {
      expect(getSpritePath(150, 'mega-y')).toBe('assets/pokemon/150-mega-y.png');
    });

    it('retorna la ruta mega simple correcta', () => {
      expect(getSpritePath(6, 'mega')).toBe('assets/pokemon/6-mega.png');
    });
  });

  describe('getSpritePath — gigamax', () => {
    it('retorna la ruta gmax correcta', () => {
      expect(getSpritePath(6, 'gmax')).toBe('assets/pokemon/6-gmax.png');
    });
  });

  describe('getSpritePath — formas numéricas', () => {
    it('retorna la ruta form-1 correcta (forma regional/alternativa)', () => {
      expect(getSpritePath(103, 'form-1')).toBe('assets/pokemon/103-1.png');
    });

    it('retorna la ruta form-2 correcta', () => {
      expect(getSpritePath(6, 'form-2')).toBe('assets/pokemon/6-2.png');
    });
  });

  describe('getSpritePath — formas con nombre libre', () => {
    it('retorna la ruta con nombre de forma libre', () => {
      expect(getSpritePath(25, 'belle')).toBe('assets/pokemon/25-belle.png');
    });

    it('retorna la ruta con nombre cosplay', () => {
      expect(getSpritePath(25, 'cosplay')).toBe('assets/pokemon/25-cosplay.png');
    });
  });

  describe('getFallbackSpritePath', () => {
    it('retorna el sprite de fallback', () => {
      expect(getFallbackSpritePath()).toBe('assets/pokemon/000.png');
    });
  });

  describe('IDs inválidos — retorna fallback', () => {
    it('id = 0 retorna fallback', () => {
      expect(getSpritePath(0)).toBe('assets/pokemon/000.png');
    });

    it('id negativo retorna fallback', () => {
      expect(getSpritePath(-1)).toBe('assets/pokemon/000.png');
    });

    it('id > 10000 retorna fallback', () => {
      expect(getSpritePath(10001)).toBe('assets/pokemon/000.png');
    });

    it('id = 10000 es válido (límite superior)', () => {
      expect(getSpritePath(10000)).toBe('assets/pokemon/10000.png');
    });

    it('id = 1 es válido (límite inferior)', () => {
      expect(getSpritePath(1)).toBe('assets/pokemon/1.png');
    });
  });

  describe('SPRITE_BASE_PATH exportado', () => {
    it('exporta SPRITE_BASE_PATH con el valor correcto', () => {
      expect(SPRITE_BASE_PATH).toBe('assets/pokemon');
    });
  });
});
