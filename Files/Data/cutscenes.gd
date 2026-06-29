extends Node

@onready var cuts_player

var screen_tint
var camera

var tile_size = 48

var positions_memory = {}
var audience_nodes = []
var corridor_nodes = []



func _ready() -> void :
    globals.cutscenes = self
    await wait(0.01)
    cuts_player = globals.ui.cuts_player
    screen_tint = globals.hotel.get_node("CanvasLayer/ScreenTint")
    camera = globals.player.get_node("Camera")

func game_start():
    start()
    await wait(0.3)
    var oak = get_npc_node("Oak")

    place_actor(globals.player, Vector2(1584, 1074))
    place_actor(oak, Vector2(1590, 772))
    face_direction(oak, "up")
    globals.player.visible = false
    reset_camera()
    face_direction(globals.player, "up")

    await fade_in()

    await wait(1)
    globals.player.visible = true
    await wait(1)
    move_actor(globals.player, "up", 3, )
    await wait(1)

    globals.npc.balloon("Oak", "!")
    await wait(0.8)
    face_direction(oak, "down")
    await wait(1)
    await move_actor(oak, "down", 2, )

    await speak(oak, ["You're finally here!", "Quick, choose your deck and get going!"])
    globals.npc.show_starters()

    while globals.ui.state != globals.ui.off:
        await wait(0.1)

    await wait(0.3)

    await move_actor(oak, "right", 2)
    face_direction(oak, "left")
    oak_reposition()
    globals.npc.setup_trades()
    await wait(0.3)
    end()

func LC_start():
    start()
    await wait(0.3)

    if not globals.resuming_game:
        globals.player_data.money += 30
    place_actor(globals.player, Vector2(1584, 894))



    reset_camera()
    face_direction(globals.player, "down")

    await fade_in()

    await wait(0.2)
    if not globals.resuming_game:
        globals.npc.setup_trades()


    end()

func up_stairs():
    start()

    await fade_out()
    place_actor(globals.player, Vector2(7300, -235))
    reset_camera()
    await wait(0.2)
    await fade_in()

    end()

func down_stairs():
    start()

    await fade_out()
    place_actor(globals.player, Vector2(1105, -136))
    reset_camera()
    await wait(0.2)
    await fade_in()

    end()

func rocket_room():
    start()

    await fade_out()
    place_actor(globals.player, Vector2(7735, -139))
    reset_camera()
    await wait(0.2)
    await fade_in()

    end()

func advance_time():
    start()


    if globals.ui.get_card_player.is_playing():
        await globals.ui.get_card_player.animation_finished

    start()

    fade_out_bgm()
    await fade_out()

    camera.drag_vertical_offset = 0
    camera.zoom = Vector2(1, 1)
    globals.player.speed = 4

    await reset_trans()
    await wait(0.2)

    if globals.hotel.game_level == 0:
        globals.ui.mm_label.text = "QUARTER  FINALS"
    elif globals.hotel.game_level == 1:
        globals.ui.mm_label.text = "SEMI  FINALS"
    elif globals.hotel.game_level == 2:
        globals.ui.mm_label.text = "GRAND  FINALS"

    globals.ui.mm_label.show()
    play_sound(load("res://Files/SoundEffects/dawn-of-the-first-day.mp3"))
    await wait(1.8)
    globals.ui.mm_label.hide()

    globals.hotel.advance_time()
    if globals.hotel.game_level == 3:
        setup_champion()
        place_audience()
        await wait(0.4)
        fade_in_bgm()
        globals.hotel.set_bgm()
        await fade_in()

        return
    else:
        place_actor(globals.player, Vector2(1588, 902))
        reset_camera()
        face_direction(globals.player, "down")

    fade_in_bgm()
    globals.hotel.set_bgm()
    await fade_in()
    end()

    await wait(2)
    get_bp(1)

func silver_event():
    start()

    var silver = get_npc_node("Silver")
    globals.enemy = silver
    globals.npc.balloon("Silver", "!")
    await wait(1)
    face_direction(globals.player, "up")

    await speak(silver, globals.npc.dialogue["Silver"]["2"])

    await wait(0.2)
    await wait_battle_end()



    await silver.interact()

    while silver.dialogue_state != silver.off:
        await wait(0.2)

    end()

func koga_event():
    start()

    var koga = get_npc_node("Koga")
    globals.enemy = koga

    var pokeball = $"../Objects/Pokeball"

    koga.visible = false
    place_actor(koga, globals.player.position + Vector2(-20, -50))
    face_direction(koga, "down")

    await blink_node(pokeball)
    await wait(0.2)

    await speak(globals.player, ["Huh? It's empty..."])

    await blink_node(koga)
    koga.visible = true
    await wait(0.4)

    pokeball.position = Vector2(9999, 9999)

    face_direction(globals.player, "up")
    await speak(koga, ["Ha! Right into my trap!", "Steel yourself!", [call_deferred, ["start_battle", "Koga"]]])
    await wait_battle_end()

    await speak(koga, ["Hahaha! That was quite fun.", "Take this as thanks for humoring me!", [call_deferred, ["get_item", "speed_up"]]])
    await wait(0.3)
    await speak(koga, ["Farewell!"])
    await blink_node(koga)
    place_actor(koga, Vector2(9999, 9999))
    await wait(0.3)
    globals.npc.progression["Koga"]["dialogue"] = "2a"

    end()

func misty_event():
    start()
    await wait(0.3)
    var misty = get_npc_node("Misty")
    var brock = get_npc_node("Brock")

    var player_record = globals.player_data.battles_won

    globals.enemy = misty

    await speak(misty, ["...Well, I understand sticking to your favorites, but Brock!", "You'll never beat me if you don't adapt your deck!"])

    await speak(brock, ["Heh, don't worry about that.", "Once my Rhyhorn learns Thunder Fang, it's over for you!", "Besides, I can always challenge Erika instead..."])

    await speak(misty, ["Ugh, I can't stand her... That whole act she puts up.", "'Oh, I'm so elegant, so pure!' Buzz off."])
    await globals.npc.balloon("Misty", "!")
    misty.face_player()
    await wait(0.6)

    await speak(misty, ["H-hey, how long have you been standing there?"])
    brock.face_player()
    await speak(brock, ["Ah! Great timing, I was just thinking about you.", "Aren't you tired of playing against one-trick ponies?", "Do you think you can take me and Misty together?"])

    face_direction(misty, "right")
    await globals.npc.balloon("Misty", "angry")
    await speak(misty, ["Well, I'd appreciate you asking me beforehand!"])
    misty.face_player()
    await speak(misty, ["... But I guess that could be fun.", "Alright, let's see what you got!", [call_deferred, ["start_battle", "BrockMisty"]]])
    await wait_battle_end()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:
        face_direction(misty, "right")
        await globals.npc.balloon("Misty", "angry")
        await speak(misty, ["Dammit Brock!", "Ugh, you really are a total screw up!"])
        await wait(0.6)
        misty.face_player()
        await wait(0.6)
        await speak(misty, ["Pff... Screw this.."])
        face_direction(brock, "up")
        await move_actor(misty, "up", 9, 2)
        await move_actor(misty, "right", 2, 2)
        place_actor(misty, Vector2(9999, 9999))
        await wait(1)

        brock.face_player()
        await wait(0.3)
        await speak(brock, ["Well... I had fun."])
        await speak(brock, ["I was going to use this item before playing...", "But you can have it since I forgot."])
        await get_item("rare_candy")
        await wait(0.4)
        globals.npc.progression["Brock"]["dialogue"] = "misty_lost"

    else:
        await speak(misty, ["Phew... That was way closer than it had to be."])
        await speak(brock, ["Thanks for the game, buddy."])

        globals.npc.progression["Misty"]["dialogue"] = "misty_won"
        globals.npc.progression["Brock"]["dialogue"] = "misty_won"
        face_direction(misty, "right")
        face_direction(brock, "left")

    misty.direction_locked = false
    brock.direction_locked = false
    end()

func surge_event():
    start()
    await wait(0.3)
    var erika = get_npc_node("Erika")
    var surge = get_npc_node("Surge")

    var player_record = globals.player_data.battles_won
    globals.enemy = surge

    await speak(surge, ["So, what would you do with the prize?", "I bet collectors would pay a lot for those 'legendary cards'..."])
    await speak(erika, ["... Well, I'm not worried about such things.", "I'm only here to play and have some fun."])
    await speak(surge, ["... You know something, don't you?", "Quit the act, I know you have some poison under the surface."])
    await wait(0.5)

    erika.face_player()
    await wait(0.6)
    surge.face_player()

    await speak(erika, ["Oh, hello. Don't you know it's rude to listen on private conversations?"])
    await speak(surge, ["Ha! Look who it is."])

    face_direction(surge, "right")
    await wait(0.6)
    surge.face_player()
    await wait(0.2)

    await speak(surge, ["Hey, Erika, I think we should teach this kid a lesson."])

    face_direction(erika, "left")
    await wait(0.6)
    erika.face_player()
    await wait(0.2)

    await speak(erika, ["Well, I'm usually aversed to such things...", "But maybe a honest beating could help them.", "... Free them from their wild curiosity.", [call_deferred, ["start_battle", "SurgeErika"]]])
    await wait_battle_end()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:

        await speak(surge, ["Don't get any ideas, punk.", "The legendary cards will be mine."])
        await wait(0.3)
        go_to_seat(surge)

        await wait(0.5)
        face_direction(globals.player, "up")
        await wait(1.5)

        face_direction(globals.player, "down")

        await wait(0.5)

        await speak(erika, ["You handled that very well, I'm surprised.", "Here, I want you to have this."])
        await get_item("hp_up")

        globals.npc.progression["Surge"]["dialogue"] = "0"
        globals.npc.progression["Erika"]["dialogue"] = "surge_lost"

    else:
        await speak(surge, ["Heh, now move along, punk. Or else.", ])

        globals.npc.progression["Surge"]["dialogue"] = "0"
        globals.npc.progression["Erika"]["dialogue"] = "surge_won"

        face_direction(surge, "right")
        face_direction(erika, "left")
    await wait(0.8)
    erika.direction_locked = false
    surge.direction_locked = false
    end()

func giovanni_event():
    start()

    globals.npc.progression["Giovanni"]["dialogue"] = "0"

    await wait(0.1)
    globals.player.anm_player.play("walk_left")
    var rocketf = get_npc_node("RocketF")
    var rocketm = get_npc_node("RocketM")
    var giovanni = get_npc_node("Giovanni")

    move_actor(globals.player, "left", 2, 0.5)
    await wait(0.6)

    if globals.player.position.y > -24:
        await move_actor(rocketf, "down", 1, 2)
        face_direction(rocketf, "right")
    await wait(2)
    place_actor(rocketm, globals.player.position + Vector2(96, -24))

    await move_actor(rocketm, "left", 2, 4)
    globals.hotel.get_node("BGMPlayer").volume_linear = 0
    globals.ui.screen_tint.color = Color("#ff0000")
    await wait(0.04)
    globals.ui.screen_tint.color = Color("#000000")

    place_actor(rocketf, Vector2(3908, -1581))
    place_actor(rocketm, Vector2(4076, -1581))
    await place_actor(globals.player, Vector2(3996, -1442))
    reset_camera()
    face_direction(rocketf, "down")
    face_direction(rocketm, "down")
    face_direction(globals.player, "up")

    await wait(1.6)
    var tween = get_tree().create_tween()
    tween.tween_property(globals.ui.screen_tint, "color", Color("#00000000"), 5)
    await wait(2)

    await speak(giovanni, ["Get their wallet."])
    face_direction(rocketf, "right")
    await wait(0.6)
    await move_actor(rocketf, "down", 3)
    await move_actor(rocketf, "right", 1)
    await wait(1)
    await show_message("You lost [color=eeca52]$%s[/color]." % globals.player_data.money)
    await move_actor(rocketf, "up", 3)
    face_direction(rocketf, "right")
    await wait(0.5)
    face_direction(giovanni, "left")
    await wait(1)

    face_direction(giovanni, "down")
    await wait(0.5)
    face_direction(rocketf, "down")
    await move_actor(giovanni, "down", 1)

    await speak(giovanni, ["Walking around like you own the place, huh?", "You ought to be more careful."])
    await wait(0.5)

    await speak(giovanni, ["Here's the deal.", "I'll give your cash back, and in return you do a little favor for me.", 
        "How does that sound?", 

        [
            ["What favor?", 
                [
                    "In the right wing of this hotel, there is a small break room.", "You'll find a letter there. Get it and bring it to me.", "We'll make sure the coast is clear.", "Think you can do that?", 
                    [
                        ["I'll do it.", 
                            [[call_deferred, ["giovanni_decision", 1]], ]
                        ], 

                        ["What's in the letter?", 
                            ["That's not for you to know.", "Just get the letter, and don't open it.", [call_deferred, ["giovanni_decision", 2]], ]
                        ], 

                        ["I'm out.", 
                            [[call_deferred, ["giovanni_decision", 0]], ]
                        ], 

                    ]
                ], 
            ], 

            ["No thanks, \"bro\".", 
                [[call_deferred, ["giovanni_decision", 0]], ]
            ], 
        ]
        ])

    if giovanni_decision_index == 2:
        await wait(0.4)
        await speak(giovanni, ["I'll ask you one more time.", "Will you do it?", 
                [
                    ["I'll do it.", 
                        ["Very good.", "That wasn't so bad, was it?", [call_deferred, ["giovanni_decision", 1]], ]
                    ], 

                    ["I won't do it.", 
                        [[call_deferred, ["giovanni_decision", 0]], ]
                    ], 
                ]

            ])

    if giovanni_decision_index == 0:
        globals.player_data.money = 0
        await wait(0.7)
        await speak(giovanni, ["Well, ain't that a shame."])

        face_direction(giovanni, "up")
        await wait(0.3)
        await move_actor(giovanni, "up", 1)
        await wait(0.7)

        await speak(giovanni, ["My associates will be escorting you out.", "See you around."])

        move_actor(rocketf, "down", 3, 0.4)
        move_actor(rocketm, "down", 3, 0.4)

        tween = get_tree().create_tween()
        tween.tween_property(globals.ui.screen_tint, "color", Color("#000000"), 1)
        await wait(1.5)

        globals.ui.screen_tint.color = Color("#ff0000")
        await wait(0.04)
        globals.ui.screen_tint.color = Color("#000000")

        await place_actor(globals.player, Vector2(7729, -143))

        globals.player.sprite.frame = 0
        globals.player.sprite.rotation_degrees = 90
        globals.player.sprite.skew = deg_to_rad(2)
        globals.player.sprite.scale.x = 2.5

        await wait(1)

        tween = get_tree().create_tween()
        tween.tween_property(globals.ui.screen_tint, "color", Color("#00000000"), 3)
        await wait(5)

        tween = get_tree().create_tween().set_parallel()
        tween.tween_property(globals.player.sprite, "skew", deg_to_rad(0), 0.2)
        tween.tween_property(globals.player.sprite, "scale", Vector2(2.5, 2), 0.2)
        await wait(0.3)

        globals.player.sprite.frame = 5
        tween = get_tree().create_tween().set_parallel()
        tween.tween_property(globals.player.sprite, "rotation_degrees", 0, 0.1)
        tween.tween_property(globals.player.sprite, "scale", Vector2(3, 3), 0.2)
        await wait(0.1)

        globals.player.sprite.frame = 5
        globals.player.facing_direction = "down"

        await wait(0.3)
        fade_in_bgm()

    if giovanni_decision_index == 1:
        globals.player_data.event_flags["giovanni_event"] = true
        await wait(0.4)
        await move_actor(giovanni, "down", 1)
        await wait(0.3)
        await speak(giovanni, ["Here's your cash back.", "No hard feelings, eh?"])
        await wait(0.3)
        await show_message("You got [color=eeca52]$%s[/color]." % globals.player_data.money)
        await wait(0.3)
        await speak(giovanni, ["Remember, the break room is in the right wing of the hotel.", "The letter will be there somewhere. Search it thoroughly.", "Oh, and... Obviously, don't open it.", "Once you have it, come straight to me."])
        await wait(0.5)

        await speak(giovanni, ["Fellas, please escort our friend out.", ])
        move_actor(rocketf, "down", 3, 0.2)
        move_actor(rocketm, "down", 3, 0.2)
        await wait(0.5)
        speak(giovanni, ["We'll be watching...", ])
        await wait(1)
        tween = get_tree().create_tween()
        tween.tween_property(globals.ui.screen_tint, "color", Color("#000000"), 1)
        await wait(3)

        await place_actor(globals.player, Vector2(7729, -143))
        face_direction(globals.player, "down")

        var gerson = get_npc_node("Gerson")
        place_actor(gerson, Vector2(1458, -237))
        face_direction(gerson, "right")
        place_actor(rocketm, Vector2(1490, -237))
        face_direction(rocketm, "left")
        globals.npc.progression["RocketM"]["dialogue"] = "event"
        globals.npc.progression["Gerson"]["dialogue"] = "giovanni"
        rocketm.direction_locked = true

        await fade_in()
        fade_in_bgm()

    globals.ui.trans_areas.cur_area = globals.ui.trans_areas.main_hotel
    globals.ui.trans_areas.transition()
    end()

