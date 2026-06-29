extends Node2D

signal choice_made(index)

#@onready var menu_selector: ColorRect = $Selector
#@onready var menu_list: VBoxContainer = $VList
@onready var gui_player: AudioStreamPlayer = $"../GUIPlayer"
@onready var status_menu: Node2D = $Status
@onready var move_info: Node2D = $Status/MoveInfoNew
@onready var move_infoOld: Node2D = $Status/MoveInfoOld
@onready var party_menu: Node2D = $Status / Party

enum {
    off, 
    locked, 
    menu, 
    party, 
    status, 
    formation, 
    battle_options, 
    card_shop, 
    selling, 
    starter, 
    items, 
    item_shop, 
    keyboard, 
}

var state = off
var status_move_index = 0
var slot_name
var new_move

var menu_index := 0
var options := []
var awaiting_choice := false

var movebox_switch_1 = Vector2(783.0, 289.0)
var movebox_switch_2 = Vector2(896.0, 289.0)
var movebox_pos_array = [movebox_switch_1, movebox_switch_2]
var CurrentPokemon

func setup(pokemon, _slot_name, _new_move):
    # Prepara la UI para mostrarla
    CurrentPokemon = pokemon
    show()
    set_process(true)
    play_learn_move()

    slot_name = _slot_name
    new_move = _new_move
    #moves = pokemon["dex"][slot_name]
    update_status(pokemon)
    $Status/MoveInfoOld/MoveName.text = moves.active[new_move]["name"]
    var attack_desc: String = moves.active[new_move]["desc"].format([moves.active[new_move]["power"]])
    $Status/MoveInfoOld/MoveDesc.text = attack_desc
    var color = moves.active[new_move]["color"]
    if color == "none": color = pokemon["dex"]["color"]
    move_infoOld.get_node("MoveColor").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([color]))
    move_infoOld.get_node("ColorBorder").modulate = poke_types.colors[pkmn.dex[pokemon["species"]]["color"]][0]
    move_infoOld.get_node("BG/CardTexture").modulate = poke_types.colors[pokemon["dex"]["color"]][3]
    
    var cost_container = $Status / MoveInfoOld / CostContainer
    for i in range(moves.active[new_move]["cost"]):
        var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])
        cost_container.add_child(new_point)
    
    #$Status/Moves/Move1.visible = false
    #$Status/Moves/Move2.visible = false
    #$Status/Moves/Move3.visible = false
    
    
    #$Status/MoveInfoNew/MoveName = 
    
    #mirar que slot es
    if(slot_name == "slot1"):
        $Status/Moves/Move1.visible = true  
    elif(slot_name == "slot3"):
        $Status/Moves/Move3.visible = true 
        
    #if moves.size() > 0:
        #$Status/Move0.text = str(moves[0])
    #if moves.size() > 1:
        #$VList/Move1.text = str(moves[1])
#
    #options = [$VList/Move0, $VList/Move1]
    menu_index = 0
    update_menu_selector()
    
    ## 🔹 Mostrar el sprite del Pokémon
    #var sprite_frame = pokemon["dex"]["sprite"] # índice del frame o sprite
    ## 🔹 Mostrar el sprite de color según el Pokémon
    #var color_name = pokemon["dex"]["color"] # por ejemplo: "green"
    #var color_path = "res://Files/Sprites/ColorIcons/%s.png" % color_name
#
    ## Cargar la textura
    #var tex = load(color_path)
    #$PokemonInfo/ColorSprite.texture = tex
    #$PokemonInfo/ColorSprite.visible = true
    #$PokemonInfo/PokeSprite.frame = sprite_frame
    #$PokemonInfo/PokeSprite.visible = true

    awaiting_choice = true
    return await await_choice()

func await_choice() -> int:
    # Espera a que se emita la señal
    while awaiting_choice:
        await get_tree().process_frame
    return menu_index

func _process(_delta):
    if not is_visible_in_tree():
        return
    handle_input()
    enable_status_menu()

