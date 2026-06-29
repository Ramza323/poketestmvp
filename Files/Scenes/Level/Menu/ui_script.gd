extends Node2D

@onready var screen_tint: ColorRect = $"../ScreenTint"
@onready var trans_areas


@onready var selector: ColorRect = $Selector
@onready var v_list: VBoxContainer = $VList

@onready var status_menu: Node2D = $Status
@onready var move_info: Node2D = $Status / MoveInfo

@onready var party_menu: Node2D = $Status / Party
@onready var party_list: VBoxContainer = $Status / Party / VList
@onready var formation_menu: Node2D = $Status / Party / Formation

@onready var items_menu: Node2D = $Items
@onready var item_list: VBoxContainer = $Items / ItemList

@onready var card_shop_menu: Node2D = $"../Shop"
@onready var card_list: HBoxContainer = $"../Shop/CardList"
@onready var booster_list: HBoxContainer = $"../Shop/BoosterList"

@onready var item_shop_menu: Node2D = $"../ItemShop"

@onready var card: Node2D = $"../GetCard/Card/CardShopCard"
@onready var get_card_player: AnimationPlayer = $"../GetCard/AnimationPlayer"

@onready var starters_menu: Node2D = $"../Starters"
@onready var deck_list1 = $"../Starters/DeckList"
@onready var deck_list2 = $"../Starters/DeckList2"
@onready var deck_list3 = $"../Starters/DeckList3"

@onready var hud: Node2D = $"../HUD"
@onready var money_label: Label = $"../HUD/Money/Money"

@onready var message_box: Node2D = $"../Message/SpeechBox"

@onready var mm_label: Label = $"../MM/Label"

@onready var gbc: Node2D = $"../GBC"
@onready var shadow_border: Sprite2D = $"../ShadowBorder"

@onready var disable_hint: Node2D = $Status / DisableHint




var card_shop_card = load("res://Files/Scenes/Level/Menu/card_shop_card.tscn")
var shop_revealed = false

var selector_base_y_pos = 97.0
var selector_index = 0

var party_index = 0
var party_selector_offset = 108
var status_move_index = 0
var formation_index = 1

var battle_options_index = 0

var displayed_unit = null
var movebox_switch_1 = Vector2(783.0, 289.0)
var movebox_switch_2 = Vector2(896.0, 289.0)
var movebox_pos_array = [movebox_switch_1, movebox_switch_2]

var mon_pickedup = false

var item_index = 0

var card_shop_index = 0
var card_shop_line = 0
var color_affordable = Color("#eeca52")
var color_unaffordable = Color("#e64039")


var starter_index = 0
var starter_line = 0
var quit_timer = 0


var keyboard_question = ""


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
    options, 
}
var state = off


var regular_menu = false

func _ready() -> void :
    globals.ui = self

    if not globals.bf_mode and not globals.test_mode:
        trans_areas = $"../../TransAreas"

    await wait(0.01)
    setup_party_menu()
    setup_formation()
    setup_starters()
    setup_item_shop()
    setup_trainer_menu()
    adjust_ui_se_volume()
    set_vsync()
    set_fullscreen()

func _physics_process(_delta: float) -> void :





    if state == menu:
        menu_input()

    elif state == party:
        party_input()

    elif state == status:
        status_input()

    elif state == formation:
        formation_input()

    elif state == battle_options:
        battle_options_input()

    elif state == card_shop:
        card_shop_input()

    elif state == selling:
        sell_input()

    elif state == starter:
        starter_input()

    elif state == items:
        items_input()

    elif state == item_shop:
        item_shop_input()

    elif state == keyboard:
        keyboard_input()

    elif state == options:
        options_input()




func show_menu():
    play_accept_SE()
    regular_menu = true
    visible = true
    globals.player.state = globals.player.locked
    selector_index = 0
    selector.position.y = selector_base_y_pos

    party_menu.get_node("Selector").z_index = 0
    $Status / Party / Options / AutoBattle.z_index = 0
    $Status / Party / Options / PreBattle.z_index = 0

    var tween = get_tree().create_tween()
    tween.tween_property(self, "position", Vector2(0, 0), 0.2)
    await wait(0.05)
    state = menu

    setup_party_menu()
    await wait(0.2)
    setup_formation()

func hide_menu():
    state = locked
    regular_menu = false
    var tween = get_tree().create_tween()
    tween.tween_property(self, "position", Vector2(312, 0), 0.2)
    await wait(0.3)
    state = off
    globals.player.state = globals.player.free

func close_menu():
    hide_party_menu()
    hide_items()
    await wait(0.4)
    await hide_menu()
    state = off

    party_menu.get_node("Selector").z_index = 0


func menu_input():
    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        if selector_index == 0:
            if not globals.player_data.player_box: return
            disable_menu()
            state = locked
            await show_party_menu()
            await wait(0.1)
            state = party

        elif selector_index == 1:
            disable_menu()
            await show_items()

        elif selector_index == 2:
            disable_menu()
            await show_trainer_menu()

        elif selector_index == 4:


            if globals.hotel.game_level > 2:
                play_buzzer_SE()
                return

            globals.cutscenes.suspend_game_event()
            return

        elif selector_index == 5:
            globals.cutscenes.quit_game_event()
            return

        elif selector_index == 3:
            show_options()

    if Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        hide_menu()

    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if selector_index + 1 < 6:
            selector_index += 1
        else:
            selector_index = 0

        selector.position.y = v_list.get_child(selector_index).position.y + selector_base_y_pos

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if selector_index - 1 >= 0:
            selector_index -= 1
        else:
            selector_index = 5

        selector.position.y = v_list.get_child(selector_index).position.y + selector_base_y_pos

func disable_menu():
    selector.modulate = Color("#ffffff82")
    v_list.modulate = Color("#ffffff82")
    selector.get_node("AnimationPlayer").speed_scale = 0

func enable_menu():
    selector.modulate = Color("#ffffff")
    v_list.modulate = Color("#ffffff")
    selector.get_node("AnimationPlayer").speed_scale = 1

func suspend_game():
    if globals.player_data.event_flags["endgame"]:
        play_buzzer_SE()
        return

    var packed_scene = PackedScene.new()
    packed_scene.pack(globals.hotel)
    ResourceSaver.save(packed_scene, globals.suspended_path)

    var dict = {
        "player_name": globals.player.player_name, 
        "player_hp": globals.player_data.player_hp, 
        "money": globals.player_data.money, 
        "battles_fought": globals.player_data.battles_fought, 
        "battles_won": globals.player_data.battles_won, 
        "battles_lost": globals.player_data.battles_lost, 
        "prize_money": globals.player_data.prize_money, 
        "event_flags": globals.player_data.event_flags, 
        "defeated_trainers": globals.player_data.defeated_trainers, 
        "player_party": globals.player_data.player_party, 
        "enemy_party": globals.player_data.enemy_party, 
        "player_box": globals.player_data.player_box, 
        "item_bag": globals.player_data.item_bag, 
    }

    dict["global_data"] = {
        "player": globals.player, 
        "normal_mode": globals.normal_mode, 
        "test_mode": globals.test_mode, 
        "auto_battle": globals.auto_battle, 
        "pre_battle_formation": globals.pre_battle_formation, 
        "booster_due": globals.booster_due, 
        "mewtwo_mode": globals.mewtwo_mode, 
        "versus_mode": globals.versus_mode, 
        "bf_mode": globals.bf_mode, 
        "LC_mode": globals.LC_mode, 
        "lc_selected": globals.lc_selected, 
        "deck_selected": globals.deck_selected, 
        "LC_character": globals.LC_character
        }

    dict["npc_progression"] = globals.npc.progression

    dict["level"] = {
        "game_level": globals.hotel.game_level, 
        "card_shop_stock": globals.hotel.card_shop_stock, 
        "event_index": globals.hotel.event_index, 
        "loop_index": globals.hotel.loop_index, 
    }



    globals.suspended_game = dict
    await wait(1)




func status_input():
    if Input.is_action_just_pressed("Cancel") or Input.is_action_just_pressed("left"):
        play_cancel_SE()
        if regular_menu:
            disable_status_menu()
        else:
            state = off
            unselect_movebox(status_move_index)
            if not globals.versus_mode:
                enable_party()

            status_move_index = 0
            var tween = get_tree().create_tween()
            tween.tween_property(move_info, "position", Vector2(290, 0), 0.2)

        return

    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        await switch_move()

    if Input.is_action_just_pressed("Info"):
        await disable_move()
















    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        unselect_movebox(status_move_index)
        if status_move_index + 1 < 3:
            status_move_index += 1
        else:
            status_move_index = 0
        select_movebox(status_move_index)

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        unselect_movebox(status_move_index)
        if status_move_index == 0:
            status_move_index = 2
        else:
            status_move_index -= 1
        select_movebox(status_move_index)

func enable_status_menu():
    play_accept_SE()
    state = status
    disable_party()
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

func disable_status_menu():
    unselect_movebox(status_move_index)
    status_move_index = 0
    $Status / DisableHint.hide()

    var tween = get_tree().create_tween()
    tween.tween_property(move_info, "position", Vector2(290, 0), 0.2)
    await tween.finished
    state = party
    enable_party()
    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2

func select_movebox(index):
    var selected_movebox = status_menu.get_node("Moves").get_child(index)
    selected_movebox.get_node("Switch/Selector").visible = true
    update_move_info()

func unselect_movebox(index):
    var selected_movebox = status_menu.get_node("Moves").get_child(index)
    selected_movebox.get_node("Switch/Selector").visible = false

func switch_move():
    var cur_unit
    if not globals.versus_mode:
        cur_unit = globals.player_data.player_box[party_index]
    else:
        cur_unit = globals.versus_menu.displayed_unit

    state = locked
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
    if status_move_index == 1:
        cur_unit["slot2_selected"] = switched_value
    if status_move_index == 2:
        cur_unit["slot3_selected"] = switched_value

    update_move_info()
    await wait(0.2)
    state = status

func update_status(unit):
    if unit == null: return
    if globals.versus_mode:
        globals.versus_menu.displayed_unit = unit


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

func update_move_info():
    var cur_unit
    if not globals.versus_mode:
        cur_unit = globals.player_data.player_box[party_index]
    else:
        cur_unit = globals.versus_menu.displayed_unit

    var cur_move

    var cost_container = $Status / MoveInfo / CostContainer

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

func disable_move():
    if status_move_index == 1: return
    var cur_unit
    if not globals.versus_mode:
        cur_unit = globals.player_data.player_box[party_index]
    else:
        cur_unit = globals.versus_menu.displayed_unit

    state = locked
    var selected_movebox = status_menu.get_node("Moves").get_child(status_move_index)

    var switched_value = 2

    if status_move_index == 0:
        if cur_unit["slot1_selected"] == 2:
            enable_move()
            return
    if status_move_index == 1:
        if cur_unit["slot2_selected"] == 2:
            enable_move()
            return
    if status_move_index == 2:
        if cur_unit["slot3_selected"] == 2:
            enable_move()
            return

    if status_move_index == 0:
        cur_unit["slot1_selected"] = switched_value
    if status_move_index == 1:
        cur_unit["slot2_selected"] = switched_value
    if status_move_index == 2:
        cur_unit["slot3_selected"] = switched_value

    selected_movebox.modulate = Color(1.0, 1.0, 1.0, 0.431)

    await wait(0.2)
    state = status

