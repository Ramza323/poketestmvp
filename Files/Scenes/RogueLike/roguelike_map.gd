extends Node2D

# ── Constants ────────────────────────────────────────────────────────────────

const FONT_PATH := "res://Files/Fonts/pokemon-ds-font.ttf"

const COL_X  : Array = [490, 800, 1110]
const ROW_Y  : Array = [790, 618, 446, 274, 102]
const NODE_R := 38
const ROWS   := 5
const COLS   := 3

const C_BG       := Color(0.022, 0.028, 0.075, 1)
const C_LINE     := Color(0.28, 0.34, 0.58, 0.80)
const C_LINE_OLD := Color(0.14, 0.16, 0.28, 0.45)

const TYPE_COLOR := {
    "battle": Color(0.78, 0.16, 0.16, 1),
    "elite":  Color(0.88, 0.46, 0.08, 1),
    "shop":   Color(0.12, 0.62, 0.22, 1),
    "event":  Color(0.44, 0.14, 0.74, 1),
    "boss":   Color(0.86, 0.70, 0.04, 1),
}
const TYPE_LABEL := {
    "battle": "B", "elite": "E", "shop": "$", "event": "?", "boss": "!",
}
const TYPE_NAME := {
    "battle": "Batalla",
    "elite":  "Entrenador Elite",
    "shop":   "Tienda",
    "event":  "Evento",
    "boss":   "Jefe Final",
}

const EVENTS := [
    {
        "id": "james_bet",
        "title": "James del Equipo Rocket",
        "text": "\"Ajaja! Entrenador, ¿te gusta apostar?\nTiro una moneda — si ganas, te doy algo valioso.\nSi pierdes... me llevo uno de tus Pokemon.\"",
        "options": ["Aceptar la apuesta", "Rechazar"],
    },
    {
        "id": "injured_pokemon",
        "title": "Un Pokemon herido en el camino",
        "text": "Encuentras un Pokemon herido a un lado del camino.\nParece que fue abandonado por su entrenador.",
        "options": ["Rescatarlo", "Seguir tu camino"],
    },
    {
        "id": "professor_oak",
        "title": "El Profesor Oak te detiene",
        "text": "\"Joven entrenador, tengo un Pokemon especial...\npero necesito uno de los tuyos para mis estudios.\n¿Hacemos un trato?\"",
        "options": ["Aceptar el trato", "Declinar"],
    },
    {
        "id": "mystery_ball",
        "title": "Una Pokeball misteriosa",
        "text": "Encuentras una Pokeball brillando en el suelo.\nNo sabes que hay dentro...",
        "options": ["Abrirla", "Dejarla"],
    },
]

# ── State ────────────────────────────────────────────────────────────────────

var _font: Font
var _map: Dictionary = {}
var _accessible: Array = []   # [[row, col], ...]
var _cursor_idx: int = 0
var _in_event: bool = false

# ── UI refs ──────────────────────────────────────────────────────────────────

var _info_label: Label
var _team_root: Node2D

var _ev_overlay: CanvasLayer
var _ev_title: Label
var _ev_text: Label
var _ev_opt_bgs: Array = []
var _ev_opt_lbls: Array = []
var _ev_cursor: int = 0
var _ev_data: Dictionary = {}

# ── Ready ────────────────────────────────────────────────────────────────────

func _ready() -> void:
    _font = load(FONT_PATH)
    if not globals.rl_map_state.is_empty():
        _map = globals.rl_map_state
        globals.rl_map_state = {}
    else:
        _map = _generate_map(randi())
    _accessible = _get_accessible()
    _build_ui()
    queue_redraw()

# ── Map generation ───────────────────────────────────────────────────────────

func _generate_map(seed: int) -> Dictionary:
    var rng := RandomNumberGenerator.new()
    rng.seed = seed
    var rows: Array = []
    for r in ROWS:
        var row: Array = []
        for c in COLS:
            var type: String
            if r == ROWS - 1:
                type = "boss"
            else:
                type = _pick_type(rng)
            row.append({ "type": type, "row": r, "col": c, "connections": [], "visited": false })
        rows.append(row)
    _gen_connections(rows, rng)
    # All pre-boss nodes connect only to the single center boss
    for c in COLS:
        rows[ROWS - 2][c]["connections"] = [1]
    return { "seed": seed, "rows": rows, "current_row": -1, "current_col": -1 }