func giovanni_event2():
    start()
    var rocketf = get_npc_node("RocketF")
    var rocketm = get_npc_node("RocketM")
    var giovanni = get_npc_node("Giovanni")
    await wait(0.3)

    await speak(rocketm, ["You better come inside."])
    await fade_out()
    await wait(0.1)

    await place_actor(globals.player, Vector2(3996, -1336))
    face_direction(globals.player, "up")
    globals.player.hide()
    reset_camera()
    place_actor(rocketf, Vector2(3908, -1581))
    place_actor(giovanni, Vector2(3985, -1600))

    face_direction(rocketf, "down")
    face_direction(giovanni, "down")
    await fade_in()

    await wait(0.2)
    face_direction(rocketm, "up")
    await place_actor(rocketm, Vector2(3996, -1336))
    await wait(0.3)
    move_actor(rocketm, "up", 2)
    await wait(0.4)
    globals.player.show()
    await wait(0.3)
    move_actor(rocketm, "right", 1)
    move_actor(globals.player, "up", 2)
    await wait(0.3)
    await move_actor(rocketm, "up", 3)
    await wait(0.2)
    face_direction(rocketm, "left")
    await speak(rocketm, ["He says he has it, boss."])
    await wait(0.2)

    face_direction(rocketm, "down")
    await move_actor(giovanni, "down", 1)

    await speak(giovanni, ["Very good.", "Come on, hand it over.", 
                            [
                                ["Give Letter", 
                                    [[call_deferred, ["giovanni_decision", 1]], ]
                                ], 

                                ["Refuse", 
                                    [[call_deferred, ["giovanni_decision", 0]], ]
                            ], 
                        ]
                    ])

    if giovanni_decision_index == 1:
        await move_actor(globals.player, "up", 1)
        await wait(0.4)
        await show_message("Handed over the [color=eeca52]Letter[/color].")
        item.consume_item("letter")
        await move_actor(giovanni, "up", 1, 0.5)
        await wait(1.3)
        face_direction(giovanni, "left")
        await wait(0.2)
        face_direction(rocketf, "right")
        await speak(giovanni, ["It's legit.", "Pay them."])
        face_direction(giovanni, "up")
        await move_actor(rocketf, "down", 2)
        await move_actor(rocketf, "right", 1)
        face_direction(globals.player, "left")
        await speak(rocketf, ["Here you go."])
        await get_item("ap_up")
        await wait(0.8)
        face_direction(rocketf, "up")
        face_direction(globals.player, "up")
        face_direction(giovanni, "down")
        await wait(0.3)
        await speak(giovanni, ["Nothing like a fair trade, eh?.", "Pleasure doing business."])
        await wait(0.3)
        face_direction(globals.player, "left")
        move_actor(rocketf, "right", 1)
        await wait(0.1)
        face_direction(globals.player, "up")
        var tween = get_tree().create_tween()
        tween.tween_property(globals.player, "position", globals.player.position + Vector2(0, 48), 0.1)
        await wait(0.4)
        move_actor(rocketf, "down", 2, 0.5)
        move_actor(globals.player, "down", 2, 0.5)
        await wait(0.2)
        await fade_out()
        await wait(1.2)
        place_actor(globals.player, Vector2(7735, -139))
        reset_camera()
        await fade_in()

    else:
        await speak(giovanni, ["Heh, having second thoughts?", ])
        await wait(0.4)
        move_actor(rocketf, "right", 1)
        face_direction(giovanni, "up")
        await wait(0.4)
        face_direction(rocketf, "down")
        await wait(0.4)
        await speak(giovanni, ["Fellas...", "Would you kindly teach this guy some manners?", ])
        move_actor(rocketm, "down", 2, 1.5)
        await move_actor(rocketf, "down", 2, 1.5)
        globals.enemy = rocketf
        var player_record = globals.player_data.battles_won
        globals.npc.start_battle("RocketF")
        await wait(2)
        face_direction(giovanni, "down")

        while globals.battle.battle_result == "":
            await wait(0.01)
        if globals.battle.battle_result == "win":
            place_actor(giovanni, Vector2(9999, 9999))

        while not globals.battle.battle_over:
            await wait(0.01)

        if globals.player_data.battles_won > player_record:
            await wait(0.6)
            rocketm.anm_player.play("walk_down")
            var tween = get_tree().create_tween()
            tween.tween_property(rocketm, "position", rocketm.position + Vector2(0, -48), 0.3)
            await tween.finished
            rocketm.anm_player.stop()
            face_direction(rocketm, "down")
            await wait(0.3)
            await speak(rocketm, ["Uh... Boss?", "What do we do now?"])
            await wait(0.4)
            await speak(rocketm, ["... Boss?"])
            face_direction(rocketm, "up")
            face_direction(rocketf, "up")
            await wait(0.2)

            globals.npc.balloon("RocketF", "!")
            await globals.npc.balloon("RocketM", "!")
            face_direction(rocketm, "left")
            face_direction(rocketf, "right")
            await wait(0.6)
            await speak(rocketf, ["Can't believe he dipped on us again!"])
            await wait(1)
            face_direction(rocketm, "down")
            face_direction(rocketf, "down")

            await speak(rocketm, ["... N-no hard feelings, right?", "Look, I just work here..."])
            await speak(rocketf, ["Er...", "Gotta go!"])
            move_actor(rocketf, "down", 3, 3)
            await move_actor(rocketm, "down", 4, 3)
            place_actor(rocketf, Vector2(9999, 9999))
            place_actor(rocketm, Vector2(9999, 9999))

        else:

            await wait(0.8)
            await speak(rocketf, ["Now, if you excuse me..."])
            await move_actor(rocketf, "down", 1)
            face_direction(rocketf, "right")
            await speak(rocketf, ["You have something that belongs to my boss."])
            await wait(0.6)
            await show_message("The [color=eeca52]Letter[/color] was taken.")
            await wait(0.4)

            move_actor(rocketm, "up", 1)
            await move_actor(rocketf, "up", 2)
            face_direction(rocketm, "down")
            face_direction(rocketf, "right")

            await wait(0.8)
            face_direction(giovanni, "left")
            await wait(0.6)
            face_direction(giovanni, "up")
            await wait(0.3)
            face_direction(rocketf, "down")
            await wait(1)
            await speak(giovanni, ["... Oh, so  that's what it was..."])

            await wait(0.8)
            face_direction(giovanni, "down")
            await wait(0.4)
            await speak(giovanni, ["I'm thankful for your service, its a shame it had to end like this.", "My associates will be escorting you out.", "See you around."])

            move_actor(rocketf, "down", 3, 0.4)
            move_actor(rocketm, "down", 3, 0.4)

            var tween = get_tree().create_tween()
            tween.tween_property(globals.ui.screen_tint, "color", Color("#000000"), 1)
            await wait(1.5)

            globals.ui.screen_tint.color = Color("#ff0000")
            await wait(0.04)
            globals.ui.screen_tint.color = Color("#000000")

            await place_actor(globals.player, Vector2(7729, -143))

            globals.player.sprite.frame = 0
            globals.player.sprite.rotation_degrees = 90
            globals.player.sprite.skew = deg_to_rad(2)
            globals.player.sprite.scale.x = 2.5

            await wait(1)

            tween = get_tree().create_tween()
            tween.tween_property(globals.ui.screen_tint, "color", Color("#00000000"), 3)
            await wait(5)

            tween = get_tree().create_tween().set_parallel()
            tween.tween_property(globals.player.sprite, "skew", deg_to_rad(0), 0.2)
            tween.tween_property(globals.player.sprite, "scale", Vector2(2.5, 2), 0.2)
            await wait(0.3)

            globals.player.sprite.frame = 5
            tween = get_tree().create_tween().set_parallel()
            tween.tween_property(globals.player.sprite, "rotation_degrees", 0, 0.1)
            tween.tween_property(globals.player.sprite, "scale", Vector2(3, 3), 0.2)
            await wait(0.1)

            globals.player.sprite.frame = 5
            globals.player.facing_direction = "down"

            await wait(0.3)

    end()

func opening_letter():
    start()
    await globals.ui.close_menu()
    globals.player.state = globals.player.locked
    await wait(0.3)
    await speak(globals.player, ["Should I open the letter?", 
                                    [
                                        ["Yes", 
                                            [[call_deferred, ["open_letter"]], ]
                                        ], 

                                        ["No", 
                                            []
                                        ], 
                                    ]

                                ])
    end()

func open_letter():
    item.consume_item("letter")
    globals.npc.update_dialogue_progression("RocketM", "letter_open")
    globals.player_data.event_flags["letter_open"] = true
    globals.npc.get_item("back_half")

func sabrina_event():
    start()
    globals.player_data.event_flags["sabrina_event"] = true

    await wait(0.3)
    var sabrina = get_npc_node("Sabrina")

    await speak(sabrina, ["Have you began to notice yet?", "How this world is beyond salvation..."])
    await wait(0.3)
    await speak(sabrina, ["There's something you should know.", "Joey found a bug.", "Good luck."])
    await wait(0.3)


    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
    tween.tween_property(sabrina, "scale", Vector2(1.2, 0.8), 0.2)
    tween.tween_property(sabrina, "scale", Vector2(0, 3), 0.1)
    await tween.finished
    place_actor(sabrina, Vector2(9999, 9999))

    if globals.hotel.game_level == 2 and globals.npc.progression["Joey"]["dialogue"] == "-1":
        place_actor(get_npc_node("Joey"), Vector2(1496, 492))
    globals.npc.progression["Joey"]["dialogue"] = "bug"
    end()

    await wait(0.1)
    sabrina.scale = Vector2(1, 1)

