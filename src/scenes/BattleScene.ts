import Phaser from 'phaser';
import { GAME_WIDTH, GAME_HEIGHT } from '../data/constants';
import { gen1Pokemon } from '../data/gen1';
import type { PokemonData } from '../types/Pokemon';
import { moves } from '../data/moves';
import { generateIVs, calculateStat, calculateHP } from '../systems/IVSystem';
import { generateAP, getBaseAP, getPPRange, generatePP } from '../systems/PPAPSystem';

// ── Constantes ────────────────────────────────────────────────────────────────

const SHINY_RATE = 30; // 1/30 de probabilidad

// ── Interfaces ────────────────────────────────────────────────────────────────

interface BattleMove {
  name: string;
  power: number;
  pp: number;        // total usos disponibles
  ppCurrent: number; // usos restantes
  effect: string;
}

interface CombatantIVs {
  hp: number; atk: number; def: number;
  spatk: number; spdef: number; spd: number;
}

interface Combatant {
  id: number;
  name: string;
  lv: number;
  maxHp: number;
  hp: number;
  atk: number;
  def: number;
  spd: number;
  ivs: CombatantIVs;
  move1: BattleMove;
  move2: BattleMove;
  passive: string;
  passiveEffect: string;
  ap: number;
  totalPP: number;
  moveToggle: boolean;
  isShiny: boolean;
  dead: boolean;
  side: 'player' | 'enemy';
  slot: number;
  sprite: Phaser.GameObjects.Image | null;
  hpBar: Phaser.GameObjects.Rectangle | null;
  hpBarBg: Phaser.GameObjects.Rectangle | null;
  nameLabel: Phaser.GameObjects.Text | null;
  ppLabel: Phaser.GameObjects.Text | null;
}

// ── Constantes de layout ──────────────────────────────────────────────────────

const HP_H    = 6;
const HP_W    = 60;
const B_SPR_W = 96;
const B_SPR_H = 72;

const PANEL_X = 750;
const PANEL_Y = 4;
const PANEL_W = 206;

const TYPE_COLORS: Record<string, number> = {
  fire: 0xff4400, water: 0x3399ff, grass: 0x33cc33, electric: 0xffcc00,
  psychic: 0xff66aa, ice: 0x66ccff, dragon: 0x7766ee, dark: 0x554433,
  fighting: 0xcc3300, poison: 0xaa44aa, ground: 0xddbb55, rock: 0xbbaa66,
  bug: 0xaacc22, ghost: 0x6655aa, steel: 0xaaaabb, flying: 0x8899dd,
  normal: 0x999988,
};

// 6 slots por equipo: columna back (0-2) + columna front (3-5)
const PLAYER_SLOTS = [
  { x: 240, y: 100 }, // P0 — back top
  { x: 200, y: 180 }, // P1 — back mid
  { x: 180, y: 260 }, // P2 — back bottom
  { x: 340, y: 100 }, // P3 — front top
  { x: 320, y: 195 }, // P4 — front mid
  { x: 300, y: 270 }, // P5 — front bottom
];
const ENEMY_SLOTS = [
  { x: 610, y: 110 }, // E0 — front top
  { x: 630, y: 190 }, // E1 — front mid
  { x: 660, y: 260 }, // E2 — front bottom
  { x: 730, y: 100 }, // E3 — back top
  { x: 760, y: 190 }, // E4 — back mid
  { x: 790, y: 280 }, // E5 — back bottom
];

// ── Helpers ───────────────────────────────────────────────────────────────────

function buildBattleMove(moveName: string): BattleMove {
  const found = moves.find(m => m.name === moveName);
  if (found) {
    const pp = found.pp ?? 15;
    return { name: found.name, power: found.power, pp, ppCurrent: pp, effect: found.effect };
  }
  return { name: moveName, power: 40, pp: 15, ppCurrent: 15, effect: '' };
}

function pickRandom<T>(arr: T[], count: number, usedIds: Set<number>, getId: (item: T) => number): T[] {
  const pool = arr.filter(item => !usedIds.has(getId(item)));
  const result: T[] = [];
  const available = [...pool];
  while (result.length < count && available.length > 0) {
    const idx = Math.floor(Math.random() * available.length);
    result.push(available.splice(idx, 1)[0]);
  }
  return result;
}

