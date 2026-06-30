extends Node2D

@onready var anm_player: AnimationPlayer = $AnimationPlayer
@onready var bf_result_menu: Node2D = $BFResult
@export var display_mode = false


var unit_scene = load("res://Files/Scenes/Battle/UnitScene.tscn")
var point_scene = load("res://Files/Scenes/Battle/PointUnit.tscn")

var player_team_ref = ["charizard_mega_x", ["pikachu", 4, {"is_shiny": true}], ["snorlax_gmax", 5, {"is_shiny": true}], null, null, null]
var enemy_team_ref  = ["venusaur_mega", ["gengar", 4, {"is_shiny": true}], "mewtwo_mega_x", null, null, null]

var player_team = [null, null, null, null, null, null]
var enemy_team = [null, null, null, null, null, null]

var player_team_copy = []
var enemy_team_copy = []
var battle_result = ""
var enemy_cost = []

var player_hp = 0
var enemy_hp = 0

var units_in_play = []

var search_index = 0

var vertical_spacing = 130
var horizontal_offset = 40
var battle_positions = [

    [

        Vector2(920, 340), 
        Vector2(920 + horizontal_offset, 340 + vertical_spacing), 
        Vector2(920 + horizontal_offset * 2, 340 + vertical_spacing * 2), 


        Vector2(1080, 340), 
        Vector2(1080 + horizontal_offset, 340 + vertical_spacing), 
        Vector2(1080 + horizontal_offset * 2, 340 + vertical_spacing * 2), 
    ], 


    [

        Vector2(620, 340), 
        Vector2(620 - horizontal_offset, 340 + vertical_spacing), 
        Vector2(620 - horizontal_offset * 2, 340 + vertical_spacing * 2), 


        Vector2(420, 340), 
        Vector2(420 - horizontal_offset, 340 + vertical_spacing), 
        Vector2(420 - horizontal_offset * 2, 340 + vertical_spacing * 2), 
    ]
]

var effects_in_play = {
    "on_battle_start": [], 
    "on_turn_start": [], 

    "before_attacking": [], 
    "after_attacking": [], 

    "before_ally_attacking": [], 
    "before_ally_attacked": [], 

    "before_attacked": [], 
    "after_attacked": [], 

    "after_ally_attacking": [], 
    "after_ally_attacked": [], 

    "on_death": [], 
    "on_enemy_death": [], 
    "on_ally_death": [], 

    "on_hit": [], 

    "on_turn_end": [], 
    "on_round_end": [], 
    "on_battle_end": [], 
}
var effect_triggering = false

var trick_room = false
var helping_hand = false


var current_act_unit = null
var current_target_unit = null
var current_delayed_actor = null

var units_out_of_place = []
var units_covering = []

var ai_highest_damage_memory = [-1, "unit_atk1", Node]
var ai_chosen_move = null

var damage_mod = 1
var damage_flat = 0

var unit_dying = false
var battle_over = false


var party_index = 0
@onready var party_selector
enum {
    off, 
    party, 
    status, 
    formation, 
    enemy_team_search, 
    battle_options, 
    bf_options, 
}

var menu_state = off
var formation_position = Vector2(1, 1)
@onready var formation_selector = $UnitField / Selector
var pickedup_mon = null

var battle_options_index = 0
var stupid = 0.0

var advance_times = {
    0: 6, 
    1: 12, 
    2: 18, 
    3: 99, 
    4: 99, 
}


var encounters
var bf_level = 0
var bf_battle_index = 0
var bf_result = "defeat"



func _ready():
    $GUIPlayer.volume_linear = 0.177 * globals.options["se_volume"]

    if globals.test_mode:
        print("[rl_pkmn] dex entries loaded: ", rl_pkmn.dex.size())
        var sample = rl_pkmn.dex.get("bulbasaur", {})
        print("[rl_pkmn] bulbasaur pp_range=%s base_ap=%s" % [sample.get("pp_range","?"), sample.get("base_ap","?")])

    if not globals.test_mode:
        party_selector = globals.ui.get_node("Status/Party/Selector")
        await wait(0.1)

    if globals.bf_mode:
        encounters = $"../Encounters"
        quit_confirm_menu = $"../QuitConfirm"
        quit_confirm_buttons = $"../QuitConfirm/Buttons"
        quit_confirm_selector = $"../QuitConfirm/Buttons/Selector"

        await setup_bf_mode()


    if not globals.test_mode and not globals.bf_mode:
        $Stage.frame = globals.hotel.game_level + 1
        if globals.gbc: $Stage.frame = 0

    await wait(0.01)
    globals.battle = self
    setup_teams()


    await animate_unit_spawns()
    if display_mode: return
    if globals.pre_battle_formation and not globals.test_mode:

            setup_team_formation()


    else:
        if player_team == [null, null, null, null, null, null]:
            setup_team_formation()
        else:
            battle_start()




func _physics_process(_delta: float) -> void :
    if menu_state == party:
        party_input()
    elif menu_state == formation:
        formation_input()
    elif menu_state == enemy_team_search:
        enemy_team_input()
    elif menu_state == battle_options:
        battle_options_input()
    elif menu_state == bf_options:
        bf_options_input()






func setup_bf_mode():
    if globals.test_mode:
        globals.bf_mode = false
        return

    bf_map = $"../BFMap"
    map_grid = $"../BFMap/GridContainer"
    map_player = $"../BFMap/MapPlayer"
    $AnimationPlayer.stop()
    $Stage.modulate = Color("#ffffff")
    $Stage.scale = Vector2.ONE

    $"../BattlePlayer".volume_linear = 0.177 * globals.options["bgm_volume"]

    globals.player_data.money = 30
    globals.player_data.player_box = globals.bf_box
    globals.player_data.player_party = globals.bf_party





    await wait(0.1)
    for i in encounters.dict:
        encounters.dict[i].shuffle()

    await bf_spawn_next_enemy()
    generate_bf_shop_cards()


func bf_get_next_enemy():
    globals.player_data.battles_fought += 1

    if globals.player_data.battles_fought == 10:
        $Stage.frame = 2
        bf_level = 1
        bf_battle_index = 0
        bf_get_bp(1)
    elif globals.player_data.battles_fought == 20:
        $Stage.frame = 3
        bf_level = 2
        bf_battle_index = 0
        bf_get_bp(1)
    elif globals.player_data.battles_fought == 30:
        $Stage.frame = 4
        bf_level = 3
        bf_battle_index = 0
        bf_get_bp(1)


    var next_enemy = encounters.dict[bf_level][bf_battle_index]
    bf_battle_index += 1

    return next_enemy

func bf_spawn_next_enemy():
    for i in enemy_team_copy:
        if i == null: continue
        i.queue_free()

    for i in $UnitField.get_children():
        if i == null: continue
        if i == $UnitField / Selector: continue
        if i.team == 2: i.queue_free()

    battle_start_effect_memory = []
    enemy_team = [null, null, null, null, null, null]
    globals.player_data.enemy_party = bf_get_next_enemy()

func bf_end_battle():
    battle_start_effect_memory = []


    if globals.player_data.battles_fought % 3 == 0:
        generate_bf_shop_cards()

    bf_get_money()

    for i in effects_in_play:
        effects_in_play[i] = []
    enemy_hp = 0
    player_hp = 0

    units_in_play = []

    bf_spawn_next_enemy()

    setup_team(globals.player_data.enemy_party, 1)
    setup_player_team()

    update_bf_map()
    await bf_animate_enemy_spawn()

    if globals.pre_battle_formation and not globals.test_mode:
        if not Input.is_action_pressed("Cancel"):
            setup_team_formation()
        else:
            battle_start()
    else:
        await bf_battle_countdown()

func bf_battle_countdown():



    $Countdown.show()
    var time = 1.5
    while time > 0:
        if Input.is_action_pressed("Cancel"):
            $Countdown.hide()
            setup_team_formation()
            return

        $Countdown / Label.text = "Next battle in [color=ffffff]%.2f" % time
        time -= 0.02
        await wait(0.02)
    $Countdown.hide()
    battle_start()

func bf_animate_enemy_spawn():
    for i in enemy_team:
        if i == null: continue
        var tween = get_tree().create_tween()
        tween.tween_property(i.get_node("Card/CardSprite"), "position", Vector2(0, 14), 0.3)

        i.get_node("AnimationPlayer").play("ot_spawn")
        await wait(0.1)

    await wait(1.4)
    for i in enemy_team:
        if i == null: continue
        i.get_node("AnimationPlayer").play("RESET")

func setup_player_team():







    player_team = player_team_copy

    for i in player_team_copy:
        if i == null: continue
        if i.selected_attack == i.atk2:
            switch_attack_ui(i)

        setup_unit(i, i.unit_dict, true)
        reposition_unit(i)
        healthbar_damage(i)
        i.team_slot = i.original_team_slot
        units_in_play.append(i)

    for i in $UnitField.get_children():
        if i == $UnitField / Selector: continue
        if i.team == 1 and i not in player_team_copy:
            i.queue_free()


func reposition_unit(unit):
    unit.anm_player.play("RESET")
    unit.get_node("Sprite/Sprite2D").self_modulate = Color(1.0, 1.0, 1.0, 1.0)
    unit.get_node("UnitUI/Burn").visible = false
    var tween = get_tree().create_tween()
    tween.tween_property(unit, "position", battle_positions[unit.team - 1][unit.original_team_slot - 1], 0.2)
    await tween.finished
    unit.update_home_coords()

func bf_get_money():
    var money = 0
    if bf_level == 0:
        money = 15
    elif bf_level == 1:
        money = 30
    else:
        money = 45



    globals.player_data.prize_money = money

    var text = "You got [color=eeca52]$%s[/color]." % globals.player_data.prize_money
    globals.ui.show_notification(text)

    globals.player_data.money += globals.player_data.prize_money
    globals.player_data.prize_money = 0

func bf_get_bp(amount):
    globals.player_bp += amount

    var text = "[color=a5a5a5]You got [color=7ac6ff]{0} BP[/color].".format([amount])
    await wait(0.8)
    globals.ui.show_notification(text)




func bf_lose_health():
    globals.player_data.player_hp -= 20
    if bf_level > 2: globals.player_data.player_hp -= 100
    if globals.player_data.player_hp < 0: globals.player_data.player_hp = 0
    globals.ui.hud.get_node("Player/Shadow").visible = false

    flash_player_healthbar()
    await wait(0.05)
    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(globals.ui.hud.get_node("Player/Bar"), "scale", Vector2(globals.player_data.player_hp / 100, 1), 0.1)


    await wait(0.1)
    globals.ui.hud.get_node("Player/Shadow").visible = true

    if globals.player_data.player_hp < 1:
            bf_result = "defeat"
            globals.ui.bf_game_over()
            return

func flash_player_healthbar():
    for i in range(5):
        globals.ui.hud.get_node("Player/Bar").color = Color("#e60000")
        await wait(0.05)
        globals.ui.hud.get_node("Player/Bar").color = Color("#ffffff")
        await wait(0.05)

    if globals.player_data.player_hp > 50:
        globals.ui.hud.get_node("Player/Bar").color = Color("#18c320")
    elif globals.player_data.player_hp < 25:
        globals.ui.hud.get_node("Player/Bar").color = Color("#e64039")
    else:
        globals.ui.hud.get_node("Player/Bar").color = Color("#cd9d20")







func setup_teams():
    if globals.rl_mode:
        setup_team(globals.bf_party, 0)
        setup_team(globals.rl_enemy_team, 1)
    elif not globals.test_mode:
        if not globals.mewtwo_mode:
            setup_team(globals.player_data.player_party, 0)
        else:
            setup_team(globals.player_data.enemy_party, 0)
        setup_team(globals.player_data.enemy_party, 1)
    else:
        setup_team(player_team_ref, 0)
        setup_team(enemy_team_ref, 1)

func setup_team(team, team_position):
    var cont = 0
    for i in team:

        if i == null:
            cont += 1
            continue

        var new_unit = unit_scene.instantiate()


        if team_position == 1:
            new_unit.team = 2
            new_unit.get_node("Sprite").scale.x = -1
            new_unit.get_node("Card").scale.x = -1

        setup_unit(new_unit, i)
        new_unit.team_slot = cont + 1

        new_unit.position = battle_positions[team_position][cont]
        new_unit.update_home_coords()
        get_node("UnitField").add_child(new_unit)

        units_in_play.append(new_unit)







        if team_position == 0:
            player_team[cont] = new_unit

        else:
            enemy_team[cont] = new_unit


        cont += 1

func setup_unit(unit, unit_dict, reseting = false):
    if typeof(unit_dict) == TYPE_STRING:
        unit_dict = globals.generate_pokemon(unit_dict, 1)
    elif typeof(unit_dict) == TYPE_ARRAY:
        unit_dict = globals.generate_pokemon(unit_dict[0], unit_dict[1], unit_dict[2])

    var dex_data = unit_dict["dex"]

    if not reseting:
        unit.visible = false

    var bonus_lv = 0
    if unit.team == 2:
        bonus_lv = 0

        if not globals.test_mode and not globals.bf_mode:
            if globals.hotel.game_level == 0:
                if globals.player_data.battles_fought in [advance_times[0] - 2, advance_times[0] - 1]:
                    bonus_lv = 1
                elif globals.player_data.battles_fought == advance_times[0]:
                    bonus_lv = 2

            elif globals.hotel.game_level == 1:
                if globals.player_data.battles_fought in [advance_times[0] + 1]:
                    bonus_lv = -1

                elif globals.player_data.battles_fought in [advance_times[1] - 2, advance_times[1] - 1]:
                    bonus_lv = 1
                elif globals.player_data.battles_fought in [advance_times[1]]:
                    bonus_lv = 2

            elif globals.hotel.game_level == 2:
                if globals.player_data.battles_fought in [advance_times[1] + 1, advance_times[1] + 2]:
                    bonus_lv = -1

                if globals.player_data.battles_fought in [advance_times[2] - 2, advance_times[2] - 1]:
                    bonus_lv = 1

        elif globals.bf_mode:
            if globals.player_data.battles_fought in [7, 8]:
                bonus_lv = 1
            elif globals.player_data.battles_fought in [9, 10]:
                bonus_lv = -2
            elif globals.player_data.battles_fought in [11, 12]:
                bonus_lv = -1
            elif globals.player_data.battles_fought in [17, 18, 19]:
                bonus_lv = 1
            elif globals.player_data.battles_fought in [20]:
                bonus_lv = -3
            elif globals.player_data.battles_fought in [21]:
                bonus_lv = -2
            elif globals.player_data.battles_fought in [22, 23]:
                bonus_lv = -1
            elif globals.player_data.battles_fought in [29, 30]:
                bonus_lv = 1


    unit.unit_name = dex_data["name"]
    unit.unit_id = unit_dict["id"]
    unit.sprite = dex_data["sprite"]
    unit.color = dex_data["color"]
    unit.rarity = dex_data["rarity"]
    unit.level = clamp(unit_dict["lv"] + bonus_lv, 1, 9)

    unit.ap = dex_data["ap"] + unit_dict["bonus_ap"]
    unit.pp = dex_data["pp"] + unit_dict["bonus_pp"]

    unit.max_ap = unit.ap

    unit.health = globals.level_scale(dex_data["health"], unit.level) + unit_dict["bonus_health"]
    unit.power = globals.level_scale(dex_data["power"], unit.level) + unit_dict["bonus_power"]
    unit.speed = globals.level_scale(dex_data["speed"], unit.level) + unit_dict["bonus_speed"]

    if unit_dict.get("is_shiny", false):
        unit.health = roundi(unit.health * 1.2)
        unit.power  = roundi(unit.power  * 1.2)
        unit.speed  = roundi(unit.speed  * 1.2)

    unit.original_power = unit.power

    unit.unit_trait = dex_data["trait"]

    if unit_dict["slot1_selected"] < 2:
        unit.atk1 = dex_data["slot1"][unit_dict["slot1_selected"]]
    else:
        unit.atk1 = "struggle"

    if unit_dict["slot2_selected"] < 2:
        unit.passive = dex_data["slot2"][unit_dict["slot2_selected"]]
    else:
        unit.passive = "none"

    if unit_dict["slot3_selected"] < 2:
        unit.atk2 = dex_data["slot3"][unit_dict["slot3_selected"]]
    else:
        unit.atk2 = "struggle"

    unit.unit_dict = unit_dict

    unit.max_hp = floor(sqrt(unit.health * 5) * 10)
    if dex_data["health"] == 1: unit.max_hp = 1


    if unit.max_hp < 1: unit.max_hp = 1
    if unit.max_hp == 0: unit.max_hp = 1
    unit.get_node("UnitUI/HPLabel").text = str(unit.max_hp)

    unit.cur_hp = float(unit.max_hp)


    var _sprite_node: Sprite2D = unit.get_node("Sprite/Sprite2D")
    var _is_shiny: bool = unit_dict.get("is_shiny", false)
    if sprite_loader.get_id(unit_dict["species"]) != -1:
        var _sprite_form: String = dex_data.get("sprite_form", "")
        sprite_loader.apply_to_sprite_by_name(_sprite_node, unit_dict["species"], _is_shiny, _sprite_form)
        var _actual_form := _sprite_form if _sprite_form != "" else ("shiny" if _is_shiny else "base")
        print("[sprite] %s → PNG (id=%d, form=%s)" % [unit_dict["species"], sprite_loader.get_id(unit_dict["species"]), _actual_form])
    else:
        _sprite_node.frame = unit.sprite
        print("[sprite] %s → spritesheet viejo (frame=%d)" % [unit_dict["species"], unit.sprite])
    unit.get_node("UnitUI/LvLabel").text = "lv{0}".format([unit.level])
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    unit.get_node("Card/CardSprite").modulate = Color(poke_types.colors[unit.color][3])
    unit.get_node("Card/CardSprite2").modulate = Color(poke_types.colors[unit.color][3])

    var direction = 1
    unit.get_node("Card/CardSprite").frame = 0
    unit.get_node("Card/CardSprite").position = Vector2(160 * direction, 14)

    if unit.team == 2:
        unit.get_node("Card").scale.x = -1

    unit.selected_attack = unit.atk1
    unit.burn_amount = 0.0
    unit.defense = 1.0
    unit.temp_power = 0
    unit.temp_defense = 0.0
    unit.temp_speed = 0
    unit.played_turn = false
    unit.waiting = false
    unit.skip_turn = false
    unit.recorded_data = {
        "dodges": 0, 
        "protect": 0, 
        "AI_protected": false, 
        "burn_immunity": false, 
        "perma_burned": false, 
        "flame_body": false, 
        "extra_turn": 0, 
        "taunted": false, 
        "rollout": 0, 
    }

    if globals.gbc:
        if unit.unit_name == "Blastoise":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 200
        elif unit.unit_name == "Pidgeot":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 201
        elif unit.unit_name == "Alakazam":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 202
        elif unit.unit_name == "Pikachu":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 203
        elif unit.unit_name == "Charizard":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 204
        elif unit.unit_name == "Butterfree":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 205
        elif unit.unit_name == "Lapras":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 206
        elif unit.unit_name == "Snorlax":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 207
        elif unit.unit_name == "Vaporeon":
            unit.get_node("Sprite").get_node("Sprite2D").frame = 208

    if unit.unit_name == "MISSINGNO.":
        loop_missingno_sprite(unit)

    setup_hp_dividers(unit)

    update_unit_ap(unit)
    update_unit_pp(unit)

    if globals.gbc:
        unit.get_node("Sprite").scale.x = 1.5
        unit.get_node("Sprite").scale.y = 1.5

func unit_post_setup(unit):
    setup_attack_data(unit, unit.atk1, 1)
    setup_attack_data(unit, unit.atk2, 2)

    if unit.team == 2:
        enemy_hp += unit.max_hp
    else:
        player_hp += unit.max_hp
        if globals.auto_battle:
            unit.auto_battle = true
        else:
            unit.auto_battle = false

    unit.selected_attack = unit.atk1
    unit.original_team_slot = unit.team_slot

    effects_in_play[moves.passive[unit.passive]["trigger"]].append([unit, moves.passive[unit.passive]["effect"]])

    if unit.passive in ["wall", "cover", "guardian"]:
        effects_in_play["before_attacked"].append([unit, moves.passive[unit.passive]["effect"]])

    await wait(0.1)
    if unit.max_hp < 1 or unit.max_hp == 0:
        unit.max_hp = 1
        unit.cur_hp = 1

func setup_hp_dividers(unit):
    var divider_list = unit.get_node("UnitUI/HealthBar/Dividers/HBoxContainer")


    for i in divider_list.get_children():
        i.queue_free()

    for i in range(clamp(floor((unit.max_hp - 75) / 24), 0, 8)):
        add_divider(divider_list)






























func add_divider(divider_list):
    var divider_node = load("res://Files/Scenes/Battle/hp_divider.tscn")
    var new_divider = divider_node.instantiate()
    new_divider.color = Color("#000000af")
    divider_list.add_child(new_divider)

func update_unit_ap(unit):
    for i in unit.get_node("UnitUI/PointBar/APBox").get_children():
        i.queue_free()

    for i in unit.ap:
        var new_point = point_scene.instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])
        unit.get_node("UnitUI/PointBar/APBox").add_child(new_point)
    unit.max_ap = unit.ap