func _pick_type(rng: RandomNumberGenerator) -> String:
    var r := rng.randf()
    if r < 0.50: return "battle"
    if r < 0.65: return "elite"
    if r < 0.80: return "shop"
    if r < 0.90: return "event"
    return "battle"

func _gen_connections(rows: Array, rng: RandomNumberGenerator) -> void:
    # Guaranteed spine path
    var pc: int = rng.randi() % COLS
    for r in (ROWS - 1):
        var nc: int = clampi(pc + rng.randi_range(-1, 1), 0, COLS - 1)
        if nc not in rows[r][pc]["connections"]:
            rows[r][pc]["connections"].append(nc)
        pc = nc

    # Extra random connections + ensure every node has at least one outgoing
    for r in (ROWS - 1):
        for c in COLS:
            if rows[r][c]["connections"].is_empty():
                var nc: int = clampi(c + rng.randi_range(-1, 1), 0, COLS - 1)
                rows[r][c]["connections"].append(nc)
            elif rng.randf() < 0.28:
                var nc: int = rng.randi() % COLS
                if nc not in rows[r][c]["connections"]:
                    rows[r][c]["connections"].append(nc)

    # Ensure every node in rows 1-4 is reachable
    for r in range(1, ROWS):
        var reached := {}
        for c in COLS:
            for nc in rows[r - 1][c]["connections"]:
                reached[nc] = true
        for c in COLS:
            if not reached.has(c):
                var from: int = clampi(c + rng.randi_range(-1, 1), 0, COLS - 1)
                if c not in rows[r - 1][from]["connections"]:
                    rows[r - 1][from]["connections"].append(c)

func _get_accessible() -> Array:
    var cr: int = _map["current_row"]
    var cc: int = _map["current_col"]
    if cr == -1:
        return [[0, 0], [0, 1], [0, 2]]
    if cr >= ROWS - 1:
        return []
    var result: Array = []
    for nc in _map["rows"][cr][cc]["connections"]:
        result.append([cr + 1, nc])
    return result

func _is_accessible(r: int, c: int) -> bool:
    for pair in _accessible:
        if pair[0] == r and pair[1] == c:
            return true
    return false

# ── Drawing ──────────────────────────────────────────────────────────────────

func _draw() -> void:
    # Background
    draw_rect(Rect2(0, 0, 1600, 900), C_BG, true)

    # Connection lines
    for r in (ROWS - 1):
        for c in COLS:
            var node: Dictionary = _map["rows"][r][c]
            var from := Vector2(COL_X[c], ROW_Y[r])
            for nc: int in node["connections"]:
                var to := Vector2(COL_X[nc], ROW_Y[r + 1])
                var both_visited: bool = node["visited"] and _map["rows"][r + 1][nc]["visited"]
                draw_line(from, to, C_LINE_OLD if both_visited else C_LINE, 2.5, true)

    # Nodes
    for r in ROWS:
        for c in COLS:
            if r == ROWS - 1 and c != 1:
                continue
            var node: Dictionary = _map["rows"][r][c]
            var pos: Vector2    = Vector2(float(COL_X[c]), float(ROW_Y[r]))
            var base_col: Color = TYPE_COLOR[node["type"]]
            var accessible: bool = _is_accessible(r, c)
            var is_cursor: bool  = _accessible.size() > 0 and _cursor_idx < _accessible.size() \
                                   and int(_accessible[_cursor_idx][0]) == r \
                                   and int(_accessible[_cursor_idx][1]) == c
            var visited: bool = node["visited"]

            var fill: Color = base_col
            if visited:
                fill = base_col.darkened(0.58)
            elif not accessible:
                fill = base_col.darkened(0.42)

            if is_cursor:
                draw_circle(pos, NODE_R + 12, Color(1.0, 0.95, 0.30, 0.22))
                draw_circle(pos, NODE_R + 6,  Color(1.0, 0.95, 0.30, 0.42))
            elif accessible:
                draw_circle(pos, NODE_R + 5, Color(1.0, 1.0, 1.0, 0.16))

            draw_circle(pos, NODE_R, fill)

            var border: Color
            if is_cursor:
                border = Color(1.0, 0.95, 0.30, 1.0)
            elif accessible:
                border = Color(1.0, 1.0, 1.0, 0.70)
            else:
                border = Color(1.0, 1.0, 1.0, 0.18)
            draw_arc(pos, NODE_R, 0.0, TAU, 40, border, 2.5, true)

            var lbl: String  = TYPE_LABEL[node["type"]]
            var sz: Vector2  = _font.get_string_size(lbl, HORIZONTAL_ALIGNMENT_LEFT, -1, 30)
            var tpos: Vector2 = pos - sz * 0.5 + Vector2(0.0, sz.y * 0.35)
            draw_string(_font, tpos, lbl, HORIZONTAL_ALIGNMENT_LEFT, -1, 30, Color.WHITE)

    # Floor labels (right side of map)
    for r in ROWS:
        var lbl := "BOSS" if r == ROWS - 1 else ("Piso %d" % (r + 1))
        draw_string(_font, Vector2(1165, ROW_Y[r] + 10), lbl,
            HORIZONTAL_ALIGNMENT_LEFT, -1, 22, Color(0.55, 0.62, 0.75, 1))