// ── Escena ────────────────────────────────────────────────────────────────────

export class BattleScene extends Phaser.Scene {
  private playerTeam: Combatant[] = [];
  private enemyTeam: Combatant[] = [];
  private logLines: string[] = [];
  private logText!: Phaser.GameObjects.Text;
  private infoPanel!: Phaser.GameObjects.Container;
  private infoPanelElements: Phaser.GameObjects.GameObject[] = [];
  private selectedCombatant: Combatant | null = null;
  private battleActive = false;

  // IDs seleccionados en init() para cargar en preload()
  private pendingTeams: {
    player: Array<{ id: number; isShiny: boolean }>;
    enemy:  Array<{ id: number; isShiny: boolean }>;
  } = { player: [], enemy: [] };

  constructor() { super({ key: 'BattleScene' }); }

  // ── Ciclo de vida Phaser ──────────────────────────────────────────────────

  init(): void {
    // Filtrar solo rarity 1-3
    const eligible = gen1Pokemon.filter(p => p.rarity >= 1 && p.rarity <= 3);
    const usedIds = new Set<number>();

    const pick3 = (): Array<{ id: number; isShiny: boolean }> => {
      const picked = pickRandom(eligible, 3, usedIds, p => p.id);
      picked.forEach(p => usedIds.add(p.id));
      return picked.map(p => ({ id: p.id, isShiny: Math.random() < 1 / SHINY_RATE }));
    };

    this.pendingTeams = { player: pick3(), enemy: pick3() };
  }

  preload(): void {
    this.load.image('battlefield', 'assets/campo_batalla.png');
    const allEntries = [...this.pendingTeams.player, ...this.pendingTeams.enemy];
    allEntries.forEach(({ id, isShiny }) => {
      if (isShiny) {
        this.load.spritesheet(`pk${id}_shiny`, `assets/pokemon/${id}-shiny.png`, {
          frameWidth: 64,
          frameHeight: 64,
        });
      } else {
        this.load.image(`pk${id}`, `assets/pokemon/${id}.png`);
      }
    });
    this.load.image('pkFallback', 'assets/pokemon/1.png');
    this.load.on('loaderror', (f: Phaser.Loader.File) => {
      console.warn(`sprite missing: ${f.key}`);
    });
  }

  create(): void {
    this.battleActive = false;
    this.logLines = [];
    this.drawArena();
    this.buildTeams();
    this.renderTeams();
    this.buildLog();
    this.buildInfoPanel();
    this.buildButton();
    if (this.playerTeam.length > 0) {
      this.updateInfoPanel(this.playerTeam[0]);
    }
  }

  // ── Arena ─────────────────────────────────────────────────────────────────

  private drawArena(): void {
    // Fondo oscuro
    this.add.rectangle(GAME_WIDTH / 2, GAME_HEIGHT / 2, GAME_WIDTH, GAME_HEIGHT, 0x0d1a0d);

    // Campo ocupa de y=0 a y=510 (perspectiva isométrica llena la pantalla)
    const FIELD_H = 510;
    this.add.image(GAME_WIDTH / 2, FIELD_H / 2, 'battlefield')
      .setDisplaySize(GAME_WIDTH, FIELD_H);
  }

  // ── Equipos ───────────────────────────────────────────────────────────────

