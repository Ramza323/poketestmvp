extends Node2D

@onready var menu_selector: ColorRect = $Menu / Selector
@onready var menu_list: VBoxContainer = $Menu / MenuList
@onready var info_box: RichTextLabel = $InfoBox / RichTextLabel
@onready var screen_tint: ColorRect = $ScreenTint



var level_scene = load("res://Files/Scenes/Level/level_scene.tscn")
var bf_scene = preload("res://Files/Scenes/BattleFrontier/battle_frontier.tscn")
enum {
    locked, 
    menu
}
var state = locked

var menu_index = 0

var infobox_contents = [
    "[center][color=bdbdbd]-Play-[center][color=fffaf6]\n[center]Start a normal run.", 
    "[center][color=bdbdbd]-RogueLike-[center][color=fffaf6]\n[center]RogueLike", 
    "[center][color=bdbdbd]-League Challenge-[center][color=fffaf6]\n[center]Play as other characters and try to beat the game using their team.", 
    "[center][color=bdbdbd]-Battle Frontier-[center][color=fffaf6]\n[center]Challenge 30 straight battles, building your team along the way.", 
    "[center][color=bdbdbd]-Versus Mode-[center][color=fffaf6]\n[center]Battle against another player in local multiplayer.", 
    "[center][color=bdbdbd]-????-[center][color=fffaf6]\n[center]This mode cannot be unlocked.", 
    "[center][color=bdbdbd]-Collection-[center][color=fffaf6]\n[center]Show game completion status.", 
    "[center][color=bdbdbd]-Options-[center][color=fffaf6]\n[center]Change settings.", 
    "[center][color=bdbdbd]-Quit-[center][color=fffaf6]\n[center]Quit the game."
]


func _ready() -> void :
    state = locked
    $InfoBox / RichTextLabel.text = "[center][color=bdbdbd]-Play-[center][color=fffaf6]\n[center]Start a normal run."

    globals.ui.hud.hide()

    battle_preview()
    await wait(0.5)
    await save.save_data()

    check_suspended_game()

    state = menu

    globals.pre_battle_formation = true

    if globals.event_flags["mewtwo_unlocked"]:
        $"Menu/MenuList/Mewtwo Mode".text = "Mewtwo Mode"
        infobox_contents[5] = "[center][color=bdbdbd]-Mewtwo Mode-[center][color=fffaf6]\n[center]Clone the opponent's deck before each battle!"

    update_menu_selector()

func _process(_delta: float) -> void :
    if state == menu:
        menu_input()

func menu_input():
    if Input.is_action_just_pressed("Accept"):
        if menu_index == 0:
            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            play_accept_SE()
            globals.auto_battle = false
            globals.mewtwo_mode = false
            globals.versus_mode = false
            globals.bf_mode = false
            globals.normal_mode = true
            globals.LC_mode = false
            globals.test_mode = false
            state = locked
            globals.core.change_scene(load("res://Files/Scenes/Level/level_scene.tscn"))
            return
        
        #if menu_index == 1:
            #play_accept_SE()
            #globals.bf_box = []
            #globals.bf_party = [null, null, null, null, null, null]
            #globals.bf_mode = true
            #screen_tint.color = Color("202020a5")
            #menu_selector.hide()
            #await globals.ui.show_starters()
            #state = locked
#
            #battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            #while globals.ui.state != globals.ui.off:
                #await wait(0.01)
#
            #if globals.bf_box == []:
                #await wait(0.3)
                #globals.bf_mode = false
                #screen_tint.color = Color("00000000")
                #menu_selector.show()
                #state = menu
                #battle_scene.process_mode = Node.PROCESS_MODE_INHERIT
                #return
#
            #battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            #globals.auto_battle = false
            #globals.mewtwo_mode = false
            #globals.versus_mode = false
            #globals.bf_mode = true
            #globals.normal_mode = false
            #globals.LC_mode = false
            #globals.test_mode = false
            #state = locked