func update_status(unit):
    if unit == null: return

    status_menu.get_node("Stats/Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([pkmn.dex[unit["species"]]["color"]]))
    status_menu.get_node("Stats/ColorBorder").modulate = poke_types.colors[pkmn.dex[unit["species"]]["color"]][0]

    var name_node = status_menu.get_node("Stats/Name")
    name_node.scale.x = 1
    name_node.text = pkmn.dex[unit["species"]]["name"]
    if name_node.text.length() > 15:
        for i in range(name_node.text.length() - 15):
            name_node.scale.x -= 0.06

    status_menu.get_node("Stats/Sprite").frame = pkmn.dex[unit["species"]]["sprite"]

    status_menu.get_node("Rarity").frame = pkmn.dex[unit["species"]]["rarity"] - 1

    if pkmn.dex[unit["species"]].has("evolve"):
        status_menu.get_node("Stats/Evolution").text = "evo:%s" % pkmn.dex[unit["species"]]["evolve"][1]
        status_menu.get_node("Stats/Evolution").modulate = Color("#f8f8f8")
    else:
        status_menu.get_node("Stats/Evolution").text = "evo:-"
        status_menu.get_node("Stats/Evolution").modulate = Color("#ffffff73")

    status_menu.get_node("BG").color = poke_types.colors[unit["dex"]["color"]][3]

    $Status / Points / AP / APBG.color = poke_types.colors[unit["dex"]["color"]][3]
    $Status / Points / PP / APBG.color = poke_types.colors[unit["dex"]["color"]][3]
    $Status / Stats / EvoBG.color = poke_types.colors[unit["dex"]["color"]][3]


    var unit_health = globals.level_scale(pkmn.dex[unit["species"]]["health"], unit["lv"]) + unit["bonus_health"]
    var unit_power = globals.level_scale(pkmn.dex[unit["species"]]["power"], unit["lv"]) + unit["bonus_power"]
    var unit_speed = globals.level_scale(pkmn.dex[unit["species"]]["speed"], unit["lv"]) + unit["bonus_speed"]


    status_menu.get_node("Stats/Level").text = "lv: {0}".format([unit["lv"]])
    status_menu.get_node("Stats/HP").text = "hp: {0}".format([unit_health])
    status_menu.get_node("Stats/ATK").text = "atk: {0}".format([unit_power])
    status_menu.get_node("Stats/SPD").text = "spd: {0}".format([unit_speed])

    status_menu.get_node("Stats/SpriteBG/ScrollBG").modulate = Color(poke_types.colors[unit["dex"]["color"]][0])
    status_menu.get_node("Stats/SpriteBG/SpriteShadow").modulate = Color(poke_types.colors[unit["dex"]["color"]][2])

    status_menu.get_node("Moves/Move1/Option1").text = moves.active[unit["dex"]["slot1"][0]]["name"]
    status_menu.get_node("Moves/Move1/Option2").text = moves.active[unit["dex"]["slot1"][1]]["name"]

    var cur_color = "none"
    if unit["slot1_selected"] != 2:
        cur_color = moves.active[unit["dex"]["slot1"][unit["slot1_selected"]]]["color"]
    else:
        cur_color = unit["dex"]["color"]
    if cur_color == "none": cur_color = unit["dex"]["color"]

    status_menu.get_node("Moves/Move1/MoveBG").modulate = poke_types.colors[cur_color][0]
    status_menu.get_node("Moves/Move1/Switch").self_modulate = poke_types.colors[unit["dex"]["color"]][1]

    status_menu.get_node("Moves/Move2/Option1").text = moves.passive[unit["dex"]["slot2"][0]]["name"]
    status_menu.get_node("Moves/Move2/Option2").text = moves.passive[unit["dex"]["slot2"][1]]["name"]
    status_menu.get_node("Moves/Move2/MoveBG").modulate = poke_types.colors[unit["dex"]["color"]][0]
    status_menu.get_node("Moves/Move2/Switch").self_modulate = poke_types.colors[unit["dex"]["color"]][1]

    status_menu.get_node("Moves/Move3/Option1").text = moves.active[unit["dex"]["slot3"][0]]["name"]
    status_menu.get_node("Moves/Move3/Option2").text = moves.active[unit["dex"]["slot3"][1]]["name"]
    status_menu.get_node("Moves/Move3/Switch").self_modulate = poke_types.colors[unit["dex"]["color"]][1]

    cur_color = "none"
    if unit["slot3_selected"] != 2:
        cur_color = moves.active[unit["dex"]["slot3"][unit["slot3_selected"]]]["color"]
    else:
        cur_color = unit["dex"]["color"]
    if cur_color == "none": cur_color = unit["dex"]["color"]
    status_menu.get_node("Moves/Move3/MoveBG").modulate = poke_types.colors[cur_color][0]

    if unit["slot1_selected"] != 2:
        status_menu.get_node("Moves").get_child(0).get_node("Switch").position = movebox_pos_array[unit["slot1_selected"]]

    cur_color = "none"
    if unit["slot1_selected"] != 2:
        cur_color = moves.active[unit["dex"]["slot1"][unit["slot1_selected"]]]["color"]
    else:
        cur_color = unit["dex"]["color"]
    if cur_color == "none": cur_color = unit["dex"]["color"]
    status_menu.get_node("Moves").get_child(0).get_node("MoveBG").modulate = poke_types.colors[cur_color][0]
    if unit["slot1_selected"] == 0:
        status_menu.get_node("Moves").get_child(0).get_node("Option1").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(0).get_node("Option1").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(0).get_node("Option2").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(0).get_node("Option2").modulate = Color("ffffffb4")

    else:
        status_menu.get_node("Moves").get_child(0).get_node("Option2").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(0).get_node("Option2").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(0).get_node("Option1").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(0).get_node("Option1").modulate = Color("ffffffb4")

    if unit["slot2_selected"] != 2:
        status_menu.get_node("Moves").get_child(1).get_node("Switch").position = movebox_pos_array[unit["slot2_selected"]]
    if unit["slot2_selected"] == 0:
        status_menu.get_node("Moves").get_child(1).get_node("Option1").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(1).get_node("Option1").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(1).get_node("Option2").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(1).get_node("Option2").modulate = Color("ffffffb4")
    else:
        status_menu.get_node("Moves").get_child(1).get_node("Option2").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(1).get_node("Option2").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(1).get_node("Option1").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(1).get_node("Option1").modulate = Color("ffffffb4")

    if unit["slot3_selected"] != 2:
        status_menu.get_node("Moves").get_child(2).get_node("Switch").position = movebox_pos_array[unit["slot3_selected"]]

    cur_color = "none"
    if unit["slot3_selected"] != 2:
        cur_color = moves.active[unit["dex"]["slot3"][unit["slot3_selected"]]]["color"]
    else:
        cur_color = unit["dex"]["color"]
    if cur_color == "none": cur_color = unit["dex"]["color"]
    status_menu.get_node("Moves").get_child(2).get_node("MoveBG").modulate = poke_types.colors[cur_color][0]

    if unit["slot3_selected"] == 0:
        status_menu.get_node("Moves").get_child(2).get_node("Option1").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(2).get_node("Option1").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(2).get_node("Option2").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(2).get_node("Option2").modulate = Color("ffffffb4")
    else:
        status_menu.get_node("Moves").get_child(2).get_node("Option2").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(2).get_node("Option2").modulate = Color("#ffffff")
        status_menu.get_node("Moves").get_child(2).get_node("Option1").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(2).get_node("Option1").modulate = Color("ffffffb4")

    if unit["slot1_selected"] == 2:
        status_menu.get_node("Moves").get_child(0).modulate = Color(1.0, 1.0, 1.0, 0.431)
    else:
        status_menu.get_node("Moves").get_child(0).modulate = Color(1.0, 1.0, 1.0, 1.0)
    if unit["slot3_selected"] == 2:
        status_menu.get_node("Moves").get_child(2).modulate = Color(1.0, 1.0, 1.0, 0.431)
    else:
        status_menu.get_node("Moves").get_child(2).modulate = Color(1.0, 1.0, 1.0, 1.0)

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(status_menu.get_node("Stats/Bars/ExpBar"), "scale", Vector2(float(unit["exp"]) / unit["max_exp"], 1), 0.1)
    tween.tween_property(status_menu.get_node("Stats/Bars/HealthBar"), "scale", Vector2(clamp(float(unit_health) / 100, 0, 1), 1), 0.1)
    tween.tween_property(status_menu.get_node("Stats/Bars/ATKBar"), "scale", Vector2(clamp(float(unit_power) / 100, 0, 1), 1), 0.1)
    tween.tween_property(status_menu.get_node("Stats/Bars/SPDBar"), "scale", Vector2(clamp(float(unit_speed) / 100, 0, 1), 1), 0.1)

    for i in status_menu.get_node("Points/AP/APBox1").get_children():
        i.queue_free()
    for i in status_menu.get_node("Points/AP/APBox2").get_children():
        i.queue_free()
    for i in status_menu.get_node("Points/PP/PPBox1").get_children():
        i.queue_free()
    for i in status_menu.get_node("Points/PP/PPBox2").get_children():
        i.queue_free()

    var ap = unit["dex"]["ap"] + unit["bonus_ap"]
    var pp = unit["dex"]["pp"] + unit["bonus_pp"]
    var cont = 0
    for i in ap:
        var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])

        if cont < 5:
            status_menu.get_node("Points/AP/APBox1").add_child(new_point)
        else:
            status_menu.get_node("Points/AP/APBox2").add_child(new_point)

        cont += 1

    cont = 0
    for i in pp:
        var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["pp"])

        if cont < 5:
            status_menu.get_node("Points/PP/PPBox1").add_child(new_point)
        else:
            status_menu.get_node("Points/PP/PPBox2").add_child(new_point)

        cont += 1