  private buildTeam(side: 'player' | 'enemy', entries: Array<{ id: number; isShiny: boolean }>): Combatant[] {
    // Asignar 3 slots aleatorios distintos de los 6 disponibles
    const allSlots = [0, 1, 2, 3, 4, 5];
    for (let i = allSlots.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [allSlots[i], allSlots[j]] = [allSlots[j], allSlots[i]];
    }
    const assignedSlots = allSlots.slice(0, 3);

    return entries.map(({ id, isShiny }, idx) => {
      const slot = assignedSlots[idx];
      const pokeData = gen1Pokemon.find(p => p.id === id)!;
      const move1 = buildBattleMove(pokeData.slots.slot1[0]);
      const move2 = buildBattleMove(pokeData.slots.slot3[0]);

      const passiveName = pokeData.slots.slot2[0];
      const passiveMove = moves.find(m => m.name === passiveName);
      const passiveEffect = passiveMove ? passiveMove.effect : '';

      const lv  = 5 + Math.floor(Math.random() * 6); // nivel 5-10
      const ivs = generateIVs();
      const shinyMult = isShiny ? 1.2 : 1;
      const hp  = Math.round(calculateHP(pokeData.baseStats.hp,  ivs.hp,  lv) * shinyMult);
      const atk = Math.round(calculateStat(pokeData.baseStats.atk, ivs.atk, lv) * shinyMult);
      const def = Math.round(calculateStat(pokeData.baseStats.def, ivs.def, lv) * shinyMult);
      const spd = Math.round(calculateStat(pokeData.baseStats.spd, ivs.spd, lv) * shinyMult);

      const ppRange  = getPPRange(pokeData);
      const baseAp   = getBaseAP(pokeData);
      // Para shiny: PP garantizado = ppRange[1] + 1
      const totalPP  = isShiny ? ppRange[1] + 1 : generatePP(ppRange);
      const totalAP  = generateAP(baseAp, isShiny);

      return {
        id: pokeData.id,
        name: pokeData.name,
        lv,
        maxHp: hp,
        hp,
        atk,
        def,
        spd,
        ivs,
        move1,
        move2,
        passive: passiveName,
        passiveEffect,
        ap: totalAP,
        totalPP,
        moveToggle: false,
        isShiny,
        dead: false,
        side,
        slot,
        sprite: null,
        hpBar: null,
        hpBarBg: null,
        nameLabel: null,
        ppLabel: null,
      };
    });
  }

  private buildTeams(): void {
    this.playerTeam = this.buildTeam('player', this.pendingTeams.player);
    this.enemyTeam  = this.buildTeam('enemy',  this.pendingTeams.enemy);
  }

  private addShinySparkle(cx: number, cy: number): void {
    const RADIUS = 70;
    const COLORS = [0xffffff, 0xffe566];
    const spawnOne = () => {
      const angle = Math.random() * Math.PI * 2;
      const dist  = Math.random() * RADIUS;
      const rx    = cx + Math.cos(angle) * dist;
      const ry    = cy + Math.sin(angle) * dist;
      const size  = 4 + Math.floor(Math.random() * 5);
      const color = COLORS[Math.floor(Math.random() * COLORS.length)];
      const g = this.add.graphics();
      g.setAlpha(0).setDepth(15);
      g.fillStyle(color, 1);
      g.fillRect(rx - size, ry - 1, size * 2, 2);
      g.fillRect(rx - 1, ry - size, 2, size * 2);
      this.tweens.add({
        targets: g, alpha: 0.9, duration: 600,
        ease: 'Quad.easeInOut', yoyo: true,
        onComplete: () => g.destroy(),
      });
    };
    this.time.addEvent({ loop: true, delay: 350, callback: spawnOne });
  }

  private renderTeams(): void {
    const place = (team: Combatant[], slots: typeof PLAYER_SLOTS, flipX: boolean) => {
      for (const p of team) {
        const pos         = slots[p.slot];
        const BAR_Y_OFF   = -(B_SPR_H / 2 + 14);
        const LABEL_Y_OFF = BAR_Y_OFF - 11;
        const PP_Y_OFF    = LABEL_Y_OFF - 10;

        p.hpBarBg = this.add.rectangle(pos.x, pos.y + BAR_Y_OFF, HP_W, HP_H, 0x222222).setOrigin(0.5);
        p.hpBar   = this.add.rectangle(pos.x - HP_W / 2, pos.y + BAR_Y_OFF, HP_W, HP_H, 0x44cc44).setOrigin(0, 0.5);

        const label      = p.isShiny ? `★ ${p.name} lv${p.lv}` : `${p.name} lv${p.lv}`;
        const labelColor = p.isShiny ? '#ffe566' : '#ffffff';
        p.nameLabel = this.add.text(pos.x, pos.y + LABEL_Y_OFF, label, {
          fontSize: '10px', color: labelColor,
          stroke: '#000000', strokeThickness: 2,
        }).setOrigin(0.5);

        p.ppLabel = this.add.text(pos.x, pos.y + PP_Y_OFF, this.ppLabelText(p), {
          fontSize: '8px', color: '#aaffaa',
          stroke: '#000000', strokeThickness: 1,
        }).setOrigin(0.5);

        const baseKey = this.textures.exists(`pk${p.id}_shiny`) ? `pk${p.id}_shiny` : `pk${p.id}`;
        const key     = this.textures.exists(baseKey) ? baseKey : 'pkFallback';
        const frame   = (p.isShiny && this.textures.exists(`pk${p.id}_shiny`)) ? 1 : undefined;

        p.sprite = this.add.image(pos.x, pos.y, key, frame)
          .setDisplaySize(B_SPR_W, B_SPR_H)
          .setFlipX(flipX)
          .setInteractive();

        if (p.isShiny) this.addShinySparkle(pos.x, pos.y);

        p.sprite.on('pointerdown', () => this.updateInfoPanel(p));

        const depth = Math.round(pos.y / 5);
        p.sprite.setDepth(depth);
        p.hpBar?.setDepth(depth + 1);
        p.hpBarBg?.setDepth(depth + 1);
        p.nameLabel?.setDepth(depth + 1);
        p.ppLabel?.setDepth(depth + 1);
      }
    };

    place(this.playerTeam, PLAYER_SLOTS, true);
    place(this.enemyTeam,  ENEMY_SLOTS,  false);
  }