func update_unit_pp(unit):
    for i in unit.get_node("UnitUI/PointBar/PPBox").get_children():
        i.queue_free()

    for i in unit.pp:
            var new_point = point_scene.instantiate()
            new_point.get_node("PointColor").color = Color(poke_types.colors["pp"])
            unit.get_node("UnitUI/PointBar/PPBox").add_child(new_point)

func spawn_unit(poke_dict, team_position, team_slot):
    var new_unit = unit_scene.instantiate()
    setup_unit(new_unit, poke_dict)
    new_unit.team_slot = team_slot + 1

    new_unit.position = battle_positions[team_position][team_slot]
    new_unit.update_home_coords()
    get_node("UnitField").add_child(new_unit)

    units_in_play.append(new_unit)


    if team_position == 1:
        new_unit.team = 2
        new_unit.get_node("Sprite").scale.x = -1
        new_unit.get_node("Card").scale.x = -1


    if team_position == 0:
        player_team[team_slot] = new_unit
    else:
        enemy_team[team_slot] = new_unit
        new_unit.get_node("Card/CardSprite").position = Vector2(160, 14)

        unit_post_setup(new_unit)



    var tween = get_tree().create_tween()
    tween.tween_property(new_unit.get_node("Card/CardSprite"), "position", Vector2(0, 14), 0.3)
    new_unit.get_node("AnimationPlayer").play("ot_spawn")
    await new_unit.get_node("AnimationPlayer").animation_finished
    new_unit.get_node("AnimationPlayer").play("RESET")

func ref_setup_team(team, team_position):
    var cont = 0
    for i in team:

        if i == null:
            cont += 1
            continue

        var new_unit = unit_scene.instantiate()
        ref_setup_unit(new_unit, pkmn.dex[i])
        new_unit.team_slot = cont + 1

        new_unit.position = battle_positions[team_position][cont]
        new_unit.update_home_coords()
        get_node("UnitField").add_child(new_unit)

        units_in_play.append(new_unit)


        if team_position == 1:
            new_unit.team = 2
            new_unit.get_node("Sprite").scale.x = -1
            new_unit.get_node("Card").scale.x = -1


        if team_position == 0:
            player_team[team.find(i)] = new_unit
            player_team_ref[team.find(i)] = null
        else:
            enemy_team[team.find(i)] = new_unit
            enemy_team_ref[team.find(i)] = null

        cont += 1

func ref_setup_unit(unit, dex_data):


    unit.unit_name = dex_data["name"]
    unit.sprite = dex_data["sprite"]
    unit.color = dex_data["color"]
    unit.rarity = dex_data["rarity"]

    unit.ap = dex_data["ap"]
    unit.pp = dex_data["pp"]

    unit.health = dex_data["health"]
    unit.power = dex_data["power"]
    unit.speed = dex_data["speed"]

    unit.unit_trait = dex_data["trait"]

    unit.atk1 = dex_data["slot1"][0]
    unit.passive = dex_data["slot2"][0]
    unit.atk2 = dex_data["slot3"][0]

    unit.selected_attack = unit.atk1

    unit.max_hp = float(unit.health * 2)
    unit.cur_hp = float(unit.max_hp)


    var _ref_sprite: Sprite2D = unit.get_node("Sprite/Sprite2D")
    var _ref_species: String = dex_data["name"].to_lower()
    if sprite_loader.get_id(_ref_species) != -1:
        sprite_loader.apply_to_sprite_by_name(_ref_sprite, _ref_species)
    else:
        _ref_sprite.frame = unit.sprite
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))

    unit.get_node("Card/CardSprite").modulate = Color(poke_types.colors[unit.color][0])
    unit.get_node("Card/CardSprite2").modulate = Color(poke_types.colors[unit.color][0])

    var direction = 1
    if unit.team == 2: direction = -1
    unit.get_node("Card/CardSprite").frame = 0
    unit.get_node("Card/CardSprite").position = Vector2(160 * direction, 14)








    for i in unit.ap:
        var new_point = point_scene.instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])
        unit.get_node("UnitUI/PointBar/APBox").add_child(new_point)

    for i in unit.pp:
        var new_point = point_scene.instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["pp"])
        unit.get_node("UnitUI/PointBar/PPBox").add_child(new_point)

    setup_attack_data(unit, unit.atk1, 1)
    setup_attack_data(unit, unit.atk2, 2)

    effects_in_play[moves.passive[unit.passive]["trigger"]].append([unit, moves.passive[unit.passive]["effect"]])

func animate_unit_spawns():
    units_in_play.shuffle()
    var mewtwo_node = null
    for i in units_in_play:
        if globals.versus_mewtwo and i.unit_name == "Mewtwo":
            mewtwo_node = i
            continue

        var tween = get_tree().create_tween()
        tween.tween_property(i.get_node("Card/CardSprite"), "position", Vector2(0, 14), 0.3)

        i.get_node("AnimationPlayer").play("ot_spawn")
        await wait(0.1)

    await wait(1.4)
    for i in units_in_play:
        i.get_node("AnimationPlayer").play("RESET")

    if mewtwo_node != null:
        await wait(1)
        mewtwo_node.player.play_backwards("ot_teleport")
        await wait(0.1)
        mewtwo_node.get_node("UnitUI").visible = false
        mewtwo_node.visible = true

        await mewtwo_node.player.animation_finished
        mewtwo_node.get_node("AnimationPlayer").play("RESET")
        mewtwo_node.get_node("UnitUI").visible = true
        await wait(1)







func setup_team_formation():
    if globals.test_mode: return
    if globals.mewtwo_mode:
        setup_mewtwo_mode()

    globals.ui.setup_party_menu()
    globals.ui.update_battle_options()
    await wait(0.01)
    party_selector.position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
    globals.ui.update_status(globals.player_data.player_box[party_index])

    globals.ui.get_node("Status/Party/Options/StartBattle").show()
    globals.ui.get_node("Status/Party/Options/BG3").show()

    var battle_player
    if globals.normal_mode or globals.LC_mode:
        battle_player = globals.hotel.get_node("BattlePlayer")
    else:
        battle_player = get_node("../BattlePlayer")

    var speed = 0.3

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(battle_player, "volume_linear", 0.07 * globals.options["bgm_volume"], 0.5)
    tween.tween_property($Stage, "position", Vector2(496, 469), speed)
    tween.tween_property($UnitField, "position", Vector2(-260, -48), speed)
    tween.tween_property(globals.ui.party_menu, "position", Vector2(-588, 0), speed)
    tween.tween_property(globals.ui.get_node("Status/Party/Options"), "position", Vector2(0, 0), speed)
    tween.tween_property(globals.ui.status_menu, "position", Vector2(298, 0), speed)
    if globals.bf_mode:
        tween.tween_property(globals.ui.get_node("Status/Party/Options/BFOptions"), "position", Vector2(290, 0), speed)

    await wait(speed)
    globals.ui.party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in globals.ui.party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2
    globals.ui.get_node("Status/Party/Options/AutoBattle").z_index = 2
    globals.ui.get_node("Status/Party/Options/PreBattle").z_index = 2
    globals.ui.get_node("Status/Party/Options/StartBattle").z_index = 2
    if globals.bf_mode:
        globals.ui.get_node("Status/Party/Options/BFOptions/Shop").z_index = 2
        globals.ui.get_node("Status/Party/Options/BFOptions/ItemShop").z_index = 2
        globals.ui.get_node("Status/Party/Options/BFOptions/Quit").z_index = 2

    menu_state = party

func setup_mewtwo_mode():
    globals.player_data.player_box = []
    globals.player_data.player_party = globals.player_data.enemy_party.duplicate()

    for i in globals.player_data.player_party:
        if i != null:
            i["bonus_speed"] += 1
            globals.player_data.player_box.append(i)

func party_input():
    if Input.is_action_just_pressed("Accept"):
        if globals.player_data.player_box[party_index] not in globals.player_data.player_party:

                play_accept_SE()
                pick_from_party()
                enable_formation()



    elif Input.is_action_just_pressed("Cancel"):
        play_accept_SE()
        battle_options_index = 2
        await start_battle_options_input()

        return

    elif Input.is_action_just_pressed("Info") or Input.is_action_just_pressed("right"):
        play_accept_SE()
        globals.ui.party_index = party_index
        globals.ui.disable_party()
        menu_state = off

        await wait(0.01)
        globals.ui.displayed_unit = globals.player_data.player_box[party_index]
        globals.ui.enable_status_menu()

        globals.ui.party_menu.get_node("Selector").z_index = 0
        for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
            for k in globals.ui.party_menu.get_node("VList").get_children():
                k.get_node(i).z_index = 0

        while true:
            if Input.is_action_just_pressed("Cancel") or Input.is_action_just_pressed("left"):
                update_party_dicts()




                menu_state = party
                play_cancel_SE()
                globals.ui.party_menu.get_node("Selector").z_index = 1
                for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
                    for k in globals.ui.party_menu.get_node("VList").get_children():
                        k.get_node(i).z_index = 2
                await wait(0.2)
                break


            await wait(0.01)
        if not globals.bf_mode and not globals.versus_mode:
            globals.ui.disable_hint.hide()

    elif Input.is_action_just_pressed("left"):
        play_cursor_SE()
        enable_formation()
        return

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if party_index + 1 < globals.ui.party_menu.get_node("VList").get_children().size():
            party_index += 1
        else:
            battle_options_index = 0
            start_battle_options_input()
            return

        party_selector.position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
        globals.ui.update_status(globals.player_data.player_box[party_index])

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if party_index - 1 >= 0:
            party_index -= 1
        else:
            battle_options_index = 2
            start_battle_options_input()
            return

        party_selector.position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
        globals.ui.update_status(globals.player_data.player_box[party_index])

func update_party_dicts():
    for i in player_team:
        if i == null: continue

        var new_dict = {}
        for k in globals.player_data.player_box:
            if k["id"] == i.unit_dict["id"]:
                new_dict = k
                i.unit_dict = new_dict.duplicate(true)
                break

        setup_unit(i, new_dict, true)

func enable_formation():
    party_selector.hide()
    menu_state = formation
    globals.ui.disable_party()
    update_formation_selector()
    formation_selector.visible = true
    if not pickedup_mon:
        globals.ui.update_status(globals.player_data.player_party[4])

func disable_formation():
    party_selector.show()
    formation_selector.visible = false
    menu_state = party
    party_index = 0
    party_selector.position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
    globals.ui.enable_party()
    formation_position = Vector2(1, 1)
    globals.ui.update_status(globals.player_data.player_box[party_index])

func formation_input():
    if Input.is_action_just_pressed("Accept"):
        if pickedup_mon != null:
            drop_pokemon()
        else:
            pick_from_field()

    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        if pickedup_mon == null:
            cancel_pickup()
            disable_formation()
        else:
            cancel_pickup()
        return

    elif Input.is_action_just_pressed("Info"):
        play_accept_SE()


        menu_state = off
        $UnitField / Selector.hide()
        var column_offset = 0
        if formation_position[1] > 0: column_offset = 3

        await wait(0.01)
        globals.ui.displayed_unit = globals.player_data.player_party[formation_position[0] + column_offset]
        party_index = globals.player_data.player_box.find(globals.ui.displayed_unit)
        globals.ui.party_index = party_index
        globals.ui.enable_status_menu()

        globals.ui.party_menu.get_node("Selector").z_index = 0
        for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
            for k in globals.ui.party_menu.get_node("VList").get_children():
                k.get_node(i).z_index = 0

        while true:
            if Input.is_action_just_pressed("Cancel") or Input.is_action_just_pressed("left"):
                update_party_dicts()

                menu_state = formation
                $UnitField / Selector.show()
                play_cancel_SE()
                globals.ui.party_menu.get_node("Selector").z_index = 1
                for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
                    for k in globals.ui.party_menu.get_node("VList").get_children():
                        k.get_node(i).z_index = 2
                await wait(0.2)
                break

            await wait(0.01)
        if not globals.bf_mode and not globals.versus_mode:
            globals.ui.disable_hint.hide()



    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if formation_position[0] < 2:
            formation_position[0] += 1
        else:
            formation_position[0] = 0
        update_formation_selector()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if formation_position[0] > 0:
            formation_position[0] -= 1
        else:
            formation_position[0] = 2
        update_formation_selector()

    if Input.is_action_just_pressed("left"):
        play_cursor_SE()
        if formation_position[1] > 0:
            formation_position[1] -= 1
        else:
            menu_state = enemy_team_search

            update_enemy_team_selector()
            for i in player_team:
                if i == null: continue
                i.get_node("TargetSelected/Active").visible = false
            return

        update_formation_selector()

    if Input.is_action_just_pressed("right"):
        play_cursor_SE()
        if formation_position[1] == 0:
            formation_position[1] += 1
        else:
            cancel_pickup()
            disable_formation()
            return

        update_formation_selector()

func update_formation_selector():
    var column_offset = 0
    if formation_position[1] > 0: column_offset = 3

    formation_selector.position = battle_positions[0][formation_position[0] + column_offset]

    for i in player_team:
        if i == null: continue
        i.get_node("TargetSelected/Active").visible = false

    if player_team[formation_position[0] + column_offset] != null:
        player_team[formation_position[0] + column_offset].get_node("TargetSelected/Active").visible = true
        $UnitField / Selector / Shadow.visible = false
    else:
        $UnitField / Selector / Shadow.visible = true

    if not pickedup_mon:
        globals.ui.update_status(globals.player_data.player_party[formation_position[0] + column_offset])

func pick_from_party():
    play_pickup_SE()
    pickedup_mon = globals.player_data.player_box[party_index]
    formation_selector.get_node("Sprite2D/PokeSprite").frame = pickedup_mon["dex"]["sprite"]
    formation_selector.get_node("Sprite2D/PokeSprite").visible = true
    formation_selector.get_node("AnimationPlayer").stop()
    formation_selector.get_node("Sprite2D").frame = 3


func pick_from_field():
    menu_state = off
    var column_offset = 0
    if formation_position[1] > 0: column_offset = 3

    var drop_index = formation_position[0] + column_offset
    formation_selector.get_node("AnimationPlayer").play("catch")

    if player_team[drop_index] == null:
        await formation_selector.get_node("AnimationPlayer").animation_finished
        menu_state = formation
        formation_selector.get_node("AnimationPlayer").play("idle")
        return
    player_team[drop_index].get_node("TargetSelected/Active").visible = false


    await wait(0.3)
    play_pickup_SE()

    pickedup_mon = globals.player_data.player_party[drop_index]
    globals.player_data.player_party[drop_index] = null
    formation_selector.get_node("Sprite2D/PokeSprite").frame = pickedup_mon["dex"]["sprite"]

    if globals.gbc:
        if pickedup_mon["dex"]["name"] == "Blastoise":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 200
        elif pickedup_mon["dex"]["name"] == "Pidgeot":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 201
        elif pickedup_mon["dex"]["name"] == "Alakazam":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 202
        elif pickedup_mon["dex"]["name"] == "Pikachu":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 203
        elif pickedup_mon["dex"]["name"] == "Charizard":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 204
        elif pickedup_mon["dex"]["name"] == "Butterfree":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 205
        elif pickedup_mon["dex"]["name"] == "Lapras":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 206
        elif pickedup_mon["dex"]["name"] == "Snorlax":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 207
        elif pickedup_mon["dex"]["name"] == "Vaporeon":
            formation_selector.get_node("Sprite2D/PokeSprite").frame = 208

    formation_selector.get_node("Sprite2D/PokeSprite").visible = true




    units_in_play.erase(player_team[drop_index])
    player_team[drop_index].queue_free()
    player_team[drop_index] = null

    menu_state = formation

    globals.ui.setup_party_menu()
    globals.ui.party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in globals.ui.party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2



func cancel_pickup():
    for i in player_team:
        if i == null: continue
        i.get_node("TargetSelected/Active").visible = false

    formation_selector.get_node("Sprite2D/PokeSprite").visible = false
    pickedup_mon = null
    formation_selector.get_node("AnimationPlayer").play("idle")

func drop_pokemon():
    menu_state = off
    var column_offset = 0
    if formation_position[1] > 0: column_offset = 3

    var drop_index = formation_position[0] + column_offset

    var swapped_mon = null
    if player_team[drop_index] == null:
        if globals.player_data.player_party.count(null) <= 3:
                play_buzzer_SE()
                menu_state = formation
                return

    else:
        swapped_mon = globals.player_data.player_party[drop_index]
        units_in_play.erase(player_team[drop_index])
        player_team[drop_index].queue_free()

    globals.player_data.player_party[drop_index] = pickedup_mon
    spawn_unit(pickedup_mon, 0, drop_index)
    player_team[drop_index].get_node("AnimationPlayer").speed_scale = 1.5

    formation_selector.get_node("AnimationPlayer").play("drop")
    await wait(0.3)
    play_putdown_SE()

    formation_selector.get_node("Sprite2D/PokeSprite").visible = false
    $UnitField / Selector / Shadow.visible = false
    player_team[drop_index].visible = true

    if swapped_mon != null:




        pickedup_mon = swapped_mon
        formation_selector.get_node("Sprite2D/PokeSprite").frame = swapped_mon["dex"]["sprite"]
        formation_selector.get_node("Sprite2D/PokeSprite").visible = true
    else:
        pickedup_mon = null


    await player_team[drop_index].get_node("AnimationPlayer").animation_finished
    player_team[drop_index].get_node("AnimationPlayer").speed_scale = 1
    player_team[drop_index].get_node("TargetSelected/Active").visible = true

    menu_state = formation
    if swapped_mon == null:
        formation_selector.get_node("AnimationPlayer").play("idle")
    else:
        formation_selector.get_node("Sprite2D").frame = 3
    globals.ui.setup_party_menu()

    globals.ui.party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in globals.ui.party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2



func enemy_team_input():






    if Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        for i in enemy_team:
            if i == null: continue
            i.get_node("TargetSelected/Active").visible = false
        disable_formation()
        return









































    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if formation_position[0] < 2:
            formation_position[0] += 1
        else:
            formation_position[0] = 0
        update_enemy_team_selector()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if formation_position[0] > 0:
            formation_position[0] -= 1
        else:
            formation_position[0] = 2
        update_enemy_team_selector()

    if Input.is_action_just_pressed("left"):
        play_cursor_SE()
        if formation_position[1] == 0:
            formation_position[1] += 1
        update_enemy_team_selector()

    if Input.is_action_just_pressed("right"):
        play_cursor_SE()
        if formation_position[1] > 0:
            formation_position[1] -= 1
        else:
            menu_state = formation

            globals.ui.update_status(globals.player_data.player_box[0])
            update_formation_selector()
            for i in enemy_team:
                if i == null: continue
                i.get_node("TargetSelected/Active").visible = false
            return




        update_enemy_team_selector()

func update_enemy_team_selector():
    var column_offset = 0
    if formation_position[1] > 0: column_offset = 3

    formation_selector.position = battle_positions[1][formation_position[0] + column_offset]

    for i in enemy_team:
        if i == null: continue
        i.get_node("TargetSelected/Active").visible = false

    if enemy_team[formation_position[0] + column_offset] != null:
        enemy_team[formation_position[0] + column_offset].get_node("TargetSelected/Active").visible = true
        $UnitField / Selector / Shadow.visible = false
    else:
        $UnitField / Selector / Shadow.visible = true


    if enemy_team[formation_position[0] + column_offset] != null:
        globals.ui.update_status(enemy_team[formation_position[0] + column_offset].unit_dict)





func start_battle_options_input():
    menu_state = off
    await wait(0.01)
    menu_state = battle_options
    select_battle_option()

func battle_options_input():
    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        if battle_options_index == 0:
            set_auto_battle()
        elif battle_options_index == 1:
            set_pre_battle()
        elif battle_options_index == 2:
            end_formation()


    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        battle_options_index = 2
        select_battle_option()





    elif Input.is_action_just_pressed("left"):
        play_cursor_SE()
        enable_formation()
        return

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if battle_options_index == 0:
            party_index = globals.ui.party_menu.get_node("VList").get_children().size() - 1
            globals.ui.party_menu.get_node("Selector").position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
            globals.ui.update_status(globals.player_data.player_box[party_index])
            menu_state = party

        elif battle_options_index == 1:
            battle_options_index = 0
            select_battle_option()

        elif battle_options_index == 2:
            battle_options_index = 1
            select_battle_option()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if battle_options_index == 0:
            battle_options_index = 1
            select_battle_option()

        elif battle_options_index == 1:
            battle_options_index = 2
            select_battle_option()

        elif battle_options_index == 2:
            party_index = 0
            globals.ui.party_menu.get_node("Selector").position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
            globals.ui.update_status(globals.player_data.player_box[party_index])
            menu_state = party

    elif Input.is_action_just_pressed("right"):
        if globals.bf_mode:
            play_cursor_SE()
            enable_bf_options_input()

func select_battle_option():
    if battle_options_index == 0:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/AutoBattle").position.y

    elif battle_options_index == 1:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/PreBattle").position.y

    elif battle_options_index == 2:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/StartBattle").position.y

func set_auto_battle():
    if globals.auto_battle:
        globals.ui.get_node("Status/Party/Options/AutoBattle").text = "Auto Battle: [color=999999]OFF[/color]"
        globals.auto_battle = false
    else:
        globals.ui.get_node("Status/Party/Options/AutoBattle").text = "Auto Battle: [color=379dab]ON[/color]"
        globals.auto_battle = true

