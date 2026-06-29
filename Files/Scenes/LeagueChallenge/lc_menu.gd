extends Node2D

@onready var grid: GridContainer = $GridContainer
@onready var lc_data: Node = $LCData
@onready var selector: ColorRect = $Selector
@onready var deck_details: Node2D = $DeckDetails
@onready var preview_sprite: Sprite2D = $DeckDetails / TrainerPreview / Sprite2D
@onready var preview_label = $DeckDetails / TrainerPreview / Label
@onready var money: Label = $Money / Money
@onready var preview_badge: Sprite2D = $DeckDetails / TrainerPreview / Badge



@onready var lc_char = load("res://Files/Scenes/LeagueChallenge/lc_character.tscn")

var character_list = []
var selector_index = 0

enum {
    select, 
    locked
}

var state = locked






func _ready() -> void :


    money.text = "$%s" % globals.player_bp

    setup_character_select()
    animate_character_preview()
    await wait(0.3)
    state = select





func _process(_delta: float) -> void :
    if state == select:
        selector_input()

func setup_character_select():
    for i in lc_data.pools:
        if i == "Mewtwo": continue
        var new_char = lc_char.instantiate()

        if i[0] == "*":
            new_char.modulate = Color("#ffffff00")

        else:
            new_char.get_node("Sprite2D").texture = load("res://Files/Sprites/Characters/%s.png" % i)
            new_char.get_node("Badge").frame = lc_data.pools[i]["badge"]

        if i[0] != "*" and not globals.LC_unlocked[i]:
            new_char.get_node("Sprite2D").modulate = Color("030303ff")

        if i[0] != "*" and not globals.LC_cleared[i]:
            new_char.get_node("Badge").modulate = Color("000000")

        if i == "Yugi" and not globals.event_flags["yugi"]:
            new_char.modulate = Color("#ffffff00")

        elif i == "Kaiba" and not globals.event_flags["kaiba"]:
            new_char.modulate = Color("#ffffff00")

        elif i == "Demi-Fiend" and not globals.event_flags["demi_fiend"]:
            new_char.modulate = Color("#ffffff00")

        character_list.append(i)
        grid.add_child(new_char)

    update_selector()

func selector_input():
    if Input.is_action_just_pressed("Accept"):
        if character_list[selector_index][0] == "*": return
        if globals.LC_unlocked[character_list[selector_index]]:
            pick_character()
        else:
            buy_character()
        return

    elif Input.is_action_just_pressed("Cancel"):
        pass

    elif Input.is_action_just_pressed("right"):
        play_cursor_SE()

        if selector_index % grid.columns != 11:
            selector_index += 1
        else:
            selector_index -= 11
        update_selector()

    elif Input.is_action_just_pressed("left"):
        play_cursor_SE()
        if selector_index % grid.columns != 0:
            selector_index -= 1
        else:
            selector_index += 11
        update_selector()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if selector_index + 12 < grid.get_children().size() - 1:
            selector_index += 12
        else:
            selector_index -= grid.columns * ((grid.get_children().size() - 1) / grid.columns)
        update_selector()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if selector_index - 12 >= 0:
            selector_index -= 12
        else:
            selector_index += grid.columns * ((grid.get_children().size() - 1) / grid.columns)
        update_selector()

func update_selector():
    if selector_index >= grid.get_children().size() - 1: selector_index = 0
    selector.global_position = grid.get_child(selector_index).global_position
    update_deck_details()