func joey_event():
    start()
    await wait(0.3)
    var joey = get_npc_node("Joey")
    var player_record = globals.player_data.battles_won
    globals.enemy = joey

    var dialogue = [
            "Hey, let's have a battle!", "... Hehehe...", 
            [
                ["Sure", 
                    [
                    "You think you're about to get a free win, aren't you!?", "I'm sick of it!", "You'll get what you freaking deserve!", 
                    [call_deferred, ["start_battle", "Joey"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Let's just say I'm only using one card, and it is in the top percentage.", "Hehehe..."
                    ], 
                ], 

                ["Found a bug?", 
                    [
                        "W-who told-", 
                        "I-I mean, I don't know what you're talking about.", 
                        "Listen, if you're not playing, then we're done here.", 

                    ]
                ], 

                ["Leave", 
                    [
                    "Really? That's no fun...", 
                    ]
                ]
            ], 
        ]

    await speak(joey, dialogue)

    await wait(0.1)
    if globals.hotel.get_node("Battle").get_children() == []:
        await end()
        return

    await wait_battle_end()

    if globals.player_data.battles_won > player_record:
        await speak(joey, ["H-how... My top percentage Rattata..."])
        await wait(0.3)
        await speak(joey, ["... Okay, I'll come clean...", "I'll give you what I found."])
        await get_item("torn_page")
        globals.npc.progression["Joey"]["dialogue"] = "bug_lost"
        await wait(0.3)

    else:
        await speak(joey, ["Hehehe, what did you think of my Rattata?", "Pretty pimp, huh?"])
        globals.npc.progression["Joey"]["dialogue"] = "bug_won"

    end()

func falkner_event():
    start()
    globals.npc.progression["Falkner"]["dialogue"] = "0"


    var previous_box = globals.player_data.player_box.duplicate(true)

    globals.player_data.player_party = [null, null, null, null, null, null]
    globals.auto_battle = false
    globals.pre_battle_formation = true
    var player_record = globals.player_data.battles_won

    if globals.hotel.game_level == 0:
        globals.player_data.player_box = [globals.generate_pokemon("rattata", 3, {"bonus_power": 15}), 
                                          globals.generate_pokemon("zigzagoon", 3, {"bonus_power": 5}), 
                                          globals.generate_pokemon("jigglypuff", 3, {"bonus_ap": 1}), 
                                          globals.generate_pokemon("skitty", 3, {"bonus_power": 10}), 
                                          globals.generate_pokemon("metapod", 3, {"bonus_health": 15}), 
                                          globals.generate_pokemon("kakuna", 3, {"bonus_health": 15}, ), 
                                        ]

    else:
        globals.player_data.player_box = [globals.generate_pokemon("raticate", 5, {"bonus_power": 10}), 
                                          globals.generate_pokemon("linoone", 5, {"bonus_power": 5}), 
                                          globals.generate_pokemon("wigglytuff", 5, {"bonus_health": 10}), 
                                          globals.generate_pokemon("delcatty", 5, {"bonus_power": 10}), 
                                          globals.generate_pokemon("beedrill", 5, {"bonus_power": 5}), 
                                          globals.generate_pokemon("butterfree", 5, {"bonus_power": 10}, ), 
                                        ]

    var falkner = get_npc_node("Falkner")
    var joey = get_npc_node("Joey")
    var megan = get_npc_node("Megan")
    var weevil = get_npc_node("Weevil")
    globals.enemy = falkner

    await wait(0.3)
    await speak(falkner, ["... And that's why I will always totally own you lamers!", "Your pathetic cards stand no chance against my magnificent bird Pokémon!"])
    await speak(megan, ["Damn, what is your damage?", "If you're so good, why aren't you playing in the game room?"])
    await speak(falkner, ["Er... You newbies should be thankful I'm here giving free tips.", "Anyways, who's next?"])

    await wait(0.3)
    joey.face_player()
    await globals.npc.balloon("Joey", "!")
    await speak(joey, ["H-hey! can you please get this guy off our backs?"])
    await speak(falkner, ["What?"])
    falkner.face_player()
    await wait(0.5)
    await speak(falkner, ["Uh..."])

    face_direction(falkner, "right")
    face_direction(joey, "left")
    await speak(falkner, ["That's totally unfair, I didn't bring my real deck today!", "That's the only reason you guys even stand a chance."])
    await speak(joey, ["Well, they can just play with OUR cards then, to make it fair."])

    await wait(0.3)
    joey.face_player()
    await speak(joey, [
        "You'd be okay with this, right?", 
            [
                ["Fine by me.", 
                    [[call_deferred, ["falkner_decision", true]], ]
                ], 

                ["No way.", 
                    [[call_deferred, ["falkner_decision", false]], ]
                ], 
            ]
    ])

    if falkner_decision_value:
        globals.player_data.battles_fought -= 1
        await speak(joey, ["Okay! Gimme a sec.", ])
        await wait(0.1)
        await move_actor(joey, "up", 1)
        face_direction(joey, "right")
        await wait(0.3)
        await speak(weevil, ["Hey, careful with those, buttmunch."])

        face_direction(weevil, "down")
        await move_actor(joey, "down", 2)
        face_direction(joey, "right")
        await wait(0.5)

        var move_memory = 0

        if globals.player.facing_direction == "up":
            face_direction(megan, "down")
            await move_actor(joey, "down", 1)
            while joey.position.x != globals.player.position.x:
                move_memory += 1
                await move_actor(joey, "right", 1)
            face_direction(joey, "down")
        else:
            face_direction(weevil, "left")
            await move_actor(joey, "left", 3)
            move_memory = 3
            if globals.player.position.y != joey.position.y:
                move_memory += 1
                await move_actor(joey, "left", 1)
                face_direction(joey, "up")
                face_direction(globals.player, "down")

        await wait(0.3)
        await speak(joey, ["Here you go!", "Please, get this guy to take it down a notch!"])


        if globals.player.facing_direction == "up":
            await move_actor(joey, "left", move_memory)
            await move_actor(joey, "up", 2)
            face_direction(joey, "down")
        else:
            face_direction(globals.player, "right")
            await move_actor(joey, "right", move_memory)
            await move_actor(joey, "up", 1)
            face_direction(joey, "left")

        await speak(falkner, ["T-that's fine!", "I'll show everyone the power of my bird cards!"])
        falkner.face_player()
        await speak(falkner, ["Think you can take me, huh?", "Get ready to be proven wrong!", [call_deferred, ["start_battle", "Falkner"]]])

        await wait_battle_end()
        await wait(0.5)


        if globals.player_data.battles_won > player_record:
            face_direction(falkner, "right")
            await speak(joey, ["Yeah! I knew you could do it!"])
            await speak(megan, ["Thank God... Can you imagine how he'd act if he won..."])
            await speak(weevil, ["Heheh, good job I guess. Heheheh.", "Now hurry and gimme my cards back."])

            await wait(0.5)
            falkner.face_player()
            await speak(falkner, ["How...", "How did you beat me with those crappy cards..."])
            await wait(0.3)
            await speak(falkner, ["I guess... It's over for me.", "It's truly, truly over."])
            await wait(0.3)
            await speak(falkner, ["Here you go. I don't need this anymore."])

            await get_item("pp_up")
            await wait(0.5)
            await move_actor(falkner, "left", 4)
            face_direction(globals.player, "up")
            await wait(0.8)
            await speak(falkner, ["... Truly, truly over... "])
            await move_actor(falkner, "up", 2)

            move_actor(falkner, "up", 11)
            move_actor(joey, "up", 1)
            move_actor(weevil, "right", 2)
            await move_actor(megan, "left", 4)

            face_direction(joey, "down")
            face_direction(weevil, "left")
            await move_actor(megan, "down", 1)
            face_direction(megan, "right")


            globals.npc.progression["Joey"]["dialogue"] = "falkner_lost"
            globals.npc.progression["Megan"]["dialogue"] = "falkner_lost"
            globals.npc.progression["Weevil"]["dialogue"] = "falkner_lost"
            await wait(1)
            falkner.position = Vector2(9999, 9999)

        else:
            await speak(falkner, ["Ha! There you go.", ])
            face_direction(falkner, "right")
            await wait(0.2)
            await speak(falkner, ["See! No matter how you play them, these cards are simply inferior.", ])

            face_direction(joey, "down")
            await speak(joey, ["Oh boy, now we really gonna hear it...", ])
            await wait(0.2)

            falkner.face_player()
            await speak(falkner, ["Thank you for the participation.", "I'll take the opportunity to educate these newbies further."])
            face_direction(joey, "left")
            face_direction(falkner, "right")
            globals.npc.progression["Falkner"]["dialogue"] = "falkner_won"
            globals.npc.progression["Joey"]["dialogue"] = "falkner_won"
            globals.npc.progression["Megan"]["dialogue"] = "falkner_won"
            globals.npc.progression["Weevil"]["dialogue"] = "falkner_won"
            falkner.direction_locked = true

    else:
        await speak(joey, ["Oh no... I guess we're on our own."])
        face_direction(joey, "up")
        face_direction(megan, "up")
        face_direction(weevil, "down")
        await speak(weevil, ["I gotta get out of here."])
        await wait(0.2)

        await move_actor(weevil, "left", 2, 3)
        face_direction(joey, "left")
        face_direction(megan, "left")
        await move_actor(weevil, "down", 1, 3)
        await move_actor(weevil, "down", 1, 3)
        await move_actor(weevil, "left", 5, 3)
        face_direction(globals.player, "up")
        await move_actor(weevil, "up", 13, 3)
        weevil.position = Vector2(9999, 9999)
        globals.npc.progression["Falkner"]["dialogue"] = "falkner_won"
        globals.npc.progression["Joey"]["dialogue"] = "falkner_won"
        globals.npc.progression["Megan"]["dialogue"] = "falkner_won"
        globals.npc.progression["Weevil"]["dialogue"] = "falkner_won"
        falkner.direction_locked = true

    globals.player_data.player_party = [null, null, null, null, null, null]
    globals.player_data.player_box = previous_box
    globals.auto_battle = false
    globals.pre_battle_formation = true

    end()

func janine_event():
    start()

    globals.npc.progression["Janine"]["dialogue"] = "2a"

    var janine = get_npc_node("Janine")
    janine.anm_player.speed_scale = 5

    janine.visible = false
    await wait(0.1)
    place_actor(janine, globals.player.position + Vector2(-160, -20))
    await blink_node(janine)
    janine.visible = true
    face_direction(globals.player, "left")

    await move_actor(janine, "right", 7, 12)
    face_direction(globals.player, "right")

    var tween = get_tree().create_tween()
    tween.tween_property(janine, "rotation_degrees", 6, 0.1)
    await wait(0.2)
    tween = get_tree().create_tween()
    tween.tween_property(janine, "rotation_degrees", 0, 0.2)
    await tween.finished

    globals.player_data.money -= 20
    await show_message("You lost [color=eeca52]$20[/color].")

    face_direction(janine, "left")
    await wait(0.2)



    await speak(janine, ["Ha! Perfect execution!", "You've been struck by the great ninja Janine!", "Thanks for the cash, sucker!"])

    await move_actor(janine, "up", 11, 8)

    place_actor(janine, Vector2(7926, -139))
    face_direction(janine, "right")
    janine.anm_player.speed_scale = 1

    end()

func janine_event2():
    start()
    globals.npc.progression["Janine"]["dialogue"] = "0"

    var janine = get_npc_node("Janine")
    await globals.npc.balloon("Janine", "!")
    await move_actor(janine, "right", 1, 4)
    face_direction(janine, "left")

    await speak(janine, ["Eek!", 
        "H-how did you find me?", 
        "L-look, I was just playing around, okay? Let's not do anything rash...", 
        "Here, you can have your stuff back, I'll even give you a bonus...", 
        "I was going to return it anyways..."]
        )

    globals.player_data.money += 40
    await show_message("You got [color=eeca52]$40[/color].")
    await wait(0.4)

    await speak(janine, ["Wait, who's that behind you?"])
    face_direction(globals.player, "left")
    await wait(0.3)

    blink_node(janine.get_node("Sprite2D"))
    await wait(0.8)
    face_direction(globals.player, "right")
    await speak(janine, ["Haha! Perfect escape!", "See you around!"])
    await wait(0.4)
    janine.position = Vector2(9999, 9999)
    janine.get_node("Sprite2D").visible = true

    end()

func cilan_event():
    start()
    await wait(0.3)
    var cilan = get_npc_node("Cilan")
    var cress = get_npc_node("Cress")
    var chili = get_npc_node("Chili")

    globals.enemy = cilan
    var player_record = globals.player_data.battles_won
    cilan.face_player()
    cress.face_player()
    chili.face_player()















    var dialogue = [
            "Hohoho...", 
            "Could it be you wish to challenge us?", 
            [
                ["Sure", 
                    [
                    "Let's mix things up!", 
                    [call_deferred, ["start_battle", "Cilan"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Me and my brothers are masters of all colors.", 
                    "Together we are unstoppable!"
                    ], 
                ], 

                ["Leave", 
                    [
                    "Hm... Regretable.", 
                    ]
                ], 


            ], 
        ]

    await speak(cilan, dialogue)

    await wait(0.1)
    if globals.hotel.get_node("Battle").get_children() != []:
        await wait_battle_end()
        await wait(0.3)
        if globals.player_data.battles_won > player_record:
            await speak(cress, ["Oh, bother... This one seems competent."])
            await speak(cilan, ["It seems your deck is even more balanced than ours...", "Amazing!"])
            await speak(chili, ["Psh... You got lucky."])

            globals.npc.update_dialogue_progression("Cress", "lost")
            globals.npc.update_dialogue_progression("Chili", "lost")

        else:
            await speak(chili, ["Heh, that was awesome!"])
            await speak(cilan, ["What a delicious victory!"])
            await speak(cress, ["Indeed."])

            globals.npc.update_dialogue_progression("Cress", "won")
            globals.npc.update_dialogue_progression("Chili", "won")

    cilan.face_facing_direction()
    cress.face_facing_direction()
    chili.face_facing_direction()
    end()

func get_letter():


    get_item("letter")

    var gerson = get_npc_node("Gerson")
    var rocketm = get_npc_node("RocketM")
    face_direction(gerson, "down")
    gerson.facing_direction = "down"

    place_actor(rocketm, Vector2(7729, -143))
    face_direction(rocketm, "down")
    rocketm.direction_locked = false
    globals.npc.progression["RocketM"]["dialogue"] = "letter"




func office_warp():
    var prev_volume = globals.hotel.get_node("BGMPlayer").volume_db
    globals.hotel.get_node("BGMPlayer").volume_db = linear_to_db(0)

    globals.ui.get_node("../Static/AnimationPlayer").play("static_gbc")
    var trans = globals.hotel.get_node("TransAreas")
    trans.cur_area = trans.main_hotel


    await start()

    await wait(0.2)
    trans.transition()
    place_actor(globals.player, Vector2(1116, 334))
    await wait(0.01)
    reset_camera()
    end()
    await globals.ui.get_node("../Static/AnimationPlayer").animation_finished
    globals.hotel.get_node("BGMPlayer").volume_db = prev_volume

func setup_champion():
    start()
    await wait(0.1)
    var oak = get_npc_node("Oak")
    globals.npc.update_dialogue_progression("Oak", "0a")

    place_actor(globals.player, Vector2(676, 1218))
    face_direction(globals.player, "up")
    reset_camera()

    place_actor(oak, Vector2(540, 1118))
    face_direction(oak, "right")

    if globals.hotel.champion == "Red":
        var red = get_npc_node("Red")
        place_actor(red, Vector2(674, 1053))




    await wait(1.4)
    await move_actor(oak, "right", 2, 0.6)
    await wait(0.2)
    face_direction(oak, "down")
    await wait(0.3)
    await speak(oak, ["Alright everybody, here's our final match for the day."])
    face_direction(oak, "right")
    await wait(0.7)
    face_direction(oak, "down")
    await wait(0.3)

    if globals.hotel.champion not in ["Kaiba"]:
        await speak(oak, ["That's right, give it up for %s everybody." % globals.hotel.champion])

    elif globals.hotel.champion == "Kaiba":
        await speak(oak, ["That's right, give it up for, uh..."])
        face_direction(oak, "right")
        await wait(0.7)
        face_direction(oak, "down")
        await wait(0.3)
        await speak(oak, ["... Well, apparently give it up for Seto Kaiba everybody."])

    audience_nodes.shuffle()
    if globals.hotel.champion == "Lance":
        await speak(get_npc_node("Lance"), ["That's right, it's me again!", "They thought they could stop the demon, I'm back!"])
        await wait(0.3)

        await speak(audience_nodes[0], ["Lance totally stomped last week's challenger..."])
        await speak(audience_nodes[1], ["The other guy is screwed.", "Lance is the biggest tryhard around."])
        await speak(audience_nodes[2], ["So anybody wanna catch a movie later or...?"])

    elif globals.hotel.champion == "Red":
        await speak(get_npc_node("Red"), ["...", ])
        await wait(0.3)

        await speak(audience_nodes[0], ["Well, he never really had that much to say."])
        await speak(audience_nodes[1], ["Maybe you guys should learn from him.", "Some of you never shut up."])
        await speak(audience_nodes[2], ["Can somebody explain to me why do we get matched against Red?", "I thought matchmaking was supposed to be fair?"])

    elif globals.hotel.champion == "Steven":
        await speak(get_npc_node("Steven"), ["Hello, friends!", "It's nice to be here again."])
        await wait(0.3)

        await speak(audience_nodes[0], ["Is this guy really wearing a suit to play card games?", "Come on, bruh..."])
        await speak(audience_nodes[1], ["What did you expect?", "That's the nerd who's always talking about rocks.", ])
        await speak(audience_nodes[2], ["Actually they're called minerals, dumbass."])

    elif globals.hotel.champion == "Cynthia":
        await speak(get_npc_node("Cynthia"), ["Thanks for inviting me!", "We better put on a good show today, challenger."])
        await wait(0.3)

        await speak(audience_nodes[0], ["WOW... I didn't know she was coming today!", ])
        await speak(audience_nodes[1], ["To think I get to watch Cynthia stomp some guy...", "Life can really turn around, never give up."])
        await speak(audience_nodes[2], ["CYNTHIA, BEAT ME UP NEXT!!!"])

    elif globals.hotel.champion == "Palmer":
        await speak(get_npc_node("Palmer"), ["You'll get turned into an example, kid.", ])
        await wait(0.3)

        await speak(audience_nodes[0], ["What? I don't remember ever seeing this guy.", ])
        await speak(audience_nodes[1], ["Are you new? Palmer is a stone cold pro.", "He'd beat everyone is this room easily."])
        await speak(audience_nodes[2], ["I can't wait for the Battle Frontier construction to be done!"])
        await wait(1)
        await speak(audience_nodes[2], ["It's never gonna happen isn't it..."])

    elif globals.hotel.champion == "Alder":
        await speak(get_npc_node("Alder"), ["Hey people, let's make some noise!", ])
        await wait(0.3)

        await speak(audience_nodes[0], ["Isn't this guy too old to be playing a children's card game?", ])
        await speak(audience_nodes[1], ["Bro... Look around, everybody here is at least 30.", "Pokémon is for adults!"])
        await speak(audience_nodes[2], ["Wait a minute, I better get out of here..."])

    elif globals.hotel.champion == "Diantha":
        await speak(get_npc_node("Diantha"), ["It's a pleasure to be here again.", ])
        await wait(0.3)

        await speak(audience_nodes[0], ["Oh my God... My friends are never going to believe this.", ])
        await speak(audience_nodes[1], ["Is there going to be a fan meetup later?", "I have a trading card I'd like signed..."])
        await speak(audience_nodes[2], ["Not this cloutless moron thinking Diantha will even look at them."])

    elif globals.hotel.champion == "Kaiba":
        await speak(get_npc_node("Kaiba"), ["Let's cut to the chase.", "My time is way too valuable to waste on this bullshit."])
        await wait(0.3)

        await speak(audience_nodes[0], ["Great, now there are two of them.", ])
        await speak(audience_nodes[1], ["How is he the champion if he hasn't even been here before?", "Tch, I guess money really does buy everything..."])
        await speak(audience_nodes[2], ["Does that mean we'll have to start playing using Duel Disks?!", "God, I hope so..."])



    await speak(oak, ["Alright alright, that's enough."])
    await wait(0.4)
    await speak(oak, ["Challenger! You may approach the champion whenever you're ready."])
    await move_actor(oak, "left", 2)
    face_direction(oak, "right")
    get_bp(1)
    end()

func champion_beaten():

    start()
    await wait(0.3)

    var oak = get_npc_node("Oak")
    var champion = get_npc_node(globals.hotel.champion)
    await move_actor(oak, "right", 1, 0.6)
    face_direction(globals.player, "left")
    face_direction(champion, "left")
    await speak(oak, ["Wow, what a great battle.", "Congratulations, %s! You're the new champion." % globals.player.player_name])


    await globals.ui.bf_victory(true)

    face_direction(oak, "down")
    face_direction(champion, "down")
    face_direction(globals.player, "down")

    audience_nodes.shuffle()
    var cont = 0
    for i in range(4):
        if audience_nodes[cont].npc_name == "Erika":
            cont += 1
            continue

        await speak(audience_nodes[cont], ["Congratulations!"])
        cont += 1

    await speak(oak, ["Alright, let's wrap this up."])
    face_direction(oak, "right")
    face_direction(globals.player, "left")
    await speak(oak, ["%s, come with me please." % globals.player.player_name])
    await fade_out()
    await wait(0.05)

    place_actor(oak, Vector2(1751, 687))
    place_actor(globals.player, Vector2(1738, 778))
    face_direction(oak, "down")
    face_direction(globals.player, "up")
    reset_camera()

    for i in globals.hotel.actors.get_children():
        if i not in [globals.player, get_npc_node("Oak"), get_npc_node("Gerson"), get_npc_node("Old Man"), get_npc_node("Old Lady"), get_npc_node("Demi-Fiend")]:
            place_actor(i, Vector2(9999, 9999))

    await wait(0.05)
    await fade_in()
    await wait(0.2)
    await speak(oak, ["Here's your prize."])
    get_bp(3)
    await wait(1)

    await speak(oak, ["Today was pretty fun, wasn't it?", "You can leave through the door behind you."])
    globals.npc.progression["Oak"]["dialogue"] = "end"
    globals.player_data.event_flags["endgame"] = true
    end()

func champion_won():
    pass




func interact_wish():
    start()

    globals.ui.keyboard_question = "ENTER KEY:"
    await globals.ui.show_keyboard()

    while globals.ui.state == globals.ui.keyboard:
        await wait(0.1)

    if globals.ui.keyboard_confirm:
        if globals.ui.current_input not in ["WISH", "MISSING"] or (globals.ui.current_input == "WISH" and globals.player_data.event_flags["mew_event"]) or (globals.ui.current_input == "MISSING" and globals.player_data.event_flags["missingno_event"]):
            node_hurt(globals.player)
            var tween = get_tree().create_tween()
            tween.tween_property(globals.player, "global_position", globals.player.global_position - Vector2(0, -48), 0.1)
            await tween.finished
            await wait(0.2)
            if (globals.ui.current_input == "WISH" and globals.player_data.event_flags["mew_event"]) or (globals.ui.current_input == "MISSING" and globals.player_data.event_flags["missingno_event"]):
                await globals.cutscenes.speak(globals.player, ["The handle is blistering!"])

        elif globals.ui.current_input == "WISH":
            globals.player_data.event_flags["mew_event"] = true
            activate_gbc_mode()
            await wait(0.01)
            globals.player.sprite.texture = load("res://Files/Sprites/Characters/SurfGBC.png")

            place_actor(globals.hotel.get_node("Objects/Truck"), Vector2(7588, -1854))
            place_actor(globals.player, Vector2(6768, -1506))
            face_direction(globals.player, "down")
            await globals.ui.get_node("../Static/AnimationPlayer").animation_finished

            globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Surf.mp3")
            globals.hotel.get_node("BGMPlayer").play(7)
            globals.hotel.get_node("BGMPlayer").volume_db = -15

            return


        elif globals.ui.current_input == "MISSING":
            globals.player_data.event_flags["missingno_event"] = true
            activate_gbc_mode()
            await wait(0.01)
            globals.player.sprite.texture = load("res://Files/Sprites/Characters/Old Red.png")

            place_actor(globals.player, Vector2(8920, -1823))
            face_direction(globals.player, "down")
            await globals.ui.get_node("../Static/AnimationPlayer").animation_finished

            globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Cinnabar.mp3")
            globals.hotel.get_node("BGMPlayer").play(7)
            globals.hotel.get_node("BGMPlayer").volume_db = -15

            return

    globals.ui.keyboard_confirm = false
    end()

func interact_truck():
    globals.player.state = globals.player.locked


    var messagebox = globals.ui.gbc.get_node("MessageBox")
    messagebox.show()
    await wait(0.3)
    messagebox.get_node("Sprite2D").frame = 1
    await wait(0.3)
    var string = "%s  used\nSTRENGTH." % globals.player_data.player_box[0]["dex"]["name"].to_upper()
    await spell_gbc(string)
    await wait(0.8)
    messagebox.get_node("Label").text = ""
    messagebox.get_node("Sprite2D").frame = 0
    await wait(0.2)
    messagebox.hide()

    globals.ui.gui_player.stream = load("res://Files/SoundEffects/SFX_PUSH_BOULDER.wav")
    globals.ui.gui_player.play()

    var truck = globals.hotel.get_node("Objects/Truck")
    var direction = 1
    truck.get_node("Dust").position.x = -41
    if globals.player.facing_direction == "left":
        truck.get_node("Dust").position.x = 7
        direction = -1

    var tween = get_tree().create_tween()
    tween.tween_property(truck, "global_position", truck.global_position + Vector2(48 * direction, 0), 0.8)
    await tween.finished

    tween = get_tree().create_tween()
    tween.tween_property(truck.get_node("Dust"), "global_position", truck.get_node("Dust").global_position + Vector2(48 * - direction, 0), 1)
    await wait(0.4)
    blink_node(truck.get_node("Dust"))
    await tween.finished
    await wait(0.1)

    globals.ui.get_node("../GBC/GBCBattle/Enemy").frame = 0
    globals.ui.get_node("../GBC/GBCBattle/EnemyStatus/Name").text = "MEW"
    globals.ui.get_node("../GBC/GBCBattle/EnemyStatus/Level").text = "5"




    globals.ui.get_node("../GBC/GBCBattle/InputBox/BALL").text = "BALL"
    globals.ui.get_node("../GBC/GBCBattle/InputBox/RUN").text = "RUN"
    globals.ui.get_node("../GBC/GBCBattle/InputBox/HEALTH").text = ""
    globals.ui.get_node("../GBC/GBCBattle/InputBox/YOU").text = ""

    globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Battle.mp3")
    globals.hotel.get_node("BGMPlayer").play()
    globals.ui.gbc.get_node("AnimationPlayer").play("gbc_battle")
    globals.player.get_node("GUIPlayer").stream = load("res://Files/SoundEffects/SFX_MEW_CRY.wav")
    await wait(4.05)
    globals.hotel.get_node("BGMPlayer").volume_db = linear_to_db(0)
    globals.player.get_node("GUIPlayer").play()
    await wait(0.02)
    wait_cry()
    await wait(0.45)
    string = "Wild   MEW\nappeared!"
    await spell_gbc(string)


    await globals.ui.gbc.get_node("AnimationPlayer").animation_finished

    var pointer_pos = [Vector2(-20, 278), Vector2(-20, 370)]
    var pointer_index = 0
    globals.ui.gui_player.stream = load("res://Files/SoundEffects/SFX_PRESS_AB.wav")
    while true:
        if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up"):
            if pointer_index == 0:
                pointer_index = 1
            else:
                pointer_index = 0

            globals.ui.gbc.get_node("GBCBattle/InputBox/Pointer").position = pointer_pos[pointer_index]

        elif Input.is_action_just_pressed("Accept"):
            globals.ui.gui_player.play()

            globals.ui.gbc.get_node("GBCBattle/InputBox").hide()
            break

        await wait(0.01)

    if pointer_index == 1:
        await wait(0.2)
        globals.ui.gui_player.stop()
        globals.ui.gui_player.stream = load("res://Files/SoundEffects/SFX_RUN.wav")
        globals.ui.gui_player.play()
        string = "Got  away  safely!"
        await spell_gbc(string)

        await wait(0.8)


        globals.ui.gbc.get_node("GBCBattle/Enemy").hide()
        globals.ui.gbc.get_node("GBCBattle/EnemyStatus").hide()
        await wait(0.1)

        globals.ui.gbc.get_node("GBCBattle/Trainer").hide()
        messagebox.get_node("Label").text = ""
        await wait(0.2)
        ssanne_warp()

    else:
        await spell_gbc("RED  used\nPOKé  BALL!")
        await wait(0.2)
        globals.ui.gbc.get_node("AnimationPlayer").play("gbc_pokeball")
        await globals.ui.gbc.get_node("AnimationPlayer").animation_finished


        await wait(0.6)
        globals.hotel.get_node("BGMPlayer").stop()
        globals.hotel.get_node("BGMPlayer").stream = load("res://Files/SoundEffects/SFX_CAUGHT_MON.wav")
        globals.hotel.get_node("BGMPlayer").play()
        await spell_gbc("Alright!  MEW\nwas  caught!")
        await wait(1)

        globals.player_data.add_pokemon_to_box("mew", 5, {})
        ssanne_warp()

func ssanne_warp():
    await start()
    deactivate_gbc_mode()

    await wait(0.4)
    place_actor(globals.player, Vector2(6607, -149))
    face_direction(globals.player, "down")
    reset_camera()
    await wait(0.25)
    end()

func anything_stupid():
    start()
    await wait(0.3)

    var oak = get_npc_node("Oak")
    face_direction(oak, "left")
    await speak(oak, ["Don't do anything stupid."])
    await wait(0.3)
    face_direction(oak, "down")
    globals.player_data.event_flags["anything_stupid"] = true
    end()

func oak_event():
    start()
    globals.hotel.game_level = 3
    var player_record = globals.player_data.battles_won
    globals.player_data.event_flags["oak_event"] = true

    var oak = get_npc_node("Oak")
    globals.enemy = oak
    oak.modulate = Color("ffffff00")

    place_actor(oak, globals.player.position + Vector2(-48, -70))
    face_direction(oak, "down")

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(oak, "skew", deg_to_rad(9), 0.8)
    tween.tween_property(oak, "skew", deg_to_rad(-4), 0.6)
    tween.tween_property(oak, "skew", deg_to_rad(0), 0.3)

    var tween2 = get_tree().create_tween()
    tween2.tween_property(oak, "modulate", (Color("ffffff")), 2)
    await wait(2)

    face_direction(globals.player, "up")
    await speak(oak, ["Snooping around, huh?", "It seems it's me who needs to clean up after these sorts of messes.", "Fine, you earned one final game for tonight.", "So, are you ready?", [call_deferred, ["start_battle", "Oak"]]])

    await wait(0.1)
    await wait_battle_end()
    globals.npc.progression["Oak"]["dialogue"] = "-1"

    if globals.player_data.battles_won > player_record:


        tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
        tween.tween_property(oak, "skew", deg_to_rad(9), 0.8)
        tween.tween_property(oak, "skew", deg_to_rad(-4), 0.6)
        tween.tween_property(oak, "skew", deg_to_rad(0), 0.3)

        tween2 = get_tree().create_tween()
        tween2.tween_property(oak, "modulate", (Color("ffffff00")), 2)
        await wait(2)
        place_actor(oak, Vector2(9999, 9999))

    else:
        await speak(oak, ["Now, as I said...", "See you next week.", ])

    end()

func office_pc():
    start()
    await wait(0.3)
    await speak(globals.player, ["Shut it down?", 
                            [["Yes", 

                                    [[call, ["mewtwo_event"]], ]

                            ], 

                            ["No", 
                                [

                                ]
                            ], ]
                            ])

    end()

func mewtwo_event():
    await wait(0.3)
    start()



    globals.hotel.get_node("BGMPlayer").volume_linear = 0
    globals.hotel.game_level = 3
    globals.player_data.event_flags["endgame"] = true
    globals.hotel.get_node("Objects/OfficePC").position = Vector2(9999, 9999)
    place_actor(globals.player, Vector2(-11797, -1917))

    camera.drag_horizontal_enabled = false
    camera.drag_vertical_enabled = false


    var mewtwo = load("res://Files/Scenes/Level/mewtwo.tscn").instantiate()
    mewtwo.position.y = -500
    await wait(5)
    globals.player.add_child(mewtwo)
    mewtwo.get_node("MewtwoSprite/ColorRect").color = Color("#050505")
    mewtwo.get_node("MewtwoSprite/AnimationPlayer").speed_scale = 0.3

    place_actor(globals.player, Vector2(-11797, -1917))

    mewtwo.get_node("MewtwoSprite/AnimationPlayer").play("walk_down")
    var tween = get_tree().create_tween()
    tween.tween_property(mewtwo, "position", Vector2(0, -360), 3)
    move_actor(mewtwo, "down", 4, 0.2)
    await mewtwo_flash(mewtwo)


    start()
    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(globals.player.camera, "zoom", Vector2(1, 1), 0.3)
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(0, 0), 2)
    tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -80, 4)
    await wait(1)
    mewtwo.get_node("MewtwoAudio").stop()
    mewtwo.get_node("MewtwoAudio").volume_db = -8
    globals.player.get_node("AnimationPlayer").speed_scale = 1
    mewtwo.get_node("MewtwoSprite/AnimationPlayer").speed_scale = 1
    face_direction(globals.player, "up")
    await wait(0.4)
    await speak(mewtwo, ["Hey man what's up."])
    await wait(0.2)
    await speak(mewtwo, ["What's the matter, didn't you like the game?", "Or are you just hunting for secrets?", "I went through a lot of trouble bringing everyone here, you know..."])
    await wait(0.2)
    await speak(mewtwo, ["It's alright though.", "You found your secret, I'll give you some bonus BP for it.", "Let's go back and play again, just a few more times.", 
            [["Let's go back.", 
                [[call, ["mewtwo_leave", mewtwo]], ]
            ], 

            ["No way!", 
                [[call, ["mewtwo_fight", mewtwo]], ]
            ], ]
    ])



func mewtwo_flash(mewtwo):
    var blink = mewtwo.get_node("MewtwoSprite/ColorRect")
    shake_ball(mewtwo)


    for i in range(5):
        await wait(1)
        blink.color = Color("#454545")
        await wait(0.04)
        blink.color = Color("#050505")
        await wait(0.04)
        blink.color = Color("#454545")
        await wait(0.04)
        blink.color = Color("#050505")
        await wait(0.04)
    blink.color = Color("#000000")
    await wait(2)

    mewtwo.position = Vector2(0, -116)

    globals.player.get_node("Camera").zoom = Vector2(2, 2)
    globals.player.get_node("AnimationPlayer").speed_scale = 4
    mewtwo.get_node("MewtwoSprite/AnimationPlayer").play("ball")
    mewtwo.get_node("MewtwoAudio").play()
    await wait(1)


    var tween = get_tree().create_tween()
    tween.tween_property(mewtwo, "position", Vector2(0, -68), 6)

    await wait(2)
    var tween2 = get_tree().create_tween()
    tween2.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -14, 3)


    await mewtwo.get_node("MewtwoSprite/AnimationPlayer").animation_finished

func shake_ball(mewtwo):
    var ball = mewtwo.get_node("Ball/Sprite2D")
    var shake = 0.06

    while true:
        if not is_instance_valid(mewtwo): return
        ball.scale -= Vector2(shake, shake)
        await wait(0.04)
        if not is_instance_valid(mewtwo): return
        ball.scale += Vector2(shake, shake)
        await wait(0.04)

func mewtwo_shine(mewtwo):
    var blink = mewtwo.get_node("MewtwoSprite/ColorRect")

    await wait(0.8)
    while mewtwo.get_node("MewtwoSprite").modulate == Color("#ffffff"):

        if not is_instance_valid(mewtwo): return
        blink.color = Color("ffffff46")
        await wait(0.04)
        if not is_instance_valid(mewtwo): return
        blink.color = Color("ffffff50")
        await wait(0.04)

func mewtwo_leave(mewtwo):
    await wait(0.3)
    await speak(mewtwo, ["Alright man, I knew you were reasonable.", "Here's your BP."])

    get_bp(3)
    await wait(0.8)
    await move_actor(mewtwo, "up", 2)
    await wait(0.1)
    face_direction(mewtwo, "down")
    await wait(0.2)


    await wait(1)
    mewtwo.get_node("MewtwoAudio").play()
    mewtwo.get_node("MewtwoAudio").volume_db = -80

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(1, 1), 2)
    tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -20, 1)

    await speak(mewtwo, ["We're leaving.", "Watch your dome."])

    if tween.is_running():
        await tween.finished

    play_sound(load("res://Files/SoundEffects/Cutscenes/mewtwo_leave.mp3"))
    globals.ui.screen_tint.color = Color("ffffff00")
    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(globals.ui.screen_tint, "color", Color("ffffff"), 1)
    tween.tween_property(mewtwo.get_node("MewtwoSprite/ColorRect"), "color", Color("ffffff"), 0.5)
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(6, 6), 1.2)

    await wait(1.4)

    for i in globals.hotel.actors.get_children():
        i.position = Vector2(9999, 9999)
    place_actor(globals.player, Vector2(1589, 919))
    reset_trans()
    face_direction(globals.player, "down")
    mewtwo.queue_free()

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(globals.ui.screen_tint, "color", Color("ffffff00"), 0.6)
    tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -80, 1)
    await tween.finished

    globals.hotel.get_node("Objects/Letter").position = Vector2(9999, 9999)
    end()