func enable_move():
    var cur_unit
    if not globals.versus_mode:
        cur_unit = globals.player_data.player_box[party_index]
    else:
        cur_unit = globals.versus_menu.displayed_unit

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





func setup_party_menu():
    if globals.test_mode: return
    for i in party_menu.get_node("VList").get_children():
        i.queue_free()



    for i in globals.player_data.player_box:
        var new_list_index = load("res://Files/Scenes/Level/Menu/party_pokemon_item.tscn").instantiate()
        new_list_index.get_node("Label").text = pkmn.dex[i["species"]]["name"]

        var name_node = new_list_index.get_node("Label")
        name_node.scale.x = 1
        name_node.text = pkmn.dex[i["species"]]["name"]
        if name_node.text.length() > 10:
            for k in range(name_node.text.length() - 10):
                name_node.scale.x -= 0.04

        new_list_index.get_node("Level").text = "lv%s" % i["lv"]
        new_list_index.get_node("Sprite").frame = pkmn.dex[i["species"]]["sprite"]
        new_list_index.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([pkmn.dex[i["species"]]["color"]]))
        new_list_index.get_node("ColorBorder").modulate = poke_types.colors[i["dex"]["color"]][0]

        if i in globals.player_data.player_party:
            new_list_index.get_node("Label").self_modulate = Color("#666666")
        else:
            new_list_index.get_node("Label").self_modulate = Color("#ffffff")

        if globals.gbc:
            if pkmn.dex[i["species"]]["name"] == "Blastoise":
                new_list_index.get_node("Sprite").frame = 200
            elif pkmn.dex[i["species"]]["name"] == "Pidgeot":
                new_list_index.get_node("Sprite").frame = 201
            elif pkmn.dex[i["species"]]["name"] == "Alakazam":
                new_list_index.get_node("Sprite").frame = 202
            elif pkmn.dex[i["species"]]["name"] == "Pikachu":
                new_list_index.get_node("Sprite").frame = 203
            elif pkmn.dex[i["species"]]["name"] == "Charizard":
                new_list_index.get_node("Sprite").frame = 204
            elif pkmn.dex[i["species"]]["name"] == "Butterfree":
                new_list_index.get_node("Sprite").frame = 205
            elif pkmn.dex[i["species"]]["name"] == "Lapras":
                new_list_index.get_node("Sprite").frame = 206
            elif pkmn.dex[i["species"]]["name"] == "Snorlax":
                new_list_index.get_node("Sprite").frame = 207
            elif pkmn.dex[i["species"]]["name"] == "Vaporeon":
                new_list_index.get_node("Sprite").frame = 208

        party_menu.get_node("VList").add_child(new_list_index)

func show_party_menu():


    update_battle_options()
    state = locked
    update_status(globals.player_data.player_box[0])

    party_index = 0
    party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
    update_status(globals.player_data.player_box[party_index])

    var tween = get_tree().create_tween()
    tween.tween_property(status_menu, "position", Vector2(308, 0), 0.1)
    tween.tween_property(party_menu, "position", Vector2(-588, 0), 0.1)
    tween.tween_property(formation_menu, "position", Vector2(306, 0), 0.1)

    tween.tween_property($Status / Party / Options, "position", Vector2(0, 0), 0.1)
    tween.tween_property($Status / Party / Formation / Affinities, "position", Vector2(0, 0), 0.1)
    await wait(0.4)

    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2




    $Status / Party / Options / AutoBattle.z_index = 2
    $Status / Party / Options / PreBattle.z_index = 2


func hide_party_menu():
    party_menu.get_node("Selector").z_index = 0
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 0
    $Status / Party / Options / AutoBattle.z_index = 0
    $Status / Party / Options / PreBattle.z_index = 0

    state = locked
    var tween = get_tree().create_tween()
    tween.tween_property($Status / Party / Formation / Affinities, "position", Vector2(0, -144), 0.05)
    tween.tween_property($Status / Party / Options, "position", Vector2(0, -144), 0.05)


    tween.tween_property(formation_menu, "position", Vector2(596, 0), 0.1)
    tween.tween_property(party_menu, "position", Vector2(-298, 0), 0.1)
    tween.tween_property(status_menu, "position", Vector2(596, 0), 0.1)


    await wait(0.4)
    enable_menu()

    party_index = 0
    party_menu.get_node("Selector").position.y = 91

    state = menu

func party_input():
    if Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        await hide_party_menu()

    if Input.is_action_just_pressed("Accept"):
        party_pickup_mon()
        if mon_pickedup:
            disable_party()
            await wait(0.01)
            start_formation_input()

    if Input.is_action_just_pressed("Info") or Input.is_action_just_pressed("right"):
        play_accept_SE()
        disable_party()
        displayed_unit = globals.player_data.player_box[party_index]
        await wait(0.01)
        enable_status_menu()



    if Input.is_action_just_pressed("left"):
        play_cursor_SE()
        disable_party()
        await wait(0.01)
        start_formation_input()
        update_status(globals.player_data.player_party[formation_index - 1])


    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if party_index + 1 < party_menu.get_node("VList").get_children().size():
            party_index += 1
        else:
            battle_options_index = 0
            start_battle_options_input()
            return


        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if party_index - 1 >= 0:
            party_index -= 1
        else:
            battle_options_index = 1
            start_battle_options_input()
            return


        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])

func disable_party():
    party_menu.get_node("Selector").modulate = Color("#ffffff82")
    party_menu.get_node("VList").modulate = Color("#ffffff82")
    party_menu.get_node("Selector").get_node("AnimationPlayer").speed_scale = 0

func enable_party():
    party_menu.get_node("Selector").modulate = Color("#ffffff")
    party_menu.get_node("VList").modulate = Color("#ffffff")
    party_menu.get_node("Selector").get_node("AnimationPlayer").speed_scale = 1
    update_status(globals.player_data.player_box[party_index])







func battle_options_input():
    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        if battle_options_index == 0:
            set_auto_battle()
        elif battle_options_index == 1:
            set_pre_battle()

    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        party_index = 0
        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])
        state = party

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if battle_options_index == 0:
            party_index = party_menu.get_node("VList").get_children().size() - 1
            party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
            update_status(globals.player_data.player_box[party_index])
            state = party
        else:
            battle_options_index = 0
            select_battle_option()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if battle_options_index == 0:
            battle_options_index = 1
            select_battle_option()
        else:
            party_index = 0
            party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
            update_status(globals.player_data.player_box[party_index])
            state = party

func start_battle_options_input():
    await wait(0.01)
    state = battle_options
    select_battle_option()

func select_battle_option():
    if battle_options_index == 0:
        party_menu.get_node("Selector").position.y = $Status / Party / Options / AutoBattle.position.y

    elif battle_options_index == 1:
        party_menu.get_node("Selector").position.y = $Status / Party / Options / PreBattle.position.y

func set_auto_battle():
    if globals.auto_battle:
        $Status / Party / Options / AutoBattle.text = "Auto Battle: [color=999999]OFF[/color]"
        globals.auto_battle = false
    else:
        $Status / Party / Options / AutoBattle.text = "Auto Battle: [color=379dab]ON[/color]"
        globals.auto_battle = true

func set_pre_battle():
    if globals.pre_battle_formation:
        $Status / Party / Options / PreBattle.text = "Pre-Battle: [color=999999]OFF[/color]"
        globals.pre_battle_formation = false
    else:
        $Status / Party / Options / PreBattle.text = "Pre-Battle: [color=379dab]FORMATION[/color]"
        globals.pre_battle_formation = true

func update_battle_options():
    if globals.auto_battle:
        $Status / Party / Options / AutoBattle.text = "Auto Battle: [color=379dab]ON[/color]"
    else:
        $Status / Party / Options / AutoBattle.text = "Auto Battle: [color=999999]OFF[/color]"

    if globals.pre_battle_formation:
        $Status / Party / Options / PreBattle.text = "Pre-Battle: [color=379dab]FORMATION[/color]"
    else:
        $Status / Party / Options / PreBattle.text = "Pre-Battle: [color=999999]OFF[/color]"




func setup_formation():
    if globals.test_mode: return
    var cont = 0
    for i in party_menu.get_node("VList").get_children():
        if globals.player_data.player_box[cont] in globals.player_data.player_party:
            i.get_node("Label").self_modulate = Color("#666666")
        else:
            i.get_node("Label").self_modulate = Color("#ffffff")
        cont += 1

    cont = 0
    await wait(0.01)



    for i in globals.player_data.player_party:
        if i == null:
            formation_menu.get_node("Slots").get_child(cont).get_node("Sprite").visible = false

        else:
            var cur_mon = i
            var cur_slot = formation_menu.get_node("Slots").get_child(cont)
            cur_slot.get_node("Sprite").frame = cur_mon["dex"]["sprite"]
            formation_menu.get_node("Slots").get_child(cont).get_node("Sprite").visible = true
            cur_slot.visible = true



        cont += 1

func start_formation_input():

    for i in formation_menu.get_node("Slots").get_children():
            i.get_node("Sprite").z_index = 1

    formation_index = 5
    formation_menu.get_node("Selector").position = formation_menu.get_node("Slots").get_child(formation_index - 1).position + Vector2(-2, -2)
    formation_menu.get_node("Selector").visible = true
    state = formation

func party_pickup_mon():




    if globals.player_data.player_box[party_index] not in globals.player_data.player_party:
        mon_pickedup = true
        formation_menu.get_node("Selector/Sprite").frame = globals.player_data.player_box[party_index]["dex"]["sprite"]
        formation_menu.get_node("Selector/Sprite").visible = true
    play_accept_SE()

func formation_pickup_mon():
    if globals.player_data.player_party[formation_index - 1] == null: return
    play_accept_SE()
    mon_pickedup = true
    formation_menu.get_node("Selector/Sprite").frame = globals.player_data.player_party[formation_index - 1]["dex"]["sprite"]
    formation_menu.get_node("Selector/Sprite").visible = true
    party_index = globals.player_data.player_box.find(globals.player_data.player_party[formation_index - 1])
    party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
    update_status(globals.player_data.player_box[party_index])
    globals.player_data.player_party[formation_index - 1] = null
    setup_formation()

func equip_mon():
    if globals.player_data.player_party[formation_index - 1] == null:
        if globals.player_data.player_party.count(null) < 4:
            play_buzzer_SE()
            return

        formation_menu.get_node("Selector/Sprite").visible = false
        globals.player_data.player_party[formation_index - 1] = globals.player_data.player_box[party_index]
        mon_pickedup = false

    else:
        var swapped_mon = globals.player_data.player_box[party_index]
        formation_menu.get_node("Selector/Sprite").frame = globals.player_data.player_party[formation_index - 1]["dex"]["sprite"]
        party_index = globals.player_data.player_box.find(globals.player_data.player_party[formation_index - 1])
        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])
        globals.player_data.player_party[formation_index - 1] = swapped_mon

    setup_formation()

