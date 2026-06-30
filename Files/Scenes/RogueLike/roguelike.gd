extends Node2D

const FONT_PATH := "res://Files/Fonts/pokemon-ds-font.ttf"
const AVAILABLE := ["pidgey", "caterpie"]
const COLS      := 10
const CELL_W    := 100
const CELL_H    := 88
const MAX_TEAM  := 3

const C_BG          := Color(0.035, 0.0425833, 0.1,  1)
const C_PANEL       := Color(0.042, 0.052,     0.115, 1)
const C_CELL        := Color(0.065, 0.08,      0.155, 1)
const C_CELL_LOCK   := Color(0.048, 0.058,     0.115, 1)
const C_SLOT_EMPTY  := Color(0.050, 0.063,     0.130, 1)
const C_SLOT_FILLED := Color(0.060, 0.140,     0.260, 1)
const C_SELECTED_HL := Color(0.215686, 0.615686, 0.670588, 0.48)
const C_CURSOR_HL   := Color(0.90, 0.85, 0.12, 0.32)

var _font: Font

var pokemon_list: Array = []
var cursor_idx: int     = 0
var selected: Array     = []

var _scroll: ScrollContainer
var _grid: GridContainer
var _cells: Array = []

var _slot_panels:  Array = []
var _slot_sprites: Array = []
var _slot_names:   Array = []

var _title_label:  Label
var _cursor_name:  Label
var _cursor_types: Label
var _cursor_stats: Label
var _confirm_hint: Label

func _ready() -> void:
    _font = load(FONT_PATH)
    _build_list()
    _build_ui()
    _refresh_all()

# ── Data ────────────────────────────────────────────────────────────────────

func _build_list() -> void:
    # Collect every species that appears as someone else's evolution target
    var evo_targets := {}
    for key: String in rl_pkmn.dex:
        var e: Dictionary = rl_pkmn.dex[key]
        var evolve: Array = e.get("evolve", [])
        if evolve.size() > 0:
            evo_targets[evolve[0]] = true

    # Only keep true base forms (not reachable via evolution) from Gen 1
    for key: String in rl_pkmn.dex:
        var e: Dictionary = rl_pkmn.dex[key]
        if e.has("sprite_form"):
            continue
        var num: int = e.get("dex_num", 0)
        if num >= 1 and num <= 151 and not evo_targets.has(key):
            pokemon_list.append({
                "species": key,
                "dex_num": num,
                "rarity":  e.get("rarity", 1),
                "name":    e.get("name", key.capitalize()),
            })
    pokemon_list.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
        return a["dex_num"] < b["dex_num"])

# ── UI construction ─────────────────────────────────────────────────────────

func _build_ui() -> void:
    var bg := ColorRect.new()
    bg.color = C_BG
    bg.size  = Vector2(1600, 900)
    add_child(bg)

    # Left: scrollable dex grid
    _title_label = _lbl("Choose your team  (0 / 3)", Vector2(30, 12), 44)
    add_child(_title_label)

    _scroll = ScrollContainer.new()
    _scroll.position = Vector2(50, 68)
    _scroll.size     = Vector2(COLS * CELL_W + 8, 822)
    _scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    add_child(_scroll)

    _grid = GridContainer.new()
    _grid.columns = COLS
    _scroll.add_child(_grid)

    for i: int in pokemon_list.size():
        var cell := _make_cell(i)
        _grid.add_child(cell)
        _cells.append(cell)

    # Right: team panel
    var right_bg := ColorRect.new()
    right_bg.color    = C_PANEL
    right_bg.position = Vector2(1108, 0)
    right_bg.size     = Vector2(492, 900)
    add_child(right_bg)

    add_child(_lbl("Your Team", Vector2(1130, 15), 40))

    for i: int in 3:
        _build_slot(i)

    var div := ColorRect.new()
    div.color    = Color(0.10, 0.12, 0.24, 1)
    div.position = Vector2(1120, 494)
    div.size     = Vector2(460, 2)
    add_child(div)

    _cursor_name = _lbl("", Vector2(1130, 510), 40)
    _cursor_name.add_theme_color_override("font_color", Color(0.9, 0.95, 1.0, 1))
    add_child(_cursor_name)

    _cursor_types = _lbl("", Vector2(1130, 556), 26)
    _cursor_types.add_theme_color_override("font_color", Color(0.65, 0.75, 0.82, 1))
    add_child(_cursor_types)

    _cursor_stats = _lbl("", Vector2(1130, 596), 26)
    _cursor_stats.add_theme_color_override("font_color", Color(0.85, 0.92, 0.88, 1))
    add_child(_cursor_stats)

    var div2 := ColorRect.new()
    div2.color    = Color(0.10, 0.12, 0.24, 1)
    div2.position = Vector2(1120, 722)
    div2.size     = Vector2(460, 2)
    add_child(div2)

    var inst := _lbl("Z    Select / Deselect\nX    Back", Vector2(1130, 730), 28)
    inst.add_theme_color_override("font_color", Color(0.55, 0.65, 0.72, 1))
    add_child(inst)

    _confirm_hint = _lbl("", Vector2(1130, 840), 42)
    _confirm_hint.add_theme_color_override("font_color", Color(0.2, 0.95, 0.5, 1))
    add_child(_confirm_hint)

