extends Node2D


@onready var grid1: GridContainer = $Grids / ScrollContainer1 / GridContainer
@onready var grid2: GridContainer = $Grids / ScrollContainer2 / GridContainer
@onready var grid3: GridContainer = $Grids / ScrollContainer3 / GridContainer
@onready var grid4: GridContainer = $Grids / ScrollContainer4 / GridContainer
@onready var grid5: GridContainer = $Grids / ScrollContainer5 / GridContainer

@onready var rarity_selector: ColorRect = $Rarities / Selector
@onready var rarities: Node2D = $Rarities
@onready var status: Node2D = $CanvasLayer / UI / Status
@onready var formation: Node2D = $CanvasLayer / UI / Status / Party / Formation
@onready var formation_slots: Node2D = $CanvasLayer / UI / Status / Party / Formation / Slots
@onready var formation_selector: ColorRect = $CanvasLayer / UI / Status / Party / Formation / Selector


@onready var pool_selector: ColorRect = $Grids / Selector


@onready var grids = [
    grid1, 
    grid2, 
    grid3, 
    grid4, 
    grid5, 
]

var mons = {
    0: [], 
    1: [], 
    2: [], 
    3: [], 
    4: [], 
    5: []
}

enum {
    off, 
    rarity, 
    pool, 
    formation_state, 
}

var input_state = off

var rarity_index = 0
var pool_index = 0
var formation_index = 5
var unit_held = null

var point_limit = 4
var player1_party = [null, null, null, null, null, null]
var player2_party = [null, null, null, null, null, null]

var cur_party = player1_party

var displayed_unit = null

var quit_timer = 0


func _ready() -> void :
    globals.versus_menu = self
    show_screen()
    await wait(0.01)

    setups_mons()
    update_rarity_selector()
    update_pool_selector()
    setup_party(1)
    for i in globals.ui.formation_menu.get_node("Slots").get_children():
            i.get_node("Sprite").z_index = 2

    show_rank_select()




func _process(_delta: float) -> void :
    if input_state == rarity:
        rarity_input()

    elif input_state == pool:
        pool_input()

    elif input_state == formation_state:
        formation_input()

    if Input.is_action_pressed("Cancel"):
        while Input.is_action_pressed("Cancel"):
            quit_timer += 1
            if quit_timer > 1400:
                quit_timer = 0
                wait(0.1)
                globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))
                wait(0.1)
                return
            await wait(0.01)
        quit_timer = 0

func setups_mons():
    for i in pkmn.dex:
        if i in pkmn.booster_excluded and not i in pkmn.versus_included: continue
        elif pkmn.dex[i]["rarity"] == 0: continue
        elif i[0] == "*": continue
        mons[pkmn.dex[i]["rarity"]].append(i)

    for i in mons:
        mons[i].sort_custom( func(a, b):
            return pkmn.dex[a]["sprite"] < pkmn.dex[b]["sprite"]
            )

    for k in mons:
        for i in mons[k]:
            var new_index = load("res://Files/Scenes/Versus/versus_index.tscn").instantiate()
            new_index.get_node("Sprite").frame = pkmn.dex[i]["sprite"]
            new_index.get_node("BG").color = Color(poke_types.colors[pkmn.dex[i]["color"]][3])
            new_index.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/%s.png" % pkmn.dex[i]["color"])
            new_index.get_node("ColorBorder").modulate = poke_types.colors[pkmn.dex[i]["color"]][0]
            new_index.get_node("SpriteShadow").modulate = Color(poke_types.colors[pkmn.dex[i]["color"]][2])
            new_index.set_meta("unit_dict", globals.generate_pokemon(i, 9))
            grids[pkmn.dex[i]["rarity"] - 1].add_child(new_index)

func show_screen():
    get_node("Grids").modulate = Color("#ffffff96")
    formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
    pool_selector.hide()

func start_rarity_input():
    input_state = rarity
    rarity_selector.get_child(0).play("loop")
    rarity_selector.modulate = Color("#ffffff")
    get_node("Rarities").modulate = Color("#ffffff")