func end_formation_input():
    for i in formation_menu.get_node("Slots").get_children():
            i.get_node("Sprite").z_index = 0
    mon_pickedup = false
    state = party
    formation_menu.get_node("Selector/Sprite").visible = false
    formation_menu.get_node("Selector").visible = false

func formation_input():
    if Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        if mon_pickedup:

            setup_formation()
            mon_pickedup = false
            formation_menu.get_node("Selector/Sprite").visible = false
            update_status(globals.player_data.player_party[formation_index - 1])
        else:
            enable_party()
            end_formation_input()

    if Input.is_action_just_pressed("Accept"):
        if mon_pickedup:
            play_accept_SE()
            equip_mon()
        else:
            formation_pickup_mon()

    if Input.is_action_just_pressed("Info"):

        if globals.player_data.player_party[formation_index - 1] != null:
            end_formation_input()

            party_index = globals.player_data.player_box.find(globals.player_data.player_party[formation_index - 1])
            party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
            update_status(globals.player_data.player_box[party_index])

            enable_status_menu()

    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if formation_index not in [3, 6]:
            formation_index += 1
        else:
            formation_index -= 2
        formation_menu.get_node("Selector").position = formation_menu.get_node("Slots").get_child(formation_index - 1).position + Vector2(-2, -2)
        if not mon_pickedup:
            update_status(globals.player_data.player_party[formation_index - 1])

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if formation_index not in [1, 4]:
            formation_index -= 1
        else:
            formation_index += 2
        formation_menu.get_node("Selector").position = formation_menu.get_node("Slots").get_child(formation_index - 1).position + Vector2(-2, -2)
        if not mon_pickedup:
            update_status(globals.player_data.player_party[formation_index - 1])

    if Input.is_action_just_pressed("right"):
        play_cursor_SE()
        if formation_index not in [4, 5, 6]:
            formation_index += 3
            formation_menu.get_node("Selector").position = formation_menu.get_node("Slots").get_child(formation_index - 1).position + Vector2(-2, -2)
            if not mon_pickedup:
                update_status(globals.player_data.player_party[formation_index - 1])
        else:
            enable_party()
            end_formation_input()
            mon_pickedup = false
            formation_menu.get_node("Selector/Sprite").visible = false
            formation_menu.get_node("Selector").visible = false

    if Input.is_action_just_pressed("left"):
        play_cursor_SE()
        if formation_index not in [1, 2, 3]:
            formation_index -= 3
            formation_menu.get_node("Selector").position = formation_menu.get_node("Slots").get_child(formation_index - 1).position + Vector2(-2, -2)
            if not mon_pickedup:
                update_status(globals.player_data.player_party[formation_index - 1])
        else:

            pass






func show_items():
    $Items / Selector.visible = true
    setup_items()
    if item_list.get_children() != []:
        update_item_desc(item_list.get_child(item_index).get_meta("item_name"))
    state = locked
    var tween = get_tree().create_tween()
    tween.tween_property(items_menu, "position", Vector2(-288, 0), 0.15)
    if item_list.get_children() != []:
        tween.tween_property($Items / ItemInfo, "position", Vector2(24, -35), 0.1)

    await wait(0.25)

    state = items

func hide_items():
    state = locked
    var tween = get_tree().create_tween()
    tween.tween_property($Items / ItemInfo, "position", Vector2(314, -35), 0.1)
    tween.tween_property(items_menu, "position", Vector2(0, 0), 0.1)

    await wait(0.2)

    item_index = 0

    enable_menu()

    party_index = 0
    update_item_selector()

    party_menu.get_node("Selector").position.y = 91

    state = menu

func items_input():
    if Input.is_action_just_pressed("Cancel"):
        if globals.bf_mode:
            $Items / Selector.visible = false
            $"../ItemShop/Selector".show()
            play_cancel_SE()
            hide_item_shop()
            return

        play_cancel_SE()
        hide_items()
        return

    elif Input.is_action_just_pressed("Accept"):
        if item_list.get_children() == []: return
        play_accept_SE()
        var item_name = item_list.get_child(item_index).get_meta("item_name")

        if item.dict[item_name]["target"] == "pokemon":
            await show_item_target()
            await choose_item_target()
            await hide_item_target()

            state = items
            return

        if item.dict[item_name]["target"] == "none":
            await item.dict[item_list.get_child(item_index).get_meta("item_name")]["func"].call()
            if not update_item_bag():
                await wait(0.1)
                if item_list.get_children() != []:
                    update_item_desc(item_list.get_child(item_index).get_meta("item_name"))

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if item_index > 0:
            item_index -= 1
            update_item_selector()
        else:
            item_index = item_list.get_children().size() - 1
            update_item_selector()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if item_index < item_list.get_children().size() - 1:
            item_index += 1
            update_item_selector()
        else:
            item_index = 0
            update_item_selector()

    elif Input.is_action_just_pressed("left"):
        if globals.bf_mode:
            $Items / Selector.visible = false
            $"../ItemShop/Selector".show()
            await wait(0.01)
            state = item_shop

func setup_items():
    for i in item_list.get_children():
        i.queue_free()

    var source = globals.player_data.item_bag

    for i in source:
        if globals.player_data.item_bag.has(i) and globals.player_data.item_bag[i] < 1: continue
        var new_entry = load("res://Files/Scenes/Level/Menu/item_entry.tscn").instantiate()

        new_entry.get_node("Label").text = item.dict[i]["name"]
        new_entry.get_node("Sprite").frame = item.dict[i]["sprite"]


        new_entry.get_node("Amount").text = "x%s" % globals.player_data.item_bag[i]

        new_entry.set_meta("item_name", item.dict.find_key(item.dict[i]))

        item_list.add_child(new_entry)

func update_item_selector():
    if item_list.get_children() == []:
        var tween = get_tree().create_tween()
        tween.tween_property($Items / ItemInfo, "position", Vector2(314, -35), 0.1)
        return

    $Items / Selector.global_position.y = item_list.get_child(item_index).global_position.y
    update_item_desc(item_list.get_child(item_index).get_meta("item_name"))

func update_item_desc(item_name):
    if item_list.get_children() != []:
        $Items / ItemInfo / Label.text = item.dict[item_name]["desc"]

func choose_item_target():
    while true:
        if Input.is_action_just_pressed("Cancel"):
            play_cancel_SE()
            return

        elif Input.is_action_just_pressed("Accept"):
            play_accept_SE()
            await item.dict[item_list.get_child(item_index).get_meta("item_name")]["func"].call(globals.player_data.player_box[party_index])
            update_status(globals.player_data.player_box[party_index])
            if not update_item_bag():
                await wait(0.1)
                if item_list.get_children() != []:
                    update_item_desc(item_list.get_child(item_index).get_meta("item_name"))
                return

        elif Input.is_action_just_pressed("down") and item_list.get_children() != []:
            play_cursor_SE()
            if party_index + 1 < party_menu.get_node("VList").get_children().size():
                party_index += 1
            else:
                party_index = 0
            update_status(globals.player_data.player_box[party_index])
            party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset

        elif Input.is_action_just_pressed("up") and item_list.get_children() != []:
            play_cursor_SE()
            if party_index - 1 >= 0:
                party_index -= 1
            else:
                party_index = party_menu.get_node("VList").get_children().size() - 1
            update_status(globals.player_data.player_box[party_index])
            party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset

        await wait(0.01)

func update_item_bag():
    setup_party_menu()

    setup_items()

    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2

    if globals.player_data.item_bag[item_list.get_child(item_index).get_meta("item_name")]:
        return true
    else:
        item_index = 0
        update_item_selector()

func show_item_target():
    state = locked

    party_index = 0
    party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
    update_status(globals.player_data.player_box[party_index])

    $Items / Selector / AnimationPlayer.stop()
    $Items / ItemList.modulate = Color("#ffffffa0")
    $Items / Selector.modulate = Color("#ffffffa0")

    if globals.bf_mode:
        party_menu.get_node("Selector").position.x = 1305 - 288
        await wait(0.1)
        return

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property($Items / ItemInfo, "position", Vector2(314, -35), 0.2)
    tween.tween_property(party_menu, "position", Vector2(-8, 0), 0.2)
    tween.tween_property(status_menu, "position", Vector2(-274, 0), 0.2)
    await wait(0.2)
    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2

func hide_item_target():
    if globals.bf_mode:

        $Items / Selector / AnimationPlayer.play("loop")
        $Items / ItemList.modulate = Color("#ffffff")
        $Items / Selector.modulate = Color("#ffffff")
        party_menu.get_node("Selector").position = Vector2(1307, 524)
        await wait(0.1)

        return

    party_menu.get_node("Selector").z_index = 0
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 0

    var tween = get_tree().create_tween().set_parallel()
    if item_list.get_children() != []:
        tween.tween_property($Items / ItemInfo, "position", Vector2(24, -35), 0.2)
    tween.tween_property(party_menu, "position", Vector2(-298, 0), 0.2)
    tween.tween_property(status_menu, "position", Vector2(596, 0), 0.2)
    await tween.finished
    $Items / Selector / AnimationPlayer.play("loop")
    $Items / ItemList.modulate = Color("#ffffff")
    $Items / Selector.modulate = Color("#ffffff")







func hide_hud():
    var bottom_elements = [hud.get_node("Money"), hud.get_node("InputHint")]
    var top_elements = [hud.get_node("Player")]

    var tween = get_tree().create_tween().set_parallel()
    for i in bottom_elements:
        tween.tween_property(i, "position", Vector2(i.position.x, 922), 0.1)

    for i in top_elements:
        tween.tween_property(i, "position", Vector2(i.position.x, -136), 0.1)

func show_hud():
    var bottom_elements = [hud.get_node("Money"), hud.get_node("InputHint")]
    var top_elements = [hud.get_node("Player")]

    var tween = get_tree().create_tween().set_parallel()
    for i in bottom_elements:
        tween.tween_property(i, "position", Vector2(i.position.x, 826), 0.1)

    for i in top_elements:
        tween.tween_property(i, "position", Vector2(i.position.x, 0), 0.1)

func toggle_hint():
    if hud.get_node("InputHint/Label").text == "[color=202020]Interact:[color=000000] Z  [color=202020]Cancel:[/color] X  [color=202020]Info:[/color] C ":
        hud.get_node("InputHint/Label").text = "[color=202020]Accept:[color=000000] Z  [color=202020]Wait:[/color] X  [color=202020]Search:[/color] C "
    else:
        hud.get_node("InputHint/Label").text = "[color=202020]Interact:[color=000000] Z  [color=202020]Cancel:[/color] X  [color=202020]Info:[/color] C "