func mewtwo_fight(mewtwo):
    await wait(1)
    mewtwo_shine(mewtwo)

    mewtwo.get_node("MewtwoAudio").play()
    mewtwo.get_node("MewtwoAudio").volume_db = -80
    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(mewtwo, "position", mewtwo.position + Vector2(0, -48), 2)
    tween.tween_property(mewtwo.get_node("MewtwoSprite/ColorRect"), "color", Color("ffffff50"), 0.7)
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(1, 1), 1.2)
    tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -18, 0.7)
    await tween.finished
    await wait(1)

    await speak(mewtwo, ["Well, I tried keeping it cool...", "I'll follow the rules of this domain, though.", "Do you think you can beat me at my own game?", "Ha! Let's see you try!", ])

    tween = get_tree().create_tween()
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(0.7, 0.7), 0.5)
    await wait(0.8)
    play_sound(load("res://Files/SoundEffects/Cutscenes/mewtwo_leave.mp3"))
    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(6, 6), 0.4)
    await wait(0.2)

    globals.versus_mewtwo = true
    globals.enemy = mewtwo
    globals.npc.start_battle("Mewtwo")

    var player_record = globals.player_data.battles_won
    await wait(1)
    tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(mewtwo.get_node("Ball"), "scale", Vector2(1, 1), 18)
    tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -80, 8)







    while not globals.battle.battle_over:
        await wait(0.01)

    while globals.battle.battle_result == "":
        await wait(0.01)
    if globals.battle.battle_result == "win":
        mewtwo.get_node("Ball").scale = Vector2.ZERO
        mewtwo_death_flash(mewtwo)



    if globals.player_data.battles_won > player_record:


        await wait(1)
        await speak(mewtwo, ["N-no...", "I just wanted everyone to play my game...", ])
        await wait(1)

        play_sound(load("res://Files/SoundEffects/Battle/Hit_Super_Effective.mp3"))
        var blink = mewtwo.get_node("MewtwoSprite/ColorRect")
        blink.color = Color("#000000")
        await wait(0.08)
        blink.color = Color("#ffffff")
        await wait(0.08)
        blink.color = Color("#ff0000")
        await wait(0.08)

        tween = get_tree().create_tween().set_parallel(true)
        tween.tween_property(mewtwo, "modulate", Color("#ff000000"), 0.5)
        await wait(2)

        globals.event_flags["mewtwo_unlocked"] = true
        await show_message("You unlocked the\n[color=ff9ee7]Mewtwo Mode[/color]!")

        await globals.ui.bf_victory(true)
        await wait(1)
        await fade_out()
        await wait(0.6)
        globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

    else:
        tween = get_tree().create_tween()
        tween.tween_property(mewtwo.get_node("MewtwoAudio"), "volume_db", -18, 2)
        await wait(1)
        await speak(mewtwo, ["Alright, listen...", "No harm no foul, right?", "But now you're gonna hold this game over."])
        await globals.ui.bf_game_over()

    globals.versus_mewtwo = false