func end_rarity_input():
    rarity_selector.get_child(0).stop()
    rarity_selector.modulate = Color("#808080")
    get_node("Rarities").modulate = Color("#ffffff96")

func rarity_input():
    if Input.is_action_just_pressed("Accept"):
        end_rarity_input()
        start_pool_input()
        return

    elif Input.is_action_just_pressed("Cancel"):
        end_rarity_input()
        start_formation_input()
        return

    elif Input.is_action_just_pressed("right"):
        if rarity_index < 4:
            rarity_index += 1
        else:
            rarity_index = 0
        update_rarity_selector()

    elif Input.is_action_just_pressed("left"):
        if rarity_index > 0:
            rarity_index -= 1
        else:

            end_rarity_input()
            start_formation_input()
            return

        update_rarity_selector()

func update_rarity_selector():
    rarity_selector.position = rarities.get_child(rarity_index).position

    var cont = 0
    for i in grids:
        if cont == rarity_index:
            i.visible = true
            cont += 1
            continue

        i.visible = false
        cont += 1

    var cur_grid = grids[rarity_index]
    globals.ui.update_status(cur_grid.get_child(pool_index).get_meta("unit_dict"))

func start_pool_input():
    input_state = pool
    update_pool_selector()
    pool_selector.show()
    get_node("Grids").modulate = Color("#ffffff")

func end_pool_input():
    get_node("Grids").modulate = Color("#ffffff96")
    pool_selector.hide()
    grids[rarity_index].get_parent().scroll_vertical = 0
    pool_index = 0

func pool_input():
    var cur_grid = grids[rarity_index]

    if Input.is_action_just_pressed("Accept"):
        if can_pickup_unit():
            unit_held = cur_grid.get_child(pool_index).get_meta("unit_dict")
            end_pool_input()
            start_formation_input()
        return

    elif Input.is_action_just_pressed("Cancel"):
        end_pool_input()
        start_rarity_input()
        return

    elif Input.is_action_just_pressed("right"):
        if pool_index % cur_grid.columns != 5:
            pool_index += 1
        else:
            pool_index -= 5
        update_pool_selector()

    elif Input.is_action_just_pressed("left"):
        if pool_index % cur_grid.columns != 0:
            pool_index -= 1
        else:
            pool_index += 5
        update_pool_selector()

    elif Input.is_action_just_pressed("down"):
        if pool_index + 6 < cur_grid.get_children().size():
            pool_index += 6

            if pool_selector.position.y >= 736:
                cur_grid.get_parent().scroll_vertical += 72
                await get_tree().create_timer(0.01).timeout

        else:
            pool_index = 0

            cur_grid.get_parent().scroll_vertical = 0
            await get_tree().create_timer(0.01).timeout

        update_pool_selector()

    elif Input.is_action_just_pressed("up"):
        if pool_index - 6 >= 0:
            pool_index -= 6

            if pool_selector.position.y <= 332:
                cur_grid.get_parent().scroll_vertical -= 72
                await get_tree().create_timer(0.01).timeout
        else:
            pool_index = cur_grid.get_children().size() - 1

            cur_grid.get_parent().scroll_vertical = cur_grid.get_parent().get_v_scroll_bar().max_value
            await get_tree().create_timer(0.01).timeout
        update_pool_selector()

func can_pickup_unit():
    if cur_party.count(null) < 4:
        flash_cant_pickup()
        return false

    var picked_up_unit = grids[rarity_index].get_child(pool_index).get_meta("unit_dict")

    var team_points = 0
    for i in cur_party:
        if i == null: continue
        team_points += i["dex"]["rarity"]

    if team_points + picked_up_unit["dex"]["rarity"] > point_limit:
        flash_cant_pickup()
        return false

    return true