func set_pre_battle():
    if globals.pre_battle_formation:
        globals.ui.get_node("Status/Party/Options/PreBattle").text = "Pre-Battle: [color=999999]OFF[/color]"
        globals.pre_battle_formation = false
    else:
        globals.ui.get_node("Status/Party/Options/PreBattle").text = "Pre-Battle: [color=379dab]FORMATION[/color]"
        globals.pre_battle_formation = true

func enable_bf_options_input():
    globals.ui.party_menu.get_node("Selector").position.x += 290
    menu_state = off
    await wait(0.01)
    menu_state = bf_options
    select_bf_option()

func select_bf_option():
    if battle_options_index == 0:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/BFOptions/Shop").position.y

    elif battle_options_index == 1:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/BFOptions/ItemShop").position.y

    elif battle_options_index == 2:
        globals.ui.party_menu.get_node("Selector").position.y = globals.ui.get_node("Status/Party/Options/BFOptions/Quit").position.y

func bf_options_input():
    if Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        if battle_options_index == 0:
            bf_show_shop()
            return

        elif battle_options_index == 1:
            bf_show_item_shop()
            return

        elif battle_options_index == 2:
            await bf_quit_game()
            return

    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        battle_options_index = 2
        menu_state = battle_options
        select_battle_option()
        globals.ui.party_menu.get_node("Selector").position.x -= 290





    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if battle_options_index == 0:
            globals.ui.party_menu.get_node("Selector").position.x -= 290
            party_index = globals.ui.party_menu.get_node("VList").get_children().size() - 1
            globals.ui.party_menu.get_node("Selector").position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
            globals.ui.update_status(globals.player_data.player_box[party_index])
            menu_state = party
        elif battle_options_index == 1:
            battle_options_index = 0
            select_bf_option()
        elif battle_options_index == 2:
            battle_options_index = 1
            select_bf_option()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if battle_options_index == 0:
            battle_options_index = 1
            select_bf_option()
        elif battle_options_index == 2:
            globals.ui.party_menu.get_node("Selector").position.x -= 290
            party_index = 0
            globals.ui.party_menu.get_node("Selector").position.y = globals.ui.party_menu.get_node("VList").get_child(party_index).position.y + 108
            globals.ui.update_status(globals.player_data.player_box[party_index])
            menu_state = party
        elif battle_options_index == 1:
            battle_options_index = 2
            select_bf_option()

    elif Input.is_action_just_pressed("left"):
        play_cursor_SE()
        globals.ui.party_menu.get_node("Selector").position.x -= 290
        start_battle_options_input()

func bf_show_shop():
    menu_state = off
    globals.ui.show_card_shop()
    await wait(0.1)






func bf_hide_shop():
    var speed = 0.2
    globals.ui.hide_card_shop()
    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(globals.ui.party_menu, "position", Vector2(-588, 0), speed)
    tween.tween_property(globals.ui.get_node("Status/Party/Options"), "position", Vector2(0, 0), speed)
    tween.tween_property(globals.ui.status_menu, "position", Vector2(298, 0), speed)
    if globals.bf_mode:
        tween.tween_property(globals.ui.get_node("Status/Party/Options/BFOptions"), "position", Vector2(290, 0), speed)
    await tween.finished
    globals.ui.party_menu.get_node("Selector").z_index = 1
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in globals.ui.party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 2
    select_bf_option()
    menu_state = bf_options

func bf_booster_pull(booster_index):
    var colors = ["red", "blue", "green", "yellow", "white", "black"]
    var pulling_pool1 = []
    var pulling_pool2 = []
    var pulling_pool3 = []
    var pulling_pool4 = []
    var pulling_pool5 = []
    for i in pkmn.dex:
        if i in pkmn.booster_excluded: continue
        if pkmn.dex[i]["color"] == colors[booster_index]:
            if pkmn.dex[i]["rarity"] == 1:
                pulling_pool1.append(i)
            elif pkmn.dex[i]["rarity"] == 2:
                pulling_pool2.append(i)
            elif pkmn.dex[i]["rarity"] == 3:
                pulling_pool3.append(i)
            elif pkmn.dex[i]["rarity"] == 4:
                pulling_pool4.append(i)
            elif pkmn.dex[i]["rarity"] == 5:
                pulling_pool5.append(i)

    pulling_pool1.shuffle()
    pulling_pool2.shuffle()
    pulling_pool3.shuffle()
    pulling_pool4.shuffle()
    pulling_pool5.shuffle()
    var pulled_mon

    var rng = randi_range(1, 100)

    var common_pull = 80
    var uncommon_pull = 95
    var rare_pull = 100
    var super_pull = 0
    var shiny_pull = 0

    if shiny_pull: pass

    if bf_level == 0:
        common_pull = 75
        uncommon_pull = 98
        rare_pull = 99
        super_pull = 0
        shiny_pull = 100

    elif bf_level == 1:
        common_pull = 65
        uncommon_pull = 95
        rare_pull = 98
        super_pull = 99
        shiny_pull = 100

    elif bf_level == 2:
        common_pull = 20
        uncommon_pull = 88
        rare_pull = 98
        super_pull = 99
        shiny_pull = 100


    else:
        common_pull = 5
        uncommon_pull = 80
        rare_pull = 96
        super_pull = 99
        shiny_pull = 100


    if rng <= common_pull:
        pulled_mon = pulling_pool1[0]
    elif rng <= uncommon_pull:
        pulled_mon = pulling_pool2[0]
    elif rng <= rare_pull:
        pulled_mon = pulling_pool3[0]
    elif rng <= super_pull:
        if pulling_pool4:
            pulled_mon = pulling_pool4[0]
        else:
            pulled_mon = pulling_pool3[-1]
    else:
        if pulling_pool5:
            pulled_mon = pulling_pool5[0]
        else:
            pulled_mon = pulling_pool3[-1]

    var booster_level

    if bf_level == 0:
        booster_level = 1 + randi_range(0, 2)
    elif bf_level == 1:
        booster_level = 4 + randi_range(-1, 2)
    else:
        booster_level = 6 + randi_range(-1, 2)

    if booster_level < 1: booster_level = 1
    elif booster_level > 9: booster_level = 9

    return globals.generate_pokemon(pulled_mon, booster_level)

func generate_bf_shop_cards():
    globals.ui.bf_shop_stock = []

    var colors = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]
    var indexes = range(11)
    indexes.shuffle()
    var cont = 0
    for i in range(6):
        globals.ui.bf_shop_stock.append(bf_booster_pull(colors[indexes[cont]]))
        cont += 1

    globals.ui.setup_shop()

func bf_show_item_shop():
    menu_state = off
    await wait(0.01)
    globals.ui.show_item_shop()

    while globals.ui.state != globals.ui.off:
        await wait(0.01)
    await wait(0.1)
    update_party_dicts()
    menu_state = bf_options



@onready var quit_confirm_menu
@onready var quit_confirm_buttons
@onready var quit_confirm_selector

func bf_quit_game():
    menu_state = off
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(quit_confirm_menu, "modulate", Color("#ffffff"), 0.1)
    tween.tween_property($"../ScreenTint", "color", Color("00000064"), 0.1)
    await tween.finished
    await wait(0.1)

    var quit_input_index = 1
    while true:
        if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
            play_cursor_SE()
            if quit_input_index == 0:
                quit_input_index = 1
                quit_confirm_selector.position = Vector2(772, 369)
            else:
                quit_input_index = 0
                quit_confirm_selector.position = Vector2(580, 369)



        elif Input.is_action_just_pressed("Accept"):
            play_accept_SE()
            if quit_input_index == 0:
                globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))
            else:
                break

        elif Input.is_action_just_pressed("Cancel"):
            play_cancel_SE()
            break
        await wait(0.01)

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(quit_confirm_menu, "modulate", Color("#ffffff00"), 0.1)
    tween.tween_property($"../ScreenTint", "color", Color("#20202000"), 0.1)
    await tween.finished

    menu_state = bf_options





func end_formation():
    globals.ui.party_index = 0
    menu_state = off

    globals.ui.party_menu.get_node("Selector").z_index = 0
    for i in ["Label", "Level", "Sprite", "ColorBorder", "Color"]:
        for k in globals.ui.party_menu.get_node("VList").get_children():
            k.get_node(i).z_index = 0

    globals.ui.get_node("Status/Party/Options/AutoBattle").z_index = 0
    globals.ui.get_node("Status/Party/Options/PreBattle").z_index = 0
    globals.ui.get_node("Status/Party/Options/StartBattle").z_index = 0
    if globals.bf_mode:
        globals.ui.get_node("Status/Party/Options/BFOptions/Shop").z_index = 0
        globals.ui.get_node("Status/Party/Options/BFOptions/ItemShop").z_index = 0
        globals.ui.get_node("Status/Party/Options/BFOptions/Quit").z_index = 0

    var battle_player
    if globals.normal_mode or globals.LC_mode:
        battle_player = globals.hotel.get_node("BattlePlayer")
    else:
        battle_player = get_node("../BattlePlayer")

    var speed = 0.2
    party_selector.position.y = globals.ui.party_menu.get_node("VList").get_child(0).position.y + 108
    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(battle_player, "volume_linear", 0.177 * globals.options["bgm_volume"], speed)
    tween.tween_property($Stage, "position", Vector2(756, 469), speed)
    tween.tween_property($UnitField, "position", Vector2(0, -48), speed)
    tween.tween_property(globals.ui.party_menu, "position", Vector2(-298, 0), speed)
    tween.tween_property(globals.ui.status_menu, "position", Vector2(596, 0), speed)
    tween.tween_property(globals.ui.get_node("Status/Party/Options"), "position", Vector2(0, -144), speed)
    if globals.bf_mode:
        tween.tween_property(globals.ui.get_node("Status/Party/Options/BFOptions"), "position", Vector2(0, 0), speed)
    await wait(speed * 1.5)

    globals.ui.get_node("Status/Party/Options/StartBattle").hide()
    globals.ui.get_node("Status/Party/Options/BG3").hide()
    battle_start()











var battle_start_effect_memory = []
func battle_start():
    if not globals.test_mode:
        globals.ui.toggle_hint()

    if globals.versus_mewtwo:
        await mewtwo_event()

    if not globals.test_mode and (globals.normal_mode or globals.LC_mode) and globals.enemy.npc_name == "Demi-Fiend":
        await demi_fiend_battle()

    for i in units_in_play:
        unit_post_setup(i)

    enemy_team_copy = enemy_team.duplicate()
    player_team_copy = player_team.duplicate()



    if player_team == [null, null, null, null, null, null] or enemy_team == [null, null, null, null, null, null]:
        end_battle()
        return


    for i in units_in_play:
        if i not in battle_start_effect_memory:
            await trigger_effects(i, "on_battle_start")
        battle_start_effect_memory.append(i)


    sort_by_speed(units_in_play)

    start_unit_turn(units_in_play[0])

func start_unit_turn(unit):
    reset_temp_buffs()
    current_target_unit = []

    if not unit.waiting:
        await trigger_effects(unit, "on_turn_start")
        if unit.cur_hp <= 0:
            current_act_unit = unit
            end_unit_turn()
            return

    unit.waiting = false

    current_act_unit = unit
    if unit.ap < 1 or unit.skip_turn:
        if unit.skip_turn:
            unit.skip_turn = false
            show_action_name(unit, "Turn Skipped")
            await wait(1)
            hide_action_name(unit)
            await wait(0.3)

        end_unit_turn()
        return

    unit.get_node("TargetSelected").get_node("Active").visible = true

    unit.selected_attack = unit.box1.get_meta("move_name")

    if (unit.team == 1 and not unit.auto_battle) or globals.versus_mode:
        await show_unit_ui(unit)
        player_input()

    else:
        play_ai_turn(unit)

func setup_attack_data(unit, move, slot):
    var atk_color
    var atk_color_name
    var attack_data = moves.active[move]
    var slot_number = "AttackInfo1"

    if slot == 2:
        slot_number = "AttackInfo2"
        unit.get_node("InputUI").get_node(slot_number).modulate = Color("#4d4d4d")

    if moves.active[move]["color"] != "none":
        atk_color = poke_types.colors[moves.active[move]["color"]]
        atk_color_name = moves.active[move]["color"]
    else:
        atk_color = poke_types.colors[unit.color]
        atk_color_name = unit.color

    unit.get_node("InputUI").get_node(slot_number).set_meta("move_name", move)




    unit.get_node("InputUI").get_node(slot_number).get_node("ColorBorder").modulate = Color(atk_color[0])
    unit.get_node("InputUI").get_node(slot_number).get_node("BG/CardTexture").modulate = Color(atk_color[3])

    unit.get_node("InputUI").get_node(slot_number).get_node("ColorSprite").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([atk_color_name]))

    unit.get_node("InputUI").get_node(slot_number).get_node("AtkNameLabel").text = attack_data["name"]

    unit.get_node("InputUI").get_node(slot_number).get_node("AtkNameLabel").scale.x = 1

    for i in range(attack_data["name"].length() - 12):
        unit.get_node("InputUI").get_node(slot_number).get_node("AtkNameLabel").scale.x -= 0.1

    var attack_desc: String = attack_data["desc"]
    attack_desc = attack_desc.insert(0, "[color=%s]" % poke_types.colors[atk_color_name][0].erase(poke_types.colors[atk_color_name][0].find("#")))
    attack_desc = attack_desc.insert(attack_desc.find(" - "), "[/color]")

    unit.get_node("InputUI").get_node(slot_number).get_node("AtkInfoLabel").text = attack_desc.format([attack_data["power"]])

    var cost_container = unit.get_node("InputUI").get_node(slot_number).get_node("CostContainer")

    for i in cost_container.get_children():
        i.queue_free()

    for i in range(attack_data["cost"]):
        var new_point = load("res://Files/Scenes/Battle/PointUnit.tscn").instantiate()
        new_point.get_node("PointColor").color = Color(poke_types.colors["ap"])
        cost_container.add_child(new_point)

func show_unit_ui(unit):


    unit.box1.scale = Vector2(0, 1)
    unit.box2.scale = Vector2(0, 1)

    unit.box1.position = Vector2(-10, 0)
    unit.box2.position = Vector2(-10, 0)

    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/Battle/GUI naming tab swap start.mp3")
    gui_player.play()

    unit.get_node("InputUI").visible = true

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.box1, "scale", Vector2(1, 1), 0.14)
    tween.tween_property(unit.box2, "scale", Vector2(1, 1), 0.14)

    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.box1, "position", Vector2(0, 0), 0.2)
    tween2.tween_property(unit.box2, "position", Vector2(0, 0), 0.2)

    await wait(0.24)

    unit.get_node("UnitUI/PointBar/APBox").visible = true

    tween = get_tree().create_tween()
    tween.tween_property(unit.box2, "position", Vector2(32, 8), 0.14)
    await wait(0.14)
    ap_cost_preview()

func hide_unit_ui(unit, blink = true):


    var tween = get_tree().create_tween()
    tween.tween_property(unit.box2, "position", Vector2(0, 0), 0.1)

    if blink:
        blink_unit_ui(unit)
        await wait(0.14)

    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.box1, "scale", Vector2(0, 1), 0.14)
    tween.tween_property(unit.box2, "scale", Vector2(0, 1), 0.14)

    await wait(0.14)

    unit.get_node("InputUI").visible = false

func blink_unit_ui(unit):
    if unit.auto_battle: return

    for i in range(2):
        unit.box1.get_node("BlinkBox").color = Color("#ffffff80")
        await wait(0.06)
        unit.box1.get_node("BlinkBox").color = Color("#ffffff00")
        await wait(0.06)

func ap_cost_preview():
    if current_act_unit == null: return
    stop_ap_cost_preview()

    if moves.active[current_act_unit.selected_attack]["cost"] <= current_act_unit.ap:
        var cont = 1
        for i in range(moves.active[current_act_unit.selected_attack]["cost"]):
            current_act_unit.get_node("UnitUI/PointBar/APBox").get_child(cont * -1 - (current_act_unit.max_ap - current_act_unit.ap)).get_node("AnimationPlayer").play("shine")
            cont += 1
    else:
        for i in current_act_unit.get_node("UnitUI/PointBar/APBox").get_children():
            i.get_node("AnimationPlayer").play("missing")

func stop_ap_cost_preview():
    if current_act_unit == null: return
    for i in current_act_unit.get_node("UnitUI/PointBar/APBox").get_children():
        i.get_node("AnimationPlayer").play("RESET")

func switch_attack_ui(unit):
    stop_ap_cost_preview()
    if unit.selected_attack == unit.atk1:
        unit.selected_attack = unit.atk2
    else:
        unit.selected_attack = unit.atk1

    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/Battle/GUI naming tab swap start.mp3")
    gui_player.play()


    var speed = 0.1

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.box1, "position", Vector2(-40, 8), speed)
    tween.tween_property(unit.box2, "position", Vector2(80, 0), speed)

    tween.tween_property(unit.box1, "modulate", Color("#4d4d4d"), speed * 2)
    tween.tween_property(unit.box2, "modulate", Color("#ffffff"), speed * 2)

    await wait(speed / 2)
    unit.box1.z_index = 11
    unit.box2.z_index = 12
    await wait(speed / 2)

    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.box1, "position", Vector2(32, 8), speed)
    tween.tween_property(unit.box2, "position", Vector2(0, 0), speed)

    await wait(speed / 2)
    var aux = unit.box1
    unit.box1 = unit.box2
    unit.box2 = aux
    ap_cost_preview()

func player_input():
    while true:
        if Input.is_action_pressed("Accept"):
            play_accept_SE()
            await hide_unit_ui(current_act_unit)
            player_select_target(current_act_unit.selected_attack)
            break

        elif Input.is_action_just_pressed("Cancel"):
            play_accept_SE()
            unit_wait(current_act_unit)
            break

        elif Input.is_action_pressed("Info"):
            play_accept_SE()
            hide_unit_ui(current_act_unit, false)
            unit_search()
            while true:
                if Input.is_action_pressed("Cancel"):
                    play_cancel_SE()
                    break
                await wait(0.01)
            await wait(0.1)
            show_unit_ui(current_act_unit)

        elif Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
            play_cursor_SE()
            await switch_attack_ui(current_act_unit)

        await wait(0.01)

func unit_search():



    search_index = units_in_play.find(current_act_unit)
    target_unit(units_in_play[search_index])
    update_searchbox()
    show_searchbox()

    while true:
        if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up"):
            units_in_play[search_index].get_node("UnitUI/PointBar/APBox").visible = false
            untarget_unit(units_in_play[search_index])
            if search_index + 1 < units_in_play.size():
                search_index += 1
            else:
                search_index = 0
            target_unit(units_in_play[search_index])
            update_searchbox()

        elif Input.is_action_just_pressed("left") or Input.is_action_just_pressed("down"):
            units_in_play[search_index].get_node("UnitUI/PointBar/APBox").visible = false
            untarget_unit(units_in_play[search_index])
            if search_index - 1 >= 0:
                search_index -= 1
            else:
                search_index = units_in_play.size() - 1
            target_unit(units_in_play[search_index])
            update_searchbox()

        elif Input.is_action_just_pressed("Cancel"):
            untarget_unit(units_in_play[search_index])
            units_in_play[search_index].get_node("UnitUI/PointBar/APBox").visible = false
            hide_searchbox()
            break

        await wait(0.01)

func update_searchbox():
    var unit = units_in_play[search_index]
    unit.get_node("UnitUI/PointBar/APBox").visible = true
    $Searchbox.position = unit.position

    $Searchbox / Stats / Name.text = unit.unit_name

    var name_node = $Searchbox / Stats / Name
    name_node.scale.x = 1
    name_node.text = pkmn.dex[unit.unit_dict["species"]]["name"]
    if name_node.text.length() > 10:
        for k in range(name_node.text.length() - 10):
            name_node.scale.x -= 0.02


    $Searchbox / Slot1.text = moves.active[unit.unit_dict["dex"]["slot1"][unit.unit_dict["slot1_selected"]]]["name"]
    $Searchbox / Slot2.text = moves.passive[unit.unit_dict["dex"]["slot2"][unit.unit_dict["slot2_selected"]]]["name"]
    $Searchbox / Slot3.text = moves.active[unit.unit_dict["dex"]["slot3"][unit.unit_dict["slot3_selected"]]]["name"]

    var unit_health = globals.level_scale(pkmn.dex[unit.unit_dict["species"]]["health"], unit.unit_dict["lv"]) + unit.unit_dict["bonus_health"]
    var unit_power = globals.level_scale(pkmn.dex[unit.unit_dict["species"]]["power"], unit.unit_dict["lv"]) + unit.unit_dict["bonus_power"]
    var unit_speed = globals.level_scale(pkmn.dex[unit.unit_dict["species"]]["speed"], unit.unit_dict["lv"]) + unit.unit_dict["bonus_speed"]

    $Searchbox / Stats / Statbox / HP.text = "hp: {0}".format([unit_health])
    $Searchbox / Stats / Statbox / ATK.text = "atk: {0}".format([unit_power])
    $Searchbox / Stats / Statbox / SPD.text = "spd: {0}".format([unit_speed])

    var tween = get_tree().create_tween().set_parallel(true)

    tween.tween_property($Searchbox / Stats / Statbox / Bars / HealthBar, "scale", Vector2(float(unit_health) / 100, 1), 0.1)
    tween.tween_property($Searchbox / Stats / Statbox / Bars / ATKBar, "scale", Vector2(float(unit_power) / 100, 1), 0.1)
    tween.tween_property($Searchbox / Stats / Statbox / Bars / SPDBar, "scale", Vector2(float(unit_speed) / 100, 1), 0.1)