func _build_slot(idx: int) -> void:
    var y := 70 + idx * 138

    var panel := ColorRect.new()
    panel.color    = C_SLOT_EMPTY
    panel.position = Vector2(1118, y)
    panel.size     = Vector2(470, 124)
    add_child(panel)
    _slot_panels.append(panel)

    var inner := ColorRect.new()
    inner.color    = Color(0.05, 0.065, 0.13, 1)
    inner.position = Vector2(3, 3)
    inner.size     = Vector2(464, 118)
    panel.add_child(inner)

    var num_lbl := _lbl(str(idx + 1), Vector2(8, 6), 28)
    num_lbl.add_theme_color_override("font_color", Color(0.4, 0.52, 0.62, 1))
    inner.add_child(num_lbl)

    var spr := Sprite2D.new()
    spr.position = Vector2(55, 62)
    spr.scale    = Vector2(2, 2)
    spr.visible  = false
    inner.add_child(spr)
    _slot_sprites.append(spr)

    var name_lbl := _lbl("—", Vector2(108, 40), 38)
    name_lbl.add_theme_color_override("font_color", Color(0.50, 0.58, 0.66, 1))
    inner.add_child(name_lbl)
    _slot_names.append(name_lbl)

func _make_cell(idx: int) -> Control:
    var pkmn: Dictionary = pokemon_list[idx]
    var available: bool  = pkmn["species"] in AVAILABLE

    var cell := Control.new()
    cell.custom_minimum_size = Vector2(CELL_W, CELL_H)

    var bg := ColorRect.new()
    bg.color    = C_CELL_LOCK if not available else C_CELL
    bg.position = Vector2(1, 1)
    bg.size     = Vector2(CELL_W - 2, CELL_H - 2)
    bg.name     = "BG"
    cell.add_child(bg)

    var hl := ColorRect.new()
    hl.color        = Color(1, 1, 1, 0)
    hl.size         = Vector2(CELL_W, CELL_H)
    hl.mouse_filter = Control.MOUSE_FILTER_IGNORE
    hl.name         = "Highlight"
    cell.add_child(hl)

    var rarity := _lbl(str(pkmn["rarity"]), Vector2(3, 1), 20)
    cell.add_child(rarity)

    var sprite := Sprite2D.new()
    sprite.scale    = Vector2(2, 2)
    sprite.position = Vector2(CELL_W * 0.5, CELL_H * 0.5 + 8)
    sprite.name     = "Sprite"
    sprite_loader.apply_to_sprite_by_name(sprite, pkmn["species"])
    if not available:
        sprite.modulate = Color(0, 0, 0, 1)
    cell.add_child(sprite)

    return cell

func _lbl(text: String, pos: Vector2, font_size: int) -> Label:
    var l := Label.new()
    l.text     = text
    l.position = pos
    l.add_theme_font_override("font", _font)
    l.add_theme_font_size_override("font_size", font_size)
    l.add_theme_color_override("font_color", Color.WHITE)
    l.add_theme_color_override("font_shadow_color", Color(0.1, 0.1, 0.1, 1))
    l.add_theme_constant_override("shadow_offset_x", 2)
    l.add_theme_constant_override("shadow_offset_y", 2)
    return l

# ── Input ───────────────────────────────────────────────────────────────────

func _input(event: InputEvent) -> void:
    if event is InputEventKey and event.pressed and not event.echo:
        if event.keycode == KEY_ENTER and selected.size() >= 1:
            _confirm_team()

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("down"):
        _move_cursor(COLS)
    elif Input.is_action_just_pressed("up"):
        _move_cursor(-COLS)
    elif Input.is_action_just_pressed("right"):
        _move_cursor(1)
    elif Input.is_action_just_pressed("left"):
        _move_cursor(-1)
    elif Input.is_action_just_pressed("Accept"):
        _handle_accept()
    elif Input.is_action_just_pressed("Cancel"):
        _handle_cancel()

func _move_cursor(delta: int) -> void:
    var new_idx: int = clampi(cursor_idx + delta, 0, pokemon_list.size() - 1)
    if new_idx == cursor_idx:
        return
    cursor_idx = new_idx
    _refresh_all()
    call_deferred("_scroll_to_cursor")