func mewtwo_death_flash(mewtwo):
    while true:

        mewtwo.get_node("MewtwoSprite").modulate = Color("#ff8080")
        await wait(0.04)

        mewtwo.get_node("MewtwoSprite").modulate = Color("#ff9c9c")
        await wait(0.04)


func blue_silver_event():
    start()
    await wait(0.3)
    var blue = get_npc_node("Blue")
    var silver = get_npc_node("Silver")

    var player_record = globals.player_data.battles_won
    globals.enemy = silver

    await speak(blue, ["Ah, so you’re Giovanni’s kid, huh?", "That explains the sulking..."])
    await speak(silver, ["And you must be the show-off who peaked at eleven.", ])
    await speak(blue, ["Geez... Real mouth on you.", "Guess it runs in the family."])
    await speak(silver, ["Don't talk like you know me.", "I'm nothing like him..."])
    silver.face_player()
    await wait(1)
    blue.face_player()
    await speak(silver, ["... What do you want?", "Enjoying the show, huh? Couldn’t mind your own business?"])
    await speak(blue, ["Eavesdropping’s not exactly classy...", "But if you're so interested, how about we give you a demonstration?"])
    face_direction(silver, "right")
    await wait(1)
    silver.face_player()
    await speak(silver, ["Psh... Not the first time I pair up with a washed-up has-been.", "Fine, I'll teach you some manners!", [call_deferred, ["start_battle", "BlueSilver"]]])
    await wait_battle_end()

    await wait(0.5)
    if globals.player_data.battles_won > player_record:
        face_direction(blue, "left")
        await speak(blue, ["Well, I guess we're both washed, huh?"])
        face_direction(silver, "right")
        await wait(0.5)
        await speak(silver, ["I had that if you weren't weighing me down."])

        await move_actor(silver, "up", 4)
        face_direction(blue, "up")
        face_direction(globals.player, "up")
        await wait(1)
        await speak(silver, ["Don’t get used to it. I’ll crush you next time."])
        get_item("atk_up")
        await wait(0.5)
        move_actor(silver, "up", 13)
        await wait(1.5)

        await speak(blue, ["What a character, huh?"])
        await wait(0.8)

        await speak(blue, ["... Sound just like I used to."])
        await wait(1)
        place_actor(silver, Vector2(9999, 9999))

        globals.npc.update_dialogue_progression("Blue", "BlueSilver_lost")

    else:
        await speak(silver, ["Tch... That was easier than I expected.", "You should’ve known better than to walk into someone else’s business."])
        face_direction(blue, "left")
        await wait(0.8)
        blue.face_player()
        await speak(blue, ["Eh... That's a funny way of saying 'nice try', I guess...", "Next time, bring a sharper deck."])
        await speak(silver, ["... Or don't bother showing up."])
        face_direction(blue, "left")
        face_direction(silver, "right")

        globals.npc.update_dialogue_progression("Blue", "BlueSilver_won")
        globals.npc.update_dialogue_progression("Silver", "BlueSilver_won")

    blue.direction_locked = false
    silver.direction_locked = false
    end()

func flannery_candice_event():
    start()
    await wait(0.3)
    var flannery = get_npc_node("Flannery")
    var candice = get_npc_node("Candice")


    globals.enemy = candice

    await speak(candice, ["... Anyways, try not taking everything so seriously all the time.", "You'll end up having more fun, I promise."])
    await speak(flannery, ["I wish I could...", "But if I don't look tough, the tryhards here will eat me alive!", "Seriously, have you seem those people?"])
    await speak(candice, ["Listen, card game players do make me sick, but that’s your problem!", "Stop trying so hard and just do your own thing!", "Even if it's cringy or whatever..."])

    candice.face_player()
    await globals.npc.balloon("Candice", "!")
    flannery.face_player()

    await speak(candice, ["Ah, perfect timing!", "You look like someone who’s not afraid to be a little silly.", "Help me teach this girl some spontaneity, will ya?"])
    face_direction(flannery, "left")
    await wait(0.6)
    await speak(flannery, ["Wait, what?"])
    face_direction(candice, "right")
    await wait(0.4)
    await speak(candice, ["Just roll with it!"])

    candice.face_player()
    flannery.face_player()

    await wait(0.6)

    await speak(candice, ["Anyways, be cool!", [call_deferred, ["start_battle", "FlanneryCandice"]]])
    await wait_battle_end()

    await wait(0.5)




    await speak(flannery, ["That actually felt... kinda good?"])
    face_direction(candice, "right")
    await globals.npc.balloon("Candice", "heart")
    face_direction(flannery, "left")
    await speak(candice, ["See? You’re way cooler when you stop worrying about being cool."])
    await speak(flannery, ["Y-you really think I'm cool?", "T-thanks..."])

    candice.face_player()
    flannery.face_player()

    await speak(flannery, ["Sorry for dragging you into this...", "Have this Speed Up on me."])
    get_item("speed_up")
    await speak(candice, ["You played your part perfectly!"])

    face_direction(candice, "right")
    face_direction(flannery, "left")

    globals.npc.update_dialogue_progression("Flannery", "FlanneryCandice_end")
    globals.npc.update_dialogue_progression("Candice", "FlanneryCandice_end")

    flannery.direction_locked = false
    candice.direction_locked = false
    end()

func clair_iris_event():
    start()
    await wait(0.3)
    var clair = get_npc_node("Clair")
    var iris = get_npc_node("Iris")

    var player_record = globals.player_data.battles_won
    globals.enemy = clair

    await speak(clair, ["Should you persist in the path of dragon comunion...", "Unwavering dedication is needed!"])
    await speak(iris, ["Okay...", ])
    await speak(clair, ["I shall demonstrate. Behold, child... my deck.", ])
    await wait(0.4)
    await speak(clair, ["Heh. I can tell you're awestruck..."])
    await speak(iris, ["Geez...", "So, are we playing a match or...?"])
    await wait(0.4)
    await speak(clair, ["Hmpf. Maybe you're still too green...", "A true Dragon Tamer would surely recognize my brilliance."])

    clair.face_player()
    await globals.npc.balloon("Clair", "!")

    await speak(clair, ["You there!"])
    await wait(0.4)
    face_direction(clair, "right")
    await speak(clair, ["Follow my lead, child!", "I'll show you how to wield true dragon power!"])
    clair.face_player()
    iris.face_player()
    await speak(iris, ["Thank God you're here.", "Let's play already before she starts lecturing me again!", [call_deferred, ["start_battle", "ClairIris"]]])
    await wait(0.5)
    await wait_battle_end()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:
        await speak(clair, ["W-wait! S-something is not right...", "H-how could this happen?"])
        await speak(iris, ["Maybe now she’ll stop talking about dragon communion or whatever...", "Here, have this for helping me out."])

        get_item("ap_up")
        await wait(0.8)

        globals.npc.update_dialogue_progression("Clair", "ClairIris_lost")
        globals.npc.update_dialogue_progression("Iris", "ClairIris_lost")


    else:
        await speak(clair, ["There. Absolute destruction.", "That's what Dragon Masters deal to their opponents!"])
        await speak(iris, ["Great... Now I'm never hearing the end of it.", ])

        globals.npc.update_dialogue_progression("Clair", "ClairIris_won")
        globals.npc.update_dialogue_progression("Iris", "ClairIris_won")

    clair.direction_locked = false
    iris.direction_locked = false

    face_direction(clair, "right")
    face_direction(iris, "left")
    end()

func burgh_elesa_event():
    start()
    await wait(0.3)
    var burgh = get_npc_node("Burgh")
    var elesa = get_npc_node("Elesa")

    var player_record = globals.player_data.battles_won
    globals.enemy = burgh
    await globals.npc.balloon("Burgh", "heart")
    await speak(burgh, ["... The way the light catches your golden hair...", "You're a living thunderbolt, captured in mortal form!"])
    await wait(0.3)
    face_direction(elesa, "up")
    await wait(0.8)
    face_direction(elesa, "down")
    await wait(0.4)
    await speak(elesa, ["Errm...", "I'm just heading to the game room..."])

    await speak(burgh, ["And every day, your aura shifts! Electric, elusive...", "You’re my lightning muse, a spark I long to capture!"])
    await wait(0.4)
    await speak(elesa, ["Sigh...", "That's... flattering, I think."])
    await wait(0.2)
    face_direction(elesa, "up")
    await speak(elesa, ["But I’m trying to focus on the tournament right now, so..."])
    await speak(burgh, ["Art waits for no one! Inspiration strikes! Like-"])
    await speak(elesa, ["Like a thunderbolt, yeah, I got it.", "Look, just e-mail my agent later and..."])
    await wait(0.4)
    elesa.face_player()
    await wait(0.4)
    await speak(elesa, ["Oh! I'm sorry, I didn't see you there.", "Would you like to play a match? I've been trying to find one..."])
    burgh.face_player()
    await globals.npc.balloon("Burgh", "!")
    await speak(burgh, ["Wait a minute... That's it!", "Pairing up with my muse! it is fate that brought us here."])

    face_direction(elesa, "up")
    await globals.npc.balloon("Elesa", "...")
    await wait(0.8)
    elesa.face_player()
    await speak(elesa, ["... Fine. At least I finally get to play.", "Come on, we're dueling now!", [call_deferred, ["start_battle", "BurghElesa"]]])

    await wait(0.5)
    await wait_battle_end()
    await wait(0.5)

    if not globals.player_data.battles_won > player_record:
        face_direction(burgh, "down")

    await speak(burgh, ["Splendid! Every move was a brushstroke of brilliance!"])
    face_direction(elesa, "up")
    if globals.player_data.battles_won > player_record:
        await speak(elesa, ["There’s your new muse.", "Now, if you'll excuse me..."])
    else:
        await speak(elesa, ["There, a performance fit for a painting.", "Now, if you'll excuse me..."])
    face_direction(burgh, "down")
    if globals.player.facing_direction != "up":
        face_direction(globals.player, "down")
    else:
        face_direction(globals.player, "right")
    await move_actor(elesa, "down", 1, 3)
    await move_actor(elesa, "right", 11, 5)
    face_direction(burgh, "right")
    face_direction(globals.player, "right")
    await move_actor(elesa, "up", 2, 3)
    await move_actor(elesa, "right", 2, 3)
    face_direction(elesa, "down")
    await speak(burgh, ["Ah... There goes my elusive lightning bolt..."])

    globals.npc.update_dialogue_progression("Burgh", "BurghElesa_end")
    globals.npc.update_dialogue_progression("Elesa", "BurghElesa_end")





    burgh.direction_locked = false
    elesa.direction_locked = false



    end()