func show_searchbox():
    $Searchbox.scale.x = 0
    $Searchbox.visible = true
    var tween = get_tree().create_tween()
    tween.tween_property($Searchbox, "scale", Vector2(1, 1), 0.2)

func hide_searchbox():
    var tween = get_tree().create_tween()
    tween.tween_property($Searchbox, "scale", Vector2(0, 1), 0.2)
    await wait(0.2)
    $Searchbox.visible = false

func player_select_target(action):
    var attack = moves.active[action]
    var selector_index
    var targeted_back = false
    var target_team = enemy_team
    var own_team = player_team
    if current_act_unit.team != 1:
        target_team = player_team
        own_team = enemy_team

    if attack.target == "single":
        var targetable_slots = target_team.slice(0, 3)
        var front_row_inv = front_row_invulnerable(targetable_slots)


        if targetable_slots == [null, null, null] or front_row_inv:
            targetable_slots = target_team.slice(3, 6)
            targeted_back = true

        show_targetable_units(targetable_slots)


        if (current_act_unit.team_slot < 4 and target_team[current_act_unit.team_slot - 1] != null) and not front_row_inv:
            target_unit(target_team[current_act_unit.team_slot - 1])
            selector_index = target_team[current_act_unit.team_slot - 1].team_slot


        else:
            for i in targetable_slots:
                if i != null:
                    target_unit(i)
                    selector_index = i.team_slot
                    break


        selector_index -= 1
        if targeted_back: selector_index -= 3
        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                await cancel_aiming()
                return

            if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left"):
                untarget_unit(targetable_slots[selector_index])
                selector_index -= 1


                if selector_index < 0: selector_index = targetable_slots.size() - 1


                for i in range(2):
                    if targetable_slots[selector_index] == null:
                        selector_index -= 1
                        if selector_index < 0: selector_index = targetable_slots.size() - 1
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("right"):
                untarget_unit(targetable_slots[selector_index])
                selector_index += 1


                if selector_index > targetable_slots.size() - 1: selector_index = 0


                for i in range(2):
                    if targetable_slots[selector_index] == null:
                        selector_index += 1
                        if selector_index > targetable_slots.size() - 1: selector_index = 0
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            await wait(0.01)


        current_target_unit = [targetable_slots[selector_index]]
        confirm_aiming()

    if attack.target == "column":
        var targetable_slots = target_team.slice(0, 3)

        var front_row_inv = front_row_invulnerable(targetable_slots)


        if targetable_slots == [null, null, null] or front_row_inv:
            targetable_slots = target_team.slice(3, 6)
            targeted_back = true

        show_targetable_units(targetable_slots)


        if (current_act_unit.team_slot < 4 and target_team[current_act_unit.team_slot - 1] != null) and not front_row_inv:
            target_unit(target_team[current_act_unit.team_slot - 1])
            selector_index = target_team[current_act_unit.team_slot - 1].team_slot


            if not targeted_back and target_team[current_act_unit.team_slot - 4] != null: target_unit(target_team[current_act_unit.team_slot - 4])


        else:
            for i in targetable_slots:
                if i != null:
                    target_unit(i)
                    selector_index = i.team_slot


                    if not targeted_back and target_team[i.team_slot - 4] != null: target_unit(target_team[i.team_slot - 4])
                    break


        selector_index -= 1
        if targeted_back: selector_index -= 3
        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                await cancel_aiming()
                return

            if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                if not targeted_back and target_team[selector_index - 3] != null: untarget_unit(target_team[selector_index - 3])
                selector_index -= 1


                if selector_index < 0: selector_index = targetable_slots.size() - 1


                for i in range(2):
                    if targetable_slots[selector_index] == null:
                        selector_index -= 1
                        if selector_index < 0: selector_index = targetable_slots.size() - 1
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])
                if not targeted_back and target_team[selector_index - 3] != null: target_unit(target_team[selector_index - 3])

            if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("right"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                if not targeted_back and target_team[selector_index - 3] != null: untarget_unit(target_team[selector_index - 3])
                selector_index += 1


                if selector_index > targetable_slots.size() - 1: selector_index = 0


                for i in range(2):
                    if targetable_slots[selector_index] == null:
                        selector_index += 1
                        if selector_index > targetable_slots.size() - 1: selector_index = 0
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])
                if not targeted_back and target_team[selector_index - 3] != null: target_unit(target_team[selector_index - 3])

            await wait(0.01)


        current_target_unit = [targetable_slots[selector_index]]
        if not targeted_back and target_team[selector_index - 3] != null: current_target_unit.append(target_team[selector_index - 3])
        play_accept_SE()
        confirm_aiming()

    if attack.target == "any":
        var targetable_slots = target_team.slice(0, 6)







        show_targetable_units(targetable_slots)


        if (current_act_unit.team_slot < 4 and target_team[current_act_unit.team_slot - 1] != null):
            target_unit(target_team[current_act_unit.team_slot - 1])
            selector_index = target_team[current_act_unit.team_slot - 1].team_slot


        else:
            for i in targetable_slots:
                if i != null:
                    target_unit(i)
                    selector_index = i.team_slot
                    break


        selector_index -= 1
        if targeted_back: selector_index -= 3
        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                await cancel_aiming()
                return

            if Input.is_action_just_pressed("up"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index -= 1


                if selector_index < 0: selector_index = targetable_slots.size() - 1


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index -= 1
                        if selector_index < 0: selector_index = targetable_slots.size() - 1
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("down"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index += 1


                if selector_index > targetable_slots.size() - 1: selector_index = 0


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index += 1
                        if selector_index > targetable_slots.size() - 1: selector_index = 0
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                var prev_index = selector_index

                if selector_index in [0, 1, 2]:
                    selector_index += 3
                else:
                    selector_index -= 3

                if targetable_slots[selector_index] == null: selector_index = prev_index

                target_unit(targetable_slots[selector_index])

            await wait(0.01)


        current_target_unit = [targetable_slots[selector_index]]
        play_accept_SE()
        confirm_aiming()

    if attack.target == "row":
        var targetable_slots = target_team.slice(0, 3)
        var front_row_inv = front_row_invulnerable(targetable_slots)


        if targetable_slots == [null, null, null] or front_row_inv:
            targetable_slots = target_team.slice(3, 6)
            targeted_back = true

        current_target_unit = []
        for i in targetable_slots:
            if i == null: continue
            target_unit(i)
            current_target_unit.append(i)

        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                cancel_aiming()
                return

            await wait(0.01)


        play_accept_SE()
        confirm_aiming()

    if attack.target == "team":
        var targetable_slots = target_team.slice(0, 6)


        current_target_unit = []
        for i in targetable_slots:
            if i == null: continue
            target_unit(i)
            current_target_unit.append(i)

        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                cancel_aiming()
                return

            await wait(0.01)


        play_accept_SE()
        await confirm_aiming()

    if attack.target == "self":
        current_act_unit.get_node("TargetSelected/Active").visible = false
        show_targetable_units([own_team[own_team.find(current_act_unit)]])
        target_unit(own_team[own_team.find(current_act_unit)])

        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                current_act_unit.get_node("TargetSelected/Active").visible = true
                hide_targetable_units([own_team[own_team.find(current_act_unit)]])
                untarget_unit(own_team[own_team.find(current_act_unit)])
                play_cancel_SE()
                await cancel_aiming()
                return

            await wait(0.01)

        current_target_unit = [current_act_unit]
        current_act_unit.get_node("TargetSelected/Active").visible = true
        hide_targetable_units([own_team[own_team.find(current_act_unit)]])
        untarget_unit(own_team[own_team.find(current_act_unit)])
        play_accept_SE()
        confirm_aiming()

    if attack.target == "ally":
        var targetable_slots = own_team.slice(0, 6)







        show_targetable_units(targetable_slots)


        if (current_act_unit.team_slot < 4 and own_team[current_act_unit.team_slot - 1] != null):
            target_unit(own_team[current_act_unit.team_slot - 1])
            selector_index = own_team[current_act_unit.team_slot - 1].team_slot


        else:
            for i in targetable_slots:
                if i != null:
                    target_unit(i)
                    selector_index = i.team_slot
                    break


        selector_index -= 1
        if targeted_back: selector_index -= 3
        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                await cancel_aiming()
                return

            if Input.is_action_just_pressed("up"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index -= 1


                if selector_index < 0: selector_index = targetable_slots.size() - 1


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index -= 1
                        if selector_index < 0: selector_index = targetable_slots.size() - 1
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("down"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index += 1


                if selector_index > targetable_slots.size() - 1: selector_index = 0


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index += 1
                        if selector_index > targetable_slots.size() - 1: selector_index = 0
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                var prev_index = selector_index

                if selector_index in [0, 1, 2]:
                    selector_index += 3
                else:
                    selector_index -= 3

                if targetable_slots[selector_index] == null: selector_index = prev_index

                target_unit(targetable_slots[selector_index])

            await wait(0.01)


        current_target_unit = [targetable_slots[selector_index]]
        play_accept_SE()
        confirm_aiming()

    if attack.target == "all":
        var targetable_slots = player_team + enemy_team







        show_targetable_units(targetable_slots)


        if (current_act_unit.team_slot < 4 and player_team[current_act_unit.team_slot - 1] != null):
            target_unit(player_team[current_act_unit.team_slot - 1])
            selector_index = player_team[current_act_unit.team_slot - 1].team_slot


        else:
            for i in targetable_slots:
                if i != null:
                    target_unit(i)
                    selector_index = i.team_slot
                    break


        selector_index -= 1
        if targeted_back: selector_index -= 3
        await wait(0.1)
        while not Input.is_action_just_pressed("Accept"):
            if Input.is_action_just_pressed("Cancel"):
                play_cancel_SE()
                await cancel_aiming()
                return

            if Input.is_action_just_pressed("up"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index -= 1


                if selector_index < 0: selector_index = targetable_slots.size() - 1


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index -= 1
                        if selector_index < 0: selector_index = targetable_slots.size() - 1
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("down"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                selector_index += 1


                if selector_index > targetable_slots.size() - 1: selector_index = 0


                for i in range(6):
                    if targetable_slots[selector_index] == null:
                        selector_index += 1
                        if selector_index > targetable_slots.size() - 1: selector_index = 0
                        if targetable_slots[selector_index] != null: break

                target_unit(targetable_slots[selector_index])

            if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
                play_cursor_SE()
                untarget_unit(targetable_slots[selector_index])
                var prev_index = selector_index

                if selector_index in [0, 1, 2]:
                    selector_index += 3
                else:
                    selector_index -= 3

                if targetable_slots[selector_index] == null: selector_index = prev_index

                target_unit(targetable_slots[selector_index])

            await wait(0.01)


        current_target_unit = [targetable_slots[selector_index]]
        play_accept_SE()
        confirm_aiming()

func front_row_invulnerable(team_slice):
    var triggered = true

    var target_team = enemy_team
    if current_act_unit.team == 2: target_team = player_team
    if target_team.count(null) == 5: return false

    for i in team_slice:
        if i == null: continue
        if i.recorded_data["dodges"] < 90: triggered = false
    return triggered

func cancel_aiming():
    hide_targetable_units(units_in_play)

    for i in units_in_play:
        if i == null: continue
        untarget_unit(i)

    await show_unit_ui(current_act_unit)
    player_input()

func confirm_aiming():
    stop_ap_cost_preview()
    hide_targetable_units(units_in_play)
    for i in units_in_play:
        if i == null: continue
        untarget_unit(i)
    unit_action(current_act_unit, current_target_unit)

func show_targetable_units(units):
    for i in units:
        if i == null: continue
        i.get_node("TargetSelected").get_node("Targetable").visible = true

func hide_targetable_units(units):
    for i in units:
        if i == null: continue
        i.get_node("TargetSelected").get_node("Targetable").visible = false

func target_unit(unit):
    unit.get_node("TargetSelected").get_node("Targeted").visible = true

func untarget_unit(unit):
    unit.get_node("TargetSelected").get_node("Targeted").visible = false

func unit_action(unit, target, free_action = false, extra_turn = false):
    if current_act_unit != null:
        current_act_unit.get_node("TargetSelected").get_node("Active").visible = false
        current_act_unit.played_turn = true

    if target == null:
        if unit == current_act_unit and not extra_turn:
            end_unit_turn()





    if moves.deal_damage not in moves.active[unit.selected_attack]["effect"]:


        if unit.ap >= moves.active[unit.selected_attack]["cost"]:
            if not moves.active[unit.selected_attack].has("hide_name"):
                show_action_name(unit)
                if moves.active[unit.selected_attack]["cost"] > 0:
                    if free_action:
                        await wait(0.8)
                    else:
                        await spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
                else:
                    unit.get_node("UnitUI/PointBar/APBox").visible = true
                    await wait(1)
                    unit.get_node("UnitUI/PointBar/APBox").visible = false
                hide_action_name(unit)

            await unit_approach(unit, moves.active[unit.selected_attack]["approach"], moves.active[unit.selected_attack]["ranged"])

            unit.signal_attack = false

            if moves.active[current_act_unit.selected_attack]["motion"] != "none":
                current_act_unit.player.play(moves.active[current_act_unit.selected_attack]["motion"])

                while not unit.signal_attack:
                    await wait(0.01)

            await execute_action_effect(moves.active[unit.selected_attack], unit)

            if unit.player.is_playing():
                await unit.player.animation_finished



            await unit_retreat(unit, moves.active[unit.selected_attack]["retreat"])



            if unit == current_act_unit and not extra_turn:
                end_unit_turn()
                return


    if moves.active[unit.selected_attack]["name"] != "":
        show_action_name(unit)
    if moves.active[unit.selected_attack]["cost"] > 0:
        if free_action:
            await wait(0.8)
        else:
            await spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    else:
        if moves.active[unit.selected_attack]["name"] != "":
            unit.get_node("UnitUI/PointBar/APBox").visible = true
            await wait(1)
            unit.get_node("UnitUI/PointBar/APBox").visible = false
    hide_action_name(unit)

    await unit_approach(unit, moves.active[unit.selected_attack]["approach"], moves.active[unit.selected_attack]["ranged"])

    await trigger_before_attack_effects(unit, target)
    if unit.cur_hp <= 0:
        end_unit_turn()
        return

    await execute_action(moves.active[unit.selected_attack], unit)

    await trigger_after_attack_effects(unit, target)
    if unit.cur_hp <= 0:
        end_unit_turn()
        return

    await unit_retreat(unit, moves.active[unit.selected_attack]["retreat"])

    await trigger_after_retreat_effects(unit, target)
    if unit.cur_hp <= 0:
        end_unit_turn()
        return

    if unit == current_act_unit and not extra_turn:
        end_unit_turn()

    if unit.selected_attack == "struggle":
        unit.selected_attack = unit.get_node("InputUI").get_child(0).get_meta("move_name")

func unit_approach(unit, type, ranged):
    if type == "none": return

    var direction = -1
    var target_position = 1
    var target_backrow = 1
    var target_distance = 124

    for i in current_target_unit:
        if i.team_slot > 3:
            target_backrow = 4

    if ranged:
        target_distance += 75
        if target_backrow != 1:
            target_distance += 70

    if unit.team == 2:
        direction = 1
        target_position = 0


    if type == "run":
        var speed = 0.4

        var tween = get_tree().create_tween().set_parallel(true)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(-8), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4.5, 3.5), 0.15)
        await wait(0.2)

        tween = get_tree().create_tween().set_parallel(false)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(3.5, 4.5), 0.05)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(0), 0.05)

        var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
        tween2.tween_property(unit, "position", 
                                current_target_unit[0].position - Vector2(target_distance * direction, 0), speed)

        await wait(speed)

    if type == "hop":
        var speed = 0.6
        var jump_height = -30

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
        tween.tween_property(unit, "position", 
                                current_target_unit[0].position - Vector2(target_distance * direction, 0), speed)

        var hop_tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_parallel(false)
        hop_tween.tween_property(unit.get_node("Sprite").get_node("Sprite2D"), "position", Vector2(0, jump_height), speed * 0.5)
        hop_tween.tween_property(unit.get_node("Sprite").get_node("Sprite2D"), "position", Vector2(0, 0), speed * 0.5)

        await wait(speed)

    if type == "run_row":
        var speed = 0.4

        var tween = get_tree().create_tween().set_parallel(true)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(-8), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4.5, 3.5), 0.15)
        await wait(0.2)

        tween = get_tree().create_tween().set_parallel(false)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(3.5, 4.5), 0.05)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(0), 0.05)

        var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
        tween2.tween_property(unit, "position", 
                                battle_positions[target_position][target_backrow] - Vector2(target_distance * direction, 0), speed)

        await wait(speed)

    if type == "run_team":
        var speed = 0.4

        var tween = get_tree().create_tween().set_parallel(true)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(-8), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4.5, 3.5), 0.15)
        await wait(0.2)

        tween = get_tree().create_tween().set_parallel(false)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(3.5, 4.5), 0.05)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.1)
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(0), 0.05)

        var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
        tween2.tween_property(unit, "position", 
                                battle_positions[target_position][1] - Vector2(target_distance * direction, 0), speed)

        await wait(speed)

func spend_point(unit, type, amount):
    if amount < 1: return

    var box_node
    var prev_color
    var point_type

    if type == "ap":
        box_node = unit.get_node("UnitUI/PointBar/APBox")
        prev_color = Color(poke_types.colors["ap"])
        point_type = unit.ap
    else:
        box_node = unit.get_node("UnitUI/PointBar/PPBox")
        prev_color = Color(poke_types.colors["pp"])
        point_type = unit.pp
        unit.get_node("UnitUI/PointBar/APBox").visible = false

    box_node.visible = true

    if point_type < amount and type == "ap":

        unit.selected_attack = "struggle"
        amount = 1

        if current_target_unit == [current_act_unit]:
            var target_team = moves.get_target_team(current_act_unit)
            for i in target_team:
                if i != null:
                    current_target_unit = [i]
                    break

        current_target_unit = [current_target_unit[0]]


        if unit == current_act_unit and type == "ap":
            show_action_name(unit)


    if point_type < 1:
        box_node.visible = false
        return

    await wait(0.2)

    for i in range(amount):
        blink_point(box_node, point_type, prev_color)
        await wait(0.15)

        point_type -= 1
        if type == "ap":
            unit.ap -= 1
        else:
            unit.pp -= 1


    if amount > 2:
        await wait(0.1 * amount)
    elif amount == 1:
        await wait(0.4)
    else:
        await wait(0.3)
    if unit == null: return
    box_node.visible = false

func blink_point(box_node, point_type, prev_color):
    for j in range(3):
        box_node.get_child(point_type - 1).get_node("PointColor").color = Color("#ffffff")
        await wait(0.04)
        box_node.get_child(point_type - 1).get_node("PointColor").color = prev_color
        await wait(0.04)

        box_node.get_child(point_type - 1).get_node("PointColor").color = Color("#202020")

func show_action_name(unit, text = moves.active[unit.selected_attack]["name"]):
    unit.get_node("ActionNamePopUp/BG").scale.x = 1
    for i in range(text.length() - 8):
        unit.get_node("ActionNamePopUp/BG").scale.x += 0.12

    unit.get_node("ActionNamePopUp/Label").text = text
    await wait(0.1)
    unit.action_timer.start()
    play_ability_SE()
    unit.get_node("ActionNamePopUp").visible = true

func hide_action_name(unit):
    await wait(0.2)
    if unit == null: return
    if not unit.action_timer.is_stopped():
        await unit.action_timer.timeout

    if unit == null: return
    unit.get_node("ActionNamePopUp").visible = false

func unit_retreat(unit, type):
    if type == "none": return

    if type == "run":
        var speed = 0.4

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
        tween.tween_property(unit, "position", 
                                unit.home_coords, speed)

        await wait(speed)

func execute_action(action, unit):
    unit.z_index = 2
    unit.signal_attack = false

    if unit.player.is_playing():
        await unit.player.animation_finished

    if action["motion"] != "none":
        unit.player.play(action["motion"])

        while not unit.signal_attack:
            await wait(0.01)

    await execute_action_effect(action, unit)

    if unit.player.is_playing():
        await unit.player.animation_finished

func execute_action_effect(action, unit):
    for i in action.effect:
        await i.call(unit)



func unit_wait(unit):
    var team = player_team
    if unit.team == 2: team = enemy_team

    var cant_wait = true
    for i in team:
        if i == current_act_unit or i == null: continue
        if i.waiting == false and i.played_turn == false:
            cant_wait = false

    if cant_wait:
        current_act_unit.get_node("TargetSelected").get_node("Active").visible = false
        unit.get_node("UnitUI/PointBar/APBox").visible = false
        hide_unit_ui(unit, false)
        unit.waiting = true
        show_action_name(unit, "Can't wait!")
        await wait(0.6)
        hide_action_name(unit)
        start_unit_turn(current_act_unit)

    else:
        current_act_unit.get_node("TargetSelected").get_node("Active").visible = false
        unit.get_node("UnitUI/PointBar/APBox").visible = false
        hide_unit_ui(unit, false)
        unit.waiting = true
        show_action_name(unit, "Waiting...")
        await wait(0.6)
        hide_action_name(unit)

        await wait(0.3)
        sort_by_speed(units_in_play)
        start_unit_turn(get_next_turn())