func flash_cant_pickup():
    pool_selector.get_node("AnimationPlayer").play("cantpickup")
    await pool_selector.get_node("AnimationPlayer").animation_finished
    pool_selector.get_node("AnimationPlayer").play("loop")

func update_pool_selector():
    var cur_grid = grids[rarity_index]
    if pool_index >= cur_grid.get_children().size():
        pool_index = 0
        cur_grid.get_parent().scroll_vertical = 0
        await wait(0.01)
    pool_selector.global_position = cur_grid.get_child(pool_index).global_position + Vector2(2, 2)
    globals.ui.update_status(cur_grid.get_child(pool_index).get_meta("unit_dict"))

func setup_party(player_index):
    cur_party = player1_party
    if player_index != 1:
        $HUD / RichTextLabel.text = "[color=c52018]Player 2[/color] picking..."
        $HUD / RichTextLabel2.text = "[color=317dff]Player 1[/color], look away!"
        cur_party = player2_party
    else:
        $HUD / RichTextLabel.text = "[color=317dff]Player 1[/color] picking..."
        $HUD / RichTextLabel2.text = "[color=c52018]Player 2[/color], look away!"

    var slots = formation.get_node("Slots").get_children()
    var cont = 0
    for i in cur_party:
        if i == null:
            slots[cont].get_node("Sprite").visible = false
        else:
            slots[cont].get_node("Sprite").frame = i["dex"]["sprite"]
            slots[cont].get_node("Sprite").visible = true

        cont += 1

func formation_input():
    if Input.is_action_just_pressed("Accept"):
        if unit_held != null:
            add_unit_to_party()
        else:
            pickup_from_party()
        return

    elif Input.is_action_just_pressed("Info"):
        input_state = off
        globals.ui.enable_status_menu()
        await wait(0.1)
        while globals.ui.state != globals.ui.off:
            await wait(0.01)
        input_state = formation_state

        return


    elif Input.is_action_just_pressed("Cancel"):
        if unit_held != null:
            formation_selector.get_node("Sprite").visible = false
            unit_held = null
            return






        elif unit_held == null:
            end_formation_input()
            start_rarity_input()

            return

        return

    elif Input.is_action_just_pressed("down"):
        if formation_index not in [3, 6]:
            formation_index += 1
        else:

            formation_selector.hide()
            $Menu / Selector.show()
            while true:
                if Input.is_action_just_pressed("Accept"):
                    confirm_team()
                    return
                elif Input.is_action_just_pressed("up"):
                    break
                await wait(0.01)

            await wait(0.01)
            formation_index = 6
            formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
            formation_selector.show()
            $Menu / Selector.hide()
            return


        formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
        globals.ui.update_status(cur_party[formation_index - 1])

    elif Input.is_action_just_pressed("up"):
        if formation_index not in [1, 4]:
            formation_index -= 1
        else:
            formation_index += 2
        formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
        globals.ui.update_status(cur_party[formation_index - 1])

    elif Input.is_action_just_pressed("right"):
        if formation_index not in [4, 5, 6]:
            formation_index += 3
            formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
            globals.ui.update_status(cur_party[formation_index - 1])







    elif Input.is_action_just_pressed("left"):
        if formation_index not in [1, 2, 3]:
            formation_index -= 3
            formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position
            globals.ui.update_status(cur_party[formation_index - 1])
        else:

            pass

func start_formation_input():
    if unit_held != null:
        formation_selector.get_node("Sprite").frame = unit_held["dex"]["sprite"]
        formation_selector.get_node("Sprite").visible = true
    else:
        formation_selector.get_node("Sprite").visible = false

    input_state = formation_state
    formation_selector.show()

    if cur_party[formation_index - 1] != null:
        globals.ui.update_status(cur_party[formation_index - 1])

func end_formation_input():
    unit_held = null
    formation_selector.hide()
    formation_index = 5
    formation_selector.position = formation.get_node("Slots").get_child(formation_index - 1).position