func blaine_wattson_event():
    start()
    await wait(0.3)
    var blaine = get_npc_node("Blaine")
    var wattson = get_npc_node("Wattson")

    var player_record = globals.player_data.battles_won
    globals.enemy = blaine

    await speak(wattson, ["AHAHA! Good one!", "Ah, you still got the spark, old friend..."])
    await speak(blaine, ["Heh, what can I say?", "Some habits don’t cool down!"])

    blaine.face_player()
    wattson.face_player()

    await wait(0.5)

    await speak(wattson, ["Well, well!", "Look who’s wandered into the retirement corner!"])
    await speak(blaine, ["Looking for easy dubs, kid?", "We've been playing since before you were born!"])
    face_direction(wattson, "left")
    await wait(0.6)
    await speak(wattson, ["AHAHA!", "Don’t underestimate the new guard!"])

    await wait(0.3)
    wattson.face_player()
    await wait(0.4)
    await speak(wattson, ["This one looks sharp.", "I reckon they could appreciate a few old tricks..."])
    face_direction(blaine, "right")
    await wait(0.3)
    await speak(blaine, ["Heh, when was the last time we teamed up like this, old friend?", ])
    await wait(0.4)
    blaine.face_player()
    await speak(blaine, ["You got me fired up, kiddo!", "Trust me, you never heard of these strats before!", [call_deferred, ["start_battle", "BlaineWattson"]]])
    await wait(0.5)
    await wait_battle_end()
    await wait(0.5)

    var speaker = blaine
    if globals.player_data.battles_won > player_record:
        await speak(wattson, ["Well I’ll be...", "The kid’s got juice!"])
        await speak(blaine, ["Quite the thrill!", "Thanks, kid. That’s what keeps a fire alive!"])
        speaker = wattson

    else:
        await speak(blaine, ["Hahaha! See? We still got it!", "Don't worry, though. We ain't trying to put you out."])
        await speak(wattson, ["You’ve got a good head for battle. Keep it up!", "Besides, I'm sure you learned something that'll light your way forward."])

    await speak(speaker, ["Here's something to remember us by.", [call_deferred, ["get_item", "rare_candy"]], "Now go along and play with the other kids!"])
    globals.npc.update_dialogue_progression("Blaine", "BlaineWattson_end")
    globals.npc.update_dialogue_progression("Wattson", "BlaineWattson_end")





    blaine.direction_locked = false
    wattson.direction_locked = false

    face_direction(blaine, "right")
    face_direction(wattson, "left")
    end()

func blue_gbc_event():
    start()
    await wait(0.3)
    var blue = get_npc_node("Blue")
    var tv_sprite = globals.hotel.get_node("Objects/TV Screen/GBC/Sprite2D")
    var player_record = globals.player_data.battles_won
    globals.enemy = blue


    var previous_box = globals.player_data.player_box.duplicate(true)

    globals.auto_battle = false
    globals.pre_battle_formation = true

    globals.player_data.player_box = [globals.generate_pokemon("PIKACHU", 9), 
                                      globals.generate_pokemon("charizard", 8), 
                                      globals.generate_pokemon("butterfree", 9, {"bonus_ap": 2, "bonus_power": 30, "bonus_health": 20}), 
                                      globals.generate_pokemon("lapras", 7), 
                                      globals.generate_pokemon("snorlax", 7, {"bonus_health": 15}), 
                                      globals.generate_pokemon("vaporeon", 8, {"bonus_ap": 1, "bonus_health": 15}, ), 
                                    ]
    var box = globals.player_data.player_box

    globals.player_data.player_party = [box[0], box[1], null, null, null, box[5]]

    if globals.player.position.x > blue.position.x:
        await move_actor(globals.player, "down", 1)
        await move_actor(globals.player, "left", 2)
        await move_actor(globals.player, "up", 1)
        await wait(0.2)
        face_direction(globals.player, "right")
        await wait(0.2)

    if globals.player.position.y > blue.position.y:
        await move_actor(globals.player, "left", 1)
        await move_actor(globals.player, "up", 1)
        await wait(0.2)
        face_direction(globals.player, "right")
        await wait(0.2)

    await speak(blue, ["This looks familiar, huh?"])
    face_direction(globals.player, "up")
    await wait(2)

    globals.ui.gui_player.stream = load("res://Files/SoundEffects/SFX_PRESS_AB.wav")
    globals.ui.gui_player.play()

    tv_sprite.visible = false
    await wait(1)
    tv_sprite.texture = load("res://Files/Sprites/GBCNewGame.png")
    tv_sprite.visible = true
    await wait(1)

    await speak(blue, ["Wait, New Game?", "That can’t be right..."])




    await wait(1)
    await speak(blue, ["I was the champion...", "I was...", [call_deferred, ["activate_gbc_mode"]]])
    place_actor(globals.player, Vector2(5714, -1673))
    face_direction(globals.player, "up")
    globals.player.state = globals.player.locked
    await wait(0.3)
    globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Indigo Plateau.wav")
    globals.hotel.get_node("BGMPlayer").volume_db = -15
    globals.hotel.get_node("BGMPlayer").play(12)
    await move_actor(globals.player, "up", 3, 0.6)
    await wait(0.8)

    await gbc_show_messagebox()
    await spell_gbc("Hey!")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await spell_gbc("That's  right,  I  am  the\nPOKéMON  CHAMPION!")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await spell_gbc("Do  you  know  what \nthat   means?")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await spell_gbc("I  am  the  most\npowerful  trainer")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await spell_gbc("in  the  world!")
    await gbc_message_input()
    await gbc_hide_messagebox()
    await wait(0.2)

    globals.ui.get_node("../GBC/GBCBattle/Enemy").frame = 2
    globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Blue.wav")
    globals.hotel.get_node("BGMPlayer").play()
    globals.ui.gbc.get_node("AnimationPlayer").play("gbc_battle")
    await wait(4.5)
    globals.ui.gbc.get_node("AnimationPlayer").speed_scale = 0
    await spell_gbc("BLUE  wants\nto  fight!")
    await gbc_message_input()
    await gbc_reset_messagebox()

    var bg_sprite = Sprite2D.new()
    bg_sprite.scale = Vector2(0.5, 0.5)
    bg_sprite.texture = load("res://Files/Sprites/Missing/gbc_blue.png")
    globals.player.add_child(bg_sprite)
    bg_sprite.position = Vector2(15.5, 0)
    await wait(0.5)
    globals.ui.get_node("../GBC").visible = false







    start_battle("OldBlue")

    globals.hotel.get_node("Battle").get_child(0).position += Vector2(40, 10)
    await wait(0.5)
    await wait_battle_end()
    globals.ui.get_node("../GBC").visible = true
    bg_sprite.queue_free()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:
        globals.player_data.prize_money *= 2
        await spell_gbc("BLUE:  No!\nThat  can't  be!")
        await gbc_message_input()
        await gbc_reset_messagebox()
        await spell_gbc("My  reign  is  over\nalready?")
        await gbc_message_input()
        await gbc_reset_messagebox()
        await spell_gbc("It's  not  fair!")
        await gbc_message_input()
        await gbc_reset_messagebox()

    else:
        await spell_gbc("BLUE:  Hahaha!\nI  won,  I  won!")
        await gbc_message_input()
        await gbc_reset_messagebox()
        await spell_gbc("You  did  well  to  even\nreach  me,")
        await gbc_message_input()
        await gbc_reset_messagebox()
        await spell_gbc("the  Pokémon  genius!\nNice  try,  loser!")
        await gbc_message_input()
        await gbc_reset_messagebox()
        spell_gbc("... Huh?  Wait,\nwhere  is  everybody?")
        await wait(1.7)



    globals.hotel.get_node("Objects/TV Screen/GBC").hide()
    deactivate_gbc_mode()

    globals.player_data.player_party = [null, null, null, null, null, null]
    globals.player_data.player_box = previous_box
    globals.auto_battle = false
    globals.pre_battle_formation = true


    place_actor(globals.player, Vector2(834, 717))
    reset_camera()
    globals.npc.update_dialogue_progression("Blue", "BlueGBC_end")

    blue.direction_locked = false

    face_direction(blue, "up")
    await wait(0.7)
    end()

    globals.ui.gbc.get_node("AnimationPlayer").stop()
    globals.ui.gbc.get_node("AnimationPlayer").speed_scale = 1

func wally_n_event():
    start()
    await wait(0.3)
    var wally = get_npc_node("Wally")
    var n = get_npc_node("N")

    var player_record = globals.player_data.battles_won
    globals.enemy = n

    await speak(n, ["You handle your cards so carefully, Wally.", "It’s like you’re afraid they might break."])
    await speak(wally, ["O-oh, um... sorry.", "I just... don’t want to mess anything up.", "I’m still not very good at this."])
    await speak(n, ["Ha... There it is again, your hesitation.", "Where does it come from, I wonder..."])
    face_direction(wally, "down")
    await wait(0.8)
    face_direction(wally, "left")
    await wait(0.3)
    await speak(wally, ["I... I just want to do my best.", "But it’s hard, you know? Seeing everyone else so confident."])
    face_direction(n, "down")
    await wait(1)
    await speak(n, ["You're naive...", "Most people just hide their doubts behind loud words."])
    await wait(0.3)
    face_direction(n, "right")
    await wait(0.3)
    await speak(n, ["You wear yours honestly.", "It’s refreshing."])

    await globals.npc.balloon("Wally", "!")
    face_direction(wally, "down")
    await wait(0.2)
    face_direction(wally, "right")
    await wait(0.8)
    await speak(wally, ["I-I don’t think I’m... really anything special like that...", "I’m still trying to figure out... who I even am in all this."])
    await wait(0.8)
    await speak(n, ["Maybe I could help you find out."])

    globals.npc.balloon("Wally", "!")
    await wait(0.3)
    character_spin(wally, 3, 0.1)
    await wait(1)

    await speak(n, ["Through a duel, of course."])
    n.face_player()
    await wait(0.4)
    await speak(n, ["It seems we even have a proper opponent."])
    await wait(0.4)
    face_direction(wally, "left")
    await wait(0.6)
    wally.face_player()
    await speak(wally, ["I-I’ll battle!", "I'll grow, even if it's just a little!", [call_deferred, ["start_battle", "WallyN"]]])

    await wait_battle_end()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:
        face_direction(wally, "down")
        await wait(0.5)
        await speak(wally, ["I knew I’d lose.", "I'm sorry for letting you down.", ])
        face_direction(n, "right")
        await wait(0.5)
        await speak(n, ["Loss isn’t failure.", "You did your best with no hesitation, that is what really matters."])

    else:
        await speak(wally, ["I... I actually did it.", "I didn’t freeze up."])
        face_direction(n, "right")
        await wait(0.4)
        await speak(n, ["Heh, you did way more than that.", "I might have to start being the nervous one around you."])

    face_direction(wally, "left")
    await wait(1)

    n.face_player()
    await speak(n, ["Thank you for helping this heart grow steadier.", "Here, I think you'd put this to a good use.", [call_deferred, ["get_item", "hp_up"]]])
    await wait(0.4)
    globals.npc.update_dialogue_progression("Wally", "WallyN_end")
    globals.npc.update_dialogue_progression("N", "WallyN_end")

    wally.direction_locked = false
    n.direction_locked = false

    face_direction(wally, "down")
    face_direction(n, "down")
    end()

func roxanne_brawly_event():
    start()
    await wait(0.3)
    var roxanne = get_npc_node("Roxanne")
    var brawly = get_npc_node("Brawly")

    var player_record = globals.player_data.battles_won
    globals.enemy = roxanne

    brawly.face_player()
    await globals.npc.balloon("Brawly", "!")
    await wait(0.8)
    await speak(brawly, ["Yo dude, check it out.", "Me and Roxie are totally hanging out!"])

    face_direction(roxanne, "left")
    face_direction(brawly, "right")
    await globals.npc.balloon("Roxanne", "angry")
    await wait(0.8)
    await speak(roxanne, ["We are not \"hanging out\"!", ])
    roxanne.face_player()
    await wait(0.3)
    await speak(roxanne, ["I was trying to get this dimwit to actually learn my strategies.", "You know, for double battles."])

    await speak(brawly, ["Hey Roxy, you ever think about letting that hair down?", "You’d look super cute if you relaxed a little."])
    face_direction(roxanne, "left")
    globals.npc.balloon("Roxanne", "!")
    await wait(0.8)
    roxanne.face_player()
    await wait(0.8)
    face_direction(roxanne, "left")
    await wait(0.8)
    await speak(roxanne, ["E-excuse me?!", "C-can you focus on our work for once?", ])
    await speak(brawly, ["Geez... I was just saying.", "Wait a minute, you’re getting shy just because they heard your pet name?"])
    await wait(0.3)
    await speak(roxanne, ["N-no! And for the last time, you'll address me by my full name!", "Plus, these \"pet names\" of yours hold no tactical advantage whatsoever!", ])
    await wait(0.8)
    roxanne.face_player()
    await wait(0.3)
    await speak(roxanne, ["Ahem!", "Since my partner here gets so easily distracted...", "Perhaps a practical demonstration would be more productive!", ])
    brawly.face_player()
    await speak(brawly, ["Now that sounds awesome!", "Dude, you dont stand a chance against me and my coach!"])
    face_direction(roxanne, "left")
    globals.npc.balloon("Roxanne", "!")
    await wait(0.8)
    await speak(roxanne, ["C-co...!", "Whatever!", ])
    roxanne.face_player()
    await wait(0.3)
    await speak(roxanne, ["Come on, %s, have at you!" % globals.player.player_name, [call_deferred, ["start_battle", "RoxanneBrawly"]]])
    await wait_battle_end()
    await wait(0.5)

    if globals.player_data.battles_won > player_record:
        await speak(brawly, ["Bro... that was a total wipeout."])
        await speak(roxanne, ["I applaud your excellent coordination.", "Sigh... if only I could get a certain someone to be as cooperative.", ])
        face_direction(brawly, "right")
        await speak(brawly, ["Hey, I followed like half of your plan!", "Besides, I can tell you had a good time, teach."])
        face_direction(roxanne, "left")
        await speak(roxanne, ["D-do not call me... ahem!", ])

    else:
        await speak(brawly, ["Oh yeah!"])
        face_direction(brawly, "right")
        await wait(0.3)
        face_direction(roxanne, "left")
        await speak(brawly, ["Gotta hand it to you, teach!", "That plan of yours actually paid off!"])
        await speak(roxanne, ["... Humpf. Obviously."])

    await wait(0.3)
    roxanne.face_player()
    await speak(roxanne, ["Regardless, that was a valuable exercise.", "Please, accept this as a token of our gratitude.", [call_deferred, ["get_item", "atk_up"]]])
    await wait(0.4)

    globals.npc.update_dialogue_progression("Roxanne", "RoxanneBrawly_end")
    globals.npc.update_dialogue_progression("Brawly", "RoxanneBrawly_end")

    roxanne.direction_locked = false
    brawly.direction_locked = false

    face_direction(roxanne, "up")
    face_direction(brawly, "up")
    end()