func switch_move():
    var cur_unit
    cur_unit = CurrentPokemon

    state = locked
    if(slot_name == "slot1"):
        status_move_index = 0
    else:
        status_move_index = 2
    var selected_movebox = status_menu.get_node("Moves").get_child(status_move_index)
    var movebox_switch = selected_movebox.get_node("Switch")

    var switched_position
    var switched_value
    var switched_color

    if status_move_index == 0 and cur_unit["slot1_selected"] == 2:
        enable_move()
        return



    elif status_move_index == 2 and cur_unit["slot3_selected"] == 2:
        enable_move()
        return

    if movebox_switch.position == movebox_switch_1:
        switched_position = movebox_switch_2
        switched_value = 1

    else:
        switched_position = movebox_switch_1
        switched_value = 0


    if status_move_index == 0:
        switched_color = moves.active[cur_unit["dex"]["slot1"][switched_value]]["color"]
        if switched_color == "none": switched_color = cur_unit["dex"]["color"]
    elif status_move_index == 2:
        switched_color = moves.active[cur_unit["dex"]["slot3"][switched_value]]["color"]
        if switched_color == "none": switched_color = cur_unit["dex"]["color"]



    var tween = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_parallel()
    tween.tween_property(movebox_switch, "position", switched_position, 0.2)
    tween.tween_property(selected_movebox.get_node("Option%s" % (switched_value + 1)), "scale", Vector2(1, 1), 0.2)

    if status_move_index in [0, 2]:
        tween.tween_property(selected_movebox.get_node("MoveBG"), "modulate", Color(poke_types.colors[switched_color][0]), 0.2)




    if switched_value == 0:
        tween.tween_property(selected_movebox.get_node("Option1"), "scale", Vector2(0.9, 0.9), 0.2)
        tween.tween_property(selected_movebox.get_node("Option2"), "scale", Vector2(0.7, 0.7), 0.2)
        tween.tween_property(selected_movebox.get_node("Option2"), "modulate", Color("ffffffb4"), 0.2)
        tween.tween_property(selected_movebox.get_node("Option1"), "modulate", Color("ffffff"), 0.2)
    else:
        tween.tween_property(selected_movebox.get_node("Option2"), "scale", Vector2(0.9, 0.9), 0.2)
        tween.tween_property(selected_movebox.get_node("Option1"), "scale", Vector2(0.7, 0.7), 0.2)
        tween.tween_property(selected_movebox.get_node("Option1"), "modulate", Color("ffffffb4"), 0.2)
        tween.tween_property(selected_movebox.get_node("Option2"), "modulate", Color("ffffff"), 0.2)

    if status_move_index == 0:
        cur_unit["slot1_selected"] = switched_value
    if status_move_index == 2:
        cur_unit["slot3_selected"] = switched_value

    update_move_info()
    await wait(0.2)
    state = status
    