  // ── Log ───────────────────────────────────────────────────────────────────

  private buildLog(): void {
    this.add.rectangle(GAME_WIDTH / 2, GAME_HEIGHT - 22, GAME_WIDTH - 60, 36, 0x111111, 0.75).setOrigin(0.5);
    this.logText = this.add.text(50, GAME_HEIGHT - 36, '', { fontSize: '10px', color: '#dddddd' });
  }

  private pushLog(msg: string): void {
    this.logLines.push(msg);
    if (this.logLines.length > 4) this.logLines.shift();
    this.logText.setText(this.logLines.join('  ·  '));
  }

  // ── PP helpers ────────────────────────────────────────────────────────────

  private ppLabelText(p: Combatant): string {
    const m1 = p.move1.name.substring(0, 8);
    const m2 = p.move2.name.substring(0, 8);
    return `M1:${p.move1.ppCurrent}  M2:${p.move2.ppCurrent}`;
  }

  private refreshPPLabel(p: Combatant): void {
    if (p.ppLabel) p.ppLabel.setText(this.ppLabelText(p));
  }

  // ── Info Panel ────────────────────────────────────────────────────────────

  private buildInfoPanel(): void {
    const bg = this.add.rectangle(PANEL_X, PANEL_Y, PANEL_W, 460, 0x1a0e08, 0.96)
      .setOrigin(0, 0).setDepth(30);
    bg.setStrokeStyle(1, 0xddaa00);
    this.infoPanel = this.add.container(0, 0).setDepth(30);
    this.infoPanel.add(bg);
    const placeholder = this.add.text(
      PANEL_X + PANEL_W / 2, PANEL_Y + 230,
      'Click a Pokemon', { fontSize: '10px', color: '#666666' }
    ).setOrigin(0.5).setDepth(31);
    this.infoPanel.add(placeholder);
    this.infoPanelElements = [placeholder];
  }

