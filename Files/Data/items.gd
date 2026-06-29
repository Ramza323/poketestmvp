extends Node

var dict = {
    "rare_candy": {
        "name": "Rare Candy", 
        "desc": "Raise a Pokémon's LEVEL by 1.", 
        "sprite": 0, 
        "target": "pokemon", 
        "func": rare_candy, 
        "cost": 80, 
    }, 

    "atk_up": {
        "name": "Attack Up", 
        "desc": "Raise a Pokémon's ATTACK by 5.", 
        "sprite": 1, 
        "target": "pokemon", 
        "func": atk_up, 
        "cost": 70, 
    }, 

    "hp_up": {
        "name": "HP Up", 
        "desc": "Raise a Pokémon's HEALTH by 5.", 
        "sprite": 3, 
        "target": "pokemon", 
        "func": hp_up, 
        "cost": 70, 
    }, 

    "speed_up": {
        "name": "Speed Up", 
        "desc": "Raise a Pokémon's SPEED by 5.", 
        "sprite": 2, 
        "target": "pokemon", 
        "func": speed_up, 
        "cost": 70, 
    }, 

    "ap_up": {
        "name": "AP Up", 
        "desc": "Raise a Pokémon's AP by 1.", 
        "sprite": 4, 
        "target": "pokemon", 
        "func": ap_up, 
        "cost": 120, 
    }, 

    "pp_up": {
        "name": "PP Up", 
        "desc": "Raise a Pokémon's PP by 1.", 
        "sprite": 5, 
        "target": "pokemon", 
        "func": pp_up, 
        "cost": 80, 
    }, 

    "letter": {
        "name": "Letter", 
        "desc": "Found in the Break Room.", 
        "sprite": 12, 
        "target": "none", 
        "func": letter, 
        "cost": 0, 
    }, 

    "cursed_key": {
        "name": "Cursed Key", 
        "desc": "Key to Room 211.", 
        "sprite": 13, 
        "target": "", 
        "func": pp_up, 
        "cost": 0, 
    }, 

    "front_half": {
        "name": "Front Half of KEY", 
        "desc": "\"WI--\"", 
        "sprite": 13, 
        "target": "", 
        "func": pp_up, 
        "cost": 0, 
    }, 

    "back_half": {
        "name": "Back Half of KEY", 
        "desc": "\"--SH\"", 
        "sprite": 13, 
        "target": "", 
        "func": pp_up, 
        "cost": 0, 
    }, 

    "torn_page": {
        "name": "Torn Page", 
        "desc": "It reads: \"The key is missing\".", 
        "sprite": 14, 
        "target": "", 
        "func": pp_up, 
        "cost": 0, 
    }, 




}

func rare_candy(unit):
    if unit["lv"] > 8: return
    consume_item("rare_candy")

    unit["lv"] += 1
    unit["max_exp"] *= 1.5
    globals.ui.update_status(globals.player_data.player_box[globals.ui.party_index])

    var node = globals.ui.party_list.get_child(globals.player_data.player_box.find(unit)).get_node("Level")
    pulse_node(node)
    pulse_node(globals.ui.status_menu.get_node("Stats/Level"))


    if unit["dex"].has("evolve") and unit["dex"]["evolve"][1] <= unit["lv"]:
        await item_evolution(unit)

    else:
        await wait(0.55)

func atk_up(unit):
    consume_item("atk_up")
    unit["bonus_power"] += get_item_value(unit)

    globals.ui.update_status(globals.player_data.player_box[globals.ui.party_index])
    pulse_node(globals.ui.status_menu.get_node("Stats/ATK"))
    pulse_node(globals.ui.status_menu.get_node("Stats/Bars/ATKBar"), false)
    await wait(0.55)

func hp_up(unit):
    consume_item("hp_up")
    unit["bonus_health"] += get_item_value(unit)

    globals.ui.update_status(globals.player_data.player_box[globals.ui.party_index])
    pulse_node(globals.ui.status_menu.get_node("Stats/HP"))
    pulse_node(globals.ui.status_menu.get_node("Stats/Bars/HealthBar"), false)
    await wait(0.55)

func speed_up(unit):
    consume_item("speed_up")
    unit["bonus_speed"] += get_item_value(unit)

    globals.ui.update_status(globals.player_data.player_box[globals.ui.party_index])
    pulse_node(globals.ui.status_menu.get_node("Stats/SPD"))
    pulse_node(globals.ui.status_menu.get_node("Stats/Bars/SPDBar"), false)
    await wait(0.55)

func ap_up(unit):
    if unit["dex"]["ap"] + unit["bonus_ap"] > 9: return
    consume_item("ap_up")

    var value = 1
    if unit["dex"]["rarity"] == 1: value = 2

    unit["bonus_ap"] += value

func pp_up(unit):
    if unit["dex"]["pp"] + unit["bonus_pp"] > 9: return
    consume_item("pp_up")

    var value = 1
    if unit["dex"]["rarity"] == 1: value = 2

    unit["bonus_pp"] += value

func letter():
    await globals.cutscenes.opening_letter()





func item_evolution(unit):

    if globals.bf_mode:
        globals.player_data.player_party[globals.player_data.player_party.find(unit)] = null

        for i in globals.battle.get_node("UnitField").get_children():
            if i == globals.battle.get_node("UnitField").get_child(0): continue
            if i.unit_dict["id"] == unit["id"]:
                globals.battle.units_in_play.erase(i)

                if i in globals.battle.player_team:
                    globals.battle.player_team[globals.battle.player_team.find(i)] = null

                if i in globals.battle.player_team_copy:
                    globals.battle.player_team_copy[globals.battle.player_team_copy.find(i)] = null

                i.queue_free()

                break

    var node = globals.ui.party_list.get_child(globals.player_data.player_box.find(unit))
    var evolved_mon = globals.get_evolution(unit)










    var new_sprite = node.get_node("Sprite").duplicate()
    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    new_sprite.modulate = Color("#ffffff00")
    new_sprite.frame = evolved_mon["dex"]["sprite"]

    node.add_child(new_sprite)

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_parallel(true)
    tween.tween_property(node.get_node("Sprite/BlinkTexture"), "color", Color("#ffffff"), 0.4)
    tween.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.4)
    await wait(0.4)

    tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_parallel(true)
    tween.tween_property(node.get_node("Sprite"), "modulate", Color("#ffffff00"), 0.5)
    tween.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.5)
    tween.tween_property(new_sprite.get_node("BlinkTexture"), "modulate", Color("#ffffff00"), 0.9)

    await wait(1)

func consume_item(item_name):
    globals.player_data.item_bag[item_name] -= 1

func pulse_node(node, scale = true):
    var prev_color = node.modulate
    node.modulate = Color("#00eeff")

    var tween = get_tree().create_tween()
    if scale:
        tween.tween_property(node, "scale", Vector2(1.5, 1.5), 0.04)
        tween.tween_property(node, "scale", Vector2(1, 1), 0.2)
    tween.tween_property(node, "modulate", prev_color, 0.3)

func get_item_value(unit):
    var rarity = unit["dex"]["rarity"]
    var value = 1

    if rarity == 1:
        value = 10
    elif rarity == 2:
        value = 7
    elif rarity == 3:
        value = 5
    elif rarity == 4:
        value = 2

    return value





func wait(time):
    await get_tree().create_timer(time).timeout
