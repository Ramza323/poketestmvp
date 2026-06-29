extends CharacterBody2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var speech_box: Node2D = $SpeechBox
@onready var choice_list: Node2D = $SpeechBox / ChoiceList
@onready var balloon: Sprite2D = $Balloon
@onready var balloon_player: AnimationPlayer = $Balloon / AnimationPlayer
@onready var anm_player: AnimationPlayer = $AnimationPlayer





@onready var sw: Sprite2D = $SpeechBox / Border / SW
@onready var se: Sprite2D = $SpeechBox / Border / SE
@onready var bottom: Sprite2D = $SpeechBox / Border / Bottom
@onready var right: Sprite2D = $SpeechBox / Border / Right
@onready var left: Sprite2D = $SpeechBox / Border / Left
@onready var bg: ColorRect = $SpeechBox / BG
@onready var bg_texture: Sprite2D = $SpeechBox / BgTexture
@onready var dialogue_arrow: Node2D = $SpeechBox / Arrow


var tile_size = 48


@export var npc_name = "Blue"
@export var facing_direction = "none"
var direction_locked = false


var current_dialogue = []
var previous_choice = []

enum {
    off, 
    talking, 
    choosing, 
}
var dialogue_state = off
var choice_index = 0



func _ready() -> void :


    speech_box.visible = false
    speech_box.scale = Vector2.ZERO






func setup_npc():
    if globals.npc.progression[npc_name]["dialogue"] == "-1" or npc_name == globals.player.player_name:
        position = Vector2(-9999, 9999)

        return

    sprite.texture = load("res://Files/Sprites/Characters/{0}.png".format([npc_name]))
    await wait(0.02)
    update_dialogue()

    var position_index = int(globals.npc.progression[npc_name]["dialogue"][0])






    if globals.npc.progression[npc_name]["positions"].size() - 1 < position_index:
        position_index = 1

    position = globals.npc.progression[npc_name]["positions"][position_index][0]
    facing_direction = globals.npc.progression[npc_name]["positions"][position_index][1]
    visible = true

    face_facing_direction()

    if npc_name == "Erika" and globals.npc.progression["Erika"]["dialogue"] == "0":
        sprite.texture = load("res://Files/Sprites/Characters/Erika_sleep.png")

    if globals.npc.progression[npc_name]["dialogue"] == "0" and npc_name in ["Morty", "Falkner", "Whitney", "Koga", "Roxanne", "Flannery"]:
        direction_locked = true
    else:
        direction_locked = false

    setup_events()

    position = position.snapped(Vector2.ONE * tile_size)
    position += Vector2.ONE * tile_size / 2





func setup_events():
    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Koga":
        $"../../Objects/Pokeball".position = Vector2(1110, 1141)
        $"../../Objects/Pokeball".position = $"../../Objects/Pokeball".position.snapped(Vector2.ONE * tile_size)
        $"../../Objects/Pokeball".position += Vector2.ONE * tile_size / 2

    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Misty":
        var brock = (globals.cutscenes.get_npc_node("Brock"))
        globals.cutscenes.place_actor(brock, position + Vector2(48, 0))
        globals.cutscenes.face_direction(brock, "left")
        globals.npc.progression["Brock"]["dialogue"] = "misty"

        direction_locked = true
        brock.direction_locked = true

    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Surge":
        var erika = (globals.cutscenes.get_npc_node("Erika"))
        globals.cutscenes.place_actor(erika, position + Vector2(48, 0))
        globals.cutscenes.face_direction(erika, "left")
        globals.npc.progression["Erika"]["dialogue"] = "surge"

        direction_locked = true
        erika.direction_locked = true

        erika.sprite.texture = load("res://Files/Sprites/Characters/Erika.png")

    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Giovanni":
        var rocketm = globals.cutscenes.get_npc_node("RocketM")
        var rocketf = globals.cutscenes.get_npc_node("RocketF")
        globals.npc.update_dialogue_progression("RocketM", "0")
        globals.cutscenes.place_actor(rocketm, Vector2(1064, -140))
        globals.cutscenes.place_actor(rocketf, Vector2(826, -48))
        globals.cutscenes.face_direction(rocketf, "right")
        globals.cutscenes.face_direction(rocketm, "down")

    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Falkner":
        var joey = globals.cutscenes.get_npc_node("Joey")
        var megan = globals.cutscenes.get_npc_node("Megan")
        var weevil = globals.cutscenes.get_npc_node("Weevil")

        globals.cutscenes.place_actor(joey, Vector2(1387, 484))
        globals.cutscenes.place_actor(megan, Vector2(1453, 524))
        globals.cutscenes.place_actor(weevil, Vector2(1453, 424))

        globals.cutscenes.face_direction(joey, "left")
        globals.cutscenes.face_direction(megan, "left")
        globals.cutscenes.face_direction(weevil, "left")

    if globals.player_data.event_flags["sabrina_event"] and npc_name == "Joey" and globals.hotel.game_level == 2:
        globals.npc.progression[npc_name]["dialogue"] = "bug"

    if globals.npc.progression[npc_name]["dialogue"] == "2" and npc_name == "Cilan":
        direction_locked = true
        var cress = globals.cutscenes.get_npc_node("Cress")
        var chili = globals.cutscenes.get_npc_node("Chili")

        globals.npc.update_dialogue_progression("Cress", "0")
        globals.npc.update_dialogue_progression("Chili", "0")

        await wait(0.1)
        globals.cutscenes.place_actor(chili, Vector2(1290, 439))
        globals.cutscenes.place_actor(cress, Vector2(1400, 439))