  private updateInfoPanel(p: Combatant): void {
    this.selectedCombatant = p;
    this.infoPanelElements.forEach(el => el.destroy());
    this.infoPanelElements = [];

    const pokeData = gen1Pokemon.find(pk => pk.id === p.id);
    const primaryType = pokeData?.types[0] ?? 'normal';
    const typeColor = TYPE_COLORS[primaryType] ?? 0x999988;

    // ── a) Header ─────────────────────────────────────────────────────────
    const headerY = PANEL_Y + 8;

    // Tipo dot
    const typeDot = this.add.graphics().setDepth(31);
    typeDot.fillStyle(typeColor, 1);
    typeDot.fillCircle(PANEL_X + 10, headerY + 5, 5);
    this.infoPanelElements.push(typeDot);

    // Nombre
    const nameText = this.add.text(
      PANEL_X + 22, headerY,
      p.isShiny ? `★ ${p.name}` : p.name,
      { fontSize: '11px', color: '#ffffff', fontStyle: 'bold' }
    ).setDepth(31);
    this.infoPanelElements.push(nameText);

    // Nivel
    const lvText = this.add.text(
      PANEL_X + PANEL_W - 6, headerY,
      `lv: ${p.lv}`,
      { fontSize: '9px', color: '#aaaaaa' }
    ).setOrigin(1, 0).setDepth(31);
    this.infoPanelElements.push(lvText);

    // HP bar fina
    const hpBarY = headerY + 16;
    const hpBarW = PANEL_W - 20;
    const hpRatio = Math.max(0, p.hp / p.maxHp);
    const hpColor = hpRatio > 0.5 ? 0x44cc44 : hpRatio > 0.25 ? 0xddcc00 : 0xcc2222;

    const hpBarBg = this.add.rectangle(PANEL_X + 10, hpBarY, hpBarW, 4, 0x333333).setOrigin(0, 0).setDepth(31);
    const hpBarFill = this.add.rectangle(PANEL_X + 10, hpBarY, Math.max(1, hpBarW * hpRatio), 4, hpColor).setOrigin(0, 0).setDepth(31);
    const hpLabelThin = this.add.text(PANEL_X + 10, hpBarY + 5, `${p.hp}/${p.maxHp}`, { fontSize: '7px', color: '#888888' }).setDepth(31);
    this.infoPanelElements.push(hpBarBg, hpBarFill, hpLabelThin);

    // ── b) Evo + Sprite ───────────────────────────────────────────────────
    const evoY = PANEL_Y + 32;

    if (pokeData?.evolve?.level) {
      const evoText = this.add.text(
        PANEL_X + 10, evoY,
        `evo: ${pokeData.evolve.level}`,
        { fontSize: '8px', color: '#888888' }
      ).setDepth(31);
      this.infoPanelElements.push(evoText);
    }

    const spriteRectX = PANEL_X + PANEL_W - 54;
    const spriteRectY = evoY;
    const spriteRect = this.add.rectangle(spriteRectX, spriteRectY, 44, 44, 0x330000).setOrigin(0, 0).setDepth(31);
    this.infoPanelElements.push(spriteRect);

    const baseKey = this.textures.exists(`pk${p.id}_shiny`) ? `pk${p.id}_shiny` : `pk${p.id}`;
    const spriteKey = this.textures.exists(baseKey) ? baseKey : 'pkFallback';
    const spriteFrame = (p.isShiny && this.textures.exists(`pk${p.id}_shiny`)) ? 1 : undefined;
    const miniSprite = this.add.image(spriteRectX + 22, spriteRectY + 22, spriteKey, spriteFrame)
      .setDisplaySize(64, 48).setDepth(32);
    this.infoPanelElements.push(miniSprite);

    // ── c) Stats ──────────────────────────────────────────────────────────
    const statsStartY = PANEL_Y + 100;
    const statRows: Array<{ label: string; value: number; barColor: number }> = [
      { label: 'hp',  value: p.maxHp, barColor: 0x44cc44 },
      { label: 'atk', value: p.atk,   barColor: 0xdd3333 },
      { label: 'spd', value: p.spd,   barColor: 0x3366dd },
    ];
    const STAT_BAR_W = 70;
    const STAT_MAX   = 200;

    statRows.forEach((stat, i) => {
      const rowY = statsStartY + i * 18;
      const statLabel = this.add.text(PANEL_X + 10, rowY, `${stat.label}: ${stat.value}`, { fontSize: '8px', color: '#ffffff' }).setDepth(31);
      const statBg    = this.add.rectangle(PANEL_X + 55, rowY + 4, STAT_BAR_W, 6, 0x333333).setOrigin(0, 0.5).setDepth(31);
      const fillW     = Math.max(1, Math.round(STAT_BAR_W * Math.min(stat.value / STAT_MAX, 1)));
      const statFill  = this.add.rectangle(PANEL_X + 55, rowY + 4, fillW, 6, stat.barColor).setOrigin(0, 0.5).setDepth(31);
      this.infoPanelElements.push(statLabel, statBg, statFill);

      // Dots PP (fila hp = índice 0)
      if (i === 0) {
        const ppCount = Math.min(p.totalPP, 8);
        for (let d = 0; d < ppCount; d++) {
          const dot = this.add.rectangle(PANEL_X + 132 + d * 8, rowY + 4, 6, 6, 0xdd2222).setOrigin(0, 0.5).setDepth(31);
          this.infoPanelElements.push(dot);
        }
      }

      // Dots AP (fila atk = índice 1)
      if (i === 1) {
        const apCount = Math.min(p.ap, 6);
        for (let d = 0; d < apCount; d++) {
          const dot = this.add.rectangle(PANEL_X + 132 + d * 8, rowY + 4, 6, 6, 0x2255dd).setOrigin(0, 0.5).setDepth(31);
          this.infoPanelElements.push(dot);
        }
      }
    });

    // Separador
    const sep = this.add.rectangle(PANEL_X + 10, statsStartY + 3 * 18, PANEL_W - 20, 1, 0x553322).setOrigin(0, 0).setDepth(31);
    this.infoPanelElements.push(sep);

    // ── d) Slot rows ──────────────────────────────────────────────────────
    const slotsStartY = PANEL_Y + 160;
    const ROW_H       = 52;

    const slotData: Array<{
      active: string;
      altKey: 'slot1' | 'slot2' | 'slot3';
      ppMove: BattleMove | null;
      isPassive: boolean;
    }> = [
      {
        active:    p.move1.name,
        altKey:    'slot1',
        ppMove:    p.move1,
        isPassive: false,
      },
      {
        active:    p.passive,
        altKey:    'slot2',
        ppMove:    null,
        isPassive: true,
      },
      {
        active:    p.move2.name,
        altKey:    'slot3',
        ppMove:    p.move2,
        isPassive: false,
      },
    ];

    slotData.forEach((row, i) => {
      const rowY = slotsStartY + i * ROW_H;
      const rowW = PANEL_W - 12;

      // Fondo de fila
      const rowBg = this.add.rectangle(PANEL_X + 6, rowY, rowW, 48, 0x2a1408).setOrigin(0, 0).setDepth(31);
      rowBg.setStrokeStyle(1, 0x553322);
      this.infoPanelElements.push(rowBg);

      // Texto activo (izquierda)
      const activeName = row.active.substring(0, 12);
      const activeText = this.add.text(
        PANEL_X + 10, rowY + 6,
        activeName,
        { fontSize: '9px', color: '#ffffff', fontStyle: 'bold' }
      ).setDepth(31);
      this.infoPanelElements.push(activeText);

      // Texto alternativa (derecha)
      const altName = (pokeData?.slots[row.altKey][1] ?? '-').substring(0, 10);
      const altText = this.add.text(
        PANEL_X + PANEL_W - 8, rowY + 6,
        altName,
        { fontSize: '8px', color: '#888888' }
      ).setOrigin(1, 0).setDepth(31);
      this.infoPanelElements.push(altText);

      if (row.isPassive) {
        // Passive label
        const passiveLabel = this.add.text(
          PANEL_X + 10, rowY + 26,
          'PASSIVE',
          { fontSize: '7px', color: '#664400' }
        ).setDepth(31);
        this.infoPanelElements.push(passiveLabel);
      } else if (row.ppMove) {
        // PP bar
        const ppBarY = rowY + 30;
        const ppBarW = PANEL_W - 20;
        const ppRatio = row.ppMove.pp > 0 ? Math.max(0, row.ppMove.ppCurrent / row.ppMove.pp) : 0;

        const ppBg   = this.add.rectangle(PANEL_X + 10, ppBarY, ppBarW, 5, 0x331100).setOrigin(0, 0).setDepth(31);
        const ppFill = this.add.rectangle(PANEL_X + 10, ppBarY, Math.max(1, ppBarW * ppRatio), 5, 0xdd2200).setOrigin(0, 0).setDepth(31);

        // Pokeball dot al final del relleno
        const dotX = PANEL_X + 10 + Math.max(1, ppBarW * ppRatio);
        const ppDot = this.add.graphics().setDepth(32);
        ppDot.fillStyle(0xffffff, 1);
        ppDot.fillCircle(dotX, ppBarY + 2, 4);

        const ppLabel = this.add.text(
          PANEL_X + 10, ppBarY + 7,
          `${row.ppMove.ppCurrent}/${row.ppMove.pp}`,
          { fontSize: '7px', color: '#888888' }
        ).setDepth(31);

        this.infoPanelElements.push(ppBg, ppFill, ppDot, ppLabel);
      }
    });
  }