# ── Input ────────────────────────────────────────────────────────────────────

func _process(_delta: float) -> void:
    if _in_event:
        _process_event_input()
        return

    if _accessible.is_empty():
        return

    if Input.is_action_just_pressed("left"):
        _cursor_idx = posmod(_cursor_idx - 1, _accessible.size())
        _update_info()
        queue_redraw()
    elif Input.is_action_just_pressed("right"):
        _cursor_idx = posmod(_cursor_idx + 1, _accessible.size())
        _update_info()
        queue_redraw()
    elif Input.is_action_just_pressed("Accept"):
        _enter_node()
    elif Input.is_action_just_pressed("Cancel"):
        globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func _process_event_input() -> void:
    var opts: Array = _ev_data.get("options", [])
    if opts.is_empty():
        return
    if Input.is_action_just_pressed("up"):
        _ev_cursor = posmod(_ev_cursor - 1, opts.size())
        _refresh_ev_cursor()
    elif Input.is_action_just_pressed("down"):
        _ev_cursor = posmod(_ev_cursor + 1, opts.size())
        _refresh_ev_cursor()
    elif Input.is_action_just_pressed("Accept"):
        _resolve_event(_ev_data["id"], _ev_cursor)
    elif Input.is_action_just_pressed("Cancel"):
        if _ev_data["id"] == "_info":
            _close_event()

# ── Node entering ────────────────────────────────────────────────────────────

func _enter_node() -> void:
    if _accessible.is_empty():
        return
    var target: Array = _accessible[_cursor_idx]
    var r: int = target[0]
    var c: int = target[1]
    var node: Dictionary = _map["rows"][r][c]

    node["visited"]         = true
    _map["current_row"]     = r
    _map["current_col"]     = c
    _accessible             = _get_accessible()
    _cursor_idx             = 0

    queue_redraw()
    _update_info()

    match node["type"]:
        "battle", "elite", "boss":
            _launch_battle(node["type"], r)
        "shop":
            _show_info("Tienda", "Un comerciante aparece.\n(Tienda en construccion)")
        "event":
            _run_random_event()

# ── Events ───────────────────────────────────────────────────────────────────

func _run_random_event() -> void:
    var ev: Dictionary = EVENTS[randi() % EVENTS.size()]
    _open_event(ev)

func _open_event(ev: Dictionary) -> void:
    _ev_data   = ev
    _ev_cursor = 0
    _in_event  = true
    _ev_title.text = ev["title"]
    _ev_text.text  = ev["text"]
    var opts: Array = ev["options"]
    for i in 3:
        if i < opts.size():
            _ev_opt_bgs[i].visible  = true
            _ev_opt_lbls[i].text    = "  " + opts[i]
        else:
            _ev_opt_bgs[i].visible  = false
            _ev_opt_lbls[i].text    = ""
    _refresh_ev_cursor()
    _ev_overlay.visible = true