func smt_door():
    start()
    if globals.player_data.event_flags["used_cursed_key"]:
        smt_warp_in()
        return

    elif globals.player_data.item_bag["cursed_key"] > 0:
        globals.player_data.item_bag["cursed_key"] -= 1
        globals.player_data.event_flags["used_cursed_key"] = true
        await speak(globals.player, ["Used the CURSED KEY."])
        smt_warp_in()
        return
    else:
        await speak(globals.player, ["The door is locked.", "I feel... relieved."])
        end()

func smt_warp_in():
    start()
    place_actor(get_npc_node("Demi-Fiend"), Vector2(3958, 804))
    fade_out_bgm()
    await fade_out()
    place_actor(globals.player, Vector2(4000, -312))

    camera.zoom = Vector2(3, 3)
    camera.drag_horizontal_enabled = false
    camera.drag_vertical_enabled = false
    camera.drag_vertical_offset = -0.5
    globals.player.speed = 2
    if demi_fiend_battle_result != "win":
        globals.ui.shadow_border.modulate = Color("#ffffff")
    await fade_in()
    end()

func smt_warp_out():
    start()

    await fade_out()
    globals.ui.shadow_border.modulate = Color("#ffffff00")
    place_actor(globals.player, Vector2(7022, -134))
    reset_camera()
    camera.drag_vertical_offset = 0
    camera.zoom = Vector2(1, 1)
    globals.player.speed = 4
    fade_in_bgm()
    await fade_in()

    end()

var demi_fiend_battle_result = "none"

func menorah():
    start()
    if demi_fiend_battle_result == "none":
        await speak(globals.player, ["You feel a terrifying presence.", 
                [
                ["Leave", 
                    [[call, ["end"]]]
                ], 

                ["Light the menorah", 
                    [[call, ["light_menorah"]]]
                ], ]
                ])
    elif demi_fiend_battle_result == "win":
        await speak(globals.player, ["You prevailed.", ])
        end()

    else:
        await speak(globals.player, ["It rejects you.", ])
        end()

func light_menorah():
    await wait(0.1)
    start()
    await wait(1)
    globals.event_flags["demi_fiend"] = true

    pentagram()
    var candles = globals.hotel.get_node("Tiles/SMT/Fire").get_children()
    for i in candles:
        if i != candles[-1]:

            i.emitting = true
            play_sound((load("res://Files/SoundEffects/Battle/Burned.mp3")))


            await wait(2)

    await wait(0.8)
    screen_tint.color = Color("000000")
    await wait(1.5)
    candles[-1].emitting = true
    play_sound((load("res://Files/SoundEffects/Battle/Burned.mp3")))
    await wait(1.5)
    place_actor(globals.player, Vector2(3938, 1423))
    face_direction(globals.player, "up")
    $"../Tiles/SMT/AnimationPlayer".play("cavern_loop")

    camera.zoom = Vector2(2, 2)





    await wait(0.1)
    globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/SMT TALK.mp3")
    globals.hotel.get_node("BGMPlayer").play()
    globals.hotel.get_node("BGMPlayer").volume_linear = 0.177 * globals.options["bgm_volume"]
    await wait(1)
    var tween2 = get_tree().create_tween().set_parallel()
    tween2.tween_property(screen_tint, "color", Color("#18181800"), 6)

    globals.hotel.get_node("Tiles/SMT/Pentagram1").hide()
    globals.hotel.get_node("Tiles/SMT/Pentagram2").hide()

    end()

func pentagram():
    var pent1 = globals.hotel.get_node("Tiles/SMT/Pentagram1")
    var pent2 = globals.hotel.get_node("Tiles/SMT/Pentagram2")

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(pent1, "modulate", Color("#0000001e"), 4.5)
    tween.tween_property(pent1, "scale", Vector2(0.9, 0.9), 4.5)

    await tween.finished
    await wait(1)

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(pent2, "modulate", Color("#ff0000"), 12)
    tween.tween_property(pent1, "modulate", Color("#ff0000"), 12)
    tween.tween_property(pent1, "scale", Vector2(1.1, 1.1), 12)
    tween.tween_property(pent2, "scale", Vector2(1.2, 1.2), 12)

func demi_fiend_event():
    start()
    await wait(3)
    var demi_fiend = get_npc_node("Demi-Fiend")

    var player_record = globals.player_data.battles_won
    globals.enemy = demi_fiend

    face_direction(demi_fiend, "right")
    await wait(0.6)
    face_direction(demi_fiend, "down")
    await wait(2)
    await move_actor(demi_fiend, "down", 3, 0.8)
    await wait(0.1)

    start_battle(demi_fiend.npc_name)
    await wait(1)
    await wait_battle_end()

    if globals.player_data.battles_won > player_record:
        demi_fiend_battle_result = "win"
        node_hurt(demi_fiend)
        var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
        tween.tween_property(demi_fiend, "position", demi_fiend.position + Vector2(0, -48), 0.2)
        await wait(0.1)
        demi_fiend_death_flash(demi_fiend)
        await wait(0.6)
        await speak(demi_fiend, ["...", "You're strong."])
        await wait(0.3)
        tween = get_tree().create_tween()
        tween.tween_property(screen_tint, "color", Color("#f8f8f8"), 0.8)
        tween.tween_property(screen_tint, "color", Color("#202020"), 0.8)
        await tween.finished

    else:
        demi_fiend_battle_result = "lose"
        var candles = globals.hotel.get_node("Tiles/SMT/Fire").get_children()
        for i in candles:
            i.emitting = false

        node_hurt(globals.player)
        var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
        tween.tween_property(globals.player, "position", globals.player.position + Vector2(0, 48), 0.2)

        await wait(0.6)
        await speak(demi_fiend, ["...", "You're rather weak to hold a menorah.", "Abandon your search while you still can."])
        await wait(0.3)
        await fade_out()

    globals.ui.shadow_border.modulate = Color("#ffffff00")
    place_actor(globals.player, Vector2(3996, -453))
    camera.zoom = Vector2(3, 3)
    await wait(1.6)
    await fade_in()
    $"../Tiles/SMT/AnimationPlayer".stop()
    globals.hotel.set_bgm()
    end()

func demi_fiend_death_flash(node):
    while true:

        node.sprite.modulate = Color("#ff8080")
        await wait(0.04)

        node.sprite.modulate = Color("#ff9c9c")
        await wait(0.04)

var old_man_state = 0
func old_man_event():
    globals.player.force_stop_walk()
    gbc_lock_loop()

    var old_man = get_npc_node("Old Man")
    old_man.face_player()

    await gbc_show_messagebox()
    await wait(0.2)
    if old_man_state == 0:
        await spell_gbc("I'm  feeling  wrong.")

    else:
        await spell_gbc("It  hurts.")
        old_man_state = 0
    await gbc_message_input()
    await gbc_reset_messagebox()
    await wait(0.2)
    await gbc_hide_messagebox()

    old_man.face_facing_direction()
    gbc_locking = false

var old_lady_state = 0
func old_lady_event():
    globals.player.force_stop_walk()
    gbc_lock_loop()

    var old_lady = get_npc_node("Old Lady")
    old_lady.face_player()

    await gbc_show_messagebox()
    await wait(0.2)
    if old_lady_state == 0:
        await spell_gbc("Why  are  you  here?")
        old_lady_state = 1
    else:
        await spell_gbc("You  should  leave.")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await wait(0.2)
    await gbc_hide_messagebox()

    old_lady.face_facing_direction()
    gbc_locking = false

func door_cinnabar():
    globals.player.force_stop_walk()
    gbc_lock_loop()
    await wait(0.4)
    face_direction(globals.player, "up")
    var old_man = get_npc_node("Old Man")
    old_man_state = 1
    place_actor(old_man, Vector2(8942, -2009))
    face_direction(old_man, "down")
    await gbc_show_messagebox()
    await wait(0.2)
    await spell_gbc("The  door  is\nlocked . . .")

    await gbc_message_input()
    await gbc_reset_messagebox()
    await wait(0.2)
    await gbc_hide_messagebox()

    await move_actor(globals.player, "down", 1)
    gbc_locking = false

    place_actor(old_man, Vector2(8890, -1754))
    face_direction(old_man, "left")








func _on_missing_no_area_body_entered(_body: Node2D) -> void :
    var missingno_area: Area2D = $"../TransAreas/MissingNoArea"
    var step_count = 0


    while globals.player in missingno_area.get_overlapping_bodies():
        if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
            step_count += 1
            if step_count > 16:
                missingno_encounter()
                return
            await wait(0.3)
        await wait(0.01)

func missingno_encounter():
    globals.player.force_stop_walk()
    globals.player.state = globals.player.locked
    await wait(0.4)

    globals.ui.get_node("../GBC/GBCBattle/EnemyStatus/Name").text = "MISSINGNO"
    globals.ui.get_node("../GBC/GBCBattle/EnemyStatus/Level").text = "146"

    globals.ui.get_node("../GBC/GBCBattle/Enemy").frame = 1
    globals.hotel.get_node("BGMPlayer").volume_db = -15
    globals.hotel.get_node("BGMPlayer").stream = load("res://Files/BGMs/GBC Battle.mp3")
    globals.hotel.get_node("BGMPlayer").play()
    globals.ui.gbc.get_node("AnimationPlayer").play("gbc_battle")


    globals.player.get_node("GUIPlayer").stream = load("res://Files/Sprites/Missing/NIDORANfE.ogg")
    await wait(4.05)
    globals.hotel.get_node("BGMPlayer").volume_db = linear_to_db(0)
    globals.player.get_node("GUIPlayer").play()
    await wait(0.02)
    await wait_cry()

    var tween = get_tree().create_tween()
    tween.tween_property(globals.hotel.get_node("BGMPlayer"), "pitch_scale", 0.5, 32)

    await wait(3)

    globals.ui.gbc.get_node("AnimationPlayer").speed_scale = 0
    await wait(0.2)
    await spell_gbc("Wild  MISSINGNO.\nappeared!")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await wait(2)
    await spell_gbc("WHAT   DOST\nTHOU   WANT?")
    await gbc_message_input()
    await gbc_reset_messagebox()
    await wait(0.1)

    globals.ui.gbc.get_node("AnimationPlayer").speed_scale = 1

    var pointer_pos = [Vector2(-20, 278), Vector2(-20, 370), Vector2(210, 278), Vector2(210, 370)]
    var pointer_index = 0






    globals.ui.get_node("../GBC/GBCBattle/InputBox/BALL").text = "EXP"
    globals.ui.get_node("../GBC/GBCBattle/InputBox/RUN").text = "$"
    globals.ui.get_node("../GBC/GBCBattle/InputBox/HEALTH").text = "HP"
    globals.ui.get_node("../GBC/GBCBattle/InputBox/YOU").text = "YOU"

    globals.ui.gui_player.stream = load("res://Files/SoundEffects/SFX_PRESS_AB.wav")
    while true:
        if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up"):
            if pointer_index == 0:
                pointer_index = 1

            elif pointer_index == 1:
                pointer_index = 0

            elif pointer_index == 2:
                pointer_index = 3

            elif pointer_index == 3:
                pointer_index = 2


            globals.ui.gbc.get_node("GBCBattle/InputBox/Pointer").position = pointer_pos[pointer_index]

        if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
            if pointer_index in [0, 1]:
                pointer_index += 2

            elif pointer_index in [2, 3]:
                pointer_index -= 2


            globals.ui.gbc.get_node("GBCBattle/InputBox/Pointer").position = pointer_pos[pointer_index]

        elif Input.is_action_just_pressed("Accept"):
            globals.ui.gui_player.play()

            globals.ui.gbc.get_node("GBCBattle/InputBox").hide()
            break

        await wait(0.01)

    if pointer_index in [0, 1, 2]:
        await wait(0.8)
        await spell_gbc("I   WILL   GUIDE\nTHY   HAND.")

        await wait(1)

        if pointer_index == 0:
            for i in range(9):
                get_item("rare_candy")

        elif pointer_index == 1:
            globals.player_data.money += 500

        elif pointer_index == 2:
            globals.player_data.player_hp = 100.0
            var tween2 = get_tree().create_tween()
            tween2.tween_property(globals.ui.hud.get_node("Player/Bar"), "scale", Vector2(globals.player_data.player_hp / 100, 1), 12)

        ssanne_warp()

    elif pointer_index == 3:
        await wait(0.2)
        await spell_gbc("RED  used\nPOKé  BALL!")
        await wait(0.2)
        globals.ui.gbc.get_node("AnimationPlayer").play("gbc_pokeball")
        await globals.ui.gbc.get_node("AnimationPlayer").animation_finished
        await wait(0.6)
        tween.stop()
        globals.hotel.get_node("BGMPlayer").pitch_scale = 1
        globals.hotel.get_node("BGMPlayer").stop()
        globals.hotel.get_node("BGMPlayer").stream = load("res://Files/SoundEffects/SFX_CAUGHT_MON.wav")
        globals.hotel.get_node("BGMPlayer").play()
        await spell_gbc("Alright!  MISSINGNO.\nwas  caught!")
        await wait(2)
        await gbc_reset_messagebox()
        await wait(4)
        await spell_gbc("THIS   SHALL\nCOST   YOU.")
        await wait(1)
        globals.player_data.add_pokemon_to_box("MISSINGNO.", 9, {})
        ssanne_warp()
    tween.stop()
    globals.hotel.get_node("BGMPlayer").pitch_scale = 1
    globals.player.state = globals.player.free

func smt():
    start()
    await wait(0.3)
    var morty = get_npc_node("Morty")
    await speak(morty, ["..."])
    await wait(0.6)
    await speak(morty, ["... I've made a huge mistake."])
    await wait(0.3)
    morty.face_player()
    await wait(0.3)
    await speak(morty, ["Please, get this away from me.", [call_deferred, ["get_item", "cursed_key"]]])
    await wait(0.75)

    face_direction(morty, "down")
    globals.npc.update_dialogue_progression("Morty", "smt_end")
    morty.direction_locked = false
    end()





func show_message(message):
    globals.ui.message_box.get_node("Dialogue").text = message
    globals.ui.message_box.scale = Vector2(0, 2)
    globals.ui.message_box.show()
    globals.ui.screen_tint.color = Color("#20202000")
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(globals.ui.screen_tint, "color", Color("#20202064"), 0.3)
    tween.tween_property(globals.ui.message_box, "scale", Vector2(2, 2), 0.15)
    await tween.finished

    while true:
        if Input.is_action_just_pressed("Accept") or Input.is_action_just_pressed("Cancel"): break
        await wait(0.01)

    tween = get_tree().create_tween().set_parallel()
    tween.tween_property(globals.ui.screen_tint, "color", Color("#00000000"), 0.3)
    tween.tween_property(globals.ui.message_box, "scale", Vector2(0, 2), 0.1)
    await tween.finished