  // ── Botones ───────────────────────────────────────────────────────────────

  private buildButton(): void {
    const back = this.add.text(52, 20, '← Volver', {
      fontSize: '12px', color: '#cccccc', backgroundColor: '#222222',
      padding: { x: 10, y: 5 },
    }).setOrigin(0.5).setInteractive({ useHandCursor: true }).setDepth(10);

    back.on('pointerover', () => back.setStyle({ backgroundColor: '#444444' }));
    back.on('pointerout',  () => back.setStyle({ backgroundColor: '#222222' }));
    back.on('pointerdown', () => this.scene.start('BootScene'));

    const reroll = this.add.text(GAME_WIDTH - 60, 20, '🎲 Re-roll', {
      fontSize: '12px', color: '#cccccc', backgroundColor: '#222222',
      padding: { x: 10, y: 5 },
    }).setOrigin(0.5).setInteractive({ useHandCursor: true }).setDepth(10);

    reroll.on('pointerover', () => reroll.setStyle({ backgroundColor: '#444444' }));
    reroll.on('pointerout',  () => reroll.setStyle({ backgroundColor: '#222222' }));
    reroll.on('pointerdown', () => this.scene.restart());

    const btn = this.add.text(GAME_WIDTH / 2, GAME_HEIGHT - 68, '▶  AUTO-BATALLA', {
      fontSize: '13px', color: '#ffffff', backgroundColor: '#1a4a1a',
      padding: { x: 16, y: 7 },
    }).setOrigin(0.5).setInteractive({ useHandCursor: true });

    btn.on('pointerover', () => btn.setStyle({ backgroundColor: '#2a6a2a' }));
    btn.on('pointerout',  () => btn.setStyle({ backgroundColor: '#1a4a1a' }));
    btn.on('pointerdown', () => {
      if (this.battleActive) return;
      this.battleActive = true;
      btn.destroy();
      void this.runBattle();
    });
  }