#
            #globals.core.change_scene(bf_scene)
            ##globals.core.change_scene(load("res://Files/Scenes/RogueLike/roguelike.tscn"))
            #return

        elif menu_index == 2:
            globals.mewtwo_mode = false
            play_accept_SE()
            state = locked
            menu_selector.hide()
            var LC_select = load("res://Files/Scenes/LeagueChallenge/lc_menu.tscn").instantiate()
            LC_select.position.y = -900

            add_child(LC_select)

            var tween = get_tree().create_tween().set_parallel()
            tween.tween_property(LC_select, "position", Vector2.ZERO, 0.2)
            tween.tween_property(screen_tint, "color", Color("#00000073"), 0.2)
            await tween.finished
            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            while true:
                if Input.is_action_just_pressed("Cancel"):
                    play_cancel_SE()
                    break
                await wait(0.01)
            battle_scene.process_mode = Node.PROCESS_MODE_INHERIT
            tween = get_tree().create_tween().set_parallel()
            tween.tween_property(LC_select, "position", Vector2(0, -900), 0.2)
            tween.tween_property(screen_tint, "color", Color("#00000000"), 0.2)
            await tween.finished
            LC_select.queue_free()
            menu_selector.show()
            state = menu
            return

        elif menu_index == 3:
            play_accept_SE()
            globals.bf_box = []
            globals.bf_party = [null, null, null, null, null, null]
            globals.bf_mode = true
            screen_tint.color = Color("202020a5")
            menu_selector.hide()
            await globals.ui.show_starters()
            state = locked

            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            while globals.ui.state != globals.ui.off:
                await wait(0.01)

            if globals.bf_box == []:
                await wait(0.3)
                globals.bf_mode = false
                screen_tint.color = Color("00000000")
                menu_selector.show()
                state = menu
                battle_scene.process_mode = Node.PROCESS_MODE_INHERIT
                return

            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            globals.auto_battle = false
            globals.mewtwo_mode = false
            globals.versus_mode = false
            globals.bf_mode = true
            globals.normal_mode = false
            globals.LC_mode = false
            globals.test_mode = false
            state = locked

            globals.core.change_scene(bf_scene)
            return

        elif menu_index == 4:
            play_accept_SE()
            globals.auto_battle = false
            globals.mewtwo_mode = false
            globals.versus_mode = true
            globals.bf_mode = false
            globals.normal_mode = false
            globals.LC_mode = false
            globals.test_mode = true
            state = locked
            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            globals.core.change_scene(load("res://Files/Scenes/Versus/versus_mode.tscn"))

        elif menu_index == 5:
            if not globals.event_flags["mewtwo_unlocked"]: return
            play_accept_SE()
            globals.auto_battle = false
            globals.mewtwo_mode = true
            globals.versus_mode = false
            globals.bf_mode = false
            globals.normal_mode = false
            globals.LC_mode = true
            globals.test_mode = false
            state = locked
            battle_scene.process_mode = Node.PROCESS_MODE_DISABLED
            globals.core.change_scene(load("res://Files/Scenes/Level/level_scene.tscn"))
            return


        elif menu_index == 6:
            globals.ui.show_trainer_menu()

        elif menu_index == 7:
            state = locked
            await globals.ui.show_options()
            while globals.ui.state != globals.ui.off:
                await wait(0.01)
            state = menu

        elif menu_index == 8:
            await save.save_data()
            await wait(0.3)
            get_tree().quit()

    elif Input.is_action_just_pressed("down"):
        play_cursor_SE()
        if menu_index < 8:
            menu_index += 1
        else:
            menu_index = 0
        update_menu_selector()

    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        if menu_index > 0:
            menu_index -= 1
        else:

            if globals.suspended_game != {}:
                menu_selector.hide()
                $Continue / Selector.show()
                state = locked
                $InfoBox / RichTextLabel.text = "[center][color=bdbdbd]-Continue-[center][color=fffaf6]\n[center]Continue suspended game."
                await wait(0.1)

                while true:
                    if Input.is_action_just_pressed("up"):
                        menu_index = 8
                        update_menu_selector()
                        state = menu
                        menu_selector.show()
                        $Continue / Selector.hide()
                        $InfoBox / RichTextLabel.text = "[center][color=bdbdbd]-Quit-[center][color=fffaf6]\n[center]Quit the game."
                        return

                    elif Input.is_action_just_pressed("down"):
                        menu_index = 0
                        update_menu_selector()
                        state = menu
                        menu_selector.show()
                        $Continue / Selector.hide()
                        $InfoBox / RichTextLabel.text = "[center][color=bdbdbd]-Play-[center][color=fffaf6]\n[center]Start a normal run."
                        return

                    elif Input.is_action_just_pressed("Accept"):
                        resume_suspended_game()
                        return

                    await wait(0.01)

            else:
                menu_index = 8
        update_menu_selector()

func update_menu_selector():
    menu_selector.global_position.y = menu_list.get_child(menu_index).global_position.y + 6
    info_box.text = infobox_contents[menu_index]

func check_suspended_game():
    if globals.suspended_game == {}:
        $Continue.hide()
    else:
        $Continue.show()

func resume_suspended_game():
    if globals.suspended_game == {}:
        menu_index = 0
        update_menu_selector()
        state = menu
        menu_selector.show()
        $Continue / Selector.hide()
        return

    else:
        globals.resuming_game = true
        for i in globals.suspended_game["global_data"]:
            globals.set(i, globals.suspended_game["global_data"][i])
        globals.core.change_scene(load("res://Files/Scenes/Level/level_scene.tscn"))


@onready var battle_scene = $BattleScene
@onready var encounters: Node = $Encounters
func battle_preview():

    globals.test_mode = true
    globals.bf_mode = false
    globals.versus_mode = false
    globals.mewtwo_mode = false
    globals.LC_mode = false
    globals.auto_battle = true


    encounters.dict[2].shuffle()
    battle_scene.player_team_ref = encounters.dict[2][0]
    battle_scene.enemy_team_ref = encounters.dict[2][1]
    $BattleScene / GUIPlayer.volume_linear = 0

@onready var gui_player: AudioStreamPlayer = $GUIPlayer

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
