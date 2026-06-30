extends Node

var core

var player_bp = 0

var player = null
var enemy
var battle
var hotel

var player_data
var npc
var cutscenes
var level_up_calls := 0
var level_up_queue := []
var level_up_running := false
var ui


var normal_mode = false
var test_mode = true
var auto_battle = true
var pre_battle_formation = true
var in_cutscene = false
var gbc = false
var booster_due = false
var versus_mewtwo = false
var mewtwo_mode = false

var deck_selected = "ivysaur"
var lc_selected = "Brock"

var suspended_path = "user://suspended_game.tscn"
var suspended_game = {}
var resuming_game = false

var options = {
    "bgm_volume": 1.0, 
    "se_volume": 1.0, 
    "v-sync": 1, 
    "fullscreen": 0, 
}

var decks_unlocked = {
    "ivysaur": true, 
    "charmeleon": true, 
    "wartortle": true, 
    "pikachu": false, 

    "bayleef": false, 
    "quilava": false, 
    "croconaw": false, 
    "clefairy": false, 

    "grovyle": false, 
    "combusken": false, 
    "marshtomp": false, 
    "kirlia": false, 

    "grotle": false, 
    "monferno": false, 
    "prinplup": false, 
    "magmar": false, 

    "servine": false, 
    "pignite": false, 
    "dewott": false, 
    "zorua": false, 

    "quilladin": false, 
    "braixen": false, 
    "frogadier": false, 
    "doublade": false, 
}

var decks_cleared = {
    "ivysaur": false, 
    "charmeleon": false, 
    "wartortle": false, 
    "pikachu": false, 

    "bayleef": false, 
    "quilava": false, 
    "croconaw": false, 
    "clefairy": false, 

    "grovyle": false, 
    "combusken": false, 
    "marshtomp": false, 
    "kirlia": false, 

    "grotle": false, 
    "monferno": false, 
    "prinplup": false, 
    "magmar": false, 

    "servine": false, 
    "pignite": false, 
    "dewott": false, 
    "zorua": false, 

    "quilladin": false, 
    "braixen": false, 
    "frogadier": false, 
    "doublade": false, 
}

var LC_unlocked = {
            "Brock": true, 
            "Misty": false, 
            "Surge": false, 
            "Erika": false, 
            "Koga": false, 
            "Sabrina": false, 
            "Blaine": false, 
            "Giovanni": false, 
            "Lorelei": false, 
            "Bruno": false, 
            "Agatha": false, 
            "Lance": false, 
            "Falkner": false, 
            "Bugsy": false, 
            "Whitney": false, 
            "Morty": false, 
            "Chuck": false, 
            "Janine": false, 
            "Jasmine": false, 
            "Clair": false, 
            "Karen": false, 
            "Koichi": false, 
            "Bill": false, 
            "Roxanne": false, 
            "Brawly": false, 
            "Wattson": false, 
            "Flannery": false, 
            "Norman": false, 
            "Winona": false, 
            "Wallace": false, 
            "Sidney": false, 
            "Phoebe": false, 
            "Drake": false, 
            "Steven": false, 
            "Roark": false, 
            "Gardenia": false, 
            "Fantina": false, 
            "Candice": false, 
            "Volkner": false, 
            "Flint": false, 
            "Cyrus": false, 
            "Cynthia": false, 
            "Cilan": false, 
            "Lenora": false, 
            "Burgh": false, 
            "Elesa": false, 
            "Clay": false, 
            "Skyla": false, 
            "Iris": false, 
            "Roxie": false, 
            "Alder": false, 
            "Red": false, 
            "Leaf": false, 
            "Blue": false, 
            "Gold": false, 
            "Kris": false, 
            "Silver": false, 
            "Brendan": false, 
            "May": false, 
            "Wally": false, 
            "Lucas": false, 
            "Dawn": false, 
            "Barry": false, 
            "Hilbert": false, 
            "Hilda": false, 
            "N": false, 
            "Calem": false, 
            "Serena": false, 
            "Tierno": false, 
            "Maxie": false, 
            "Archie": false, 
            "Ghetsis": false, 
            "Sycamore": false, 
            "Lysandre": false, 
            "Diantha": false, 
            "Wes": false, 
            "Oak": false, 
            "Elm": false, 
            "Birch": false, 
            "Rowan": false, 
            "Juniper": false, 
            "Demi-Fiend": false, 
            "Yugi": false, 
            "Kaiba": false
        }