func select_movebox(index):
    var selected_movebox = status_menu.get_node("Moves").get_child(index)
    selected_movebox.get_node("Switch/Selector").visible = true
    update_move_info()
    
func enable_status_menu():
    state = status
    select_movebox(status_move_index)

    update_move_info()
    var tween = get_tree().create_tween()
    tween.tween_property(move_info, "position", Vector2(0, 0), 0.2)

    party_menu.get_node("Selector").z_index = 0
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 0

    if not globals.bf_mode and not globals.versus_mode:
        $Status / DisableHint.show()

func delete_cost_childs():
    var cost_container = $Status/MoveInfoOld/CostContainer

    for child in cost_container.get_children():
        child.queue_free()

func handle_input():
    #if Input.is_action_just_pressed("Info") or Input.is_action_just_pressed("right"):
        #play_accept_SE()
        ##disable_party()
        ##displayed_unit = globals.player_data.player_box[party_index]
        #await wait(0.01)
        #enable_status_menu()
    #if Input.is_action_just_pressed("down"):
        #play_cursor_SE()
        #menu_index = (menu_index + 1) % options.size()
        #update_menu_selector()
    #elif Input.is_action_just_pressed("up"):
        #play_cursor_SE()
        #menu_index = (menu_index - 1 + options.size()) % options.size()
        #update_menu_selector()
    if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
        play_accept_SE()
        await switch_move()
    elif Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        select_current(menu_index)
        delete_cost_childs()
    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        select_current(-1)
        delete_cost_childs()