  // ── Lógica de batalla ─────────────────────────────────────────────────────

  private getAlive(team: Combatant[]): Combatant[] { return team.filter(p => !p.dead); }

  private getFrontTarget(team: Combatant[]): Combatant | undefined {
    const alive = this.getAlive(team);
    return alive.find(p => p.slot < 2) ?? alive[0];
  }

  private chooseMove(p: Combatant): BattleMove | null {
    // Elige basándose en moveToggle; si ese move no tiene PP, intenta el otro
    const preferred  = p.moveToggle ? p.move2 : p.move1;
    const fallback   = p.moveToggle ? p.move1 : p.move2;
    if (preferred.ppCurrent > 0) {
      p.moveToggle = !p.moveToggle;
      return preferred;
    }
    if (fallback.ppCurrent > 0) {
      // No alternamos toggle para no "saltarnos" cuando el PP se recargue
      return fallback;
    }
    return null; // Sin PP en ningún move
  }

  private calcDamage(a: Combatant, d: Combatant, move: BattleMove): number {
    const backMod = d.slot === 2 ? 0.7 : 1;
    return Math.max(1, Math.floor((a.atk * move.power) / (d.def * 5) * backMod));
  }

  private refreshHpBar(p: Combatant): void {
    if (!p.hpBar) return;
    const ratio = Math.max(0, p.hp / p.maxHp);
    p.hpBar.width = HP_W * ratio;
    const color = ratio > 0.5 ? 0x44cc44 : ratio > 0.25 ? 0xddcc00 : 0xcc2222;
    p.hpBar.setFillStyle(color);
  }

  private animateAttack(attacker: Combatant, target: Combatant): Promise<void> {
    return new Promise(resolve => {
      if (!attacker.sprite) { resolve(); return; }
      const dir = attacker.side === 'player' ? 18 : -18;
      this.tweens.add({
        targets: attacker.sprite,
        x: attacker.sprite.x + dir,
        duration: 70, yoyo: true, repeat: 1,
        onComplete: () => {
          if (!target.sprite) { resolve(); return; }
          const shakeDir = attacker.side === 'player' ? 5 : -5;
          this.tweens.add({
            targets: target.sprite,
            x: target.sprite.x + shakeDir,
            duration: 35, yoyo: true, repeat: 3,
            onComplete: () => resolve(),
          });
        },
      });
    });
  }