var LC_cleared = {
            "Brock": false, 
            "Misty": false, 
            "Surge": false, 
            "Erika": false, 
            "Koga": false, 
            "Sabrina": false, 
            "Blaine": false, 
            "Giovanni": false, 
            "Lorelei": false, 
            "Bruno": false, 
            "Agatha": false, 
            "Lance": false, 
            "Falkner": false, 
            "Bugsy": false, 
            "Whitney": false, 
            "Morty": false, 
            "Chuck": false, 
            "Janine": false, 
            "Jasmine": false, 
            "Clair": false, 
            "Karen": false, 
            "Koichi": false, 
            "Bill": false, 
            "Roxanne": false, 
            "Brawly": false, 
            "Wattson": false, 
            "Flannery": false, 
            "Norman": false, 
            "Winona": false, 
            "Wallace": false, 
            "Sidney": false, 
            "Phoebe": false, 
            "Drake": false, 
            "Steven": false, 
            "Roark": false, 
            "Gardenia": false, 
            "Fantina": false, 
            "Candice": false, 
            "Volkner": false, 
            "Flint": false, 
            "Cyrus": false, 
            "Cynthia": false, 
            "Cilan": false, 
            "Lenora": false, 
            "Burgh": false, 
            "Elesa": false, 
            "Clay": false, 
            "Skyla": false, 
            "Iris": false, 
            "Roxie": false, 
            "Alder": false, 
            "Red": false, 
            "Leaf": false, 
            "Blue": false, 
            "Gold": false, 
            "Kris": false, 
            "Silver": false, 
            "Brendan": false, 
            "May": false, 
            "Wally": false, 
            "Lucas": false, 
            "Dawn": false, 
            "Barry": false, 
            "Hilbert": false, 
            "Hilda": false, 
            "N": false, 
            "Calem": false, 
            "Serena": false, 
            "Tierno": false, 
            "Maxie": false, 
            "Archie": false, 
            "Ghetsis": false, 
            "Sycamore": false, 
            "Lysandre": false, 
            "Diantha": false, 
            "Wes": false, 
            "Oak": false, 
            "Elm": false, 
            "Birch": false, 
            "Rowan": false, 
            "Juniper": false, 
            "Demi-Fiend": false, 
            "Yugi": false, 
            "Kaiba": false
        }

var event_flags = {
    "yugi": false, 
    "kaiba": false, 
    "demi_fiend": false, 
    "mewtwo_unlocked": false, 
    "mewtwo_cleared": false, 
    }



var LC_mode = false
var LC_character = "Red"


var bf_mode = false
var bf_box = []
var bf_party = [null, null, null, null, null, null]


var versus_mode = false
var versus_menu

# Roguelike: best captured stats per species (pp is the only varying stat)
var rl_captured := {
    "caterpie": { "pp": 2 },
    "pidgey":   { "pp": 2 },
}