func oak_reposition():
    var oak = get_npc_node("Oak")
    while globals.hotel.get_node("Battle").get_children().size() < 1:
        await wait(3)
    place_actor(oak, Vector2(1734, 677))
    face_direction(oak, "down")

func blink_node(node):
    for i in range(8):
        node.visible = false
        await wait(0.02)
        node.visible = true
        await wait(0.02)
    node.visible = false

func go_to_seat(surge):
    await move_actor(surge, "up", 13)
    await move_actor(surge, "left", 5)
    await move_actor(surge, "down", 2)
    face_direction(surge, "left")

var pool = [
        "Blue", 
        "Leaf", 
        "Gold", 
        "Silver", 
        "May", 
        "Brendan", 
        "Wally", 
        "Lucas", 
        "Dawn", 
        "Barry", 
        "Wes", 
        "Kris", 
        "Tierno", 

        "Cyrus", 
        "Lysandre", 
        "Ghetsis", 
        "Archie", 
        "Maxie", 
        "Serena", 
        "Calem", 

        "Brock", 
        "Misty", 
        "Surge", 
        "Erika", 
        "Sabrina", 
        "Koga", 
        "Blaine", 
        "Giovanni", 

        "Falkner", 
        "Bugsy", 
        "Whitney", 
        "Morty", 
        "Chuck", 
        "Jasmine", 
        "Clair", 
        "Janine", 

        "Roxanne", 
        "Brawly", 
        "Wattson", 
        "Flannery", 
        "Norman", 
        "Winona", 
        "Wallace", 

        "Roark", 
        "Gardenia", 
        "Fantina", 
        "Candice", 
        "Volkner", 
        "Flint", 

        "Elesa", 
        "Skyla", 
        "Burgh", 
        "Clay", 
        "Lenora", 
        "Iris", 
        "Roxie", 
        "Hilbert", 
        "Hilda", 
        "N", 

        "Karen", 
        "Bruno", 
        "Agatha", 
        "Lorelei", 
        "Sidney", 
        "Phoebe", 
        "Drake", 

        "Bill", 
        "Jack", 
        "Koichi", 
        "Joey", 
        "Megan", 
        "Weevil", 
    ]
func place_audience():
    var positions = [
        Vector2(539, 1230), 
        Vector2(636, 1304), 
        Vector2(674, 1333), 
        Vector2(594, 1314), 
        Vector2(719, 1313), 
        Vector2(721, 1395), 
        Vector2(777, 1392), 
        Vector2(820, 1319), 
        Vector2(544, 1399), 
        Vector2(490, 1392), 
        Vector2(828, 1204), 
        Vector2(783, 1202), 
        Vector2(631, 1389), 


        Vector2(436, 1163), 
        Vector2(436, 1203), 


        Vector2(878, 1161), 
    ]

    var corridor_positions = [
        Vector2(1335, -46), 
        Vector2(1383, -46), 
        Vector2(1431, -46), 

        Vector2(1335, 2), 
        Vector2(1383, 2), 
        Vector2(1431, 2), 

        Vector2(1479, -46), 
        Vector2(1527, -46), 
        Vector2(1575, -46), 
        Vector2(1623, -46), 
        Vector2(1671, -46), 
        Vector2(1719, -46), 

        Vector2(1575, 2), 
        Vector2(1623, 2), 
        Vector2(1671, 2), 
        Vector2(1719, 2), 
    ]

    pool.shuffle()
    await wait(0.1)
    var cont = 0
    for i in range(positions.size()):
        var cur_actor = get_npc_node(pool[cont])
        place_actor(cur_actor, positions[cont])
        globals.npc.progression[pool[cont]]["dialogue"] = "-1"
        audience_nodes.append(cur_actor)
        if cont < 13:
            face_direction(cur_actor, "up")
        elif cont < 15:
            face_direction(cur_actor, "right")
        else:
            face_direction(cur_actor, "left")
        cont += 1

    var cont2 = 0
    for i in range(corridor_positions.size()):
        var cur_actor = get_npc_node(pool[cont])
        place_actor(cur_actor, corridor_positions[cont2])
        globals.npc.progression[pool[cont]]["dialogue"] = "-1"
        corridor_nodes.append(cur_actor)
        face_direction(cur_actor, "left")
        cont += 1
        cont2 += 1

    while cont < pool.size():
        place_actor(get_npc_node(pool[cont]), Vector2(9999, 9999))
        cont += 1

    var gerson = get_npc_node("Gerson")
    place_actor(gerson, Vector2(1738, 976))
    face_direction(gerson, "down")
    globals.npc.progression["Gerson"]["dialogue"] = "end"

func node_hurt(node):
    globals.player.get_node("GUIPlayer").stream = load("res://Files/SoundEffects/Battle/Hit_Normal_Damage.mp3")
    globals.player.get_node("GUIPlayer").play()
    var tween2 = get_tree().create_tween()
    tween2.tween_property(node, "scale", Vector2(1.1, 0.9), 0.1)
    var blinker = node.get_node("Sprite2D/ColorRect")
    blinker.color = Color("#000000")
    await wait(0.03)
    blinker.color = Color("#ffffff")
    await wait(0.03)
    blinker.color = Color("#e60000")
    await wait(0.03)

    var tween = get_tree().create_tween()
    tween.tween_property(blinker, "color", Color("#e6000000"), 0.2)

    tween2 = get_tree().create_tween()
    tween2.tween_property(node, "scale", Vector2(0.9, 1.1), 0.05)
    tween2.tween_property(node, "scale", Vector2(1.1, 0.9), 0.1)
    tween2.tween_property(node, "scale", Vector2(1, 1), 0.15)
    await tween2.finished

func gbc_show_messagebox():
    var messagebox = globals.ui.gbc.get_node("MessageBox")
    messagebox.show()
    await wait(0.3)
    messagebox.get_node("Sprite2D").frame = 1
    await wait(0.3)

func gbc_hide_messagebox():
    var messagebox = globals.ui.gbc.get_node("MessageBox")
    messagebox.get_node("Label").text = ""
    messagebox.get_node("Sprite2D").frame = 0
    await wait(0.2)
    messagebox.hide()

func gbc_reset_messagebox():
    globals.ui.gbc.get_node("MessageBox").get_node("Label").text = ""
    await wait(0.1)

func gbc_message_input():
    while true:
        if Input.is_action_just_pressed("Accept") or Input.is_action_pressed("Cancel"):
            break
        await wait(0.01)

func spell_gbc(string):

    var messagebox = globals.ui.gbc.get_node("MessageBox")
    messagebox.get_node("Label").text = ""
    for i in string:
            messagebox.get_node("Label").text += i
            if i != " ":
                await wait(0.05)

var gbc_locking = false
func gbc_lock_loop():
    gbc_locking = true
    while gbc_locking:
        globals.player.state = globals.player.locked
        await wait(0.01)
    globals.player.state = globals.player.free

var giovanni_decision_index = 0
func giovanni_decision(decision):
    giovanni_decision_index = decision

var falkner_decision_value = false
func falkner_decision(decision):
    falkner_decision_value = decision

func end_game():
    start()
    await fade_out()
    globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func cant_leave():
    start()
    await wait(0.3)
    await speak(globals.player, ["I can't leave."])
    await move_actor(globals.player, "up", 1)
    end()

func reset_trans():
    var trans = globals.hotel.get_node("TransAreas")
    trans.cur_area = trans.main_hotel
    await wait(0.2)
    trans.transition()

func wait_cry():
    await globals.player.get_node("GUIPlayer").finished
    globals.hotel.get_node("BGMPlayer").volume_db = -15

func activate_gbc_mode():
    globals.gbc = true
    globals.player.speed = 2

    globals.hotel.get_node("BGMPlayer").volume_db = linear_to_db(0)
    globals.ui.get_node("../Static/AnimationPlayer").play("static_gbc")
    globals.ui.gbc.get_node("AnimationPlayer").play("RESET")
    globals.ui.gbc.show()
    globals.player.sprite.texture = load("res://Files/Sprites/Characters/Old Red.png")

    globals.player.camera.zoom = Vector2(2, 2)
    globals.player.camera.drag_horizontal_enabled = false
    globals.player.camera.drag_vertical_enabled = false
    globals.player.state = globals.player.free

func deactivate_gbc_mode():
    globals.gbc = false
    globals.player.speed = 4
    globals.hotel.get_node("BGMPlayer").volume_db = linear_to_db(0)
    globals.ui.get_node("../Static/AnimationPlayer").play("static_gbc")
    globals.ui.gbc.hide()
    globals.player.camera.zoom = Vector2(1, 1)
    globals.player.camera.drag_horizontal_enabled = true
    globals.player.camera.drag_vertical_enabled = true

    await wait(0.5)
    globals.player.sprite.texture = load("res://Files/Sprites/Characters/%s.png" % globals.player.player_name)
    globals.ui.hide_hud()

    await globals.hotel.set_bgm()
    await wait(0.01)
    globals.hotel.get_node("BGMPlayer").play(12)
    await globals.ui.get_node("../Static/AnimationPlayer").animation_finished
    globals.hotel.get_node("BGMPlayer").volume_db = -15

func character_spin(node, reps, speed):
    for i in range(reps):
        face_direction(node, "up")
        await wait(speed)
        face_direction(node, "left")
        await wait(speed)
        face_direction(node, "down")
        await wait(speed)
        face_direction(node, "right")
        await wait(speed)
    face_direction(node, "up")
    await wait(speed * 2)
    face_direction(node, "left")
    await wait(speed * 2)
    face_direction(node, "down")

func quit_game_event():
    start()
    await globals.ui.close_menu()
    globals.player.state = globals.player.locked
    await wait(0.3)
    await speak(globals.player, ["Abandon this run?", 
                                    [
                                        ["Yes", 
                                            [[call_deferred, ["quit_game"]], ]
                                        ], 

                                        ["No", 
                                            []
                                        ], 
                                    ]

                                ])
    end()

func suspend_game_event():
    start()
    await globals.ui.close_menu()
    globals.player.state = globals.player.locked
    await wait(0.3)
    await speak(globals.player, ["Suspend the game?", 
                                    [
                                        ["Yes", 
                                            [[call_deferred, ["suspend_game"]], ]
                                        ], 

                                        ["No", 
                                            []
                                        ], 
                                    ]

                                ])
    end()


func quit_game():
    start()
    await fade_out()
    await wait(1)
    globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func suspend_game():
    globals.ui.suspend_game()
    start()
    await fade_out()
    await wait(1)
    globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))





func start():
    globals.in_cutscene = true
    globals.player.force_stop_walk()
    globals.ui.hide_hud()

    globals.ui.state = globals.ui.locked
    globals.player.state = globals.player.locked

func end():
    globals.in_cutscene = false
    globals.ui.show_hud()
    globals.ui.state = globals.ui.off
    globals.player.state = globals.player.free

func get_npc_node(npc_name):
    var npc_node = null
    for i in globals.hotel.get_node("Actors").get_children():
        if not "npc_name" in i: continue
        if i.npc_name == npc_name:
            npc_node = i
            break
    return npc_node

func fade_out():
    screen_tint.color = Color("#18181800")
    var tween = get_tree().create_tween()
    tween.tween_property(screen_tint, "color", Color("#181818"), 0.4)
    await wait(0.4)

func fade_in():
    screen_tint.color = Color("#181818")
    var tween = get_tree().create_tween()
    tween.tween_property(screen_tint, "color", Color("#18181800"), 0.4)
    await wait(0.4)

func place_actor(node, position):
    position = position.snapped(Vector2.ONE * tile_size)
    position += Vector2.ONE * tile_size / 2
    node.position = position

func face_direction(node, direction):
    node.facing_direction = direction
    var sprite = node.get_node("Sprite2D")
    node.facing_direction = direction

    var node_name
    if node == globals.player: node_name = globals.player.player_name
    else: node_name = node.npc_name

    if direction == "up":
        if node_name != "Mewtwo":
            sprite.frame = 0
        else:
            node.get_node("MewtwoSprite").frame = 0

    elif direction == "down":
        if node_name != "Mewtwo":
            sprite.frame = 5
        else:
            node.get_node("MewtwoSprite").frame = 6

    elif direction == "left":
        if node_name != "Mewtwo":
            sprite.frame = 6
        else:
            node.get_node("MewtwoSprite").frame = 1

    elif direction == "right":
        if node_name != "Mewtwo":
            sprite.frame = 1
        else:
            node.get_node("MewtwoSprite").frame = 5

    if node == globals.player:
        globals.player.set_npc_detect()

func move_actor(node, direction, steps, speed_mod = 1.0):
    var dir
    if direction == "up": dir = Vector2.UP
    elif direction == "left": dir = Vector2.LEFT
    elif direction == "down": dir = Vector2.DOWN
    elif direction == "right": dir = Vector2.RIGHT

    var anm_player = node.get_node("AnimationPlayer")
    if node != globals.player and node.npc_name == "Mewtwo":
        anm_player = node.get_node("MewtwoSprite/AnimationPlayer")

    anm_player.play("walk_%s" % direction)
    var tween = create_tween()
    tween.tween_property(node, "position", node.position + dir * tile_size * steps, 0.3 / speed_mod * steps)
    await tween.finished
    anm_player.stop()
    face_direction(node, direction)

func speak(node, dialogue):
    node.dialogue_state = node.talking
    node.current_dialogue = dialogue
    await node.show_dialogue_box()
    node.dialogue_input(node.current_dialogue)

    while node.dialogue_state != node.off:
        await wait(0.1)

func reset_camera():
    camera.drag_horizontal_enabled = false
    camera.drag_vertical_enabled = false
    await wait(0.01)
    camera.drag_horizontal_enabled = true
    camera.drag_vertical_enabled = true

func clear_hotel():
    for i in globals.hotel.get_node("Actors").get_children():
        if i == globals.player: continue
        positions_memory[i.npc_name] = i.position
        i.position = Vector2(3000, 3000)

func restore_hotel():
    for i in globals.hotel.get_node("Actors").get_children():
        if i == globals.player: continue
        i.position = positions_memory[i.npc_name]

func start_battle(enemy_name):
    globals.npc.start_battle(enemy_name)

func get_item(item_name):
    await globals.npc.get_item(item_name)

func get_bp(amount):
    await globals.npc.get_bp(amount)

func wait_battle_end():
    if globals.hotel.get_node("Battle").get_children() == []: return
    while not globals.battle.battle_over:
        if globals.hotel.get_node("Battle").get_children() == []: return
        await wait(0.5)

func play_sound(resource):
    cuts_player.stop()
    cuts_player.stream = resource
    cuts_player.play()

func fade_out_bgm():
    var bgm_player = globals.hotel.get_node("BGMPlayer")
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(bgm_player, "volume_linear", 0, 1)

func fade_in_bgm():
    var bgm_player = globals.hotel.get_node("BGMPlayer")
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(bgm_player, "volume_linear", 0.177 * globals.options["bgm_volume"], 1)

func wait(time):
    await get_tree().create_timer(time).timeout