func _close_event() -> void:
    _ev_overlay.visible = false
    _in_event           = false
    _rebuild_team_panel()

func _resolve_event(id: String, choice: int) -> void:
    match id:
        "james_bet":
            if choice == 0:
                _close_event()
                _james_bet()
            else:
                _close_event()
        "injured_pokemon":
            if choice == 0:
                _close_event()
                _rescue_pokemon()
            else:
                _close_event()
        "professor_oak":
            if choice == 0:
                _close_event()
                _oak_trade()
            else:
                _close_event()
        "mystery_ball":
            if choice == 0:
                _close_event()
                _mystery_ball()
            else:
                _close_event()
        "_info":
            _close_event()
        _:
            _close_event()

func _show_info(title: String, msg: String) -> void:
    _open_event({ "id": "_info", "title": title, "text": msg, "options": ["Continuar"] })

# ── Event outcomes ────────────────────────────────────────────────────────────

func _james_bet() -> void:
    if randf() < 0.5:
        _show_info("James del Equipo Rocket",
            "Cara! Ganaste!\nJames saca a regañadientes un Booster Pack...\n\n+1 Booster Pack (sistema pendiente)")
    else:
        var party: Array = globals.bf_party
        if party.size() > 1:
            var idx: int = randi() % party.size()
            var lost: Dictionary = party[idx]
            party.remove_at(idx)
            var lost_species: String = lost.get("species", "")
            var name: String = rl_pkmn.dex.get(lost_species, {}).get("name", lost_species)
            _show_info("James del Equipo Rocket",
                "Cruz! Perdiste!\nJames agarra a tu %s y desaparece entre la niebla..." % name)
        else:
            _show_info("James del Equipo Rocket",
                "Cruz... pero solo tienes un Pokemon.\nJames se va de vacio. \"¡La proxima vez!\"")

func _rescue_pokemon() -> void:
    var pool := ["rattata", "spearow", "ekans", "sandshrew", "jigglypuff",
                 "zubat", "oddish", "paras", "venonat", "psyduck"]
    var species: String = pool[randi() % pool.size()]
    var name: String = rl_pkmn.dex.get(species, {}).get("name", species)
    if globals.bf_party.size() < 3:
        globals.bf_party.append(globals.generate_pokemon(species, 1))
        _show_info("Pokemon rescatado", "El Pokemon se recupera y decide acompañarte!\n%s se unio al equipo." % name)
    else:
        _show_info("Pokemon rescatado",
            "El Pokemon se recupera y sigue su camino.\nTu equipo ya esta lleno.")

func _oak_trade() -> void:
    var party: Array = globals.bf_party
    if party.size() <= 1:
        _show_info("Profesor Oak",
            "\"Mmm... necesitas mas Pokemon para hacer un trato justo, joven.\"")
        return
    var idx: int = randi() % party.size()
    var lost: Dictionary = party[idx]
    party.remove_at(idx)
    var gained_pool := ["alakazam", "gengar", "machamp", "golem", "lapras", "snorlax", "jolteon"]
    var g_species: String = gained_pool[randi() % gained_pool.size()]
    party.append(globals.generate_pokemon(g_species, 3))
    var lost_species: String = lost.get("species", "")
    var l_name: String = rl_pkmn.dex.get(lost_species, {}).get("name", lost_species)
    var g_name: String = rl_pkmn.dex.get(g_species, {}).get("name", g_species)
    _show_info("Profesor Oak", "Oak toma a tu %s para sus estudios.\nA cambio recibes a %s!" % [l_name, g_name])