func generate_pokemon(species, level, params: = {}):
    var dex_copy: Dictionary
    var source_rarity: int

    if pkmn.dex.has(species):
        dex_copy = pkmn.dex[species].duplicate(true)
        source_rarity = dex_copy["rarity"]
    elif rl_pkmn.dex.has(species):
        dex_copy = rl_pkmn.dex[species].duplicate(true)
        # rl_pkmn usa base_ap y pp_range — agregar aliases que espera setup_unit
        dex_copy["ap"] = dex_copy.get("base_ap", 2)
        var pr = dex_copy.get("pp_range", [3, 4])
        dex_copy["pp"] = randi_range(pr[0], pr[1])
        source_rarity = dex_copy["rarity"]
    else:
        push_error("generate_pokemon: especie '%s' no encontrada en pkmn ni en rl_pkmn" % species)
        return {}

    # slot1
    var pool1 = dex_copy["slot1"].duplicate()
    pool1.shuffle()
    dex_copy["slot1"] = pool1.slice(0, 2)

    # slot2
    var pool2 = dex_copy["slot2"].duplicate()
    pool2.shuffle()
    dex_copy["slot2"] = pool2.slice(0, 2)

    # slot3
    var pool3 = dex_copy["slot3"].duplicate()
    pool3.shuffle()
    dex_copy["slot3"] = pool3.slice(0, 2)

    var slot1 = params.get("slot1", randi() % 2)
    var slot2 = params.get("slot2", randi() % 2)
    var slot3 = params.get("slot3", randi() % 2)

    var bonus_ap = params.get("bonus_ap", 0)
    var bonus_pp = params.get("bonus_pp", 0)
    var bonus_health = params.get("bonus_health", 0)
    var bonus_power = params.get("bonus_power", 0)
    var bonus_speed = params.get("bonus_speed", 0)

    var cur_exp = params.get("exp", 0)
    var max_exp = (100.0 * (float(source_rarity) / 10 + 1))

    for i in range(level):
        max_exp *= 0.1

    if level == 9: cur_exp = max_exp

    var cost = (source_rarity * 50) + (level * 5) + randi_range(-4, 4) - 20
    

    return {
        "species": species,
        "dex": dex_copy,
        "lv": level,
        "exp": cur_exp,
        "max_exp": max_exp,
        "id": randi(),

        "is_shiny": params.get("is_shiny", false),

        "bonus_ap": bonus_ap,
        "bonus_pp": bonus_pp,
        "bonus_health": bonus_health,
        "bonus_power": bonus_power,
        "bonus_speed": bonus_speed,

        "slot1_selected": slot1,
        "slot2_selected": slot2,
        "slot3_selected": slot3,

        "cost": cost,
    }

func level_scale(stat, level):
    return roundi(stat / 2 + (stat * ((float(level) + 1) / 10)) / 2)

func get_evolution(unit):
    var mon_dict

    if typeof(unit) == TYPE_DICTIONARY:
        mon_dict = unit.duplicate(true)
    else:
        mon_dict = unit.unit_dict.duplicate(true)

    var evolved_mon
    if mon_dict["dex"]["name"] not in ["Eevee", "Tyrogue", "Rotom"]:
        evolved_mon = globals.generate_pokemon(pkmn.dex[mon_dict["dex"]["evolve"][0]]["name"].to_lower(), mon_dict["lv"])
    else:
        if mon_dict["dex"]["name"] == "Eevee":
            var eevolutions = ["jolteon", "vaporeon", "flareon", "espeon", "umbreon", "sylveon"]
            eevolutions.shuffle()
            evolved_mon = globals.generate_pokemon(eevolutions[0], 4)

        elif mon_dict["dex"]["name"] == "Tyrogue":
            var eevolutions = ["hitmonlee", "hitmonchan", "hitmontop"]
            eevolutions.shuffle()
            evolved_mon = globals.generate_pokemon(eevolutions[0], 4)

        elif mon_dict["dex"]["name"] == "Rotom":
            var eevolutions = ["heat_rotom", "wash_rotom", "frost_rotom", "fan_rotom", "mow_rotom", ]
            eevolutions.shuffle()
            evolved_mon = globals.generate_pokemon(eevolutions[0], 4)

    evolved_mon["bonus_ap"] = mon_dict["bonus_ap"]
    evolved_mon["bonus_pp"] = mon_dict["bonus_pp"]
    evolved_mon["bonus_health"] = mon_dict["bonus_health"]
    evolved_mon["bonus_power"] = mon_dict["bonus_power"]
    evolved_mon["bonus_speed"] = mon_dict["bonus_speed"]
    evolved_mon["exp"] = mon_dict["exp"]

    player_data.player_box[player_data.player_box.find(mon_dict)] = evolved_mon

    if mon_dict in player_data.player_party:
        player_data.player_party[player_data.player_party.find(mon_dict)] = evolved_mon
    return evolved_mon

func remove_pokemon(dict):
    player_data.player_box.erase(dict)
    if dict in player_data.player_party:
        player_data.player_party[player_data.player_party.find(dict)] = null
