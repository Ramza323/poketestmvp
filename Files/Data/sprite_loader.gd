extends Node

const BASE_PATH := "res://Files/Sprites/Pokemon/"

# Mapeo nombre de especie → número de Pokédex
const NAME_TO_ID := {
	"bulbasaur": 1, "ivysaur": 2, "venusaur": 3,
	"charmander": 4, "charmeleon": 5, "charizard": 6,
	"squirtle": 7, "wartortle": 8, "blastoise": 9,
	"caterpie": 10, "metapod": 11, "butterfree": 12,
	"weedle": 13, "kakuna": 14, "beedrill": 15,
	"pidgey": 16, "pidgeotto": 17, "pidgeot": 18,
	"rattata": 19, "raticate": 20,
	"spearow": 21, "fearow": 22,
	"ekans": 23, "arbok": 24,
	"pikachu": 25, "raichu": 26,
	"sandshrew": 27, "sandslash": 28,
	"nidoran-f": 29, "nidorina": 30, "nidoqueen": 31,
	"nidoran-m": 32, "nidorino": 33, "nidoking": 34,
	"clefairy": 35, "clefable": 36,
	"vulpix": 37, "ninetales": 38,
	"jigglypuff": 39, "wigglytuff": 40,
	"zubat": 41, "golbat": 42,
	"oddish": 43, "gloom": 44, "vileplume": 45,
	"paras": 46, "parasect": 47,
	"venonat": 48, "venomoth": 49,
	"diglett": 50, "dugtrio": 51,
	"meowth": 52, "persian": 53,
	"psyduck": 54, "golduck": 55,
	"mankey": 56, "primeape": 57,
	"growlithe": 58, "arcanine": 59,
	"poliwag": 60, "poliwhirl": 61, "poliwrath": 62,
	"abra": 63, "kadabra": 64, "alakazam": 65,
	"machop": 66, "machoke": 67, "machamp": 68,
	"bellsprout": 69, "weepinbell": 70, "victreebel": 71,
	"tentacool": 72, "tentacruel": 73,
	"geodude": 74, "graveler": 75, "golem": 76,
	"ponyta": 77, "rapidash": 78,
	"slowpoke": 79, "slowbro": 80,
	"magnemite": 81, "magneton": 82,
	"farfetchd": 83,
	"doduo": 84, "dodrio": 85,
	"seel": 86, "dewgong": 87,
	"grimer": 88, "muk": 89,
	"shellder": 90, "cloyster": 91,
	"gastly": 92, "haunter": 93, "gengar": 94,
	"onix": 95,
	"drowzee": 96, "hypno": 97,
	"krabby": 98, "kingler": 99,
	"voltorb": 100, "electrode": 101,
	"exeggcute": 102, "exeggutor": 103,
	"cubone": 104, "marowak": 105,
	"hitmonlee": 106, "hitmonchan": 107,
	"lickitung": 108,
	"koffing": 109, "weezing": 110,
	"rhyhorn": 111, "rhydon": 112,
	"chansey": 113,
	"tangela": 114,
	"kangaskhan": 115,
	"horsea": 116, "seadra": 117,
	"goldeen": 118, "seaking": 119,
	"staryu": 120, "starmie": 121,
	"mr_mime": 122,
	"scyther": 123,
	"jynx": 124,
	"electabuzz": 125,
	"magmar": 126,
	"pinsir": 127,
	"tauros": 128,
	"magikarp": 129, "gyarados": 130,
	"lapras": 131,
	"ditto": 132,
	"eevee": 133, "vaporeon": 134, "jolteon": 135, "flareon": 136,
	"porygon": 137,
	"omanyte": 138, "omastar": 139,
	"kabuto": 140, "kabutops": 141,
	"aerodactyl": 142,
	"snorlax": 143,
	"articuno": 144, "zapdos": 145, "moltres": 146,
	"dratini": 147, "dragonair": 148, "dragonite": 149,
	"mewtwo": 150,
	"mew": 151,

	# ── Formas Mega Gen 1 ─────────────────────────────────────────────────────
	"venusaur_mega": 3,
	"charizard_mega_x": 6, "charizard_mega_y": 6,
	"blastoise_mega": 9,
	"beedrill_mega": 15,
	"pidgeot_mega": 18,
	"alakazam_mega": 65,
	"slowbro_mega": 80,
	"gengar_mega": 94,
	"kangaskhan_mega": 115,
	"pinsir_mega": 127,
	"gyarados_mega": 130,
	"aerodactyl_mega": 142,
	"mewtwo_mega_x": 150, "mewtwo_mega_y": 150,

	# ── Formas Gmax Gen 1 (sprite siempre shiny) ──────────────────────────────
	"venusaur_gmax": 3,
	"charizard_gmax": 6,
	"blastoise_gmax": 9,
	"butterfree_gmax": 12,
	"gengar_gmax": 94,
	"kingler_gmax": 99,
	"lapras_gmax": 131,
	"eevee_gmax": 133,
	"snorlax_gmax": 143,
	"pikachu_gmax": 25,
	"meowth_gmax": 52,
	"machamp_gmax": 68,
}

const FRAME_W := 40
const FRAME_H := 30

var _cache := {}

# ── API por ID numérico ────────────────────────────────────────────────────────

func get_sprite_path(id: int, form := "base") -> String:
	if form == "base":
		return BASE_PATH + "%d.png" % id
	return BASE_PATH + "%d-%s.png" % [id, form]

func get_texture(id: int, form := "base") -> Texture2D:
	var path := get_sprite_path(id, form)
	if _cache.has(path):
		return _cache[path]
	if ResourceLoader.exists(path):
		var raw: Texture2D = load(path)
		var frames := 2 if "shiny" in form else 1
		var target_w := FRAME_W * frames
		var target_h := FRAME_H
		var img := raw.get_image()
		if img.get_width() != target_w or img.get_height() != target_h:
			img.resize(target_w, target_h, Image.INTERPOLATE_NEAREST)
		var tex := ImageTexture.create_from_image(img)
		_cache[path] = tex
		return tex
	if form != "base":
		push_warning("SpriteLoader: '%s' no encontrado, usando base" % path)
		return get_texture(id, "base")
	push_warning("SpriteLoader: sin sprite para id=%d" % id)
	return null

func apply_to_sprite(sprite: Sprite2D, id: int, form := "base") -> void:
	var tex := get_texture(id, form)
	if tex == null:
		return
	sprite.texture = tex
	if "shiny" in form:
		# Spritesheet 128×64 (shiny, gmax-shiny, etc.): frame 0=normal, frame 1=shiny
		sprite.hframes = 2
		sprite.vframes = 1
		sprite.frame = 1
	else:
		# PNG individual (base, mega, mega-x, etc.) — frame único
		sprite.hframes = 1
		sprite.vframes = 1
		sprite.frame = 0

# ── API por nombre de especie ──────────────────────────────────────────────────

func get_id(species: String) -> int:
	var key := species.to_lower()
	return NAME_TO_ID.get(key, -1)

# sprite_form: override de forma ("mega-x", "gmax-shiny", etc.)
# Si está vacío: usa "shiny" o "base" según is_shiny
func apply_to_sprite_by_name(sprite: Sprite2D, species: String, is_shiny := false, sprite_form := "") -> void:
	var id := get_id(species)
	if id == -1:
		return
	var form: String
	if sprite_form != "":
		form = sprite_form
	else:
		form = "shiny" if is_shiny else "base"
	apply_to_sprite(sprite, id, form)
