import Phaser from 'phaser';
import { getSpritePath } from '../systems/AssetLoader';
import type { SpriteForm } from '../systems/AssetLoader';
import { GAME_WIDTH, GAME_HEIGHT, SPRITE_W, SPRITE_H } from '../data/constants';

const MEGA_FORMS: Partial<Record<number, SpriteForm[]>> = {
  3: ['mega'], 6: ['mega-x', 'mega-y'], 9: ['mega'],
  15: ['mega'], 18: ['mega'], 65: ['mega'], 80: ['mega'],
  94: ['mega'], 115: ['mega'], 127: ['mega'], 130: ['mega'],
  142: ['mega'], 150: ['mega-x', 'mega-y'],
};

const PIKACHU_FORMS: SpriteForm[] = ['belle', 'cosplay', 'libre', 'phd', 'pop-star', 'rock-star'];
const GMAX_SHINY_IDS = new Set([3, 6, 9, 12, 25, 52, 68, 94, 99, 131, 133, 143]);
const GEN1_MAX_ID = 151;

// Shiny PNGs are 128×64 spritesheets: frame 0 (left) = normal palette, frame 1 (right) = shiny palette
const SHINY_FRAME_W = 64;
const SHINY_FRAME_H = 64;
const SHINY_FRAME_INDEX = 1;

function getAvailableForms(id: number): SpriteForm[] {
  const forms: SpriteForm[] = ['base', 'shiny'];
  const megaForms = MEGA_FORMS[id];
  if (megaForms) forms.push(...megaForms);
  if (id === 25) forms.push(...PIKACHU_FORMS);
  if (GMAX_SHINY_IDS.has(id)) forms.push('gmax-shiny');
  return forms;
}

function randomInt(max: number): number {
  return Math.floor(Math.random() * max);
}

interface DemoEntry {
  id: number;
  form: SpriteForm;
  key: string;
  isSpritesheet: boolean;
}

export class BootScene extends Phaser.Scene {
  private demoEntries: DemoEntry[] = [];
  private failedKeys = new Set<string>();

  constructor() {
    super({ key: 'BootScene' });
  }

  init(): void {
    this.demoEntries = [];
    this.failedKeys = new Set();

    const usedIds = new Set<number>();
    while (this.demoEntries.length < 3) {
      const id = randomInt(GEN1_MAX_ID) + 1;
      if (usedIds.has(id)) continue;
      usedIds.add(id);

      const forms = getAvailableForms(id);
      const form = forms[randomInt(forms.length)];
      const isSpritesheet = (form as string).includes('shiny');
      this.demoEntries.push({ id, form, key: `pokemon_${id}_${form}`, isSpritesheet });
    }
  }

  preload(): void {
    // Bulbasaur base como fallback garantizado (000.png no existe en el repo)
    this.load.image('fallback', getSpritePath(1));

    this.load.on('loaderror', (file: Phaser.Loader.File) => {
      this.failedKeys.add(file.key);
    });

    for (const entry of this.demoEntries) {
      const path = getSpritePath(entry.id, entry.form);
      if (entry.isSpritesheet) {
        this.load.spritesheet(entry.key, path, {
          frameWidth: SHINY_FRAME_W,
          frameHeight: SHINY_FRAME_H,
        });
      } else {
        this.load.image(entry.key, path);
      }
    }
  }

  create(): void {
    const positions = [
      { x: GAME_WIDTH * 0.25, y: GAME_HEIGHT * 0.4 },
      { x: GAME_WIDTH * 0.5,  y: GAME_HEIGHT * 0.4 },
      { x: GAME_WIDTH * 0.75, y: GAME_HEIGHT * 0.4 },
    ];

    for (let i = 0; i < this.demoEntries.length; i++) {
      const entry = this.demoEntries[i];
      const pos = positions[i];
      const failed = this.failedKeys.has(entry.key);
      const textureKey = failed ? 'fallback' : entry.key;
      const frame = (!failed && entry.isSpritesheet) ? SHINY_FRAME_INDEX : undefined;

      this.add.image(pos.x, pos.y, textureKey, frame).setDisplaySize(SPRITE_W, SPRITE_H);

      if (!failed && entry.isSpritesheet) {
        this.addShinySparkle(pos.x, pos.y);
      }

      const label = `#${entry.id} ${entry.form}`;
      this.add.text(pos.x, pos.y + SPRITE_H / 2 + 16, label, {
        fontSize: '14px',
        color: '#ffffff',
        align: 'center',
      }).setOrigin(0.5);
    }

    this.addButton(GAME_WIDTH / 2 - 110, GAME_HEIGHT - 50, '🎲  Re-roll', () => {
      this.scene.restart();
    });

    this.addButton(GAME_WIDTH / 2 + 110, GAME_HEIGHT - 50, '⚔️  Batalla', () => {
      this.scene.start('BattleScene');
    });
  }

  private addShinySparkle(cx: number, cy: number): void {
    const RADIUS = 35;
    const COLORS = [0xffffff, 0xffe566];

    const spawnOne = () => {
      const angle = Math.random() * Math.PI * 2;
      const dist = Math.random() * RADIUS;
      const rx = cx + Math.cos(angle) * dist;
      const ry = cy + Math.sin(angle) * dist;
      const size = 4 + Math.floor(Math.random() * 5); // 4..8
      const color = COLORS[Math.floor(Math.random() * COLORS.length)];

      const g = this.add.graphics();
      g.setAlpha(0);
      g.setDepth(15);
      g.fillStyle(color, 1);
      g.fillRect(rx - size, ry - 1, size * 2, 2);
      g.fillRect(rx - 1, ry - size, 2, size * 2);

      this.tweens.add({
        targets: g,
        alpha: 0.9,
        duration: 600,
        ease: 'Quad.easeInOut',
        yoyo: true,
        onComplete: () => g.destroy(),
      });
    };

    this.time.addEvent({ loop: true, delay: 350, callback: spawnOne });
  }

  private addButton(x: number, y: number, label: string, onClick: () => void): void {
    const btn = this.add.text(x, y, label, {
      fontSize: '14px',
      color: '#ffffff',
      backgroundColor: '#1a3a1a',
      padding: { x: 16, y: 8 },
    }).setOrigin(0.5).setInteractive({ useHandCursor: true });

    btn.on('pointerover', () => btn.setStyle({ backgroundColor: '#2a5a2a' }));
    btn.on('pointerout',  () => btn.setStyle({ backgroundColor: '#1a3a1a' }));
    btn.on('pointerdown', onClick);
  }
}
