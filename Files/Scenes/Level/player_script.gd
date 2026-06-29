extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var anm_player: AnimationPlayer = $AnimationPlayer
@onready var npc_detect: Area2D = $NPCDetect
@onready var camera: Camera2D = $Camera


@onready var speech_box: Node2D = $SpeechBox
@onready var choice_list: Node2D = $SpeechBox / ChoiceList
@onready var sw: Sprite2D = $SpeechBox / Border / SW
@onready var se: Sprite2D = $SpeechBox / Border / SE
@onready var bottom: Sprite2D = $SpeechBox / Border / Bottom
@onready var right: Sprite2D = $SpeechBox / Border / Right
@onready var left: Sprite2D = $SpeechBox / Border / Left
@onready var bg: ColorRect = $SpeechBox / BG
@onready var bg_texture: Sprite2D = $SpeechBox / BgTexture


@onready var ray = $RayCast2D


@export var player_name = "Red"


var current_dialogue = []
var previous_choice = []
enum {
    off, 
    talking, 
    choosing, 
}
var dialogue_state = off
var choice_index = 0



var moving = false
var tile_size = 48
var inputs = {"right": Vector2.RIGHT, 
            "left": Vector2.LEFT, 
            "up": Vector2.UP, 
            "down": Vector2.DOWN}

var walk_speed = 300
var speed = 4

var is_running = false

var facing_direction = "down"



enum {
    free, 
    locked, 
}
var state = free

func _ready() -> void :
    globals.player = self

    setup_LC()

    position = position.snapped(Vector2.ONE * tile_size)
    position += Vector2.ONE * tile_size / 2

    sprite.texture = load("res://Files/Sprites/Characters/%s.png" % player_name)
    globals.ui.setup_hud(player_name)

    await wait(0.01)
    if player_name == "Mewtwo":
        sprite.hide()
        get_node("MewtwoSprite").show()
        anm_player = get_node("MewtwoSprite/AnimationPlayer")

















func move(dir):


    ray.target_position = inputs[dir] * tile_size
    ray.force_raycast_update()

    anm_player.play("walk_%s" % dir)
    facing_direction = dir



    if not ray.is_colliding():



        moving = true

        if not is_running:
            for i in range(float(tile_size) / speed):
                position += inputs[dir] * speed
                await wait(0.01)
        else:
            for i in range(float(tile_size) / 8.0):
                position += inputs[dir] * 8.0
                await wait(0.01)


        moving = false


        if Input.is_action_pressed(dir) and not globals.in_cutscene and state == free:
            move(dir)

func _physics_process(_delta: float) -> void :
    if globals.hotel.get_node("Battle").get_children() != []: return
    if globals.ui.state != globals.ui.off: return

    if (state == free and not globals.in_cutscene) or (state == free and globals.gbc):
        walk_input()


func walk_input():


    if not moving:
        for dir in inputs.keys():
            if Input.is_action_pressed(dir):
                move(dir)
                return

    if not moving:
        animate_stop_walk()

    if Input.is_action_just_pressed("Accept"):
        if npc_detect.get_overlapping_areas():
            play_accept_SE()
            npc_detect.get_overlapping_areas()[0].get_owner().interact()
            animate_stop_walk()

    if Input.is_action_just_pressed("Cancel"):

        if globals.ui.state == globals.ui.off:
            if globals.in_cutscene: return
            globals.ui.show_menu()
        animate_stop_walk()

    if Input.is_action_pressed("Info") and not globals.player_data.event_flags["endgame"]:
        if not globals.gbc:
            is_running = true
            anm_player.speed_scale = 2.5
    elif not globals.player_data.event_flags["endgame"]:
        is_running = false
        anm_player.speed_scale = 1
        pass















































func animate_stop_walk():
    anm_player.stop()
    if facing_direction == "up":
        sprite.frame = 0

    elif facing_direction == "down":
        sprite.frame = 5

    elif facing_direction == "left":
        sprite.frame = 6

    elif facing_direction == "right":
        sprite.frame = 1

func force_stop_walk():
    while anm_player.is_playing():
        anm_player.stop()
        await wait(0.05)
        if facing_direction == "up":
            sprite.frame = 0

        elif facing_direction == "down":
            sprite.frame = 5

        elif facing_direction == "left":
            sprite.frame = 6

        elif facing_direction == "right":
            sprite.frame = 1

func set_npc_detect():
    if facing_direction == "down":
        npc_detect.rotation = 0
    elif facing_direction == "up":
        npc_detect.rotation = 180
    elif facing_direction == "left":
        npc_detect.rotation = 90
    elif facing_direction == "right":
        npc_detect.rotation = 270

func setup_LC():
    if globals.LC_mode:

        if globals.mewtwo_mode:
            player_name = "Mewtwo"
            return

        player_name = globals.LC_character

        if not globals.resuming_game:
            for i in LC_pools.pools[player_name]["starters"]:
                globals.player_data.player_box.append(globals.generate_pokemon(i[0], i[1]))
            globals.player_data.player_party[1] = globals.player_data.player_box[0]
            if globals.player_data.player_box.size() > 1:
                globals.player_data.player_party[4] = globals.player_data.player_box[1]




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
    var char_amount = float(dialogue.replace("\n", "").length())
    var line_amount = ceil(char_amount / 20)

    if line_amount < 3:
        speech_box.position.y = -70
        choice_list.position.y = -12
        bg.size.y = 72
        bg_texture.scale.y = 0.844
        right.scale.y = 1.8
        left.scale.y = 1.8
        for i in [se, sw, bottom]:
            i.position.y = -17

    else:
        speech_box.position.y = -81
        choice_list.position.y = 16
        bg.size.y = 98
        bg_texture.scale.y = 1.308
        right.scale.y = 2.5
        left.scale.y = 2.5
        for i in [se, sw, bottom]:
            i.position.y = 14

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
    dialogue_state = off


    if globals.ui.state == globals.ui.off:
        globals.player.state = globals.player.free




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
            play_cursor_SE()
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
                    play_cursor_SE()
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = false
                    if choice_index == 0:
                        choice_index = get_node("SpeechBox/ChoiceList").get_children().size() - 1
                    else:
                        choice_index -= 1
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = true

                if Input.is_action_just_pressed("down"):
                    play_cursor_SE()
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = false
                    if choice_index == get_node("SpeechBox/ChoiceList").get_children().size() - 1:
                        choice_index = 0
                    else:
                        choice_index += 1
                    get_node("SpeechBox/ChoiceList").get_child(choice_index).get_node("Selector").visible = true

                if Input.is_action_just_pressed("Accept"):
                    play_accept_SE()
                    hide_choices()
                    dialogue_input(i[choice_index][1])
                    return

                if Input.is_action_just_pressed("Cancel"):
                    play_cancel_SE()
                    choice_index = get_node("SpeechBox/ChoiceList").get_children().size() - 1
                    hide_choices()
                    dialogue_input(i[choice_index][1])
                    await wait(0.1)
                    return

                await wait(0.01)

    await hide_dialogue_box()





@onready var gui_player: AudioStreamPlayer = $"GUIPlayer"

func play_cursor_SE():
    gui_player.stop()
    gui_player.stream = load("res://Files/SoundEffects/GUI sel cursor.ogg")
    gui_player.play()

func play_accept_SE():
    gui_player.stop()
    if globals.gbc:
        gui_player.stream = load("res://Files/SoundEffects/SFX_PRESS_AB.wav")
    else:
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