func end_unit_turn():
    current_target_unit = []
    if current_act_unit == null: return

    if current_act_unit != null:
        current_act_unit.recorded_data["taunted"] = false
        current_act_unit.temp_speed = 0
        if not current_act_unit.recorded_data["extra_turn"]:
            current_act_unit.played_turn = true
        else:
            current_act_unit.recorded_data["extra_turn"] -= 1


        await trigger_effects(current_act_unit, "on_turn_end")
        if current_act_unit == null:
            start_unit_turn(get_next_turn())
            return

        await suffer_burn()
        if current_act_unit == null:
            start_unit_turn(get_next_turn())
            return

        current_act_unit.z_index = 1
        current_act_unit.get_node("TargetSelected").get_node("Active").visible = false

        current_act_unit = null


    await return_units_out_of_place()


    damage_mod = 1
    damage_flat = 0

    reset_temp_buffs()



    if player_team == [null, null, null, null, null, null] or enemy_team == [null, null, null, null, null, null]:
        print("knockout 1")
        end_battle()
        return



    var round_over = true
    for i in units_in_play:
        if i.played_turn == false:
            round_over = false

    if round_over:
        for i in units_in_play:
            await trigger_effects(i, "on_round_end")

        await return_units_out_of_place()


        if player_team == [null, null, null, null, null, null] or enemy_team == [null, null, null, null, null, null]:
            print("knockout 2")
            end_battle()
            return

        sort_by_speed(units_in_play)

        for i in units_in_play:
            i.played_turn = false
            i.waiting = false


    var out_of_ap = true
    for i in units_in_play:
        if i.ap > 0:
            out_of_ap = false

    if out_of_ap:
        print("out of AP")
        for i in units_in_play:
            await trigger_effects(i, "on_round_end")

        end_battle()
        return

    start_unit_turn(get_next_turn())

func return_units_out_of_place():
    units_covering.clear()
    for i in units_out_of_place:
        var tween = get_tree().create_tween()
        tween.tween_property(i, "position", i.home_coords, 0.3)
    if units_out_of_place.size() > 0:
        units_out_of_place.clear()
        await wait(0.45)

func reset_temp_buffs():
    helping_hand = false

    for i in units_in_play:
        i.unit_immune = false
        i.temp_power = 0
        i.temp_defense = 0.0

func start_exp():

    for i in $BoxExp / VBoxContainer.get_children():
        i.queue_free()

    for i in globals.player_data.player_box:
        if i not in globals.player_data.player_party:
            var new_index = load("res://Files/Scenes/Battle/box_exp_index.tscn").instantiate()
            new_index.get_node("Sprite").frame = i["dex"]["sprite"]
            new_index.get_node("Level").text = "lv%s" % i["lv"]
            new_index.get_node("ExpBar").scale.x = i["exp"] / i["max_exp"]
            new_index.set_meta("unit_dict", i)
            $BoxExp / VBoxContainer.add_child(new_index)

    var exp_amount = 0

    if globals.normal_mode:
        if globals.hotel.game_level == 0:
            exp_amount = 140
        elif globals.hotel.game_level == 1:
            exp_amount = 290
        else:
            exp_amount = 920

    if battle_result == "win" and (globals.normal_mode or globals.LC_mode) and globals.enemy.npc_name == "Demi-Fiend":
        exp_amount *= 3

    elif globals.bf_mode:
        if bf_level == 0:
            exp_amount = 90
        elif bf_level == 1:
            exp_amount = 220
        else:
            exp_amount = 480




    for i in player_team_copy:
        if i == null: continue
        var exp_scale = i.unit_dict["exp"] / i.unit_dict["max_exp"]
        i.get_node("UnitUI/EXP/ExpBar").scale.x = exp_scale

        var tween = get_tree().create_tween().set_parallel(true)
        tween.tween_property(self, "stupid", 1.0, 0.1)

        if i.level < 9:
            tween.tween_property(i.get_node("UnitUI/EXP"), "modulate", Color("#ffffff"), 0.1)
        if i.cur_hp < 1 and i.level < 9:
            i.get_node("Sprite/Sprite2D").scale = Vector2(4, 4)
            i.get_node("Sprite/Sprite2D/BlinkTexture").color = Color("#ffffff00")
            tween.tween_property(i.get_node("UnitUI"), "modulate", Color("#ffffff"), 0.2)
            tween.tween_property(i.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff96"), 0.3)

    await wait(0.3)

    for i in player_team_copy:
        if i == null: continue
        if i.unit_dict["lv"] == 9: continue
        i.getting_exp = true
        i.unit_dict["exp"] += exp_amount
        get_exp(i)

    while true:
        var break_loop = true
        for i in player_team_copy:
            if i == null: continue
            if i.getting_exp: break_loop = false
        await wait(0.1)
        if break_loop: break


    var tween2
    var speed = 0.3
    if $BoxExp / VBoxContainer.get_children():
        tween2 = get_tree().create_tween().set_parallel(true)
        tween2.tween_property($BoxExp, "position", Vector2(0, 0), speed)
        await wait(speed + 0.3)

        if globals.normal_mode or globals.LC_mode:
            await get_box_exp(exp_amount * 0.75)
        elif globals.bf_mode:
            await get_box_exp(exp_amount * 0.75)

        await wait(0.1)
    while true:
        var break_loop = true
        for i in $BoxExp / VBoxContainer.get_children():

            if i.get_meta("getting_exp"): break_loop = false
        await wait(0.1)
        if break_loop: break

    if $BoxExp / VBoxContainer.get_children():

        tween2 = get_tree().create_tween()
        tween2.tween_property($BoxExp, "position", Vector2(320, 0), 0.2)

func get_exp(unit):
    if unit.unit_dict["lv"] == 9:
        if unit.cur_hp <= 0.0:
            var tween2 = get_tree().create_tween().set_parallel(true)
            tween2.tween_property(unit.get_node("UnitUI/EXP"), "modulate", Color("#ffffff00"), 0.2)
            tween2.tween_property(unit.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff00"), 0.2)
            tween2.tween_property(unit.get_node("UnitUI"), "modulate", Color("#ffffff00"), 0.2)
        return

    var exp_scale = unit.unit_dict["exp"] / unit.unit_dict["max_exp"]
    var repeat = false

    if exp_scale > 1:
        exp_scale = 1

        unit.unit_dict["exp"] -= unit.unit_dict["max_exp"]
        unit.unit_dict["max_exp"] *= 1.5
        unit.unit_dict["lv"] += 1
        repeat = true
        if unit.unit_dict["lv"] == 9:
            unit.unit_dict["exp"] = unit.unit_dict["max_exp"]

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
    tween.tween_property(unit.get_node("UnitUI/EXP/ExpBar"), "scale", Vector2(exp_scale, 1), 0.6)

    await wait(0.6)
    if repeat:
        await level_up(unit)
        await get_exp(unit)
        return

    await wait(0.3)
    unit.getting_exp = false
    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.get_node("UnitUI/EXP"), "modulate", Color("#ffffff00"), 0.2)
    if unit.cur_hp <= 0.0:
        tween.tween_property(unit.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff00"), 0.2)
        tween.tween_property(unit.get_node("UnitUI"), "modulate", Color("#ffffff00"), 0.2)
    await wait(0.1)
    
func get_evolution_moves(unit):
    var new_dex = globals.get_evolution(unit)
    var current_moves = []
    
    # Obtener todos los movimientos actuales en slots
    for slot in ["slot1", "slot2", "slot3"]:
        if unit.unit_dict.has(slot):
            current_moves += unit.unit_dict[slot]
    
    # Revisar los movimientos “base” de la nueva forma
    var new_base_moves = []
    for slot in ["slot1", "slot2", "slot3"]:
        if new_dex["dex"].has(slot):
            new_base_moves += new_dex["dex"][slot]
    
    # Filtramos solo los que no tiene ya
    var moves_to_learn = new_base_moves.filter(func(m):
        return m not in current_moves
    )
    
    return moves_to_learn


func level_up(unit):
    globals.level_up_calls += 1
    unit.get_node("UnitUI/LvLabel").text = "lv{0}".format([unit.unit_dict["lv"]])
    unit.get_node("UnitUI/EXP/ExpBar/ExpShadow").visible = false
    unit.blink.play("level_up")
    for i in range(6):
        unit.get_node("UnitUI/EXP/Label").modulate = Color("#ffffff")
        unit.get_node("UnitUI/EXP/ExpBar").color = Color("#ffffff")
        await wait(0.06)
        unit.get_node("UnitUI/EXP/Label").modulate = Color("#4992fb")
        unit.get_node("UnitUI/EXP/ExpBar").color = Color("#4992fb")
        await wait(0.06)
    await wait(0.3)
    unit.get_node("UnitUI/EXP/ExpBar/ExpShadow").visible = true

    var pokemon = unit.unit_dict
    var dex = pokemon["dex"]

    # ===== SLOT 1 (lvl 4) =====
    if pokemon["lv"] in [2, 4] and dex.has("learn_slot1"):
        var pool1 = dex["learn_slot1"].duplicate()
        pool1 = pool1.filter(func(m): return m not in dex["slot1"])
        pool1.shuffle()

        if pool1.size() > 0:
            var new_move = pool1[0]

            if dex["slot1"].size() < 2:
                dex["slot1"].append(new_move)
            else:
                # 🔥 abrir UI
                var choice = await show_move_replace_ui(unit, "slot1", new_move)

                if choice != -1:
                    dex["slot1"][choice] = new_move
                    print("reemplazado slot", choice, "por", new_move)

    # ===== SLOT 3 (lvl 7) =====
    if pokemon["lv"] in [7, 9] and dex.has("learn_slot3"):
        print("aprendiendo slot3")

        var pool3 = dex["learn_slot3"].duplicate()
        pool3 = pool3.filter(func(m): return m not in dex["slot3"])
        pool3.shuffle()

        if pool3.size() > 0:
            var new_move = pool3[0]

            if dex["slot3"].size() < 2:
                dex["slot3"].append(new_move)
            else:
                var choice = await show_move_replace_ui(unit, "slot3", new_move)

                if choice != -1:
                    dex["slot3"][choice] = new_move

    if pokemon["lv"] == 9:
        unit.getting_exp = false
    else:
        unit.get_node("UnitUI/EXP/ExpBar").scale.x = 0

    if dex.has("evolve") and dex["evolve"][1] <= pokemon["lv"]:
        await unit_evolve(unit)
    
    globals.level_up_calls -= 1
        
func show_move_replace_ui(unit, slot_name, new_move):
    var ui = globals.ui.get_node("../MoveReplaceUiNew")
    # Esperar si la UI ya está visible
    while ui.visible:
        await get_tree().process_frame

    ui.visible = true
    if unit is Node:
        ui.setup(unit.unit_dict, slot_name, new_move)
    else:
        ui.setup(unit, slot_name, new_move)

    var result = await ui.choice_made
    ui.visible = false
    return result
    
func unit_evolve(unit):
    # 🔒 Detener XP durante este combate
    #unit.getting_exp = false

    var evolved_mon = globals.get_evolution(unit)
    var dex = evolved_mon["dex"]
    
    # 🔒 Pausar el juego mientras se seleccionan movimientos
    #get_tree().paused = true
    var pool1 = unit.unit_dict["dex"]["slot1"].duplicate()
    pool1.shuffle()
    if pool1.size() > 0:
        var new_move = pool1[0]

        if dex["slot1"].size() < 2:
            dex["slot1"].append(new_move)
        else:
            # 🔥 abrir UI
            var choice = await show_move_replace_ui(evolved_mon, "slot1", new_move)

            if choice != -1:
                dex["slot1"][choice] = new_move
                print("reemplazado slot", choice, "por", new_move)
            else:
                print("no aprendió el movimiento")
                
    var pool3 = unit.unit_dict["dex"]["slot3"].duplicate()
    pool3.shuffle()
    if pool3.size() > 0:
        var new_move = pool3[0]
        if dex["slot3"].size() < 2:
            dex["slot3"].append(new_move)
        else:
            # 🔥 abrir UI
            var choice = await show_move_replace_ui(evolved_mon, "slot3", new_move)

            if choice != -1:
                dex["slot3"][choice] = new_move
                print("reemplazado slot", choice, "por", new_move)
            else:
                print("no aprendió el movimiento")

    # 🔓 Reanudar el juego
    #get_tree().paused = false

    # 3️⃣ Animación de evolución
    show_action_name(unit, "%s is evolving!" % unit.unit_name)
    await wait(0.6)

    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
    new_sprite.frame = dex["sprite"]
    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    new_sprite.self_modulate = Color("#ffffff00")
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    var tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("#ffffff73"), 0.4)
    await wait(0.8)
    tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("#ffffff00"), 0.4)
    await wait(0.6)
    tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("#ffffff"), 0.8)
    await wait(0.8)
    tween = get_tree().create_tween()
    tween.tween_property(new_sprite, "self_modulate", Color("#ffffff"), 1)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff00"), 1.5)
    await wait(0.9)

    hide_action_name(unit)
    await wait(0.7)
    var tween2 = get_tree().create_tween()
    tween2.tween_property(new_sprite.get_node("BlinkTexture"), "color", Color("#ffffff00"), 0.8)
    await wait(0.8)

    show_action_name(unit, "Evolved into %s!" % dex["name"])
    await wait(0.6)

    # 4️⃣ Aplicar stats y movimientos seleccionados
    unit.unit_dict = evolved_mon

    # 5️⃣ Actualizar sprite final
    unit.get_node("Sprite/Sprite2D").frame = dex["sprite"]
    unit.get_node("Sprite/Sprite2D").self_modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D/BlinkTexture").color = Color("#ffffff00")
    unit.get_node("Sprite/Sprite2D").scale = Vector2(4,4)
    new_sprite.queue_free()

    # 6️⃣ Animación final / sonido
    unit.player.play("ot_skill")
    await unit.player.animation_finished

    # 7️⃣ Finalizar UI
    hide_action_name(unit)

    print("%s ha evolucionado, XP bloqueada hasta el siguiente combate" % unit.unit_name)
        
func get_box_exp(exp_amount):
    var cont = 0
    for i in globals.player_data.player_box:
        if i not in globals.player_data.player_party:
            var cur_mon = $BoxExp / VBoxContainer.get_child(cont)

            if i["lv"] == 9:
                cont += 1
                continue

            i["exp"] += exp_amount
            box_unit_exp(i, cur_mon)

            cont += 1

func box_unit_exp(i, cur_mon):
    if cur_mon == null: return
    var repeat = false
    cur_mon.set_meta("getting_exp", true)
    var exp_scale = i["exp"] / i["max_exp"]

    if exp_scale > 1:
        exp_scale = 1

        i["exp"] -= i["max_exp"]
        i["max_exp"] *= 1.5
        i["lv"] += 1
        var dex = cur_mon.get_meta("unit_dict")["dex"]
        # ===== SLOT 1 (lvl 4) =====
        if cur_mon.get_meta("unit_dict")["lv"] in [2, 4] and dex.has("learn_slot1"):
            var pool1 = dex["learn_slot1"].duplicate()
            pool1 = pool1.filter(func(m): return m not in dex["slot1"])
            pool1.shuffle()

            if pool1.size() > 0:
                var new_move = pool1[0]

                if dex["slot1"].size() < 2:
                    dex["slot1"].append(new_move)
                else:
                    # 🔥 abrir UI
                    var choice = await show_move_replace_ui(cur_mon.get_meta("unit_dict"), "slot1", new_move)

                    if choice != -1:
                        dex["slot1"][choice] = new_move
                        print("reemplazado slot", choice, "por", new_move)

        # ===== SLOT 3 (lvl 7) =====
        if cur_mon.get_meta("unit_dict")["lv"] in [7, 9] and dex.has("learn_slot3"):
            print("aprendiendo slot3")

            var pool3 = dex["learn_slot3"].duplicate()
            pool3 = pool3.filter(func(m): return m not in dex["slot3"])
            pool3.shuffle()

            if pool3.size() > 0:
                var new_move = pool3[0]

                if dex["slot3"].size() < 2:
                    dex["slot3"].append(new_move)
                else:
                    var choice = await show_move_replace_ui(cur_mon.get_meta("unit_dict"), "slot3", new_move)

                    if choice != -1:
                        dex["slot3"][choice] = new_move

        
        repeat = true
        if i["lv"] == 9:
            i["exp"] = i["max_exp"]

    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(cur_mon.get_node("ExpBar"), "scale", Vector2(exp_scale, 1), 0.2)
    await wait(0.2)
    if repeat:
        await box_level_up(cur_mon)
        if i["lv"] != 9:
            cur_mon.get_node("ExpBar").scale.x = 0
            await box_unit_exp(i, cur_mon)
            return

    cur_mon.set_meta("getting_exp", false)

func box_level_up(unit):
    unit.get_node("ExpShadow").visible = false

    unit.get_node("Level").text = "lv%s" % (int(unit.get_node("Level").text[-1]) + 1)
    for i in range(6):
        await wait(0.06)
        unit.get_node("Level").modulate = Color("#4992fb")
        unit.get_node("ExpBar").color = Color("#b1d0fa")
        await wait(0.06)
        unit.get_node("Level").modulate = Color("#ffffff")
        unit.get_node("ExpBar").color = Color("#4992fb")
    await wait(0.3)
    unit.get_node("ExpShadow").visible = true

    var unit_dict = unit.get_meta("unit_dict")
    if unit_dict["dex"].has("evolve") and unit_dict["dex"]["evolve"][1] <= unit_dict["lv"]:
        await box_evolution(unit)

func box_evolution(unit):
    var evolved_mon = globals.get_evolution(unit.get_meta("unit_dict"))
    var dex = unit.get_meta("unit_dict")["dex"]
    var pool1 = unit.get_meta("unit_dict")["dex"]["slot1"].duplicate()
    pool1.shuffle()
    if pool1.size() > 0:
        var new_move = pool1[0]

        if dex["slot1"].size() < 2:
            dex["slot1"].append(new_move)
        else:
            # 🔥 abrir UI
            var choice = await show_move_replace_ui(evolved_mon, "slot1", new_move)

            if choice != -1:
                evolved_mon["dex"]["slot1"][choice] = new_move
                print("reemplazado slot", choice, "por", new_move)
            else:
                print("no aprendió el movimiento")
                
    var pool3 = unit.get_meta("unit_dict")["dex"]["slot3"].duplicate()
    pool3.shuffle()
    if pool3.size() > 0:
        var new_move = pool3[0]
        if dex["slot3"].size() < 2:
            dex["slot3"].append(new_move)
        else:
            # 🔥 abrir UI
            var choice = await show_move_replace_ui(evolved_mon, "slot3", new_move)

            if choice != -1:
                evolved_mon["dex"]["slot3"][choice] = new_move
                print("reemplazado slot", choice, "por", new_move)
            else:
                print("no aprendió el movimiento")

    unit.set_meta("unit_dict", evolved_mon)

    var new_sprite = unit.get_node("Sprite").duplicate()
    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    new_sprite.modulate = Color("#ffffff00")
    new_sprite.frame = evolved_mon["dex"]["sprite"]

    unit.add_child(new_sprite)

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_parallel(true)
    tween.tween_property(unit.get_node("Sprite/BlinkTexture"), "color", Color("#ffffff"), 0.4)
    tween.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.4)
    await wait(0.4)

    tween = get_tree().create_tween().set_ease(Tween.EASE_IN).set_parallel(true)
    tween.tween_property(unit.get_node("Sprite"), "modulate", Color("#ffffff00"), 0.5)
    tween.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.5)
    tween.tween_property(new_sprite.get_node("BlinkTexture"), "modulate", Color("#ffffff00"), 0.9)

    await wait(1)