func setup_hud(player_name):
    hud.get_node("Player/Avatar/Sprite2D").texture = load("res://Files/Sprites/Characters/%s.png" % player_name)
    hud.get_node("Player/Label").text = player_name

    if globals.mewtwo_mode:
        hud.get_node("Player/Avatar/Sprite2D").frame = 6
        hud.get_node("Player/Avatar/Sprite2D").hframes = 2
        hud.get_node("Player/Avatar/Sprite2D").position.y += 18
        hud.get_node("Player/Avatar/Sprite2D").position.x += 4







var bf_shop_stock = []

func show_card_shop():
    state = locked
    visible = true
    await setup_party_menu()
    update_prices()

    if not globals.bf_mode:
        update_status(globals.hotel.card_shop_stock[0])
        globals.player.state = globals.player.locked
    elif globals.bf_mode:
        update_status(bf_shop_stock[0])

    party_menu.get_node("Selector").visible = false

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(card_shop_menu, "position", Vector2(-20, 0), 0.2)
    tween.tween_property(status_menu, "position", Vector2(209, 0), 0.1)
    tween.tween_property(party_menu, "position", Vector2(-592, 0), 0.1)


    await wait(0.25)

    if not shop_revealed:
        await reveal_shop()

    state = card_shop
    card_shop_index = 0
    select_card()

func reveal_shop():
    shop_revealed = true
    for i in card_list.get_children():
        i.get_node("AnimationPlayer").play("reveal")
        await wait(0.1)
    await wait(0.1)

    var cont = 0
    var trigger_wait = false

    if not globals.bf_mode:
        for i in globals.hotel.card_shop_stock:
            if i["dex"]["rarity"] > 2:
                trigger_wait = true
                card_list.get_child(cont).get_node("AnimationPlayer").play("rare")
            cont += 1
        if trigger_wait:
            await wait(1.2)

    elif globals.bf_mode:
        for i in bf_shop_stock:
            if i["dex"]["rarity"] > 2:
                trigger_wait = true
                card_list.get_child(cont).get_node("AnimationPlayer").play("rare")
            cont += 1
        if trigger_wait:
            await wait(1.2)

func hide_card_shop():
    state = locked
    unselect_card()
    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(card_shop_menu, "position", Vector2(-1072, 0), 0.2)
    if not globals.bf_mode:
        tween.tween_property(party_menu, "position", Vector2(-298, 0), 0.1)
        tween.tween_property(status_menu, "position", Vector2(596, 0), 0.1)


    await wait(0.05)

    if not globals.bf_mode:

        globals.player.state = globals.player.free

    state = off
    party_menu.get_node("Selector").visible = true

func card_shop_input():
    var source
    if not globals.bf_mode:
        source = globals.hotel.card_shop_stock
    if globals.bf_mode:
        source = bf_shop_stock

    if Input.is_action_just_pressed("Accept"):
        if card_shop_line == 0:
            buy_card()

        elif card_shop_line == 1:
            buy_booster()

        elif card_shop_line == 2:
            play_accept_SE()
            sell_button()

    elif Input.is_action_just_pressed("Cancel"):
        if not globals.bf_mode:
            hide_card_shop()
        elif globals.bf_mode:
            globals.battle.bf_hide_shop()











    elif Input.is_action_just_pressed("right"):
        unselect_card()
        if card_shop_index < source.size() - 1:
            card_shop_index += 1
        else:
            card_shop_index = 0
        select_card()

    elif Input.is_action_just_pressed("left"):
        unselect_card()
        if card_shop_index > 0:
            card_shop_index -= 1
        else:
            card_shop_index = source.size() - 1
        select_card()

    elif Input.is_action_just_pressed("down"):
        unselect_card()
        if card_shop_line == 0:
            card_shop_line += 1
            select_card()

        elif card_shop_line == 1:
            card_shop_line += 1
            card_shop_menu.get_node("SellButton/Selector").visible = true

    elif Input.is_action_just_pressed("up"):
        unselect_card()
        if card_shop_line == 0:
            card_shop_line = 2
            card_shop_menu.get_node("SellButton/Selector").visible = true

        elif card_shop_line == 1:
            card_shop_line -= 1
            select_card()

        elif card_shop_line == 2:
            card_shop_line -= 1
            card_shop_menu.get_node("SellButton/Selector").visible = false
            select_card()

func select_card():
    if card_shop_line == 0:
        card_list.get_child(card_shop_index).get_node("Selector").visible = true
        if not globals.bf_mode:
            update_status(globals.hotel.card_shop_stock[card_shop_index])
        elif globals.bf_mode:
            update_status(bf_shop_stock[card_shop_index])
    elif card_shop_line == 1:
        booster_list.get_child(card_shop_index).get_node("Selector").visible = true

func unselect_card():
    if card_shop_line == 0:
        card_list.get_child(card_shop_index).get_node("Selector").visible = false
    elif card_shop_line == 1:
        booster_list.get_child(card_shop_index).get_node("Selector").visible = false

func setup_shop():
    shop_revealed = false
    for i in card_list.get_children():
        i.queue_free()

    await wait(0.05)
    if not globals.bf_mode:
        for i in globals.hotel.card_shop_stock:
            var new_card = card_shop_card.instantiate()
            setup_card(new_card, i)

            card_list.add_child(new_card)
    elif globals.bf_mode:
        for i in bf_shop_stock:
            var new_card = card_shop_card.instantiate()
            setup_card(new_card, i)

            card_list.add_child(new_card)

    var colors = ["red", "blue", "green", "yellow", "white", "black"]
    var cont = 0
    for i in booster_list.get_children():
        i.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([colors[cont]]))
        i.get_node("ColorBorder").modulate = Color(poke_types.colors[colors[cont]][2])
        i.get_node("BG").color = Color(poke_types.colors[colors[cont]][0])
        i.get_node("Border").color = Color(poke_types.colors[colors[cont]][2])
        i.get_node("BoosterTop").modulate = Color(poke_types.colors[colors[cont]][2])

        cont += 1

        if globals.LC_mode:
            i.set_meta("disabled", true)
            i.get_node("Color").modulate = Color("#ffffff82")

            i.get_node("Cost").text = "$--"
            i.get_node("Cost").modulate = Color("#6a757b")

    update_prices()

    for i in booster_list.get_children():
        i.get_node("BGTexture/AnimationPlayer").play("shine")
        await wait(0.3)

func setup_card(card_node, card_dict):
    var colors = ["red", "blue", "green", "yellow", "white", "black"]

    card_node.get_node("Sprite").frame = card_dict["dex"]["sprite"]
    card_node.get_node("SpriteShadow").modulate = Color(poke_types.colors[card_dict["dex"]["color"]][2])
    card_node.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([card_dict["dex"]["color"]]))

    card_node.get_node("Cost").text = "${0}".format([card_dict["cost"]])
    card_node.set_meta("cost", card_dict["cost"])
    card_node.get_node("BG").color = Color(poke_types.colors[card_dict["dex"]["color"]][3])
    card_node.get_node("Border").color = Color(poke_types.colors[card_dict["dex"]["color"]][0])
    card_node.get_node("Shadow").modulate = Color(poke_types.colors[card_dict["dex"]["color"]][2])

    card_node.get_node("BGTexture").frame = card_dict["dex"]["rarity"] - 1
    card_node.get_node("Level").text = "lv%s" % card_dict["lv"]

    if card_dict["dex"]["color"] != "black":
        card_node.get_node("LevelBar/Control/Color").color = Color(poke_types.colors[card_dict["dex"]["color"]][1])
    else:
        card_node.get_node("LevelBar/Control/Color").color = Color("#bc809f")

    card_node.get_node("CardUI").frame = colors.find(card_dict["dex"]["color"])

    for i in card_node.get_node("LevelBar").get_children():
        if i == card_node.get_node("LevelBar").get_children()[0]: continue
        i.queue_free()

    for i in range(card_dict["lv"] - 1):
        card_node.get_node("LevelBar").add_child(card_node.get_node("LevelBar/Control").duplicate())

    if globals.LC_mode:
        for k in globals.player_data.player_box:
            if k["species"] == card_dict["species"]:
                disable_card_node(card_node)
                break

    await wait(randf_range(0.05, 2.5))
    card_node.get_node("BGTexture/AnimationPlayer").play("shine")

func buy_card():
    if globals.player_data.player_box.size() > 9: return
    var card_node = card_list.get_child(card_shop_index)
    var bought_card

    if not globals.bf_mode:
        bought_card = globals.hotel.card_shop_stock[card_shop_index]
    elif globals.bf_mode:
        bought_card = bf_shop_stock[card_shop_index]

    if card_node.get_meta("disabled"):
        play_buzzer_SE()
        return

    if globals.player_data.money >= bought_card["cost"]:
        play_buy_SE()
        globals.player_data.money -= bought_card["cost"]

        globals.player_data.get_card(bought_card, 1)
        disable_card_node(card_node)
        update_prices()

    else:
        play_buzzer_SE()
        state = locked
        card_node.get_node("Cost").modulate = Color("#e60000")
        var tween = get_tree().create_tween()
        tween.tween_property(card_node.get_node("Cost"), "position", card_node.get_node("Cost").position + Vector2(4, 0), 0.1)
        tween.tween_property(card_node.get_node("Cost"), "position", card_node.get_node("Cost").position + Vector2(0, 0), 0.1)
        tween.tween_property(card_node.get_node("Cost"), "modulate", color_unaffordable, 0.4)
        await wait(0.2)
        state = card_shop

func buy_booster():
    if globals.player_data.money >= 40 and not globals.LC_mode:
        if globals.player_data.player_box.size() > 9:
            play_buzzer_SE()
            return

        play_buy_SE()
        state = locked
        globals.player_data.money -= 40

        var colors = ["red", "blue", "green", "yellow", "white", "black"]

        var bought_card
        if not globals.bf_mode:
            bought_card = globals.hotel.booster_pull(card_shop_index)
        elif globals.bf_mode:
            bought_card = globals.battle.bf_booster_pull(card_shop_index)

        bought_card["cost"] -= 80
        if bought_card["cost"] < 10: bought_card["cost"] = 10

        $"../GetCard/Booster/Color".texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([colors[card_shop_index]]))
        $"../GetCard/Booster".get_node("ColorBorder").modulate = Color(poke_types.colors[colors[card_shop_index]][2])
        $"../GetCard/Booster".get_node("BG").color = Color(poke_types.colors[colors[card_shop_index]][0])
        $"../GetCard/Booster".get_node("Border").color = Color(poke_types.colors[colors[card_shop_index]][2])
        $"../GetCard/Booster".get_node("BoosterTop").modulate = Color(poke_types.colors[colors[card_shop_index]][2])
        $"../GetCard/Booster".get_node("ColorBorder").modulate = Color(poke_types.colors[colors[card_shop_index]][2])

        await globals.player_data.get_card(bought_card, 1, true)
        state = card_shop

        update_prices()

        await wait(0.01)
        setup_formation()

    elif not globals.LC_mode:
        play_buzzer_SE()
        var card_node = booster_list.get_child(card_shop_index)
        state = locked
        card_node.get_node("Cost").modulate = Color("#e60000")
        var tween = get_tree().create_tween()
        tween.tween_property(card_node.get_node("Cost"), "position", card_node.get_node("Cost").position + Vector2(4, 0), 0.1)
        tween.tween_property(card_node.get_node("Cost"), "position", card_node.get_node("Cost").position + Vector2(0, 0), 0.1)
        tween.tween_property(card_node.get_node("Cost"), "modulate", color_unaffordable, 0.4)
        await wait(0.2)
        state = card_shop