func select_current(index):
    awaiting_choice = false
    hide()
    emit_signal("choice_made", index)

func update_menu_selector():
    if options.is_empty():
        return
    var target = options[menu_index]
    if not is_instance_valid(target):
        return
    #menu_selector.global_position = target.global_position + Vector2(-10, 0)

func enable_move():
    var cur_unit
    cur_unit = CurrentPokemon

    state = locked
    var selected_movebox = status_menu.get_node("Moves").get_child(status_move_index)
    var movebox_switch = selected_movebox.get_node("Switch")
    var switched_value = 0
    movebox_switch.position = movebox_switch_1





    if status_move_index == 0:
        cur_unit["slot1_selected"] = switched_value
        status_menu.get_node("Moves").get_child(0).get_node("Option1").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(0).get_node("Option2").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(0).get_node("Option2").modulate = Color("ffffffb4")
        status_menu.get_node("Moves").get_child(0).get_node("Option1").modulate = Color("ffffff")


    if status_move_index == 2:
        cur_unit["slot3_selected"] = switched_value
        status_menu.get_node("Moves").get_child(2).get_node("Option1").scale = Vector2(0.9, 0.9)
        status_menu.get_node("Moves").get_child(2).get_node("Option2").scale = Vector2(0.7, 0.7)
        status_menu.get_node("Moves").get_child(0).get_node("Option2").modulate = Color("ffffffb4")
        status_menu.get_node("Moves").get_child(0).get_node("Option1").modulate = Color("ffffff")

    selected_movebox.modulate = Color(1.0, 1.0, 1.0, 1.0)
    update_move_info()
    await wait(0.2)
    state = status
    
func update_move_info():
    var cur_unit
    cur_unit = CurrentPokemon

    var cur_move

    var cost_container = $Status / MoveInfoNew / CostContainer

    if status_move_index == 0:
        if cur_unit["slot1_selected"] == 2:
            for i in cost_container.get_children():
                i.queue_free()
            return
        cur_move = cur_unit["dex"]["slot1"][cur_unit["slot1_selected"]]

    elif status_move_index == 1:
        if cur_unit["slot2_selected"] == 2:
            for i in cost_container.get_children():
                i.queue_free()
            return
        cur_move = cur_unit["dex"]["slot2"][cur_unit["slot2_selected"]]

    elif status_move_index == 2:
        if cur_unit["slot3_selected"] == 2:
            for i in cost_container.get_children():
                i.queue_free()
            return
        cur_move = cur_unit["dex"]["slot3"][cur_unit["slot3_selected"]]


    for i in cost_container.get_children():
        i.queue_free()

    if status_move_index in [0, 2]:
        for i in range(moves.active[cur_move]["cost"]):
            var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
            new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])
            cost_container.add_child(new_point)
    else:
        for i in range(moves.passive[cur_move]["cost"]):
            var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
            new_point.get_node("PointColor").color = Color(poke_types.colors["pp"])
            cost_container.add_child(new_point)

    if status_move_index == 1:
        move_info.get_node("MoveColor").visible = false
        move_info.get_node("ColorBorder").visible = false
        move_info.get_node("MoveName").text = moves.passive[cur_move]["name"]
        move_info.get_node("MoveDesc").text = moves.passive[cur_move]["desc"]
    else:
        move_info.get_node("MoveColor").visible = true
        move_info.get_node("ColorBorder").visible = true
        move_info.get_node("MoveName").text = moves.active[cur_move]["name"]
        move_info.get_node("MoveDesc").text = moves.active[cur_move]["desc"].format([moves.active[cur_move]["power"], moves.active[cur_move]["cost"]])

        var color = moves.active[cur_move]["color"]
        if color == "none": color = cur_unit["dex"]["color"]
        move_info.get_node("MoveColor").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([color]))
        move_info.get_node("ColorBorder").modulate = poke_types.colors[pkmn.dex[cur_unit["species"]]["color"]][0]
        move_info.get_node("BG/CardTexture").modulate = poke_types.colors[cur_unit["dex"]["color"]][3]


# 🎵 Sonidos
func play_learn_move():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/SFX_CAUGHT_MON.wav")
    gui_player.play()

func play_cursor_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI sel cursor.ogg")
    gui_player.play()

func play_accept_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI sel decision.ogg")
    gui_player.play()

func play_cancel_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI menu close.ogg")
    gui_player.play()
    
func wait(time):
    await get_tree().create_timer(time).timeout