func _mystery_ball() -> void:
    var r := randf()
    if r < 0.45:
        var pool := ["rattata", "spearow", "jigglypuff", "oddish", "paras"]
        var species: String = pool[randi() % pool.size()]
        var name: String = rl_pkmn.dex.get(species, {}).get("name", species)
        if globals.bf_party.size() < 3:
            globals.bf_party.append(globals.generate_pokemon(species, 1))
            _show_info("Pokeball misteriosa", "Habia un %s dentro!\nSe une a tu equipo." % name)
        else:
            _show_info("Pokeball misteriosa", "Habia un %s dentro, pero tu equipo esta lleno.\nSale corriendo..." % name)
    elif r < 0.80:
        _show_info("Pokeball misteriosa", "La Pokeball estaba vacia.\nAlguien te la jugo.")
    else:
        _show_info("Pokeball misteriosa",
            "Era una trampa del Equipo Rocket!\nPor suerte solo pierdes un poco de tiempo.")

# ── Battle launch ────────────────────────────────────────────────────────────

func _launch_battle(node_type: String, floor: int) -> void:
    globals.rl_enemy_team  = rl_pools.generate_enemy_team(floor, node_type)
    globals.rl_map_state   = _map.duplicate(true)
    globals.rl_mode        = true
    globals.core.change_scene(load("res://Files/Scenes/Battle/BattleScene.tscn"))

# ── UI construction ───────────────────────────────────────────────────────────

func _build_ui() -> void:
    # Title
    var title := _lbl("KANTO", Vector2(660, 18), 54)
    title.add_theme_color_override("font_color", Color(0.88, 0.92, 1.0, 1))
    add_child(title)

    # Right info panel
    var rp_bg := ColorRect.new()
    rp_bg.color    = Color(0.035, 0.044, 0.108, 1)
    rp_bg.position = Vector2(1230, 0)
    rp_bg.size     = Vector2(370, 900)
    add_child(rp_bg)

    add_child(_lbl("Siguiente nodo", Vector2(1250, 18), 30))

    var div := ColorRect.new()
    div.color    = Color(0.12, 0.15, 0.28, 1)
    div.position = Vector2(1240, 58)
    div.size     = Vector2(350, 2)
    add_child(div)

    _info_label = _lbl("", Vector2(1250, 72), 28)
    _info_label.add_theme_color_override("font_color", Color(0.75, 0.82, 0.92, 1))
    _info_label.autowrap_mode = TextServer.AUTOWRAP_WORD
    _info_label.size = Vector2(340, 500)
    add_child(_info_label)

    # Controls hint
    var ctrl := _lbl("  Mover   Z Entrar   X Salir", Vector2(320, 862), 26)
    ctrl.add_theme_color_override("font_color", Color(0.48, 0.56, 0.68, 1))
    add_child(ctrl)

    # Left team panel
    _team_root = Node2D.new()
    add_child(_team_root)
    _rebuild_team_panel()

    # Event overlay
    _build_event_overlay()
    _update_info()

func _rebuild_team_panel() -> void:
    for ch in _team_root.get_children():
        ch.queue_free()

    var panel_bg := ColorRect.new()
    panel_bg.color    = Color(0.035, 0.044, 0.108, 1)
    panel_bg.position = Vector2(0, 0)
    panel_bg.size     = Vector2(230, 900)
    _team_root.add_child(panel_bg)

    var lbl := _lbl("Equipo", Vector2(18, 18), 32)
    _team_root.add_child(lbl)

    var div := ColorRect.new()
    div.color    = Color(0.12, 0.15, 0.28, 1)
    div.position = Vector2(10, 58)
    div.size     = Vector2(210, 2)
    _team_root.add_child(div)

    var party: Array = globals.bf_party
    for i in party.size():
        var pkmn: Dictionary = party[i]
        if pkmn.is_empty():
            continue
        var y := 72 + i * 108

        var slot_bg := ColorRect.new()
        slot_bg.color    = Color(0.055, 0.072, 0.150, 1)
        slot_bg.position = Vector2(8, y)
        slot_bg.size     = Vector2(214, 96)
        _team_root.add_child(slot_bg)

        var species: String = pkmn.get("species", "")
        var spr := Sprite2D.new()
        spr.position = Vector2(48, y + 52)
        spr.scale    = Vector2(1.8, 1.8)
        sprite_loader.apply_to_sprite_by_name(spr, species)
        _team_root.add_child(spr)

        var e: Dictionary = rl_pkmn.dex.get(species, {})
        var display_name: String = e.get("name", species.capitalize())
        var name_lbl := _lbl(display_name, Vector2(92, y + 18), 24)
        name_lbl.add_theme_color_override("font_color", Color.WHITE)
        _team_root.add_child(name_lbl)

        var dex: Dictionary = pkmn.get("dex", {})
        var pp: int  = dex.get("pp", 0)
        var ap: int  = dex.get("base_ap", 0)
        var stat_lbl := _lbl("PP %d  AP %d" % [pp, ap], Vector2(92, y + 54), 22)
        stat_lbl.add_theme_color_override("font_color", Color(0.62, 0.74, 0.84, 1))
        _team_root.add_child(stat_lbl)