func disable_card_node(card_node):
    card_node.set_meta("disabled", true)
    card_node.get_node("Sprite").modulate = Color("#ffffff82")
    card_node.get_node("Color").modulate = Color("#ffffff82")
    card_node.get_node("Cost").text = "$--"
    card_node.get_node("Cost").modulate = Color("#6a757b")

func update_prices():
    $"../Shop/PlayerMoney/Money".text = "${0}".format([globals.player_data.money])
    for i in card_list.get_children():
        if i.get_meta("disabled"): continue
        if i.get_meta("cost") <= globals.player_data.money:
            i.get_node("Cost").modulate = color_affordable
        else:
            i.get_node("Cost").modulate = color_unaffordable

    if globals.LC_mode: return
    for i in booster_list.get_children():
        if 40 <= globals.player_data.money:
            i.get_node("Cost").modulate = color_affordable
        else:
            i.get_node("Cost").modulate = color_unaffordable

func sell_button():
    state = locked
    party_index = 0
    var sell_node = card_shop_menu.get_node("SellButton")
    sell_node.modulate = Color("#ffffffa0")
    sell_node.get_node("Selector/AnimationPlayer").speed_scale = 0
    party_menu.get_node("Selector").visible = true
    update_status(globals.player_data.player_box[party_index])
    await wait(0.02)
    update_sell_value()
    state = selling

    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2

    if globals.bf_mode:
        party_menu.get_node("Selector").position.x = 1305 - 280
        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])
        update_sell_value()






@onready var item_shop_list: VBoxContainer = $"../ItemShop/ItemList"
var item_shop_index = 0

func setup_item_shop():
    if globals.test_mode: return

    var source = []
    if not globals.bf_mode:
        source = globals.hotel.item_shop_stock
    else:
        source = ["rare_candy", "hp_up", "atk_up", "speed_up", "ap_up", "pp_up"]

    for i in source:
        var new_entry = load("res://Files/Scenes/Level/Menu/item_entry.tscn").instantiate()

        new_entry.get_node("Label").text = item.dict[i]["name"]
        new_entry.get_node("Sprite").frame = item.dict[i]["sprite"]



        new_entry.get_node("Amount").text = "$%s" % item.dict[i]["cost"]

        new_entry.set_meta("item_name", item.dict.find_key(item.dict[i]))

        item_shop_list.add_child(new_entry)

func show_item_shop():
    update_item_prices()
    update_item_shop_selector()
    state = locked
    visible = true

    setup_items()
    $Items / Selector.visible = false

    var menu_offset = Vector2.ZERO
    if not globals.bf_mode:
        globals.player.state = globals.player.locked
    else:
        menu_offset = Vector2(-180, 0)

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(item_shop_menu, "position", Vector2(1503, 0) + menu_offset, 0.2)
    tween.tween_property(items_menu, "position", Vector2(-715, 0) + menu_offset, 0.2)
    await wait(0.2)

    state = item_shop
    card_shop_index = 0
    select_card()

func hide_item_shop():
    state = locked

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(item_shop_menu, "position", Vector2(2553, 0), 0.2)
    tween.tween_property(items_menu, "position", Vector2(0, 0), 0.2)

    await wait(0.1)

    if not globals.bf_mode:
        globals.player.state = globals.player.free
    else:
        party_menu.get_node("Selector").position = Vector2(1307, 524)


    state = off

func item_shop_input():
    if Input.is_action_just_pressed("Accept"):
        buy_item()

    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        hide_item_shop()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if item_shop_index > 0:
            item_shop_index -= 1
            update_item_shop_selector()
        else:
            item_shop_index = item_shop_list.get_children().size() - 1
            update_item_shop_selector()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if item_shop_index < item_shop_list.get_children().size() - 1:
            item_shop_index += 1
            update_item_shop_selector()
        else:
            item_shop_index = 0
            update_item_shop_selector()

    elif Input.is_action_just_pressed("right"):
        if globals.bf_mode:
            $Items / Selector.visible = true
            $"../ItemShop/Selector".hide()
            await wait(0.01)
            state = items

func update_item_shop_selector():
    if item_shop_list.get_children() == []:
        var tween = get_tree().create_tween()
        tween.tween_property($"../ItemShop/ItemInfo", "position", Vector2(-1639, -35), 0.1)
        return

    $"../ItemShop/Selector".global_position.y = item_shop_list.get_child(item_shop_index).global_position.y
    $"../ItemShop/ItemInfo/Label".text = item.dict[item_shop_list.get_child(item_shop_index).get_meta("item_name")]["desc"]

func buy_item():
    var cur_item = item_shop_list.get_child(item_shop_index).get_meta("item_name")
    if globals.player_data.money >= item.dict[cur_item]["cost"]:
        play_buy_SE()
        if globals.player_data.item_bag.has(cur_item):
            globals.player_data.item_bag[cur_item] += 1
        else:
            globals.player_data.item_bag[cur_item] = 1

        globals.player_data.money -= item.dict[cur_item]["cost"]
        setup_items()
        update_item_prices()

    else:
        play_buzzer_SE()
        state = off
        var node = item_shop_list.get_child(item_shop_index).get_node("Amount")
        node.modulate = Color("#e60000")
        var tween = get_tree().create_tween()
        tween.tween_property(node, "position", node.position + Vector2(4, 0), 0.1)
        tween.tween_property(node, "position", node.position + Vector2(0, 0), 0.1)
        tween.tween_property(node, "modulate", color_unaffordable, 0.4)
        await wait(0.2)
        state = item_shop

func update_item_prices():
    for i in item_shop_list.get_children():
        if item.dict[i.get_meta("item_name")]["cost"] <= globals.player_data.money:
            i.get_node("Amount").modulate = color_affordable
        else:
            i.get_node("Amount").modulate = color_unaffordable








func sell_input():
    if Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        stop_selling()

    if Input.is_action_just_pressed("Accept"):
        sell_card()

    if Input.is_action_just_pressed("left"):
        pass

    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if party_index + 1 < party_menu.get_node("VList").get_children().size():
            party_index += 1
        else:
            party_index = 0

        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])
        update_sell_value()

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if party_index - 1 >= 0:
            party_index -= 1
        else:
            party_index = party_menu.get_node("VList").get_children().size() - 1

        party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
        update_status(globals.player_data.player_box[party_index])
        update_sell_value()

func stop_selling():
    party_menu.get_node("Selector").z_index = 0
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 0

    state = card_shop
    $"../Shop/SellValue".visible = false
    party_index = 0
    party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
    var sell_node = card_shop_menu.get_node("SellButton")
    sell_node.modulate = Color("#ffffff")
    sell_node.get_node("Selector/AnimationPlayer").speed_scale = 1
    party_menu.get_node("Selector").visible = false

    if not globals.bf_mode:
        update_status(globals.hotel.card_shop_stock[card_shop_index])
    elif globals.bf_mode:
        party_menu.get_node("Selector").position.x = 1305
        update_status(bf_shop_stock[card_shop_index])

func sell_card():
    if globals.player_data.player_box.size() < 2:
        play_buzzer_SE()
        return
    globals.player_data.money += roundi(globals.player_data.player_box[party_index]["cost"] / 2)

    if globals.player_data.player_box[party_index] in globals.player_data.player_party:
        if globals.bf_mode:
            for i in globals.battle.get_node("UnitField").get_children():
                if i == globals.battle.get_node("UnitField/Selector"): continue
                if i.unit_dict == globals.player_data.player_box[party_index]:
                    globals.battle.units_in_play.erase(i)
                    globals.battle.player_team[globals.battle.player_team.find(i)] = null
                    i.queue_free()
                    break

        globals.player_data.player_party[globals.player_data.player_party.find(globals.player_data.player_box[party_index])] = null

    globals.player_data.player_box.erase(globals.player_data.player_box[party_index])

    if party_index > 0:
        party_index -= 1
    party_menu.get_node("Selector").position.y = party_menu.get_node("VList").get_child(party_index).position.y + party_selector_offset
    play_buy_SE()
    await setup_party_menu()

    party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2

    await wait(0.01)
    setup_formation()

    update_sell_value()
    update_status(globals.player_data.player_box[party_index])
    update_prices()

func update_sell_value():
    var sell_value = $"../Shop/SellValue"
    sell_value.visible = true
    sell_value.position = party_menu.get_node("Selector").position + Vector2(175, -7)
    sell_value.get_node("Money").text = "${0}".format([roundi(globals.player_data.player_box[party_index]["cost"] / 2)])







func show_notification(text):

    play_notification_SE()
    var notif_node = load("res://Files/Scenes/Level/Menu/notification.tscn").instantiate()
    notif_node.get_node("Label").text = text
    notif_node.position = Vector2(1639, 200)

    var tween = get_tree().create_tween().set_parallel(true)
    for i in get_node("../Notifications").get_children():
        if i == notif_node: continue
        tween.tween_property(i, "position", Vector2(i.position.x, i.position.y - 80), 0.3)

    get_node("../Notifications").add_child(notif_node)
    tween.tween_property(notif_node, "position", Vector2(1255, notif_node.position.y), 0.2)
    hide_nofication(notif_node)

func hide_nofication(node):
    await wait(3)
    var tween = get_tree().create_tween()
    tween.tween_property(node, "position", Vector2(1739, node.position.y), 0.3)
    await wait(0.4)
    node.queue_free()






@onready var bp_label: Label = $"../Starters/BP/Money"

