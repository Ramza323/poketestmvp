extends Node


var player_hp = 100.0

var money = 0:
    set(value):
        money = value
        if money < 0: money = 0
        globals.ui.money_label.text = "$%s" % money

var battles_fought = 0
var battles_won = 0
var battles_lost = 0

var prize_money = 0

var event_flags = {
    "giovanni_event": false, 
    "sabrina_event": false, 
    "mew_event": false, 
    "missingno_event": false, 
    "oak_event": false, 
    "letter_open": false, 
    "endgame": false, 
    "anything_stupid": false, 
    "used_cursed_key": false, 
}

var defeated_trainers = []

var player_party = [null, null, null, null, null, null]
var enemy_party = [null, null, null, null, null, null]

var player_box = []

var item_bag = {"rare_candy": 0, 
                "hp_up": 0, 
                "atk_up": 0, 
                "speed_up": 0, 
                "ap_up": 0, 
                "pp_up": 0, 
                "letter": 0, 
                "cursed_key": 0, 
                "front_half": 0, 
                "back_half": 0, 
                "torn_page": 0, 
                }


func _ready():
    globals.player_data = self

    await get_tree().create_timer(0.01).timeout
    globals.ui.money_label.text = "$%s" % money

func get_card(species, level, booster = false):
    var new_mon
    if typeof(species) == TYPE_STRING:
        new_mon = globals.generate_pokemon(species, level)
    else:
        new_mon = species

    globals.ui.setup_card(globals.ui.card, new_mon)
    globals.ui.get_card_player.play("RESET")
    if not booster:
        globals.ui.get_card_player.play("get_card")
    else:
        globals.ui.get_card_player.play("get_booster")
        await get_tree().create_timer(1.7).timeout

    globals.player_data.player_box.append(new_mon)
    globals.ui.setup_party_menu()

func add_pokemon_to_box(species, level, param):
    player_box.append(globals.generate_pokemon(species, level, param))