  // Flash overlay sobre el sprite al subir/bajar stats
  // direction 'up' → rojo, 'down' → azul; duración total ~1500ms
  flashStatChange(p: Combatant, direction: 'up' | 'down'): void {
    if (!p.sprite) return;
    const pos   = p.side === 'player' ? PLAYER_SLOTS[p.slot] : ENEMY_SLOTS[p.slot];
    const color = direction === 'up' ? 0xff3333 : 0x3366ff;
    const depth = p.slot * 2 + 0.5;

    const overlay = this.add.rectangle(pos.x, pos.y, B_SPR_W, B_SPR_H, color, 0)
      .setDepth(depth);

    // Fase 1: fade-in (200ms)
    this.tweens.add({
      targets: overlay,
      alpha: 0.65,
      duration: 200,
      ease: 'Linear',
      onComplete: () => {
        // Fase 2: hold (600ms) → fade-out (700ms)
        this.tweens.add({
          targets: overlay,
          alpha: 0,
          delay: 600,
          duration: 700,
          ease: 'Quad.easeIn',
          onComplete: () => overlay.destroy(),
        });
      },
    });
  }

  private animateDeath(p: Combatant): Promise<void> {
    return new Promise(resolve => {
      const objs = [p.sprite, p.hpBar, p.hpBarBg, p.nameLabel, p.ppLabel]
        .filter((o): o is NonNullable<typeof o> => o !== null);
      if (!objs.length) { resolve(); return; }
      this.tweens.add({
        targets: objs,
        alpha: 0,
        y: `+=${20}`,
        duration: 350,
        onComplete: () => resolve(),
      });
    });
  }

  private wait(ms: number): Promise<void> {
    return new Promise(r => this.time.delayedCall(ms, r));
  }

  private async runBattle(): Promise<void> {
    while (true) {
      const order = [
        ...this.getAlive(this.playerTeam),
        ...this.getAlive(this.enemyTeam),
      ].sort((a, b) => b.spd - a.spd);

      for (const attacker of order) {
        if (attacker.dead) continue;

        const opposing = attacker.side === 'player' ? this.enemyTeam : this.playerTeam;
        const target = this.getFrontTarget(opposing);
        if (!target) continue;

        const move = this.chooseMove(attacker);
        if (!move) continue; // Sin PP, se salta

        move.ppCurrent -= 1;
        this.refreshPPLabel(attacker);

        const dmg = this.calcDamage(attacker, target, move);
        target.hp = Math.max(0, target.hp - dmg);
        this.pushLog(`${attacker.name} → ${move.name} → ${target.name}  -${dmg} HP`);

        await this.animateAttack(attacker, target);
        this.refreshHpBar(target);

        if (target.hp <= 0) {
          target.dead = true;
          await this.animateDeath(target);
        }

        if (this.getAlive(this.enemyTeam).length  === 0) { this.endBattle('player'); return; }
        if (this.getAlive(this.playerTeam).length === 0) { this.endBattle('enemy');  return; }

        // Comprobar empate por PP agotados
        const playerCantAct = this.getAlive(this.playerTeam).every(
          p => p.move1.ppCurrent === 0 && p.move2.ppCurrent === 0
        );
        const enemyCantAct = this.getAlive(this.enemyTeam).every(
          p => p.move1.ppCurrent === 0 && p.move2.ppCurrent === 0
        );
        if (playerCantAct && enemyCantAct) { this.endBattle('draw'); return; }

        await this.wait(320);
      }
    }
  }

  private endBattle(winner: 'player' | 'enemy' | 'draw'): void {
    const text  = winner === 'player' ? '¡VICTORIA!' : winner === 'enemy' ? '¡DERROTA!' : '¡EMPATE!';
    const color = winner === 'player' ? '#44ff44'    : winner === 'enemy' ? '#ff4444'   : '#ffaa00';

    this.add.rectangle(GAME_WIDTH / 2, GAME_HEIGHT / 2, 290, 94, 0x000000, 0.87).setOrigin(0.5);
    this.add.text(GAME_WIDTH / 2, GAME_HEIGHT / 2 - 16, text, {
      fontSize: '38px', color,
      stroke: '#000000', strokeThickness: 4,
    }).setOrigin(0.5);
    this.add.text(GAME_WIDTH / 2, GAME_HEIGHT / 2 + 26, 'Click para reiniciar', {
      fontSize: '12px', color: '#aaaaaa',
    }).setOrigin(0.5);
    this.input.once('pointerdown', () => this.scene.restart());
  }
}