func get_battle_result():
    var result
    if player_team == [null, null, null, null, null, null]:
        result = false

    if enemy_team == [null, null, null, null, null, null]:
        result = true

    var player_cur_hp = 0
    var enemy_cur_hp = 0

    for i in player_team_copy:
        if i == null: continue
        if i.max_hp == 0: continue
        if i.cur_hp > 0:
            player_cur_hp += i.cur_hp

    for i in enemy_team_copy:
        if i == null: continue
        if i.max_hp == 0: continue
        if i.cur_hp > 0:
            enemy_cur_hp += i.cur_hp

    var player_ratio
    if player_hp != 0:
        player_ratio = (player_cur_hp / player_hp - 1) * -1
    else: player_ratio = 0.0

    var enemy_ratio = (enemy_cur_hp / enemy_hp - 1) * -1

    if player_ratio < enemy_ratio:
        result = true
        battle_result = "win"
        if not globals.bf_mode and not globals.test_mode:
            globals.player_data.defeated_trainers.append(globals.enemy.npc_name)
    else:
        result = false
        battle_result = "lose"

    if globals.test_mode: return

    $BattleResults / PlayerTeam / ScoreBar.scale.x = 0
    $BattleResults / EnemyTeam / ScoreBar.scale.x = 0
    $BattleResults / PlayerTeam / Score.text = "0%"
    $BattleResults / EnemyTeam / Score.text = "0%"

    for i in $BattleResults / PlayerTeam / VBoxContainer.get_children():
        i.queue_free()

    var tween = get_tree().create_tween()
    tween.tween_property($BattleResults, "modulate", Color("#ffffff"), 0.2)
    await wait(0.3)

















    while true:

        if int($BattleResults / PlayerTeam / Score.text) < enemy_ratio * 100:

            $BattleResults / PlayerTeam / Score.text = str(int($BattleResults / PlayerTeam / Score.text) + 1) + "%"
            $BattleResults / PlayerTeam / ScoreBar.scale.x += 0.01


        if int($BattleResults / EnemyTeam / Score.text) < player_ratio * 100:
            $BattleResults / EnemyTeam / Score.text = str(int($BattleResults / EnemyTeam / Score.text) + 1) + "%"
            $BattleResults / EnemyTeam / ScoreBar.scale.x += 0.01

        if int($BattleResults / PlayerTeam / Score.text) >= enemy_ratio * 100 and int($BattleResults / EnemyTeam / Score.text) >= player_ratio * 100:
            break
        await wait(0.01)

    var winner_bar
    var winner_label
    if result:
        winner_bar = $BattleResults / PlayerTeam / ScoreBar
        winner_label = $BattleResults / PlayerTeam / Label
    else:
        winner_bar = $BattleResults / EnemyTeam / ScoreBar
        winner_label = $BattleResults / EnemyTeam / Label

    if globals.normal_mode or globals.LC_mode:
        play_battle_result_bgm()

    var prev_color = winner_bar.color
    for i in range(8):
        winner_label.modulate = Color("#bdb6ac")
        winner_bar.color = Color("#ffffff")
        await wait(0.02)
        winner_bar.color = prev_color
        winner_label.modulate = Color("#ffffff")
        await wait(0.02)

    if result:

        if enemy_ratio >= 1:
            result_notification("[color=fffaf6]enemy wipeout:[/color] [color=f6ce29]2x")

            await wait(0.3)
            bounce_score($BattleResults / PlayerTeam / Score, 2)
            await wait(0.2)


        if player_team.count(null) == player_team_copy.count(null):
            result_notification("[color=fffaf6]flawless victory:[/color] [color=f6ce29]2x")
            await wait(0.3)
            bounce_score($BattleResults / PlayerTeam / Score, 2)
            await wait(0.2)

    await wait(0.6)
    tween = get_tree().create_tween()
    tween.tween_property($BattleResults, "modulate", Color("#ffffff00"), 0.2)


    return result

func result_notification(text):
    var notif = $BattleResults / PlayerTeam / ResultNotif
    var new_notif = notif.duplicate()
    new_notif.get_node("Label").text = text
    $BattleResults / PlayerTeam / VBoxContainer.add_child(new_notif)

    var tween = get_tree().create_tween().set_parallel(true).set_trans(Tween.TRANS_BOUNCE)
    tween.tween_property(new_notif, "modulate", Color("#ffffff"), 0.1)
    tween.tween_property(new_notif.get_node("Label"), "position", Vector2(-133, 0), 0.1)

func end_battle():
    for i in units_in_play:
        if i.burn_amount > 0:
                await suffer_burn(i)

        await trigger_effects(i, "on_battle_end")

    await wait(0.6)

    var result = await get_battle_result()

    if globals.versus_mewtwo:
        if result and not final_battle:
            mewtwo_won_pre_battle()
            return
        elif not result and not final_battle:
            await mewtwo_lost_pre_battle()

        elif not result:
            await mewtwo_won()

    if globals.versus_mode:
        show_versus_menu()
        return

    for i in player_team:
        if i == null: continue
        if i.unit_name == "MISSINGNO.":
            await missingno_event(i)
            break

    if globals.test_mode: return

    if globals.rl_mode:
        globals.rl_mode = false
        globals.core.change_scene(load("res://Files/Scenes/RogueLike/roguelike_map.tscn"))
        return

    if globals.mewtwo_mode:
        globals.player_data.player_box = []
        globals.player_data.player_party = []

    if not globals.bf_mode:

        if result:
            battle_result = "win"
            globals.npc.progression[globals.enemy.npc_name]["dialogue"] = "1_lose"
            globals.npc.progression[globals.enemy.npc_name]["battle_results"]["lose"] += 1
            globals.player_data.battles_won += 1



        else:
            battle_result = "lose"
            globals.npc.progression[globals.enemy.npc_name]["dialogue"] = "1_win"
            globals.npc.progression[globals.enemy.npc_name]["battle_results"]["win"] += 1
            globals.player_data.battles_lost += 1

        if globals.player_data.battles_fought % 6 == 0 or globals.player_data.battles_fought == 2:
                globals.booster_due = true

    elif globals.bf_mode:
        if result:
            battle_result = "win"
            globals.player_data.battles_won += 1
            if globals.player_data.battles_fought > 29:
                globals.ui.bf_victory()
                return
        else:
            battle_result = "lose"
            globals.player_data.battles_lost += 1
            await bf_lose_health()
            if globals.player_data.player_hp < 1: return



    await start_exp()


    if not globals.bf_mode:
        for i in units_in_play:
            if globals.versus_mewtwo and i.unit_name == "Mewtwo": continue
            if i.team == 1:
                i.get_node("Card/CardSprite").position = Vector2(0, 14)
            i.get_node("AnimationPlayer").play_backwards("ot_spawn")
            await wait(0.1)
    else:
        for i in enemy_team:
            if i == null: continue
            i.get_node("AnimationPlayer").play_backwards("ot_spawn")
            await wait(0.1)

    await wait(0.8)

    if not globals.bf_mode:
        anm_player.play_backwards("start battle")
        await anm_player.animation_finished

        globals.ui.toggle_hint()

        if not globals.in_cutscene:
            await globals.enemy.interact()
            await wait(0.1)
            while globals.enemy.dialogue_state != globals.enemy.off:
                await wait(0.1)
            globals.ui.state = globals.ui.off

        battle_over = true
        end_battle_bgm()
        while globals.player.state != globals.player.free:
            await wait(0.1)
        await post_battle()

        queue_free()
    else:
        await bf_end_battle()

func post_battle():
    var money = 0
    if globals.hotel.game_level == 0:
        money = 10 + randi_range(0, 8)
    elif globals.hotel.game_level == 1:
        money = 20 + randi_range(0, 8)
    else:
        money = 30 + randi_range(0, 8)

    if battle_result == "lose":
        money = roundi(float(money) / 2)



    if globals.LC_mode: money = int(money * 1.5)

    if globals.player.player_name == "Demi-Fiend": money *= 4
    globals.player_data.prize_money = money


    if globals.player_data.battles_fought % 2 == 0:
        globals.hotel.generate_shop_cards()

    while globals.player.state != globals.player.free:
        await wait(0.01)

    if battle_result == "lose":
        globals.npc.player_lose_hp()
        if globals.player_data.player_hp < 1:
            bf_result = "defeat"
            await globals.ui.bf_game_over()
            return

    globals.npc.get_money()

    if globals.hotel.game_level == 0 and globals.player_data.battles_fought == advance_times[0]:
        globals.cutscenes.advance_time()

    elif globals.hotel.game_level == 1 and globals.player_data.battles_fought == advance_times[1]:
        globals.cutscenes.advance_time()

    elif globals.hotel.game_level == 2 and globals.player_data.battles_fought == advance_times[2]:
        globals.cutscenes.advance_time()

func bounce_score(node, mult):
    node.text = str(int(node.text) * mult) + "%"
    var tween = get_tree().create_tween()
    tween.tween_property(node, "scale", Vector2(0.7, 0.7), 0.05)
    tween.tween_property(node, "scale", Vector2(1.5, 1.5), 0.1)
    tween.tween_property(node, "scale", Vector2(1, 1), 0.05)

    for i in range(6):


        node.label_settings.font_color = Color("#ffffff")
        await wait(0.02)
        node.label_settings.font_color = Color("#317dff")


        await wait(0.02)

func show_versus_menu():
    if battle_result == "win":
        $VersusMenu / RichTextLabel.text = "[color=317dff]Player 1[/color] wins!"
    else:
        $VersusMenu / RichTextLabel.text = "[color=c52018]Player 2[/color] wins!"

    $VersusMenu.show()
    var selector_index = true
    while true:
        if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down"):
            selector_index = not selector_index
            if selector_index:
                $VersusMenu / Selector.position = $VersusMenu / Label.position
            else:
                $VersusMenu / Selector.position = $VersusMenu / Label2.position

        elif Input.is_action_just_pressed("Accept"):
            if selector_index:
                globals.core.change_scene(load("res://Files/Scenes/Versus/versus_mode.tscn"))
            else:
                globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))
            return


        await wait(0.01)

func play_battle_result_bgm():
    if globals.versus_mewtwo and not final_battle: return
    var battle_player = globals.hotel.get_node("BattlePlayer")
    var bgm_player = globals.hotel.get_node("BGMPlayer")
    if battle_result == "win":
        if globals.gbc:
            bgm_player.stream = load("res://Files/BGMs/GBC Victory.mp3")
            bgm_player.play()
            return

        battle_player.stream = load("res://Files/BGMs/Battle Win %s.ogg" % globals.hotel.game_level)
        battle_player.play()

func end_battle_bgm():

    var battle_player = globals.hotel.get_node("BattlePlayer")
    var bgm_player = globals.hotel.get_node("BGMPlayer")

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(battle_player, "volume_linear", 0, 1)

    if advance_times[globals.hotel.game_level] == globals.player_data.battles_fought: return
    if globals.hotel.game_level > 2: return

    if globals.enemy.npc_name != "Demi-Fiend":
        tween.tween_property(bgm_player, "volume_linear", 0.177 * globals.options["bgm_volume"], 2)

func missingno_event(missingno):
    var target = null
    var team_copy = player_team.duplicate()
    team_copy.shuffle()

    for i in team_copy:
        if i == null: continue
        if i.unit_name == "MISSINGNO.": continue
        if i.cur_hp > 1:
            if i.level > 2:
                target = i
                break

    if target == null: return

    await wait(0.3)
    var phrases = [
        "I shall partake...", 
        "I eat...", 
        "Consume...", 
        "... That thing...", 
        "Hunger..."
    ]
    phrases.shuffle()
    show_action_name(missingno, phrases[0])
    missingno.get_node("UnitUI").hide()
    await wait(0.8)
    await hide_action_name(missingno)

    var prev_position = missingno.position
    var tween = get_tree().create_tween()
    tween.tween_property(missingno, "modulate", Color("ffffff00"), 0.5)
    tween.tween_property(missingno, "position", Vector2(80, 0) + target.position, 0.2)
    tween.tween_property(missingno, "modulate", Color("ffffff"), 0.8)
    await tween.finished

    await wait(0.3)


    tween = get_tree().create_tween()
    tween.tween_property(target.get_node("UnitUI/EXP"), "modulate", Color("#ffffff"), 0.1)

    await wait(0.3)

    tween = get_tree().create_tween()
    tween.tween_property(missingno, "position", Vector2(20, 0) + missingno.position, 0.2)
    tween.tween_property(missingno, "position", Vector2(-30, 0) + missingno.position, 0.08)
    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(3, 5), 0.2)
    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.4)

    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(3, 5), 0.6)
    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.6)
    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(3, 5), 0.6)
    tween.tween_property(missingno.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.6)



    await wait(0.2)
    target.blink.play("hurt")

    target.player.play("ot_exhausted")

    var tween2 = get_tree().create_tween()
    tween2.tween_property(target.get_node("UnitUI/EXP/ExpBar"), "scale", Vector2(0, 1), 0.8)
    await tween2.finished
    target.player.speed_scale = 0.4
    target.unit_dict["lv"] -= 1
    await level_down(target)


    await wait(0.6)







    tween = get_tree().create_tween()
    tween.tween_property(target.get_node("UnitUI/EXP"), "modulate", Color("#ffffff00"), 0.1)
    tween.tween_property(missingno, "modulate", Color("ffffff00"), 0.5)
    tween.tween_property(missingno, "position", prev_position, 0.2)
    tween.tween_property(missingno, "modulate", Color("ffffff"), 0.8)
    await tween.finished
    target.player.speed_scale = 1

func level_down(unit):
    unit.get_node("UnitUI/LvLabel").text = "lv{0}".format([unit.unit_dict["lv"]])
    unit.get_node("UnitUI/EXP/ExpBar/ExpShadow").visible = false

    unit.get_node("UnitUI/EXP/Label").text = "LEVEL DOWN"
    unit.get_node("UnitUI/EXP/Label").scale = Vector2(1, 1)
    for i in range(6):
        unit.get_node("UnitUI/EXP/Label").modulate = Color("#ffffff")
        unit.get_node("UnitUI/EXP/ExpBar").color = Color("#ffffff")
        await wait(0.06)
        unit.get_node("UnitUI/EXP/Label").modulate = Color("fa4848ff")
        unit.get_node("UnitUI/EXP/ExpBar").color = Color("#fa4848ff")
        await wait(0.06)

    unit.get_node("UnitUI/EXP/ExpBar").color = Color("#4992fb")

    await wait(0.1)
    unit.get_node("UnitUI/EXP/Label").modulate = Color("#4992fb")
    unit.get_node("UnitUI/EXP/Label").scale = Vector2(0, 1)
    unit.get_node("UnitUI/EXP/Label").text = "LEVEL UP"

    unit.get_node("UnitUI/EXP/ExpBar/ExpShadow").visible = true








func play_ai_turn(unit):


    AI_find_most_damage(unit)

    unit_action(unit, current_target_unit)

func AI_find_most_damage(unit):
    var unit_atk1 = moves.active[unit.atk1]
    var unit_atk2 = moves.active[unit.atk2]
    ai_highest_damage_memory = [-99999999999999999, "unit_atk1", [Node]]



    if unit.ap >= unit_atk1["cost"]:
        AI_test_atk_slot(unit, unit_atk1)

    if unit.ap >= unit_atk2["cost"]:
        AI_test_atk_slot(unit, unit_atk2)





    var atk1 = moves.active[unit.atk1]
    var atk2 = moves.active[unit.atk2]

    var cheaper_move = atk1
    if atk2["cost"] < atk1["cost"]: cheaper_move = atk2

    if ai_highest_damage_memory[1] is not String:
        if ai_highest_damage_memory[1]["target"] != "team":
            if cheaper_move["cost"] <= unit.ap:
                var previous_damage = ai_highest_damage_memory.duplicate()
                ai_highest_damage_memory = [-99999999999999999, "unit_atk1", [Node]]
                AI_test_atk_slot(unit, cheaper_move)

                if ai_highest_damage_memory[0] < ai_highest_damage_memory[2][0].cur_hp:
                    ai_highest_damage_memory = previous_damage
                    current_target_unit = ai_highest_damage_memory[2]
                    ai_chosen_move = ai_highest_damage_memory[1]
                    unit.selected_attack = ai_highest_damage_memory[1]






























    if ai_highest_damage_memory[1] is String:


        AI_test_atk_slot(unit, moves.active["struggle"])









    unit.selected_attack = moves.active.find_key(ai_highest_damage_memory[1])

func AI_test_atk_slot(unit, atk_slot):
    if atk_slot["target"] == "single":
        AI_test_single_atk(unit, atk_slot)

    if atk_slot["target"] == "row":
        AI_test_row_atk(unit, atk_slot)

    if atk_slot["target"] == "column":
        AI_test_column_atk(unit, atk_slot)

    if atk_slot["target"] == "any":
        AI_test_any_atk(unit, atk_slot)

    if atk_slot["target"] == "team":
        AI_test_team_atk(unit, atk_slot)

    if atk_slot["target"] == "self":
        AI_test_self_atk(unit, atk_slot)

    if atk_slot["target"] == "ally":
        AI_test_ally_atk(unit, atk_slot)

    if atk_slot["target"] == "all":
        AI_test_all_atk(unit, atk_slot)

func AI_test_single_atk(unit, tested_atk):
    var target_team = enemy_team
    if unit.team == 2: target_team = player_team


    var targetable_slots = target_team.slice(0, 3)
    var front_row_inv = front_row_invulnerable(targetable_slots)



    if targetable_slots == [null, null, null] or front_row_inv:
        targetable_slots = target_team.slice(3, 6)


    targetable_slots.shuffle()

    for i in targetable_slots:
        if i == null: continue
        var cur_test = calculate_damage(tested_atk, unit, i)


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)

        if cur_test[0] > ai_highest_damage_memory[0]:
            ai_highest_damage_memory = [cur_test[0], tested_atk, [i]]

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_row_atk(unit, tested_atk):
    var target_team = enemy_team

    if unit.team == 2: target_team = player_team

    var targetable_slots = target_team.slice(0, 3)
    var front_row_inv = front_row_invulnerable(targetable_slots)



    if targetable_slots == [null, null, null] or front_row_inv:
        targetable_slots = target_team.slice(3, 6)


    var cur_test = 0

    targetable_slots.shuffle()
    for i in targetable_slots:
        if i == null: continue
        cur_test += calculate_damage(tested_atk, unit, i)[0]


        cur_test += AI_calculate_action_effect_damage(unit, tested_atk, i)

    if cur_test > ai_highest_damage_memory[0]:
        ai_highest_damage_memory = [cur_test, tested_atk, targetable_slots]

        while null in ai_highest_damage_memory[2]:
            ai_highest_damage_memory[2].erase(null)

    current_target_unit = ai_highest_damage_memory[2]

    ai_chosen_move = ai_highest_damage_memory[1]

func AI_test_column_atk(unit, tested_atk):
    var target_team = enemy_team
    if unit.team == 2: target_team = player_team

    var targetable_slots = target_team.slice(0, 3)
    var front_row_inv = front_row_invulnerable(targetable_slots)
    var targeted_back = false


    if targetable_slots == [null, null, null] or front_row_inv:
        targetable_slots = target_team.slice(3, 6)
        targeted_back = true


    targetable_slots.shuffle()
    for i in targetable_slots:
        if i == null: continue
        var cur_test = calculate_damage(tested_atk, unit, i)


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)


        if not targeted_back and target_team[i.team_slot - 4] != null:
            cur_test[0] += calculate_damage(tested_atk, unit, target_team[i.team_slot - 4])[0]


            cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, target_team[i.team_slot - 4])

        if cur_test[0] > ai_highest_damage_memory[0]:
            ai_highest_damage_memory = [cur_test[0], tested_atk, [i]]


            if not targeted_back and target_team[i.team_slot - 4] != null:
                ai_highest_damage_memory[2].append(target_team[i.team_slot - 4])

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_any_atk(unit, tested_atk):
    var target_team = enemy_team
    if unit.team == 2: target_team = player_team

    var targetable_slots = target_team.slice(0, 6)







    targetable_slots.shuffle()
    for i in targetable_slots:
        if i == null: continue
        var cur_test = calculate_damage(tested_atk, unit, i)


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)
        if cur_test[0] > ai_highest_damage_memory[0]:
            ai_highest_damage_memory = [cur_test[0], tested_atk, [i]]

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_team_atk(unit, tested_atk):
    var target_team = enemy_team
    if unit.team == 2: target_team = player_team

    var targetable_slots = target_team.slice(0, 6)

    var cur_test = [1, tested_atk.color, 1]

    for i in targetable_slots:
        if i == null: continue
        cur_test[0] += calculate_damage(tested_atk, unit, i)[0]


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)

    if cur_test[0] > ai_highest_damage_memory[0]:
        ai_highest_damage_memory = [cur_test[0], tested_atk, target_team.duplicate()]

    while null in ai_highest_damage_memory[2]:
            ai_highest_damage_memory[2].erase(null)

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_ally_atk(unit, tested_atk):
    var target_team = player_team
    if unit.team == 2: target_team = enemy_team

    var targetable_slots = target_team.slice(0, 6)







    targetable_slots.shuffle()
    for i in targetable_slots:
        if i == null: continue
        var cur_test = calculate_damage(tested_atk, unit, i)


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)

        if cur_test[0] > ai_highest_damage_memory[0]:
            ai_highest_damage_memory = [cur_test[0], tested_atk, [i]]

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_all_atk(unit, tested_atk):
    var target_team = units_in_play


    var targetable_slots = target_team.slice(0, 6)







    targetable_slots.shuffle()
    for i in targetable_slots:
        if i == null: continue
        var cur_test = calculate_damage(tested_atk, unit, i)


        cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, i)

        if cur_test[0] > ai_highest_damage_memory[0]:
            ai_highest_damage_memory = [cur_test[0], tested_atk, [i]]

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_test_self_atk(unit, tested_atk):
    var cur_test = [-1]

    cur_test[0] += AI_calculate_action_effect_damage(unit, tested_atk, unit)

    if cur_test[0] > ai_highest_damage_memory[0]:
        ai_highest_damage_memory = [cur_test[0], tested_atk, [unit]]

    current_target_unit = ai_highest_damage_memory[2]
    ai_chosen_move = ai_highest_damage_memory[1]
    unit.selected_attack = ai_highest_damage_memory[1]

