export type SpriteForm =
  | 'base'
  | 'shiny'
  | 'mega'
  | 'mega-x'
  | 'mega-y'
  | 'gmax'
  | `form-${number}`
  | string;

import { MAX_POKEMON_ID } from '../data/constants';

export const SPRITE_BASE_PATH = 'assets/pokemon';
const FALLBACK_SPRITE = `${SPRITE_BASE_PATH}/000.png`;

export function getSpritePath(id: number, form: SpriteForm = 'base'): string {
  if (id <= 0 || id > MAX_POKEMON_ID || !Number.isInteger(id)) {
    return getFallbackSpritePath();
  }

  if (form === 'base') {
    return `${SPRITE_BASE_PATH}/${id}.png`;
  }

  if (form === 'shiny') {
    return `${SPRITE_BASE_PATH}/${id}-shiny.png`;
  }

  if (form === 'mega') {
    return `${SPRITE_BASE_PATH}/${id}-mega.png`;
  }

  if (form === 'mega-x') {
    return `${SPRITE_BASE_PATH}/${id}-mega-x.png`;
  }

  if (form === 'mega-y') {
    return `${SPRITE_BASE_PATH}/${id}-mega-y.png`;
  }

  if (form === 'gmax') {
    return `${SPRITE_BASE_PATH}/${id}-gmax.png`;
  }

  const formMatch = (form as string).match(/^form-(\d+)$/);
  if (formMatch) {
    return `${SPRITE_BASE_PATH}/${id}-${formMatch[1]}.png`;
  }

  return `${SPRITE_BASE_PATH}/${id}-${form}.png`;
}

export function getFallbackSpritePath(): string {
  return FALLBACK_SPRITE;
}