var starter_sets = {
    "ivysaur": {
        "name": "GREEN", 
        "sprite": 0, 
        "cost": 1, 
        "mons": [globals.generate_pokemon("ivysaur", 1), globals.generate_pokemon("Santy", 9)], 
        "formation": [1, 4], 
    }, 

    "charmeleon": {
        "name": "RED", 
        "sprite": 1, 
        "cost": 1, 
        "mons": [globals.generate_pokemon("charmeleon", 1), globals.generate_pokemon("machoke", 2)], 
        "formation": [1, 2], 
    }, 

    "wartortle": {
        "name": "BLUE", 
        "sprite": 2, 
        "cost": 1, 
        "mons": [globals.generate_pokemon("wartortle", 1), globals.generate_pokemon("haunter", 2)], 
        "formation": [4, 1], 
    }, 

    "pikachu": {
        "name": "YELLOW", 
        "sprite": 3, 
        "cost": 6, 
        "mons": [globals.generate_pokemon("pikachu", 2), globals.generate_pokemon("eevee", 1)], 
        "formation": [0, 2], 
    }, 

    "bayleef": {
        "name": "CRYSTAL", 
        "sprite": 4, 
        "cost": 2, 
        "mons": [globals.generate_pokemon("bayleef", 1), globals.generate_pokemon("quagsire", 1)], 
        "formation": [1, 2], 
    }, 

    "quilava": {
        "name": "GOLD", 
        "sprite": 5, 
        "cost": 2, 
        "mons": [globals.generate_pokemon("quilava", 1), globals.generate_pokemon("teddiursa", 2)], 
        "formation": [1, 3], 
    }, 

    "croconaw": {
        "name": "SILVER", 
        "sprite": 6, 
        "cost": 2, 
        "mons": [globals.generate_pokemon("croconaw", 1), globals.generate_pokemon("granbull", 2)], 
        "formation": [1, 0], 
    }, 

    "clefairy": {
        "name": "CLEAR", 
        "sprite": 7, 
        "cost": 5, 
        "mons": [globals.generate_pokemon("clefairy", 2), globals.generate_pokemon("marill", 1)], 
        "formation": [1, 0], 
    }, 

    "grovyle": {
        "name": "EMERALD", 
        "sprite": 8, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("grovyle", 1), globals.generate_pokemon("dusclops", 2)], 
        "formation": [1, 4], 
    }, 

    "combusken": {
        "name": "RUBY", 
        "sprite": 9, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("combusken", 1), globals.generate_pokemon("mawile", 2)], 
        "formation": [1, 0], 
    }, 

    "marshtomp": {
        "name": "SAPPHIRE", 
        "sprite": 10, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("marshtomp", 1), globals.generate_pokemon("cacturne", 2)], 
        "formation": [1, 3], 
    }, 

    "kirlia": {
        "name": "AURA", 
        "sprite": 11, 
        "cost": 6, 
        "mons": [globals.generate_pokemon("kirlia", 2), globals.generate_pokemon("riolu", 2)], 
        "formation": [4, 1], 
    }, 

    "grotle": {
        "name": "PLATINUM", 
        "sprite": 12, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("grotle", 1), globals.generate_pokemon("luxio", 2)], 
        "formation": [4, 1], 
    }, 

    "monferno": {
        "name": "DIAMOND", 
        "sprite": 13, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("monferno", 1), globals.generate_pokemon("croagunk", 2)], 
        "formation": [1, 3], 
    }, 

    "prinplup": {
        "name": "PEARL", 
        "sprite": 14, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("prinplup", 1), globals.generate_pokemon("buneary", 2)], 
        "formation": [1, 4], 
    }, 

    "magmar": {
        "name": "RIVALS", 
        "sprite": 15, 
        "cost": 6, 
        "mons": [globals.generate_pokemon("magmar", 1), globals.generate_pokemon("electabuzz", 1)], 
        "formation": [0, 2], 
    }, 

    "servine": {
        "name": "TRUTH", 
        "sprite": 16, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("servine", 1), globals.generate_pokemon("yamask", 2)], 
        "formation": [4, 2], 
    }, 

    "pignite": {
        "name": "BLACK", 
        "sprite": 17, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("pignite", 1), globals.generate_pokemon("pawniard", 2)], 
        "formation": [1, 0], 
    }, 

    "dewott": {
        "name": "WHITE", 
        "sprite": 18, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("dewott", 1), globals.generate_pokemon("rufflet", 2)], 
        "formation": [1, 2], 
    }, 

    "zorua": {
        "name": "IDEALS", 
        "sprite": 19, 
        "cost": 6, 
        "mons": [globals.generate_pokemon("zorua", 1), globals.generate_pokemon("minccino", 2)], 
        "formation": [3, 1], 
    }, 

    "quilladin": {
        "name": "HARMONY", 
        "sprite": 20, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("quilladin", 1), globals.generate_pokemon("fletchinder", 2)], 
        "formation": [1, 3], 
    }, 

    "braixen": {
        "name": "LIFE", 
        "sprite": 21, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("braixen", 1), globals.generate_pokemon("pancham", 2)], 
        "formation": [3, 1], 
    }, 

    "frogadier": {
        "name": "DEATH", 
        "sprite": 22, 
        "cost": 3, 
        "mons": [globals.generate_pokemon("frogadier", 1), globals.generate_pokemon("floette", 2)], 
        "formation": [4, 1], 
    }, 

    "doublade": {
        "name": "HONOR", 
        "sprite": 23, 
        "cost": 6, 
        "mons": [globals.generate_pokemon("doublade", 1), globals.generate_pokemon("skiddo", 2)], 
        "formation": [1, 0], 
    }, 
}


func setup_starters():
    var deck_lists = [deck_list1, deck_list2, deck_list3]

    var list_index = 0

    bp_label.text = "$%s" % globals.player_bp

    var cont = 1
    for i in starter_sets:
        var new_deck = load("res://Files/Scenes/Level/Menu/deck_item.tscn").instantiate()
        new_deck.set_meta("deck_name", i)
        new_deck.get_node("Name").text = starter_sets[i]["name"]

        var index = 0
        new_deck.get_node("DeckCoin1/Sprite").frame = cont
        new_deck.get_node("DeckCoin1/Sprite").modulate = poke_types.colors[starter_sets[i]["mons"][index]["dex"]["color"]][2]
        index += 1
        new_deck.get_node("DeckCoin2/Sprite").frame = cont + 1
        new_deck.get_node("DeckCoin2/Sprite").modulate = poke_types.colors[starter_sets[i]["mons"][index]["dex"]["color"]][2]

        if globals.decks_cleared[i]:
            new_deck.get_node("Badge").modulate = Color("ffffff")
        else:
            new_deck.get_node("Badge").modulate = Color("000000")

        if i == "grovyle": list_index = 1
        elif i == "servine": list_index = 2

        deck_lists[list_index].add_child(new_deck)

        if not globals.decks_unlocked[i]:
            new_deck.get_node("DeckCoin1/Sprite/AnimationPlayer").play("RESET")
            new_deck.get_node("DeckCoin1/Sprite").frame = 0
            new_deck.get_node("DeckCoin2/Sprite").frame = 0
            new_deck.get_node("DeckCoin1/Sprite").modulate = Color("ffffffff")
            new_deck.get_node("DeckCoin2/Sprite").modulate = Color("ffffffff")
            new_deck.get_node("Name").text = "???"
        else:
            setup_deck_bg(i, new_deck)
        cont += 2

    $"../Starters/DeckDetails".get_node("DeckItem/BG/AnimationPlayer").play("loop")
    play_bg_anm()
    coin_shine()

func setup_deck_bg(deck, node):
    var color1 = poke_types.colors[starter_sets[deck]["mons"][0]["dex"]["color"]][2]
    var color2 = poke_types.colors[starter_sets[deck]["mons"][1]["dex"]["color"]][2]
    var bg = node.get_node("BG")
    var nameplate = node.get_node("DeckNameBG")

    bg.modulate = color1
    nameplate.modulate = color1
    await wait(8)

    while true:
        var tween = get_tree().create_tween().set_parallel()
        tween.tween_property(bg, "modulate", Color(color2), 1)

        await tween.finished
        await wait(6)

        var tween2 = get_tree().create_tween().set_parallel()
        tween2.tween_property(bg, "modulate", Color(color1), 1)

        await tween2.finished
        await wait(6)

func coin_shine():
    for i in [deck_list1, deck_list2, deck_list3]:
        for k in i.get_children():
            if globals.decks_unlocked[k.get_meta("deck_name")]:
                k.get_node("DeckCoin1/Sprite/AnimationPlayer").play("loop")
    $"../Starters/DeckDetails".get_node("DeckItem/DeckCoin1/Sprite/AnimationPlayer").play("loop")


    await wait(0.4)

    for i in [deck_list1, deck_list2, deck_list3]:
        for k in i.get_children():
            if globals.decks_unlocked[k.get_meta("deck_name")]:
                k.get_node("DeckCoin2/Sprite/AnimationPlayer").play("loop")
    $"../Starters/DeckDetails".get_node("DeckItem/DeckCoin2/Sprite/AnimationPlayer").play("loop")

func play_bg_anm():
    for i in [deck_list1, deck_list2, deck_list3]:
        for k in i.get_children():
            k.get_node("BG/AnimationPlayer").play("loop")

func show_starters():
    visible = true

    if not globals.test_mode and not globals.bf_mode:
        globals.player.state = globals.player.locked
    globals.ui.hide_hud()

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(starters_menu, "position", Vector2(1100, 0), 0.2)

    await wait(0.2)
    select_starter()
    update_deck_details()
    state = starter

func hide_starters():
    visible = true

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(starters_menu, "position", Vector2(-520, 0), 0.3)
    globals.ui.show_hud()
    state = off



func starter_input():
    if Input.is_action_just_pressed("Accept"):
        var picked_starter
        if starter_line == 0:
            picked_starter = deck_list1.get_child(starter_index).get_meta("deck_name")
        elif starter_line == 1:
            picked_starter = deck_list2.get_child(starter_index).get_meta("deck_name")
        elif starter_line == 2:
            picked_starter = deck_list3.get_child(starter_index).get_meta("deck_name")

        if globals.decks_unlocked[picked_starter]:
            play_accept_SE()
            await pick_starter(picked_starter)
            set_player_party(picked_starter)
            setup_party_menu()
            await wait(0.1)
            setup_formation()

        else:
            buy_starter(picked_starter)

    if Input.is_action_just_pressed("right"):
        play_cursor_SE()
        unselect_starter()
        if starter_index < 7:
            starter_index += 1
        else:
            starter_index = 0
        select_starter()
        update_deck_details()

    if Input.is_action_just_pressed("left"):
        play_cursor_SE()
        unselect_starter()
        if starter_index > 0:
            starter_index -= 1
        else:
            starter_index = 7
        select_starter()
        update_deck_details()

    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if starter_line in [0, 1]:
            unselect_starter()
            starter_line += 1
            select_starter()
            update_deck_details()

    if Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if starter_line in [1, 2]:
            unselect_starter()
            starter_line -= 1
            select_starter()
            update_deck_details()

    if globals.bf_mode and Input.is_action_pressed("Cancel"):
        if globals.bf_mode:
            globals.bf_box = []
            globals.bf_party = [null, null, null, null, null, null]
            hide_starters()











func select_starter():
    if starter_line == 0:
        deck_list1.get_child(starter_index).get_node("Selector").visible = true
    elif starter_line == 1:
        deck_list2.get_child(starter_index).get_node("Selector").visible = true
    elif starter_line == 2:
        deck_list3.get_child(starter_index).get_node("Selector").visible = true

func unselect_starter():
    if starter_line == 0:
        deck_list1.get_child(starter_index).get_node("Selector").visible = false
    elif starter_line == 1:
        deck_list2.get_child(starter_index).get_node("Selector").visible = false
    elif starter_line == 2:
        deck_list3.get_child(starter_index).get_node("Selector").visible = false