func AI_calculate_action_effect_damage(unit, tested_atk, target):
    if target == null: return 0
    var bonus_damage = 0

    if target.burn_amount > 0:
        var burn_damage = roundi(target.max_hp * (target.burn_amount / 100))
        if burn_damage >= target.cur_hp:
            bonus_damage -= 200

    var cur_test = calculate_damage(tested_atk, unit, target)
    if cur_test[0] >= target.cur_hp:
        if target.ap > 0:
            bonus_damage += 100



    for effect in tested_atk["effect"]:
        if effect == moves.deal_damage:
            if target.recorded_data["dodges"] > 90:
                bonus_damage += -300

        if effect == moves.add_burn_10:
            bonus_damage += round(target.max_hp * 0.1)

        if effect == moves.add_burn_15:
            bonus_damage += round(target.max_hp * 0.15)

        if effect == moves.add_burn_20:
            bonus_damage += round(target.max_hp * 0.2)

        if effect == moves.add_burn_30:
            bonus_damage += round(target.max_hp * 0.3)

        if effect == moves.add_burn_40:
            bonus_damage += round(target.max_hp * 0.4)

        if effect == moves.splash_burn_10:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            for i in [target]:
                var adjacent_allies_indexes = moves.get_adjacent_allies(i)

                for k in target_team:
                    if k == null: continue
                    if k.team_slot in adjacent_allies_indexes:
                        bonus_damage += round(target.max_hp * 0.1)

        if effect == moves.splash_25:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            for i in [target]:
                var adjacent_allies_indexes = moves.get_adjacent_allies(i)

                for k in target_team:
                    if k == null: continue
                    if k.team_slot in adjacent_allies_indexes:
                        bonus_damage += calculate_damage({"power": 25, "color": tested_atk["color"]}, unit, target)[0]

        if effect == moves.splash_30:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            for i in [target]:
                var adjacent_allies_indexes = moves.get_adjacent_allies(i)

                for k in target_team:
                    if k == null: continue
                    if k.team_slot in adjacent_allies_indexes:
                        bonus_damage += calculate_damage({"power": 40, "color": tested_atk["color"]}, unit, target)[0]

        if effect in [moves.lower_speed_10, moves.lower_speed_20, moves.lower_speed_40, moves.lower_speed_100]:
            if target.speed + target.temp_speed > 50:
                bonus_damage += 99

        if effect == moves.chain:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            var adjacent_allies_indexes = moves.get_adjacent_allies(target)
            var adjacent_allies = []

            for k in target_team:
                if k == null: continue
                if k.team_slot in adjacent_allies_indexes:
                    adjacent_allies.append(k)

            for k in adjacent_allies:
                bonus_damage += calculate_damage(tested_atk, unit, k)[0]

        if effect == moves.double_dmg_less_30_speed:
            if target.speed < unit.speed - 31:
                bonus_damage += calculate_damage(tested_atk, unit, target)[0]

        if effect == moves.double_dmg_less_50pc_hp:
            if target.cur_hp <= target.max_hp * 0.5:
                bonus_damage += calculate_damage(tested_atk, unit, target)[0]

        if effect == moves.night_shade:
            bonus_damage += 40 * (target.rarity - 1)

        if effect == moves.rollout_count:
            if unit.recorded_data.has("rollout"):
                bonus_damage += 15 * unit.recorded_data["rollout"]

        if effect == moves.bonus_dmg_cur_hp_50:
            bonus_damage += (target.cur_hp * 0.5)

        if effect == moves.add_atk:
            bonus_damage += calculate_damage(tested_atk, unit, target)[0]

        if effect == moves.add_2_atk:
            bonus_damage += (calculate_damage(tested_atk, unit, target)[0]) * 2

        if effect == moves.add_comet_atk:
            bonus_damage += (calculate_damage(tested_atk, unit, target)[0]) * 3




        if effect == moves.pull:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            if target.team_slot in [4, 5, 6] and target_team[target.team_slot - 4] == null:
                bonus_damage += 50

        if effect in [moves.shove, moves.vice_grip]:
            var target_team = enemy_team
            if unit.team == 2: target_team = player_team

            if target.team_slot in [1, 2, 3] and target_team[target.team_slot + 2] == null:
                bonus_damage += 50

        if effect in [moves.heal_50pc, moves.wish_charge]:
            if unit.cur_hp <= unit.max_hp * 0.6:
                bonus_damage += 99999999

        if effect in [moves.harden, moves.splash, moves.metronome]:
                bonus_damage += 99999999

        if effect == moves.lower_def_20:
            if target.defense > 1:
                bonus_damage += 100

        if effect == moves.move_transform:
            if target.unit_name in ["Ditto", "Mew", "Smeargle"]:
                bonus_damage += -9999
            bonus_damage += target.power + target.speed + (20 * target.rarity)

        if effect == moves.soft_boiled:
            var own_team = moves.get_own_team(unit)
            var adjacent_indexes = moves.get_adjacent_allies(unit)
            for i in own_team:
                if i == null: continue
                if i.cur_hp < i.max_hp * 0.6 and i.team_slot in adjacent_indexes:
                    bonus_damage = 9999999
                    break

        if effect == moves.protect:
            if unit.team_slot in [1, 2, 3] or moves.get_own_team(unit).slice(0, 3) == [null, null, null]:
                if unit.recorded_data["AI_protected"]:
                    bonus_damage = 10
                else:
                    bonus_damage = 9999999
            else:
                if unit.passive in ["cover", "wall"] and not unit.recorded_data["AI_protected"]:
                    bonus_damage = 9999999

        if effect == moves.gyro_ball:
            bonus_damage -= 120 * (unit.speed / 100)

        if effect == moves.sketch:
            if target.unit_name == "Smeargle":
                bonus_damage += -9999
            bonus_damage += target.rarity

        if effect == moves.nullify_protect:
            if target.recorded_data["protect"] > 0:
                bonus_damage += 9999999

        if effect == moves.double_damage_to_blue:
            if target.color == "blue":
                bonus_damage += calculate_damage(tested_atk, unit, target)[0]

        if effect == moves.frontrow_heal_30pc:
            if unit.team_slot < 4:
                if unit.cur_hp < unit.max_hp * 0.6:
                    bonus_damage += 50

        if effect in [moves.target_heal_40pc]:
            if target.cur_hp < target.max_hp * 0.6:
                bonus_damage += 100





    return bonus_damage








func get_effective_speed(node: Node) -> float:
    var effective_speed = node.speed + node.temp_speed

    if node.team_slot > 3:
        effective_speed *= 0.7

    return effective_speed

func sort_by_speed(nodes: Array) -> void :


















    var n: int = nodes.size()
    var swapped: bool = true

    while swapped:
        swapped = false

        for i in n - 1:
            var speed_a = get_effective_speed(nodes[i])
            var speed_b = get_effective_speed(nodes[i + 1])

            var condition = speed_a < speed_b
            if trick_room:
                condition = speed_a > speed_b

            if condition:
                var temp: Node = nodes[i]
                nodes[i] = nodes[i + 1]
                nodes[i + 1] = temp
                swapped = true


    units_in_play = nodes

    var waiting_units = []


    for i in units_in_play:
        if i.waiting:
            waiting_units.append(i)


    for i in waiting_units:
        units_in_play.erase(i)



    for i in waiting_units:
        var next_ally = null

        for k in units_in_play:
            if k.team == i.team and not k.waiting and not k.played_turn:
                next_ally = units_in_play.find(k)
                break

        if next_ally == null:
            units_in_play.append(i)
        else:
            units_in_play.insert(next_ally + 1, i)








func get_next_turn():
    for i in units_in_play:
        if i.played_turn == false:
            return i

func remove_unit(unit):
    if unit.team == 1:
        player_team[player_team.find(unit)] = null
    else:
        enemy_team[enemy_team.find(unit)] = null
    units_in_play.erase(unit)









func calculate_damage(action, unit, individual_target):
    var affinity = 1
    var color = "none"


    var damage = sqrt(action["power"]) * (sqrt(unit.power * 3)) * 0.5
    damage *= damage_mod
    damage += damage_flat

    if action["color"] == "none":
        color = unit.color
    else:
        color = action["color"]



    if action.has("cost") and action["cost"] == 1:
        damage *= 0.75
    elif action.has("cost") and action["cost"] == 3:
        damage *= 1.15
    elif action.has("cost") and action["cost"] > 3:
        damage *= 1.2

    if action.has("target") and action["target"] == "team":
        damage *= 0.7
    elif action.has("target") and action["target"] == "row":
        damage *= 0.85

    var burn_effects = [moves.add_burn_10, moves.add_burn_15, moves.add_burn_20, moves.add_burn_30, moves.add_burn_40]

    if action.has("effect"):
        for i in action["effect"]:
            if i in burn_effects:
                damage *= 0.85
                break

    affinity = poke_types.affinity[individual_target.color][color]
    damage *= affinity

    damage /= (individual_target.defense + individual_target.temp_defense)

    if damage < 1: damage = 0

    return [roundi(damage), color, affinity]

func deal_damage(unit):
    var action = moves.active[unit.selected_attack]
    var target = current_target_unit

    for i in target:
        if i == null: continue

        if i.max_hp < 1:
            i.max_hp = 1
            i.cur_hp = 1

        if i.cur_hp < 1: continue
        if i.unit_immune: continue

        if i.recorded_data["dodges"] > 0:
            if i.recorded_data.has("dark_illusion") and i.recorded_data["dark_illusion"]:
                if i.position != i.home_coords:
                    i.player.stop()
                    if action["dmg_motion"] != "none":
                        i.player.play(action["dmg_motion"])

                    await suffer_damage(i, calculate_damage(action, unit, i))
                    continue
            dodge(i)
            continue

        if i.recorded_data["protect"] > 0:
            protect(i)
            continue

        i.player.stop()
        if action["dmg_motion"] != "none":
            i.player.play(action["dmg_motion"])
        var damage = calculate_damage(action, unit, i)

        await suffer_damage(i, damage)

func suffer_damage(unit, damage):
    if unit.get_node("AnimationPlayer").get_current_animation() == "ht_frozen":
        await wait(1.28)

    unit.cur_hp -= damage[0]
    unit.cur_hp = floor(unit.cur_hp)
    unit.blink.play("hurt")
    unit.popup_damage(damage[0], damage[1], damage[2])

    healthbar_damage(unit)

    unit.audio.stop()
    if damage[2] == 1:

        unit.audio.stream = load("res://Files/SoundEffects/Battle/Hit_Normal_Damage.mp3")
        unit.audio.play()

    elif damage[2] < 1:

        unit.audio.stream = load("res://Files/SoundEffects/Battle/Hit_Weak_Not_Very_Effective.mp3")
        unit.audio.play()

    elif damage[2] > 1:

        unit.audio.stream = load("res://Files/SoundEffects/Battle/Hit_Super_Effective.mp3")
        unit.audio.play()

    if unit.cur_hp < 1.0 or unit.cur_hp == 0:
        await unit_death(unit)

func dodge(unit):

    unit.recorded_data["dodges"] -= 1
    unit.popup_damage("dodge", "none", 1)
    unit.unit_immune = true

    if unit.recorded_data.has("dark_illusion") and unit.recorded_data["dark_illusion"]:
        unit.player.play("dg_illusion")
        unit.recorded_data["dark_illusion"] = false
    else:
        unit.player.play("dg_duck")

func protect(unit):

    unit.recorded_data["protect"] -= 1
    unit.popup_damage("block", "none", 1)
    unit.unit_immune = true
    unit.player.play("dg_protect")

func healthbar_damage(unit):
    var speed = 0.1
    var damage_ratio = unit.cur_hp / unit.max_hp
    if unit.cur_hp > 0.9 and damage_ratio < 0.01: damage_ratio = 0.01
    if damage_ratio > 1.0: damage_ratio = 1
    if damage_ratio < 0.0: damage_ratio = 0

    var tween = get_tree().create_tween()
    tween.tween_property(unit.healthbar, "scale", Vector2(damage_ratio, 1), speed)

    update_healthbar_shadow(unit)
    await wait(speed)

func update_healthbar_shadow(unit):
    await wait(0.4)
    var tween = get_tree().create_tween()
    tween.tween_property(unit.healthbar_shadow, "scale", unit.healthbar.scale, 0.1)

func unit_death(unit):
    effect_triggering = true
    await trigger_effects(unit, "on_death")
    effect_triggering = false

    if unit.cur_hp > 0: return
    remove_unit(unit)

    await wait(0.01)
    unit.player.play("ot_death")


    await trigger_on_death_effects(unit)

func trigger_effects(unit, effect_type):
    for i in effects_in_play[effect_type]:
        if i[0] == unit:
            if unit.cur_hp > 0 or (effect_type == "on_death" and unit.cur_hp < 1):
                await i[1].call(unit)

func apply_burn(target, amount):
    await wait(0.2)

    for i in target:
        if i == null: continue
        if i.cur_hp < 1: continue
        if i.recorded_data["dodges"] > 0 or i.recorded_data["protect"] > 0: continue
        if i.recorded_data["burn_immunity"]:
            show_action_name(i, "Burn Immune")
            continue
        show_action_name(i, "Burned")
        i.burn_amount += amount
        i.blink.play("burn")

        i.get_node("UnitUI/Burn/Label").text = str(int(i.burn_amount))
        i.get_node("UnitUI/Burn").visible = true

        for k in range(3):
            var tween = get_tree().create_tween()
            tween.tween_property(i.get_node("UnitUI/Burn/Label"), "scale", Vector2(2, 2), 0.05)
            tween.tween_property(i.get_node("UnitUI/Burn"), "position", Vector2(4, 0), 0.05)
            tween.tween_property(i.get_node("UnitUI/Burn"), "position", Vector2(0, 0), 0.05)
            tween.tween_property(i.get_node("UnitUI/Burn/Label"), "scale", Vector2(1, 1), 0.2)

    await wait(0.4)

    for i in target:
        hide_action_name(i)

    await wait(0.4)

func suffer_burn(unit = current_act_unit):
    if unit == null: return
    if unit.burn_amount < 1 or unit.cur_hp < 1: return

    if not unit.recorded_data["flame_body"]:
        show_action_name(unit, "Burned")
        await wait(0.4)
        hide_action_name(unit)

        unit.audio.stop()
        unit.audio.stream = load("res://Files/SoundEffects/Battle/Hit_Normal_Damage.mp3")
        unit.audio.play()

    var damage = roundi(unit.max_hp * (unit.burn_amount / 100))

    if unit.unit_name == "MISSINGNO.": damage *= 3

    if not unit.recorded_data["flame_body"]:
        unit.cur_hp -= damage
        unit.blink.play("hurt")
        unit.player.play("ht_flinched")
        unit.popup_damage(damage, "none", 1)

    else:
        show_action_name(unit, "Flame Body")
        await wait(0.6)
        unit.cur_hp += clamp(int(damage * 0.6), 0, unit.max_hp)
        unit.blink.play("heal")
        unit.popup_damage(damage, "none", -1)
        await wait(0.3)
        hide_action_name(unit)

    if not unit.recorded_data["perma_burned"]:
        unit.burn_amount = 0.0

    await healthbar_damage(unit)

    for k in range(3):
        var tween = get_tree().create_tween()
        tween.tween_property(unit.get_node("UnitUI/Burn/Label"), "scale", Vector2(2, 2), 0.05)
        tween.tween_property(unit.get_node("UnitUI/Burn"), "position", Vector2(4, 0), 0.05)
        tween.tween_property(unit.get_node("UnitUI/Burn"), "position", Vector2(0, 0), 0.05)
        tween.tween_property(unit.get_node("UnitUI/Burn/Label"), "scale", Vector2(1, 1), 0.1)
    await wait(0.25)
    if not unit.recorded_data["perma_burned"]:
        unit.get_node("UnitUI/Burn").visible = false
    if unit.cur_hp < 1:
        await unit_death(unit)

    await wait(0.6)






func trigger_before_attack_effects(unit, target):

    for i in target:
        await trigger_effects(i, "before_attacked")
    if unit.cur_hp < 1:
        return


    for i in units_in_play:
        if i.team == unit.team and i != unit:
            await trigger_effects(i, "before_ally_attacking")
    if unit.cur_hp < 1:
        return


    for i in units_in_play:
        if i.team != unit.team and i not in target:
            await trigger_effects(i, "before_ally_attacked")
    if unit.cur_hp < 1:
        return


    await trigger_effects(unit, "before_attacking")
    if unit.cur_hp < 1:
        return

func trigger_after_attack_effects(unit, _target):
    await trigger_effects(unit, "after_attacking")
    if unit.cur_hp < 1:
        return


    for i in current_target_unit:
        await trigger_effects(i, "after_attacked")
    if unit.cur_hp < 1:
        return

func trigger_after_retreat_effects(unit, target):
    for i in units_in_play:
        if i.team == unit.team and i != unit:
            await trigger_effects(i, "after_ally_attacking")
    if unit.cur_hp < 1:
        return


    for i in units_in_play:
        if i.team != unit.team and i not in target:
            await trigger_effects(i, "after_ally_attacked")
    if unit.cur_hp < 1:
        return

func trigger_on_death_effects(unit):
    for i in units_in_play:
        if i == unit or i.team == unit.team: continue
        await trigger_effects(i, "on_enemy_death")

    for i in units_in_play:
        if i == unit or i.team != unit.team: continue
        await trigger_effects(i, "on_ally_death")






@onready var bf_map
@onready var map_grid
@onready var map_player

var bf_path = [0, 15, 16, 1, 2, 17, 18, 3, 4, 19, 20, 5, 6, 21, 22, 7, 8, 23, 24, 9, 10, 25, 26, 11, 12, 27, 28, 13, 14, 29]
var map_player_position = 0
var facing_direction = "down"


func update_bf_map():
    var cur_index = globals.player_data.battles_fought - 1

    if bf_path[cur_index - 1] == bf_path[cur_index] - 15:
        map_player.get_node("AnimationPlayer").play("walk_down")
    elif bf_path[cur_index - 1] == bf_path[cur_index] - 1:
        map_player.get_node("AnimationPlayer").play("walk_right")
    elif bf_path[cur_index - 1] == bf_path[cur_index] + 15:
        map_player.get_node("AnimationPlayer").play("walk_up")

    map_grid.get_child(bf_path[cur_index - 1]).get_node("LowerGrass").hide()
    map_grid.get_child(bf_path[cur_index - 1]).get_node("UpperGrass").hide()

    var tween = get_tree().create_tween()
    tween.tween_property(map_player, "position", map_grid.get_child(bf_path[cur_index]).global_position + Vector2(16, 16), 1.6)
    await tween.finished
    animate_stop_walk()

func animate_stop_walk():
    map_player.get_node("AnimationPlayer").stop()
    await wait(0.3)
    map_player.get_node("Sprite2D").frame = 5


















var mewtwo_swaying = true
var player_forfeit = false
var mewtwo
var mew_node = null
var mew_present = false
var mew_state = "absent"
var final_battle = false

func mewtwo_event():
    get_mewtwo()

    await wait(1)
    mewtwo.z_index = 80
    mewtwo.get_node("UnitUI").hide()


    if player_team == [null, null, null, null, null, null]:
        player_forfeit = true
        await speak(mewtwo, ["What?!", 
                            "Why did you give up?", "That's no fun..."])
        mewtwo.get_node("UnitUI").modulate = Color("ffffff")
        return



    await speak(mewtwo, ["Huh, the team you've built is pretty strong.", 
    "No wonder you've beaten %s's ass." % globals.hotel.champion])


    for i in globals.player_data.player_box:
        if i["species"] == "mew":
            mew_present = true

    if mew_present:
        await wait(0.2)
        await speak(mewtwo, ["Wait, what?!", "How did you find Mew?", "Even though I made sure to Dexit them...", 
        "Well, I guess I'll roll with it."
        ])

    await wait(0.2)

    await speak(mewtwo, ["Battling against a single opponent...", "I guess that would be kinda boring, wouldn't it?"])

    mewtwo.player.play("mewtwo_hover")
    await mewtwo.player.animation_finished
    mewtwo_sway(mewtwo)

    await wait(1)
    await speak(mewtwo, ["Hm..."])
    await speak(mewtwo, ["Oh, I know.", "Let's see how you handle this!"])

    await mewtwo_shoot()

    if not mew_present:
        var tween = get_tree().create_tween()
        tween.tween_property(mewtwo, "position", mewtwo.position + Vector2(10, 0), 0.2)
        await wait(0.3)

        units_in_play.erase(mewtwo)
        enemy_team = [null, null, null, null, null, null]

        globals.player_data.enemy_party = globals.player_data.player_party.duplicate()
        await setup_team(globals.player_data.enemy_party, 1)

        var cont = 0
        for i in enemy_team:
            if i == null: continue

            var cur_proj = get_node("MewtwoProjectile").get_child(cont)
            var tween2 = get_tree().create_tween()
            tween2.tween_property(cur_proj, "position", i.position + Vector2(0, -50), 0.3)
            cont += 1

        tween = get_tree().create_tween().set_trans(Tween.TRANS_CIRC)
        tween.tween_property(mewtwo, "position", mewtwo.position + Vector2(-320, 0), 1)
        await wait(0.8)
        play_sound(load("res://Files/SoundEffects/Cutscenes/mewtwo_transform.mp3"))
        for i in enemy_team:
            if i == null: continue
            i.modulate = Color("#ffffff00")
            i.get_node("Sprite/Sprite2D").self_modulate = Color("#ea94ff")

            i.visible = true
            var mewtwo_tween = get_tree().create_tween()
            mewtwo_tween.tween_property(i, "modulate", Color("#ffffff"), 0.6)

            i.get_node("Card/CardSprite").position = Vector2(0, 14)

        for i in get_node("MewtwoProjectile").get_children():
            tween = get_tree().create_tween()
            tween.tween_property(i, "modulate", Color("#ffffff00"), 0.6)

        await wait(1.4)

        await speak(mewtwo, ["That's pretty funny, right?", "Remember this from my movie?!", "Come on! Let me see if you can handle my clones!"])

    else:
        final_battle = true
        await wait(1)
        await speak(mewtwo, ["What?!", "You weren't even supposed to be in this game!"])
        await wait(0.3)
        await speak(mewtwo, ["Dammit...", "... Fine."])
        mewtwo_swaying = false
        await wait(1)
        mewtwo.player.play_backwards("mewtwo_hover")

        await mewtwo.player.animation_finished

        await speak(mewtwo, ["I'll do it myself!"])

        return_units_out_of_place()
        var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "position", Vector2(0, 0), 0.3)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "rotation_degrees", 0, 0.3)

        if mew_state == "box":
            mew_node.player.play_backwards("ot_spawn")

        await wait(0.2)
        mew_node.get_node("UnitUI").show()
        mew_node.z_index = 0

        effects_in_play["on_death"].append([mewtwo, moves.mewtwo_death])
        mewtwo.get_node("UnitUI").show()