func interact():
    if dialogue_state == off:
        if globals.npc.progression[npc_name]["dialogue"] == "-1": return
        globals.player.force_stop_walk()
        globals.player.state = globals.player.locked
        $Balloon.visible = false
        globals.enemy = self
        update_dialogue()
        if not direction_locked:
            face_player()
        await show_dialogue_box()
        dialogue_input(current_dialogue)

func face_player():



    if globals.player.facing_direction == "up":
        sprite.frame = 5

    elif globals.player.facing_direction == "down":
        sprite.frame = 0

    elif globals.player.facing_direction == "left":
        sprite.frame = 1

    elif globals.player.facing_direction == "right":
        sprite.frame = 6

func update_dialogue():
    current_dialogue = globals.npc.dialogue[npc_name][globals.npc.progression[npc_name]["dialogue"]]

func show_dialogue_box():
    dialogue_state = talking
    if not typeof(current_dialogue[0]) == TYPE_STRING: return

    set_dialogue_box_size(current_dialogue[0])

    speech_box.get_node("Dialogue").text = ""
    speech_box.visible = true
    speech_box.scale.x = 0.01
    var tween = get_tree().create_tween()

    tween.tween_property(speech_box, "scale", Vector2(1, 1), 0.2)
    await wait(0.3)

func set_dialogue_box_size(dialogue):
    if not typeof(dialogue) == TYPE_STRING: return
    var char_amount = float(dialogue.replace("\n", "").length())
    var line_amount = ceil(char_amount / 20)

    if line_amount < 3:
        speech_box.position.y = -70
        choice_list.position.y = -12
        bg.size.y = 72
        bg_texture.scale.y = 0.844
        right.scale.y = 1.8
        left.scale.y = 1.8
        dialogue_arrow.position = Vector2(0, -4)
        dialogue_arrow.scale = Vector2(1, 1)
        for i in [se, sw, bottom]:
            i.position.y = -17

    else:
        speech_box.position.y = -81
        choice_list.position.y = 16
        bg.size.y = 98
        bg_texture.scale.y = 1.308
        right.scale.y = 2.5
        left.scale.y = 2.5
        dialogue_arrow.position = Vector2(0, 27)
        dialogue_arrow.scale = Vector2(1, 0.5)
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

    await wait(0.3)
    speech_box.visible = false
    dialogue_state = off

    if globals.booster_due and not globals.LC_mode and not globals.in_cutscene:
        if globals.hotel.game_level < 3:

            if globals.npc.progression[npc_name]["dialogue"] in ["1_lost", "1_won"]:


                interact()
                if globals.npc.dialogue[npc_name].has("booster"):
                    current_dialogue = globals.npc.dialogue[npc_name]["booster"]
                else:
                    current_dialogue = ["heres your booster bitch", [call_deferred, ["get_booster", "red"]]]
                globals.booster_due = false
                return

    if globals.ui.state == globals.ui.off and not globals.in_cutscene:
        globals.player.state = globals.player.free
    else:
        while globals.ui.state != globals.ui.off:
            await wait(0.1)

        if not globals.in_cutscene:
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

func face_facing_direction():
    if facing_direction != "none":
        if facing_direction == "up":
            sprite.frame = 0

        elif facing_direction == "down":
            sprite.frame = 5

        elif facing_direction == "left":
            sprite.frame = 6

        elif facing_direction == "right":
            sprite.frame = 1

func get_booster(color):
    globals.npc.get_booster(color)





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





func wait(time):
    await get_tree().create_timer(time).timeout