func pick_starter(picked_starter):
    globals.deck_selected = picked_starter



    for i in starter_sets[picked_starter]["mons"]:
        if not globals.bf_mode:
            globals.player_data.player_box.append(i)
        elif globals.bf_mode:
            globals.bf_box.append(i)

    hide_starters()

func set_player_party(picked_starter):
    if not globals.bf_mode:
        globals.player_data.player_party = [null, null, null, null, null, null]
    var cont = 0
    for i in starter_sets[picked_starter]["mons"]:
        if not globals.bf_mode:
            globals.player_data.player_party[starter_sets[picked_starter]["formation"][cont]] = i
        elif globals.bf_party:
            globals.bf_party[starter_sets[picked_starter]["formation"][cont]] = i
        cont += 1

func update_deck_details():
    var deck_details = $"../Starters/DeckDetails"

    var deck_name
    if starter_line == 0:
        deck_name = deck_list1.get_child(starter_index).get_meta("deck_name")
    elif starter_line == 1:
        deck_name = deck_list2.get_child(starter_index).get_meta("deck_name")
    elif starter_line == 2:
        deck_name = deck_list3.get_child(starter_index).get_meta("deck_name")

    for i in deck_details.get_node("VList").get_children():
            i.queue_free()

    if globals.decks_unlocked[deck_name]:




        deck_details.get_node("DeckItem/Name").text = starter_sets[deck_name]["name"]


        deck_details.get_node("DeckItem/BG/BGSprite").modulate = poke_types.colors[starter_sets[deck_name]["mons"][0]["dex"]["color"]][2]
        deck_details.get_node("DeckItem/DeckNameBG").modulate = poke_types.colors[starter_sets[deck_name]["mons"][0]["dex"]["color"]][2]


        var index = 0
        deck_details.get_node("DeckItem/DeckCoin1/Sprite").frame = (starter_index * 2) + ((starter_line) * 16) + 1
        deck_details.get_node("DeckItem/DeckCoin1/Sprite").modulate = poke_types.colors[starter_sets[deck_name]["mons"][index]["dex"]["color"]][2]

        index += 1
        deck_details.get_node("DeckItem/DeckCoin2/Sprite").frame = (starter_index * 2) + 1 + ((starter_line) * 16) + 1
        deck_details.get_node("DeckItem/DeckCoin2/Sprite").modulate = poke_types.colors[starter_sets[deck_name]["mons"][index]["dex"]["color"]][2]

        if globals.decks_cleared[deck_name]:
            deck_details.get_node("DeckItem/Badge").modulate = Color("ffffff")
        else:
            deck_details.get_node("DeckItem/Badge").modulate = Color("000000")

        for i in deck_details.get_node("VList").get_children():
            i.queue_free()

        for i in starter_sets[deck_name]["mons"]:
            var new_index = load("res://Files/Scenes/Level/Menu/party_pokemon_item.tscn").instantiate()

            new_index.get_node("Label").text = pkmn.dex[i["species"]]["name"]
            new_index.get_node("Level").text = "lv%s" % i["lv"]
            new_index.get_node("Sprite").frame = pkmn.dex[i["species"]]["sprite"]
            new_index.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([pkmn.dex[i["species"]]["color"]]))


            deck_details.get_node("VList").add_child(new_index)

    else:

        deck_details.get_node("DeckItem/DeckCoin1/Sprite").frame = 0
        deck_details.get_node("DeckItem/DeckCoin2/Sprite").frame = 0
        deck_details.get_node("DeckItem/DeckCoin1/Sprite").modulate = Color("ffffffff")
        deck_details.get_node("DeckItem/DeckCoin2/Sprite").modulate = Color("ffffffff")
        deck_details.get_node("DeckItem/BG/BGSprite").modulate = Color("ffffffff")
        deck_details.get_node("DeckItem/DeckNameBG").modulate = Color("ffffffff")

        deck_details.get_node("DeckItem/Badge").modulate = Color("000000")

        var color = "#7ac6ff"
        var cost = starter_sets[deck_name]["cost"]
        if cost > globals.player_bp:
            color = "#e64039"

        deck_details.get_node("DeckItem/Name").text = "Unlock: [color=%s]$%s" % [color, cost]


func buy_starter(picked_starter):
    if globals.player_bp >= starter_sets[picked_starter]["cost"]:
        play_accept_SE()
        globals.player_bp -= starter_sets[picked_starter]["cost"]
        bp_label.text = "$%s" % globals.player_bp

        globals.decks_unlocked[picked_starter] = true

        var deck_node

        for i in [deck_list1, deck_list2, deck_list3]:
            for k in i.get_children():
                if k.get_meta("deck_name") == picked_starter:
                    deck_node = k

        deck_node.get_node("Name").text = starter_sets[picked_starter]["name"]

        var cont = (starter_index * 2) + ((starter_line) * 16) + 1
        var index = 0
        deck_node.get_node("DeckCoin1/Sprite").frame = cont
        deck_node.get_node("DeckCoin1/Sprite").modulate = poke_types.colors[starter_sets[picked_starter]["mons"][index]["dex"]["color"]][2]
        index += 1
        deck_node.get_node("DeckCoin2/Sprite").frame = cont + 1
        deck_node.get_node("DeckCoin2/Sprite").modulate = poke_types.colors[starter_sets[picked_starter]["mons"][index]["dex"]["color"]][2]

        setup_deck_bg(picked_starter, deck_node)
        coin_shine()

        update_deck_details()
    else:
        play_buzzer_SE()
        var deck_details = $"../Starters/DeckDetails"
        var label = deck_details.get_node("DeckItem/Name")
        state = locked
        label.modulate = Color("#e60000")
        var tween = get_tree().create_tween()
        tween.tween_property(label, "position", label.position + Vector2(4, 0), 0.1)
        tween.tween_property(label, "position", label.position + Vector2(0, 0), 0.1)
        tween.tween_property(label, "modulate", Color("#ffffff"), 0.1)
        await wait(0.2)
        state = starter






@onready var keyboard_menu: Node2D = $"../Keyboard"
@onready var keyboard_selector: ColorRect = $"../Keyboard/Keys/Selector"
@onready var keys: VBoxContainer = $"../Keyboard/Keys/KeyVBox"
@onready var keyboard_inputbox: HBoxContainer = $"../Keyboard/Keys/InputVBox"
@onready var question: Label = $"../Keyboard/Keys/Question"

var keyb_selector = Vector2(0, 0)
var keyb_map = ["ABCDEFGHI", "JKLMNOPQR", "STUVWXYZ?"]
var current_input = ""
var keyboard_confirm = false

func setup_keyboard():
    question.text = keyboard_question
    current_input = ""
    keyb_selector = Vector2(0, 0)
    keyboard_selector.show()
    $"../Keyboard/Keys/Enter/Selector".hide()

    for i in keyboard_inputbox.get_children():
        i.get_node("Label").text = ""

    update_cursor()
    select_key()

func show_keyboard():
    setup_keyboard()
    $"../ScreenTint".color = Color("#00000000")
    await wait(0.01)
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property($"../ScreenTint", "color", Color("#00000096"), 0.1)
    tween.tween_property(keyboard_menu, "modulate", Color("#ffffff"), 0.1)
    await tween.finished
    state = keyboard

func hide_keyboard():
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property($"../ScreenTint", "color", Color("#00000000"), 0.1)
    tween.tween_property(keyboard_menu, "modulate", Color("#ffffff00"), 0.1)
    await tween.finished
    state = off

func select_key():
    keyboard_selector.global_position = keys.get_child(keyb_selector[1]).get_child(keyb_selector[0]).global_position

func input_key():
    if current_input.length() >= 9: return
    if not keyboard_selector.visible: return
    var new_key = keyb_map[keyb_selector[1]][keyb_selector[0]]
    keyboard_inputbox.get_child(current_input.length()).get_node("Label").text = new_key
    current_input += new_key
    update_cursor()

func erase_key():
    if current_input.length() == 0:
        hide_keyboard()
        return

    keyboard_inputbox.get_child(current_input.length() - 1).get_node("Label").text = ""
    current_input = current_input.left(current_input.length() - 1)
    update_cursor()

func update_cursor():
    for i in keyboard_inputbox.get_children():
        i.get_node("ColorRect").position.y = 43
    if current_input.length() < 9:
        keyboard_inputbox.get_child(current_input.length()).get_node("ColorRect").position.y = 50

func keyboard_input():
    if not keyboard_selector.visible: return

    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        input_key()

    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        erase_key()

    elif Input.is_action_just_pressed("right"):
        play_cursor_SE()
        if keyb_selector[0] < 8:
            keyb_selector[0] += 1
        else:
            keyb_selector[0] = 0
        select_key()

    elif Input.is_action_just_pressed("left"):
        play_cursor_SE()
        if keyb_selector[0] == 0:
            keyb_selector[0] = 8
        else:
            keyb_selector[0] -= 1
        select_key()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if keyb_selector[1] < 2:
            keyb_selector[1] += 1
        else:
            keyboard_selector.hide()
            while not Input.is_action_just_pressed("up"):
                $"../Keyboard/Keys/Enter/Selector".show()
                if Input.is_action_just_pressed("Accept"):
                    play_accept_SE()
                    keyboard_confirm = true
                    await hide_keyboard()
                    return

                await wait(0.01)
            $"../Keyboard/Keys/Enter/Selector".hide()
            keyb_selector[0] = 4
            play_cursor_SE()
            keyboard_selector.show()

        select_key()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if keyb_selector[1] == 0:
            keyb_selector[1] = 2
        else:
            keyb_selector[1] -= 1
        select_key()






@onready var options_menu: Node2D = $"../Options"
@onready var options_items: Node2D = $"../Options/Items"
@onready var options_selector: ColorRect = $"../Options/Selector"
@onready var vsync_label: Label = $"../Options/Items/VSync/Label"
@onready var fullscreen_label: Label = $"../Options/Items/Fullscreen/Label"


var options_prev_state = off
var option_index = 0
var options_amount = 5


func show_options():
    options_prev_state = state
    screen_tint.color = Color("202020a5")
    $"../Options/Items/BGMVolume/Bar".scale.x = globals.options["bgm_volume"]
    options_selector.show()
    options_menu.show()
    await wait(0.1)

    state = options

func hide_options():
    screen_tint.color = Color("00000000")
    options_selector.hide()
    options_menu.hide()
    await wait(0.1)
    state = options_prev_state

func select_option():
    var cur_option = options_items.get_child(option_index)
    options_selector.position = cur_option.position

func pick_option():
    if option_index == 0:
        await adjust_volume_input("bgm_volume")

    elif option_index == 1:
        await adjust_volume_input("se_volume")

    elif option_index == 2:
        await toggle_fullscreen()

    elif option_index == 3:
        await toggle_vsync()

    elif option_index == 4:
        await save.export_save()
        hide_options()

    elif option_index == 5:
        await save.import_save()
        hide_options()