func mewtwo_won_pre_battle():
    enemy_hp = mewtwo.max_hp
    final_battle = true
    await speak(mewtwo, ["Heh, you're pretty good!", "But now I'm fired up myself!"])

    for i in enemy_team:
        if i == null: continue
        i.get_node("AnimationPlayer").play_backwards("ot_spawn")
        units_in_play.erase(i)


    var tween = get_tree().create_tween()
    tween.tween_property(mewtwo, "position", mewtwo.position + Vector2(320, 0), 1)
    mewtwo_swaying = false
    await wait(1)
    mewtwo.player.play_backwards("mewtwo_hover")
    await mewtwo.player.animation_finished
    await speak(mewtwo, ["It's not over yet!"])
    units_in_play.append(mewtwo)
    enemy_team = [null, mewtwo, null, null, null, null]
    effects_in_play["on_death"].append([mewtwo, moves.mewtwo_death])
    mewtwo.get_node("UnitUI").show()

    sort_by_speed(units_in_play)
    start_unit_turn(get_next_turn())

func mewtwo_lost_pre_battle():
    if player_forfeit:
        await mewtwo_fly_away()
        return

    await speak(mewtwo, ["Wait, was that actually too hard?", "Damn... Now I feel bad."])

    await mewtwo_fly_away()

func mewtwo_won():
    await wait(0.6)
    mewtwo.get_node("UnitUI").hide()
    await speak(mewtwo, ["Psh..."])
    await mewtwo_fly_away()

func mewtwo_fly_away():


    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", 0, 0.2)
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "position", mewtwo.get_node("Sprite/Sprite2D").position + Vector2(0, 10), 0.2)
    await wait(0.35)

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(mewtwo.get_node("Sprite/Shadow"), "modulate", Color("ffffff00"), 0.1)
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "position", mewtwo.get_node("Sprite/Sprite2D").position + Vector2(0, -500), 0.1)
    await tween.finished

func get_mewtwo():
    for i in units_in_play:
        if i.unit_name == "Mewtwo" and i.team == 2:
            mewtwo = i
            break

func mewtwo_sway(node):
    var tween2
    mewtwo_swaying = true
    while mewtwo_swaying:
        tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
        tween2.tween_property(node.get_node("Sprite"), "position", Vector2(4, 0), 1)

        await tween2.finished

        if not mewtwo_swaying: return
        tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
        tween2.tween_property(node.get_node("Sprite"), "position", Vector2(-4, 0), 1)

        await tween2.finished

func mewtwo_shoot():
    if mew_present:
        mew_state = "box"
        for i in globals.player_data.player_party:
            if i == null: continue
            if i["species"] == "mew":
                mew_state = "party"

                for k in player_team:
                    if k == null: continue
                    if k.unit_name == "Mew":
                        mew_node = k
                        break
                break

    await wait(0.3)

    var projectiles = []
    var proj_group = Node2D.new()
    proj_group.z_index = 21
    proj_group.name = "MewtwoProjectile"
    add_child(proj_group)

    mewtwo.get_node("AudioPlayer").stream = load("res://Files/SoundEffects/Cutscenes/mewtwo_spawn_proj.mp3")
    mewtwo.get_node("AudioPlayer").play()
    for i in range(6 - player_team.count(null)):
        var cur_proj = load("res://Files/Scenes/Battle/mewtwo_projectile.tscn").instantiate()
        cur_proj.position = mewtwo.position + Vector2(0, -260)
        cur_proj.modulate = Color("#ffffff00")
        projectiles.append(cur_proj)
        get_node("MewtwoProjectile").add_child(cur_proj)
        cur_proj.get_node("Particle").emitting = true
        var proj_tween = get_tree().create_tween()
        proj_tween.tween_property(cur_proj, "modulate", Color("ffffff"), 0.2)


    var targets = []
    for k in player_team:
        if k != null and k not in targets:
            targets.append(k)

    await wait(0.3)

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", -22, 0.3)

    await wait(0.5)

    tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", 20, 0.2)

    if mew_node != null:
        units_out_of_place.append(mew_node)
        mew_node.z_index = 20
        mew_node.get_node("UnitUI").hide()
        tween.tween_property(mew_node, "position", Vector2(960 - 100, 470), 0.2)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "position", Vector2(0, -80), 0.2)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "rotation_degrees", -14, 0.2)

    elif mew_state == "box":
        mew_node = load("res://Files/Scenes/Battle/UnitScene.tscn").instantiate()
        mew_node.position = Vector2(860, 470)
        mew_node.get_node("UnitUI").hide()
        mew_node.get_node("Sprite/Sprite2D").frame = 199
        mew_node.get_node("Sprite/Sprite2D").scale = Vector2(2, 0)
        mew_node.get_node("Sprite/Sprite2D/BlinkTexture").color = Color("ffffff")
        get_node("UnitField").add_child(mew_node)
        mew_node.get_node("Card/CardSprite").modulate = Color(poke_types.colors["white"][3])
        mew_node.get_node("Card/CardSprite2").modulate = Color(poke_types.colors["white"][3])
        tween.tween_property(mew_node.get_node("Card/CardSprite"), "position", Vector2(14, 18), 0.2)
        tween.tween_property(mew_node.get_node("Card/CardSprite"), "self_modulate", Color("ffffff"), 0.05)
        await wait(0.1)

        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.2)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "position", Vector2(0, -80), 0.2)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "rotation_degrees", -14, 0.2)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("ffffff00"), 0.2)
        tween.tween_property(mew_node.get_node("Card/CardSprite"), "self_modulate", Color("ffffff00"), 0.2)

    await wait(0.2)
    play_sound(load("res://Files/SoundEffects/Cutscenes/mewtwo_projectile.mp3"))
    if mew_node != null:
        mewtwo_sway(mew_node)
    tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", 40, 0.05)
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", -50, 0.05)
    tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", -10, 0.5)

    await wait(0.1)

    if not mew_present:
        for i in projectiles:
            var tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN)
            tween2.tween_property(i, "position", targets[projectiles.find(i)].position + Vector2(0, -50), 0.2)
        await wait(0.2)

        for i in player_team:
            if i == null: continue
            i.player.play("ht_flinched")
            i.blink.play("hurt")
            i.get_node("AudioPlayer").stream = load("res://Files/SoundEffects/Battle/Hit_Normal_Damage.mp3")
            i.get_node("AudioPlayer").play()

        for i in projectiles:
            var tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN)
            tween2.tween_property(i.get_node("Particle").process_material, "color", Color("#ffffff"), 0.2)
            tween2.tween_property(i.get_node("Particle"), "modulate", Color(poke_types.colors[targets[projectiles.find(i)].color][2]), 0.2)

        await wait(1)

    else:
        targets = [mew_node.position + Vector2(-95, -60 - 140), 
                    mew_node.position + Vector2(-120, 0 - 140), 
                    mew_node.position + Vector2(-95, 60 - 140), ]

        for i in projectiles:
            var tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN)
            tween2.tween_property(i, "position", targets[projectiles.find(i)], 0.2)
        await wait(0.2)
        play_sound(load("res://Files/SoundEffects/Cutscenes/mew_block.mp3"))
        var mew_ball = load("res://Files/Scenes/Battle/mew_ball.tscn").instantiate()
        mew_ball.position = mew_node.get_node("Sprite/Sprite2D").position + Vector2(0, -18)
        mew_node.add_child(mew_ball)
        shake_ball(mew_ball)

        await wait(2)
        play_sound(load("res://Files/SoundEffects/Battle/Hit_Weak_Not_Very_Effective.mp3"))
        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(mew_ball, "scale", Vector2(0.8, 0.8), 0.1)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "rotation_degrees", 12, 0.1)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "rotation_degrees", -14, 0.3)

        for i in projectiles:
            var tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN)
            tween2.tween_property(i, "position", targets[projectiles.find(i)] + Vector2(20, 0), 0.2)
        await wait(0.2)


        await wait(1)

        var cont = 0
        var aux = [-300, 0, 300]

        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "scale", Vector2(5, 3), 0.3)

        await wait(1)
        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(mew_node.get_node("Sprite/Sprite2D"), "scale", Vector2(3, 5), 0.1)
        await wait(0.1)

        play_sound(load("res://Files/SoundEffects/Cutscenes/scratch.mp3"))
        var tween3 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
        tween3.tween_property(mew_ball, "scale", Vector2(2, 2), 0.1)
        tween3.tween_property(mew_node.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.2)
        tween3.tween_property(mew_ball, "modulate", Color("#ffffff00"), 0.6)

        for i in projectiles:
            var tween2 = get_tree().create_tween().set_ease(Tween.EASE_IN)
            tween2.tween_property(i, "position", targets[projectiles.find(i)] + Vector2(-1000, aux[cont]), 0.4)
            cont += 1
        await wait(0.1)

        mewtwo.blink.play("hurt")
        mewtwo.get_node("AudioPlayer").stream = load("res://Files/SoundEffects/Battle/Hit_Super_Effective.mp3")
        mewtwo.get_node("AudioPlayer").play()
        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
        tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", 6, 0.1)
        tween.tween_property(mewtwo, "position", mewtwo.position + Vector2(-80, 0), 0.1)
        await wait(0.2)
        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", -14, 0.1)
        tween.tween_property(mewtwo.get_node("Sprite/Sprite2D"), "rotation_degrees", -10, 0.2)

        await wait(0.1)

func shake_ball(ball):
    var shake = 0.02

    while true:
        if not is_instance_valid(ball): return
        ball.scale -= Vector2(shake, shake)
        await wait(0.04)
        if not is_instance_valid(ball): return
        ball.scale += Vector2(shake, shake)
        await wait(0.04)



var demi_fiend_node

func demi_fiend_battle():
    demi_fiend_node = globals.cutscenes.get_npc_node("Demi-Fiend").duplicate()
    demi_fiend_node.position = Vector2(650, -200)
    demi_fiend_node.scale = Vector2(1.5, 1.5)
    get_node("UnitField").add_child(demi_fiend_node)

    if player_team.count(null) >= 5: return

    var target = [null, 9]
    var targeted_row = player_team.slice(0, 3)
    if targeted_row == [null, null, null]:
        targeted_row = player_team.slice(3, 6)


    for i in targeted_row:
        if i == null: continue
        if i.rarity < target[1]:
            target = [i, i.rarity]

    if target[0] == null: return
    await wait(1)

    var tween = get_tree().create_tween()
    tween.tween_property(demi_fiend_node, "position", Vector2(700, 450), 0.1)
    tween.tween_property(demi_fiend_node, "scale", Vector2(2, 1), 0.05)
    tween.tween_property(demi_fiend_node, "scale", Vector2(1.5, 1.5), 0.3)
    await wait(0.08)
    globals.cutscenes.play_sound(load("res://Files/SoundEffects/Battle/Hit_Weak_Not_Very_Effective.mp3"))
    await tween.finished
    await wait(0.5)

    demi_fiend_node.anm_player.play("walk_right")
    tween = get_tree().create_tween()
    tween.tween_property(demi_fiend_node, "position", target[0].position + Vector2(-104, -14), 1.2)
    await tween.finished
    demi_fiend_node.anm_player.stop()
    demi_fiend_node.sprite.frame = 1
    await wait(0.1)

    tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(demi_fiend_node.sprite, "rotation_degrees", 12, 0.1)
    tween.tween_property(demi_fiend_node.sprite, "rotation_degrees", -28, 0.3)

    await wait(0.7)
    tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel()
    tween.tween_property(demi_fiend_node.sprite, "rotation_degrees", 60, 0.1)
    tween.tween_property(demi_fiend_node, "position", demi_fiend_node.position + Vector2(50, 0), 0.1)
    tween.tween_property(demi_fiend_node, "scale", Vector2(2, 2), 0.1)
    await tween.finished
    target[0].position.x += 60
    target[0].get_node("Sprite/Sprite2D").rotation_degrees = -20
    target[0].get_node("Sprite/Sprite2D").scale.y = 3
    target[0].audio.stream = load("res://Files/SoundEffects/Battle/Hit_Super_Effective.mp3")
    target[0].audio.play()

    target[0].get_node("Sprite/Sprite2D/BlinkTexture").color = Color("ff00008c")

    target[0].popup_damage(9999, "none", poke_types.weak)
    target[0].cur_hp = 0
    healthbar_damage(target[0])

    for i in range(6):
        target[0].get_node("Sprite/Sprite2D").position.x -= 6
        demi_fiend_node.position.y += 4
        await wait(0.02)
        target[0].get_node("Sprite/Sprite2D").position.x += 6
        demi_fiend_node.position.y -= 4
        await wait(0.02)

    target[0].get_node("UnitUI").hide()
    target[0].get_node("Sprite/Shadow").hide()
    target[0].get_node("Sprite/Sprite2D").position.x -= 3
    target[0].get_node("Sprite/Sprite2D").offset.y = -4
    target[0].get_node("Sprite/Sprite2D").position.y -= 4
    target[0].get_node("Sprite/Sprite2D").scale.y = 4
    remove_unit(target[0])

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(demi_fiend_node.sprite, "rotation_degrees", 0, 0.4)
    tween.tween_property(demi_fiend_node, "position", demi_fiend_node.position - Vector2(30, 0), 0.4)
    tween.tween_property(demi_fiend_node, "scale", Vector2(1.5, 1.5), 0.1)

    tween.tween_property(target[0].get_node("Sprite/Sprite2D"), "position", Vector2(2000, -1300), 1)
    tween.tween_property(target[0].get_node("Sprite/Sprite2D"), "rotation_degrees", 2960, 1)
    await tween.finished
    target[0].hide()
    target[0].get_node("UnitUI").show()
    target[0].anm_player.play("RESET")
    target[0].get_node("Sprite/Sprite2D").modulate = Color("#ffffff00")
    target[0].get_node("UnitUI").modulate = Color("#ffffff00")
    await wait(0.3)

    demi_fiend_node.anm_player.play("walk_left")
    tween = get_tree().create_tween()
    tween.tween_property(demi_fiend_node, "position", demi_fiend_node.position + Vector2(-80, 0), 1)
    await tween.finished
    demi_fiend_node.anm_player.stop()
    demi_fiend_node.sprite.frame = 6
    await wait(0.3)
    globals.cutscenes.play_sound(load("res://Files/SoundEffects/mario_jump.mp3"))
    demi_fiend_node.sprite.frame = 9
    tween = get_tree().create_tween()


    tween.tween_property(demi_fiend_node, "position", demi_fiend_node.position + Vector2(-220, -650), 0.4)

    await tween.finished
    await wait(0.4)





@onready var speech_box: Node2D = $SpeechBox
@onready var choice_list: Node2D = $SpeechBox / ChoiceList
@onready var sw: Sprite2D = $SpeechBox / Border / SW
@onready var se: Sprite2D = $SpeechBox / Border / SE
@onready var bottom: Sprite2D = $SpeechBox / Border / Bottom
@onready var right: Sprite2D = $SpeechBox / Border / Right
@onready var left: Sprite2D = $SpeechBox / Border / Left
@onready var bg: ColorRect = $SpeechBox / BG
@onready var bg_texture: Sprite2D = $SpeechBox / BgTexture

var current_dialogue = []
var previous_choice = []
enum {

    talking, 
    choosing, 
    dialogue_off
}
var dialogue_state = dialogue_off
var choice_index = 0



func show_dialogue_box():
    dialogue_state = talking

    set_dialogue_box_size(current_dialogue[0])

    speech_box.get_node("Dialogue").text = ""
    speech_box.visible = true
    speech_box.scale.x = 0.01
    var tween = get_tree().create_tween()

    tween.tween_property(speech_box, "scale", Vector2(1, 1), 0.2)
    await wait(0.3)

func set_dialogue_box_size(dialogue):
    var _lol = dialogue
    return























func spell_dialogue(text):
    set_dialogue_box_size(text)
    speech_box.get_node("Dialogue").text = ""


    var cur_index = 0
    var line_chars = 0
    var word_chars = 0
    for i in text:

        for cur_char in text.substr(cur_index):
            if cur_char != " ":
                word_chars += 1
            else: break


        if line_chars + word_chars > 26:
            speech_box.get_node("Dialogue").text += "\n"
            line_chars = 0

        speech_box.get_node("Dialogue").text += i
        word_chars = 0
        line_chars += 1
        cur_index += 1
        await wait(0.01)

        if Input.is_action_pressed("Cancel") or Input.is_action_just_pressed("Accept"):
            speech_box.get_node("Dialogue").text = text
            await wait(0.05)
            break

func hide_dialogue_box():
    hide_choices()

    speech_box.get_node("Dialogue").text = ""
    var tween = get_tree().create_tween()
    tween.tween_property(speech_box, "scale", Vector2(0, 1), 0.2)

    await wait(0.4)
    speech_box.visible = true
    dialogue_state = dialogue_off






func hide_choices():
    for i in get_node("SpeechBox/ChoiceList").get_children():
        i.queue_free()

func dialogue_input(dialogue):
    for i in dialogue:


        if typeof(i) == TYPE_STRING:
            await spell_dialogue(i)


            while not Input.is_action_just_pressed("Accept") and not Input.is_action_pressed("Cancel"):
                await wait(0.01)


            if Input.is_action_pressed("Cancel"):
                await wait(0.1)


        elif typeof(i) == TYPE_ARRAY and typeof(i[0]) == TYPE_CALLABLE:
            i[0].callv(i[1])


        elif typeof(i) == TYPE_ARRAY and typeof(i[0][0]) == TYPE_STRING:
            previous_choice = dialogue.find(i)

            var cont = 0
            for choice in i:
                var cur_choice = load("res://Files/Scenes/Level/choice_box.tscn").instantiate()
                cur_choice.position = Vector2(145, 20 + (cont * 32 + 8))
                cur_choice.get_node("ChoiceLabel").text = choice[0]
                get_node("SpeechBox/ChoiceList").add_child(cur_choice)
                cont += 1

            choice_index = 0
            get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = true


            await wait(0.3)
            while true:
                if Input.is_action_just_pressed("up"):
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = false
                    if choice_index == 0:
                        choice_index = get_node("SpeechBox/ChoiceList").get_children().size() - 1
                    else:
                        choice_index -= 1
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = true

                if Input.is_action_just_pressed("down"):
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = false
                    if choice_index == get_node("SpeechBox/ChoiceList").get_children().size() - 1:
                        choice_index = 0
                    else:
                        choice_index += 1
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = true

                if Input.is_action_just_pressed("Accept"):
                    hide_choices()
                    dialogue_input(i[choice_index][1])
                    return

                if Input.is_action_just_pressed("Cancel"):
                    choice_index = get_node("SpeechBox/ChoiceList").get_children().size() - 1
                    hide_choices()
                    dialogue_input(i[choice_index][1])
                    await wait(0.1)
                    return

                await wait(0.01)

    await hide_dialogue_box()

func speak(node, dialogue):
    dialogue_state = talking
    current_dialogue = dialogue

    speech_box.position = node.get_node("Sprite/Sprite2D").global_position + Vector2(0, -80)


    await show_dialogue_box()
    dialogue_input(current_dialogue)

    while dialogue_state != dialogue_off:
        await wait(0.01)








@onready var gui_player: AudioStreamPlayer = $"GUIPlayer"

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

func play_pickup_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI storage pick up.ogg")
    gui_player.play()

func play_putdown_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI storage put down.ogg")
    gui_player.play()

func play_ability_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/Battle/Battle ability.mp3")
    gui_player.play()

func play_sound(resource):
    gui_player.stop()
    gui_player.stream = resource
    gui_player.play()




func loop_missingno_sprite(node):
    while not battle_over:
        await wait(8)
        if node == null: return
        node.sprite_2d.frame = 1246
        await wait(0.08)
        if node == null: return
        node.sprite_2d.frame = 1245
        await wait(0.08)
        if node == null: return
        node.sprite_2d.frame = 1246
        await wait(0.08)
        if node == null: return
        node.sprite_2d.frame = 1245
        await wait(0.08)
        if node == null: return

func wait(time):
    await get_tree().create_timer(time).timeout
