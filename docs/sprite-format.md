# Formato de sprites Pokemon

## Tipos de archivo

| Tipo | Dimensiones | Ejemplo |
|---|---|---|
| Base / mega / formas nombradas | 40×30 px | `1.png`, `6-mega-x.png`, `25-belle.png` |
| Shiny / gmax-shiny | 128×64 px | `1-shiny.png`, `6-gmax-shiny.png` |

## Spritesheets shiny (128×64)

Los archivos `*-shiny.png` y `*-gmax-shiny.png` contienen **dos frames de 64×64 px** lado a lado:

```
┌──────────────────────────────────┐
│  frame 0 (0–64)  │  frame 1 (64–128) │
│  paleta normal   │  paleta shiny      │
└──────────────────────────────────┘
        128 px total × 64 px alto
```

- **Frame 0** (izquierdo): paleta normal/base
- **Frame 1** (derecho): paleta shiny — este es el que se debe mostrar

## Cómo cargar en Phaser 3

### Sprites base (40×30)
```typescript
this.load.image(key, getSpritePath(id, 'base'));
// en create:
this.add.image(x, y, key).setDisplaySize(SPRITE_W, SPRITE_H);
```

### Sprites shiny (128×64 spritesheet)
```typescript
this.load.spritesheet(key, getSpritePath(id, 'shiny'), {
  frameWidth: 64,
  frameHeight: 64,
});
// en create — frame 1 = paleta shiny:
this.add.image(x, y, key, 1).setDisplaySize(SPRITE_W, SPRITE_H);
```

## Advertencia: setCrop + setDisplaySize no funcionan juntos

En Phaser 3, `setCrop` opera en el espacio de la textura original **antes** de que `setDisplaySize` escale. El resultado es que el sprite se muestra reducido a la mitad del ancho esperado.

```typescript
// MAL — el sprite shiny aparece aplastado (40×60 en lugar de 80×60)
this.add.image(x, y, key).setCrop(0, 0, 64, 64).setDisplaySize(80, 60);

// BIEN — usar spritesheet con frame index
this.load.spritesheet(key, path, { frameWidth: 64, frameHeight: 64 });
this.add.image(x, y, key, 1).setDisplaySize(80, 60);
```

## Detección en código

```typescript
const isSpritesheet = (form as string).includes('shiny');
```

## Escala de visualización

Los sprites nativos son 40×30. Para mostrarlos al 200%:

```typescript
// src/data/constants.ts
export const SPRITE_W = 80;
export const SPRITE_H = 60;
```

## Formas especiales disponibles (Gen 1 verificado)

| Forma | IDs con sprite normal (no solo shiny) |
|---|---|
| `mega` | 3, 9, 15, 18, 65, 80, 94, 115, 127, 130, 142 |
| `mega-x` / `mega-y` | 6, 150 |
| `gmax-shiny` | 3, 6, 9, 12, 25, 52, 68, 94, 99, 131, 133, 143 |
| `belle`, `cosplay`, `libre`, `phd`, `pop-star`, `rock-star` | 25 (Pikachu) |
| `form-1` (solo shiny) | 3, 6, 9, 15, 18, 19, 20, 26, 27, 28, 37, 38, 50, 51, 52, 53, 58, 59, 65, 74, 75, 76, 77, 78, 79, 80, 83, 88, 89, 94, 100, 101, 103, 105, 110, 115, 122, 127, 128, 130, 142, 144, 145, 146, 150 |