func add_unit_to_party():
    var swapped_unit = null
    if cur_party[formation_index - 1] != null:
        swapped_unit = cur_party[formation_index - 1].duplicate(true)

    cur_party[formation_index - 1] = unit_held.duplicate(true)

    if swapped_unit == null:
        formation_selector.get_node("Sprite").visible = false
        formation.get_node("Slots").get_child(formation_index - 1).get_node("Sprite").visible = true
        formation.get_node("Slots").get_child(formation_index - 1).get_node("Sprite").frame = unit_held["dex"]["sprite"]
        unit_held = null

    else:
        formation_selector.get_node("Sprite").visible = true
        formation.get_node("Slots").get_child(formation_index - 1).get_node("Sprite").visible = true
        formation.get_node("Slots").get_child(formation_index - 1).get_node("Sprite").frame = unit_held["dex"]["sprite"]

        unit_held = swapped_unit
        formation_selector.get_node("Sprite").frame = unit_held["dex"]["sprite"]

    update_point_counter()

func pickup_from_party():
    if cur_party[formation_index - 1] == null: return
    unit_held = cur_party[formation_index - 1].duplicate(true)
    cur_party[formation_index - 1] = null
    formation_selector.get_node("Sprite").frame = unit_held["dex"]["sprite"]
    formation_selector.get_node("Sprite").visible = true
    formation.get_node("Slots").get_child(formation_index - 1).get_node("Sprite").visible = false
    update_point_counter()

func confirm_team():
    if cur_party == [null, null, null, null, null, null]:
        return

    if cur_party == player1_party:
        setup_player2_pick()

    else:
        battle_start()

func setup_player2_pick():
    cur_party = player2_party
    $Menu / Selector.hide()
    end_formation_input()
    rarity_index = 0
    update_rarity_selector()
    start_rarity_input()
    setup_party(2)
    update_point_counter()

func battle_start():
    input_state = off
    $BG.hide()
    $BG2.hide()
    $Grids.hide()
    $Rarities.hide()
    $Menu.hide()
    $HUD.hide()
    status.hide()
    formation.hide()



    var battle_scene = load("res://Files/Scenes/Battle/BattleScene.tscn").instantiate()
    battle_scene.player_team_ref = player1_party
    battle_scene.enemy_team_ref = player2_party

    battle_scene.get_node("BattleResults/PlayerTeam/Label").text = "PLAYER 1"
    battle_scene.get_node("BattleResults/EnemyTeam/Label").text = "PLAYER 2"

    add_child(battle_scene)

func show_rank_select():





    $RaritySelect.modulate = Color("#ffffff")
    await wait(0.1)
    var selector = $RaritySelect / Selector
    var sel_index = 0
    while true:
        if Input.is_action_just_pressed("Accept"):
            if sel_index == 0:
                point_limit = 5
            elif sel_index == 1:
                point_limit = 7
            elif sel_index == 2:
                point_limit = 9
            elif sel_index == 3:
                point_limit = 12
            elif sel_index == 4:
                point_limit = 999
            break

        if Input.is_action_just_pressed("right"):
            if sel_index + 1 < 5:
                sel_index += 1
            else:
                sel_index = 0
            selector.position = $RaritySelect / Ranks.get_child(sel_index).position

        elif Input.is_action_just_pressed("left"):
            if sel_index - 1 >= 0:
                sel_index -= 1
            else:
                sel_index = 4
            selector.position = $RaritySelect / Ranks.get_child(sel_index).position

        await wait(0.01)

    $HUD / Label.text = "Points: %s" % point_limit

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property($RaritySelect, "modulate", Color("#ffffff00"), 0.2)
    tween.tween_property($CanvasLayer / UI, "modulate", Color("#ffffff"), 0.1)
    await tween.finished

    start_rarity_input()

func update_point_counter():
    var points_used = 0
    for i in cur_party:
        if i == null: continue
        points_used += i["dex"]["rarity"]

    $HUD / Label.text = "Points: %s" % (point_limit - points_used)



func wait(time):
    await get_tree().create_timer(time).timeout