func _build_event_overlay() -> void:
    _ev_overlay = CanvasLayer.new()
    _ev_overlay.visible = false
    add_child(_ev_overlay)

    var backdrop := ColorRect.new()
    backdrop.color = Color(0, 0, 0, 0.74)
    backdrop.size  = Vector2(1600, 900)
    _ev_overlay.add_child(backdrop)

    var box := ColorRect.new()
    box.color    = Color(0.038, 0.048, 0.125, 1)
    box.position = Vector2(320, 140)
    box.size     = Vector2(960, 620)
    _ev_overlay.add_child(box)

    var box_inner := ColorRect.new()
    box_inner.color    = Color(0.055, 0.068, 0.165, 1)
    box_inner.position = Vector2(324, 144)
    box_inner.size     = Vector2(952, 612)
    _ev_overlay.add_child(box_inner)

    _ev_title = _lbl_in_overlay("", Vector2(350, 162), 42)
    _ev_title.add_theme_color_override("font_color", Color(0.92, 0.95, 1.0, 1))

    _ev_text = _lbl_in_overlay("", Vector2(350, 228), 30)
    _ev_text.add_theme_color_override("font_color", Color(0.78, 0.85, 0.94, 1))
    _ev_text.autowrap_mode = TextServer.AUTOWRAP_WORD
    _ev_text.size = Vector2(900, 200)

    for i in 3:
        var opt_bg := ColorRect.new()
        opt_bg.color    = Color(0.08, 0.10, 0.22, 1)
        opt_bg.position = Vector2(350, 468 + i * 76)
        opt_bg.size     = Vector2(900, 62)
        _ev_overlay.add_child(opt_bg)
        _ev_opt_bgs.append(opt_bg)

        var opt_lbl := _lbl_in_overlay("", Vector2(368, 480 + i * 76), 30)
        opt_lbl.add_theme_color_override("font_color", Color(0.80, 0.88, 0.96, 1))
        _ev_opt_lbls.append(opt_lbl)

func _refresh_ev_cursor() -> void:
    for i in _ev_opt_bgs.size():
        _ev_opt_bgs[i].color = Color(0.215686, 0.615686, 0.670588, 0.55) \
            if i == _ev_cursor else Color(0.08, 0.10, 0.22, 1)

func _update_info() -> void:
    if _accessible.is_empty():
        _info_label.text = "Fin del camino." if _map["current_row"] >= 0 else ""
        return
    var lines: Array = []
    for pair in _accessible:
        var node: Dictionary = _map["rows"][pair[0]][pair[1]]
        lines.append("• " + TYPE_NAME[node["type"]])
    _info_label.text = "\n\n".join(lines)

# ── Helpers ──────────────────────────────────────────────────────────────────

func _lbl(text: String, pos: Vector2, font_size: int) -> Label:
    var l := Label.new()
    l.text     = text
    l.position = pos
    l.add_theme_font_override("font", _font)
    l.add_theme_font_size_override("font_size", font_size)
    l.add_theme_color_override("font_color", Color.WHITE)
    l.add_theme_color_override("font_shadow_color", Color(0.08, 0.08, 0.08, 1))
    l.add_theme_constant_override("shadow_offset_x", 2)
    l.add_theme_constant_override("shadow_offset_y", 2)
    return l

func _lbl_in_overlay(text: String, pos: Vector2, font_size: int) -> Label:
    var l := _lbl(text, pos, font_size)
    _ev_overlay.add_child(l)
    return l