func adjust_volume_input(option_name):
    state = locked
    options_selector.hide()
    var bar = options_items.get_child(option_index).get_node("Bar")
    bar.get_node("AnimationPlayer").play("loop")
    await wait(0.04)
    while true:
        if Input.is_action_just_pressed("left"):
            if globals.options[option_name] > 0.1:
                globals.options[option_name] -= 0.1
                bar.scale.x -= 0.1
                adjust_volume()

        elif Input.is_action_just_pressed("right"):
            if globals.options[option_name] < 0.95:
                globals.options[option_name] += 0.1
                bar.scale.x += 0.1
                adjust_volume()

        elif Input.is_action_just_pressed("Cancel") or Input.is_action_just_pressed("Accept"):
            break

        await wait(0.01)
    bar.get_node("AnimationPlayer").play("RESET")
    options_selector.show()
    state = options

func options_input():
    if Input.is_action_just_pressed("Accept"):
        pick_option()

    elif Input.is_action_just_pressed("Cancel"):
        hide_options()

    elif Input.is_action_just_pressed("down"):
        if option_index < options_amount:
            option_index += 1
        else:
            option_index = 0
        options_selector.position = options_items.get_child(option_index).position

    elif Input.is_action_just_pressed("up"):
        if option_index > 0:
            option_index -= 1
        else:
            option_index = options_amount
        options_selector.position = options_items.get_child(option_index).position

func adjust_volume():
    if options_prev_state == 0:
        get_tree().get_current_scene().get_node("Scenes/TitleScene/BGMPlayer").volume_linear = 0.177 * globals.options["bgm_volume"]
        $"../../GUIPlayer".volume_linear = 0.177 * globals.options["se_volume"]

    elif options_prev_state == 2:
        get_tree().get_current_scene().get_node("Scenes/Level/BGMPlayer").volume_linear = 0.177 * globals.options["bgm_volume"]
    adjust_ui_se_volume()
    play_cursor_SE()

func adjust_ui_se_volume():
    $"../GUIPlayer".volume_linear = 0.177 * globals.options["se_volume"]
    $"../CutscenePlayer".volume_linear = 0.177 * globals.options["se_volume"]

func set_vsync():

    if not globals.options.has("v-sync"):
        globals.options["v-sync"] = 1

    match globals.options["v-sync"]:
        0:
            vsync_label.text = "V-Sync: OFF"
        1:
            vsync_label.text = "V-Sync: ON"



func toggle_vsync():


    if globals.options["v-sync"] == 0:
        DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
        globals.options["v-sync"] = 1
        set_vsync()
        return

    if globals.options["v-sync"] == 1:
        DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
        globals.options["v-sync"] = 0
        set_vsync()
        return


















func set_fullscreen():
    if not globals.options.has("fullscreen"):
        globals.options["fullscreen"] = 0

    match globals.options["fullscreen"]:
        0:
            fullscreen_label.text = "Fullscreen: OFF"
        1:
            fullscreen_label.text = "Fullscreen: ON"

func toggle_fullscreen():
    if globals.options["fullscreen"] == 0:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
        globals.options["fullscreen"] = 1
        set_fullscreen()
        return

    if globals.options["fullscreen"] == 1:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
        globals.options["fullscreen"] = 0
        set_fullscreen()
        return




@onready var trainer_menu: Node2D = $"../Trainer"
@onready var starter_decks: Node2D = $"../Trainer/Items/StarterDecks"
@onready var lc: Node2D = $"../Trainer/Items/LC"
var trainer_index_scene = load("res://Files/Scenes/Menu/collection_index.tscn")

func setup_trainer_menu():
    for i in globals.decks_cleared:
        var new_index = trainer_index_scene.instantiate()
        if globals.decks_cleared[i] == true:
            new_index.get_node("BG").color = Color("#f8c050")
        starter_decks.get_node("GridContainer").add_child(new_index)

    for i in LC_pools.pools:
        if i == "Mewtwo": continue
        var new_index = load("res://Files/Scenes/Menu/lc_collection_index.tscn").instantiate()

        if i[0] == "*":
            new_index.modulate = Color(0.0, 0.0, 0.0, 0.0)

        elif globals.LC_cleared[i]:
            new_index.get_node("BG").color = Color("#f8c050")
        lc.get_node("GridContainer").add_child(new_index)

    if globals.event_flags["mewtwo_cleared"]:
        trainer_menu.get_node("Items/Extra/Mewtwo").modulate = Color("ffffff")

func show_trainer_menu():
    if globals.test_mode:
        get_node("../..").state = get_node("../..").locked
    else:
        selector.hide()
        state = locked

    screen_tint.color = Color("202020a5")
    trainer_menu.show()
    await wait(0.1)
    while true:
        if Input.is_action_just_pressed("Cancel"):
            play_cancel_SE()
            hide_trainer_menu()
            if globals.test_mode:
                get_node("../..").state = get_node("../..").menu
            else:
                await wait(0.02)
                selector.show()
                state = menu
                enable_menu()
            break
        await wait(0.01)

func hide_trainer_menu():
    screen_tint.color = Color("00000000")
    trainer_menu.hide()







@onready var bf_result_menu = $"../BFResult"
func bf_victory(normal_victory = false):
    if globals.normal_mode and not globals.LC_mode:
        globals.decks_cleared[globals.deck_selected] = true

    if globals.LC_mode:
        globals.LC_cleared[globals.lc_selected] = true

    if globals.bf_mode:
        globals.battle.bf_get_bp(3)
        globals.battle.bf_result = "victory"

    if globals.mewtwo_mode:
        globals.event_flags["mewtwo_cleared"] = true
    await save.save_data()
    await bf_game_over(normal_victory)

func bf_game_over(normal_victory = false):
    setup_bf_results(normal_victory)
    setup_defeated_trainers()

    if globals.normal_mode:
        globals.player.state = globals.player.locked

    globals.ui.screen_tint.color = Color("#20202000")
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(bf_result_menu, "modulate", Color("#ffffff"), 0.2)
    tween.tween_property(globals.ui.screen_tint, "color", Color("#20202064"), 0.2)

    if not normal_victory:
        if globals.battle.battle_result == "lose":
            bf_result_menu.get_node("DefeatedBy").show()
            tween.tween_property(bf_result_menu.get_node("DefeatedBy"), "position", Vector2(506, 0), 0.2)

    await tween.finished
    flash_result()

    await wait(1)
    bf_result_menu.get_node("Button/Selector").show()
    while true:
        if Input.is_action_pressed("Accept") or Input.is_action_pressed("Cancel"): break
        await wait(0.01)
    play_accept_SE()

    globals.ui.get_node("../ScreenTint").color = Color("18181800")
    tween = get_tree().create_tween()
    tween.tween_property(bf_result_menu, "modulate", Color("#ffffff00"), 0.2)
    if normal_victory:
        await tween.finished
        return
    tween.tween_property(globals.ui.get_node("../ScreenTint"), "color", Color("#181818"), 0.2)
    await tween.finished
    globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func setup_bf_results(normal_victory = false):
    if not normal_victory:
        bf_result_menu.get_node("Result").text = globals.battle.bf_result.to_upper()
    else:
        bf_result_menu.get_node("Result").text = "VICTORY"
        if globals.versus_mewtwo:
            bf_result_menu.get_node("Result").text = "ESCAPED"

    bf_result_menu.get_node("Stats/ResultsValue").text = bf_result_menu.get_node("Stats/ResultsValue").text.format([globals.player_data.battles_fought, globals.player_data.battles_won, globals.player_data.battles_lost])

    var cont = 0
    for i in globals.player_data.player_party:
        if i != null:
            bf_result_menu.get_node("Party/Sprite%s" % cont).show()
            bf_result_menu.get_node("Party/Sprite%s" % cont).frame = i["dex"]["sprite"]
        else:
            bf_result_menu.get_node("Party/Sprite%s" % cont).hide()
        cont += 1

    cont = 0
    for i in globals.player_data.player_box:
        if i not in globals.player_data.player_party:
            bf_result_menu.get_node("Box/Sprite%s" % cont).show()
            bf_result_menu.get_node("Box/Sprite%s" % cont).frame = i["dex"]["sprite"]
            cont += 1

    if not normal_victory:
        if globals.battle.battle_result == "lose":
            cont = 0
            if not globals.versus_mewtwo:
                if not globals.bf_mode:
                    bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").texture = load("res://Files/Sprites/Characters/%s.png" % globals.enemy.npc_name)
                    if globals.enemy.npc_name == "Mewtwo":
                        bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").hframes = 2
                        bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").frame = 4
                else:
                    bf_result_menu.get_node("DefeatedBy/PartyBG6").hide()

                for i in globals.battle.enemy_team_copy:
                    if i != null:
                        bf_result_menu.get_node("DefeatedBy/Party").get_node("Sprite%s" % cont).show()
                        bf_result_menu.get_node("DefeatedBy/Party").get_node("Sprite%s" % cont).frame = i.unit_dict["dex"]["sprite"]
                    cont += 1
            else:
                bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").texture = load("res://Files/Sprites/Characters/Mewtwo.png")
                bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").position.y += 8
                bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").hframes = 2
                bf_result_menu.get_node("DefeatedBy/PartyBG6/Sprite2D").frame = 4
                bf_result_menu.get_node("DefeatedBy/Party").get_node("Sprite1").show()
                bf_result_menu.get_node("DefeatedBy/Party").get_node("Sprite1").frame = pkmn.dex["mewtwo"]["sprite"]

func setup_defeated_trainers():
    if globals.bf_mode:
        $"../BFResult/TrainersDefeated".hide()
        return

    for i in $"../BFResult/TrainersDefeated/HBoxContainer".get_children():
        i.queue_free()

    for i in globals.player_data.defeated_trainers:
        var new_index = load("res://Files/Scenes/Menu/defeated_trainer_index.tscn").instantiate()
        new_index.get_node("Sprite2D").texture = load("res://Files/Sprites/Characters/%s.png" % i)

        if i == "Mewtwo":
            new_index.get_node("Sprite2D").hframes = 2
            new_index.get_node("Sprite2D").frame = 4

        $"../BFResult/TrainersDefeated/HBoxContainer".add_child(new_index)

func flash_result():
    var flash_color = Color("#fef9cd")
    if bf_result_menu.get_node("Result").text == "DEFEAT":
        flash_color = Color("#cccccc")

    for i in range(50):
        bf_result_menu.get_node("Result").modulate = flash_color
        await wait(0.04)
        bf_result_menu.get_node("Result").modulate = Color("#f8f8f8")
        await wait(0.04)





@onready var gui_player: AudioStreamPlayer = $"../GUIPlayer"
@onready var cuts_player: AudioStreamPlayer = $"../CutscenePlayer"


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

func play_buzzer_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI sel buzzer.ogg")
    gui_player.play()

func play_notification_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/Voltorb Flip point.ogg")
    gui_player.play()

func play_buy_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/Battle/Mart buy item.ogg")
    gui_player.play()




func wait(time):
    await get_tree().create_timer(time).timeout