func update_deck_details():
    for i in deck_details.get_node("VList").get_children():
        i.queue_free()

    if character_list[selector_index][0] == "*":
        preview_sprite.hide()
        preview_label.hide()
        preview_badge.hide()
        $DeckDetails / TrainerPreview / Light.hide()
        return

    var char_name = character_list[selector_index]

    if (char_name == "Yugi" and not globals.event_flags["yugi"]) or (char_name == "Kaiba" and not globals.event_flags["kaiba"]) or (char_name == "Demi-Fiend" and not globals.event_flags["demi_fiend"]):
        preview_sprite.hide()
        preview_label.hide()
        preview_badge.hide()
        $DeckDetails / TrainerPreview / Light.hide()
        return

    $DeckDetails / TrainerPreview / Light.show()
    preview_sprite.show()
    preview_label.show()
    preview_badge.show()
    preview_sprite.texture = load("res://Files/Sprites/Characters/%s.png" % character_list[selector_index])
    preview_badge.frame = lc_data.pools[character_list[selector_index]]["badge"]

    if character_list[selector_index][0] != "*" and not globals.LC_cleared[character_list[selector_index]]:
        preview_badge.modulate = Color("000000")
    else:
        preview_badge.modulate = Color("ffffff")

    if not globals.LC_unlocked[character_list[selector_index]]:
        preview_sprite.modulate = Color(0.01, 0.01, 0.01, 1.0)
        $DeckDetails / TrainerPreview / Light.modulate = Color(0.01, 0.01, 0.01, 1.0)
        $DeckDetails / TrainerPreview / BG / BGSprite.modulate = Color("#ffffff")
        $DeckDetails / TrainerPreview / Nameplate.modulate = Color("#ffffff")
        var color = "#7ac6ff"
        var cost = lc_data.pools[character_list[selector_index]]["cost"]
        if cost > globals.player_bp:
            color = "#e64039"

        preview_label.text = "Unlock: [color=%s]$%s" % [color, cost]
        return

    $DeckDetails / TrainerPreview / BG / BGSprite.modulate = lc_data.pools[character_list[selector_index]]["color"]
    $DeckDetails / TrainerPreview / Nameplate.modulate = lc_data.pools[character_list[selector_index]]["color"]
    $DeckDetails / TrainerPreview / Light.modulate = lc_data.pools[character_list[selector_index]]["color"]

    preview_sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
    preview_label.text = character_list[selector_index].capitalize()

    for i in lc_data.pools[character_list[selector_index]]["starters"]:
        var new_index = load("res://Files/Scenes/Level/Menu/party_pokemon_item.tscn").instantiate()

        new_index.get_node("Label").text = pkmn.dex[i[0]]["name"]

        var name_node = new_index.get_node("Label")
        name_node.scale.x = 1
        name_node.text = pkmn.dex[i[0]]["name"]
        if name_node.text.length() > 10:
            for k in range(name_node.text.length() - 10):
                name_node.scale.x -= 0.04

        new_index.get_node("Level").text = "lv%s" % i[1]
        new_index.get_node("Sprite").frame = pkmn.dex[i[0]]["sprite"]
        new_index.get_node("Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([pkmn.dex[i[0]]["color"]]))

        deck_details.get_node("VList").add_child(new_index)

func pick_character():
    play_accept_SE()
    globals.lc_selected = character_list[selector_index]
    globals.LC_character = character_list[selector_index]
    globals.auto_battle = false
    globals.versus_mode = false
    globals.bf_mode = false
    globals.normal_mode = true
    globals.LC_mode = true
    globals.test_mode = false
    globals.core.change_scene(load("res://Files/Scenes/Level/level_scene.tscn"))

func buy_character():
    var char_name = character_list[selector_index]
    if (char_name == "Yugi" and not globals.event_flags["yugi"]) or (char_name == "Kaiba" and not globals.event_flags["kaiba"]) or (char_name == "Demi-Fiend" and not globals.event_flags["demi_fiend"]):
        return

    var cost = lc_data.pools[character_list[selector_index]]["cost"]
    if cost > globals.player_bp:
        play_buzzer_SE()
        state = locked
        preview_label.modulate = Color("#e60000")
        var tween = get_tree().create_tween()
        tween.tween_property(preview_label, "position", preview_label.position + Vector2(4, 0), 0.1)
        tween.tween_property(preview_label, "position", preview_label.position + Vector2(0, 0), 0.1)
        tween.tween_property(preview_label, "modulate", Color("#ffffff"), 0.1)
        await wait(0.2)
        state = select
    else:
        play_accept_SE()
        globals.player_bp -= cost
        globals.LC_unlocked[character_list[selector_index]] = true
        money.text = "$%s" % globals.player_bp
        var node = grid.get_child(selector_index)
        node.get_node("Sprite2D").modulate = Color("ffffff")
        update_deck_details()

func animate_character_preview():
    var speed = 0.3

    while true:
        preview_sprite.frame = 5
        await wait(speed)
        preview_sprite.frame = 8
        await wait(speed)
        preview_sprite.frame = 5
        await wait(speed)
        preview_sprite.frame = 11
        await wait(speed)







@onready var gui_player: AudioStreamPlayer = $"../GUIPlayer"

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





func wait(time):
        await get_tree().create_timer(time).timeout