func _handle_accept() -> void:
    var pkmn: Dictionary = pokemon_list[cursor_idx]
    if pkmn["species"] not in AVAILABLE:
        return
    if pkmn["species"] in selected:
        selected.erase(pkmn["species"])
    elif selected.size() < MAX_TEAM:
        selected.append(pkmn["species"])
    _refresh_all()

func _handle_cancel() -> void:
    if selected.size() > 0:
        selected.pop_back()
        _refresh_all()
    else:
        globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func _confirm_team() -> void:
    globals.bf_party = []
    for species: String in selected:
        var pkmn_dict: Dictionary = globals.generate_pokemon(species, 1)
        # Apply the player's best captured PP for this species
        var captured_pp: int = globals.rl_captured.get(species, {}).get("pp", pkmn_dict["dex"]["pp"])
        pkmn_dict["dex"]["pp"] = captured_pp
        globals.bf_party.append(pkmn_dict)
    globals.core.change_scene(load("res://Files/Scenes/RogueLike/roguelike_map.tscn"))

# ── Refresh ─────────────────────────────────────────────────────────────────

func _refresh_all() -> void:
    _refresh_cells()
    _refresh_slots()
    _refresh_info()

func _refresh_cells() -> void:
    for i: int in _cells.size():
        var pkmn: Dictionary = pokemon_list[i]
        var cell: Control    = _cells[i]
        var hl: ColorRect    = cell.get_node("Highlight")
        var bg: ColorRect    = cell.get_node("BG")
        var available: bool  = pkmn["species"] in AVAILABLE

        var is_cursor:   bool = i == cursor_idx
        var is_selected: bool = pkmn["species"] in selected

        if is_cursor and is_selected:
            hl.color = Color(0.95, 0.85, 0.10, 0.45)
            bg.color = Color(0.08, 0.15, 0.26, 1)
        elif is_cursor:
            hl.color = C_CURSOR_HL
            bg.color = Color(0.08, 0.10, 0.20, 1) if available else Color(0.06, 0.075, 0.155, 1)
        elif is_selected:
            hl.color = C_SELECTED_HL
            bg.color = Color(0.065, 0.145, 0.265, 1)
        else:
            hl.color = Color(1, 1, 1, 0)
            bg.color = C_CELL_LOCK if not available else C_CELL

func _refresh_slots() -> void:
    for i: int in 3:
        if i < selected.size():
            var species: String = selected[i]
            sprite_loader.apply_to_sprite_by_name(_slot_sprites[i], species)
            _slot_sprites[i].visible = true
            var e: Dictionary = rl_pkmn.dex.get(species, {})
            _slot_names[i].text = e.get("name", species.capitalize())
            _slot_names[i].add_theme_color_override("font_color", Color.WHITE)
            _slot_panels[i].color = C_SLOT_FILLED
        else:
            _slot_sprites[i].visible = false
            _slot_names[i].text = "—"
            _slot_names[i].add_theme_color_override("font_color", Color(0.50, 0.58, 0.66, 1))
            _slot_panels[i].color = C_SLOT_EMPTY

    _confirm_hint.text = "Enter  Start!" if selected.size() >= 1 else ""

func _refresh_info() -> void:
    if pokemon_list.is_empty():
        return
    var pkmn: Dictionary = pokemon_list[cursor_idx]
    _title_label.text = "Choose your team  (%d / %d)" % [selected.size(), MAX_TEAM]

    var available: bool = pkmn["species"] in AVAILABLE
    if not available:
        _cursor_name.text  = "???"
        _cursor_types.text = ""
        _cursor_stats.text = ""
        return

    var e: Dictionary = rl_pkmn.dex.get(pkmn["species"], {})
    _cursor_name.text = e.get("name", pkmn["species"].capitalize())

    var types: Array = e.get("types", [])
    var parts: Array = []
    for t: String in types:
        parts.append(t.capitalize())
    _cursor_types.text = "  /  ".join(parts) + "    Rarity %d" % pkmn["rarity"]

    var hp:  int = globals.level_scale(e.get("health", 0), 1)
    var pwr: int = globals.level_scale(e.get("power",  0), 1)
    var spd: int = globals.level_scale(e.get("speed",  0), 1)
    var ap:  int = e.get("base_ap", 1)
    var pp:  int = globals.rl_captured.get(pkmn["species"], {}).get("pp", e.get("pp_range", [2])[0])

    _cursor_stats.text = "HP  %-4d  PP  %d\nPWR %-4d  AP  %d\nSPD %d" % [hp, pp, pwr, ap, spd]

func _scroll_to_cursor() -> void:
    var row   := cursor_idx / COLS
    var top_y := row * CELL_H
    var bot_y := top_y + CELL_H
    var view_h := int(_scroll.size.y)
    if top_y < _scroll.scroll_vertical:
        _scroll.scroll_vertical = top_y
    elif bot_y > _scroll.scroll_vertical + view_h:
        _scroll.scroll_vertical = bot_y - view_h
