import type { PokemonType } from './Pokemon';

export type MoveCategory = 'physical' | 'special' | 'status' | 'passive';

export type EffectTag =
  // Condiciones de estado
  | 'burn' | 'paralysis' | 'sleep' | 'poison' | 'toxic' | 'confuse' | 'freeze'
  // Targeting
  | 'target:row'          // golpea fila frontal completa
  | 'target:all-enemies'  // golpea todos los enemigos
  // Formación / posición
  | 'push:back'           // empuja objetivo a fila trasera
  | 'pull:front'          // jala objetivo de fila trasera a frontal
  | 'swap:ally'           // usuario se intercambia con aliado aleatorio
  | 'trap'                // inmoviliza objetivo N turnos
  // Modificadores de daño
  | 'multi-hit'           // golpea 2-5 veces (random)
  | 'double-hit'          // golpea exactamente 2 veces
  | 'absorb'              // roba HP = value% del daño infligido
  | 'recoil'              // usuario recibe value% del daño como retroceso
  | 'fixed-damage'        // inflige exactamente value puntos de daño
  | 'level-damage'        // daño = nivel del usuario
  | 'priority'            // siempre actúa primero
  | 'high-crit'           // mayor probabilidad de golpe crítico
  | 'charge'              // requiere turno de carga
  | 'recharge'            // no puede actuar el siguiente turno
  // Cambios de stat propios (value = etapas, positivo)
  | 'self:atk' | 'self:def' | 'self:spd' | 'self:spatk' | 'self:spdef'
  | 'self:evasion' | 'self:crit'
  // Cambios de stat del rival (value = etapas, negativo)
  | 'foe:atk' | 'foe:def' | 'foe:spd' | 'foe:spatk' | 'foe:spdef' | 'foe:accuracy'
  // Debuffs a toda la fila frontal enemiga
  | 'row:foe:atk' | 'row:foe:def' | 'row:foe:spd' | 'row:foe:accuracy'
  // Recuperación / utilidad
  | 'heal'                // cura value% del HP máximo propio
  | 'full-heal'           // cura 100% HP y limpia condiciones
  | 'leech-seed'          // drena HP del objetivo cada turno
  | 'disable'             // deshabilita el último move del objetivo
  | 'transform'           // copia stats/moves/tipo del objetivo
  | 'screen:special'      // reduce daño especial recibido 50% por 5 turnos
  | 'clear-stats'         // elimina todos los cambios de stat del campo
  // Triggers de habilidades pasivas
  | 'passive:pinch-type-boost'   // +50% daño de tipo cuando HP<30%
  | 'passive:contact-status'     // aplica estado al atacante/objetivo en contacto
  | 'passive:absorb-type'        // absorbe daño de un tipo y se potencia
  | 'passive:stab-boost'         // STAB mejorado (2.25x en vez de 1.5x)
  | 'passive:weather-speed'      // velocidad doble en cierto clima
  | 'passive:contact-boost'      // +30% daño en moves de contacto
  | 'passive:on-swap-heal'       // cura 33% HP al ir a fila trasera
  | 'passive:status-atk-boost'   // +50% ATK físico cuando tiene condición de estado
  | 'passive:end-turn-cure'      // 33% de curar condición al final del turno
  | 'passive:mirror-status'      // replica condición al agresor
  | 'passive:on-hit-disable'     // 30% de deshabilitar move que causó daño
  | 'passive:recoil-cancel'      // cancela daño de retroceso
  | 'passive:immune-paralysis'   // inmune a parálisis
  | 'passive:immune-stat-drop'   // inmune a reducción de stats
  | 'passive:free-swap'          // puede rotar a fila trasera sin golpe de oportunidad
  | 'passive:type-resist';       // resistencia doble a ciertos tipos

export interface MoveEffect {
  tag: EffectTag;
  chance?: number;        // 0-100, omitir = 100 (siempre ocurre)
  value?: number;         // etapas para stats, % para heal/absorb/recoil, daño fijo
  type?: PokemonType;     // para passives que son específicos de tipo
}

export interface Move {
  id: number;
  name: string;
  type: PokemonType | 'normal';
  category: MoveCategory;
  power: number;          // 0 para status y passive
  accuracy: number;       // 0–100; 0 = nunca falla
  effect: string;         // descripción human-readable
  effects?: MoveEffect[]; // machine-readable para el motor de batalla
  pp?: number;            // Usos del move por batalla (physical/special/status)
  apCost?: number;        // Costo en AP para activar (solo passive; 0 = siempre activo)
}
