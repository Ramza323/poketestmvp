extends Node2D

signal choice_made(index)

@onready var menu_selector: ColorRect = $Selector
@onready var menu_list: VBoxContainer = $VList
@onready var gui_player: AudioStreamPlayer = $"../GUIPlayer"

var slot_name
var moves = []
var new_move

var menu_index := 0
var options := []
var awaiting_choice := false

func setup(pokemon, _slot_name, _new_move):
    # Prepara la UI para mostrarla
    show()
    set_process(true)

    play_learn_move()

    slot_name = _slot_name
    new_move = _new_move
    moves = pokemon["dex"][slot_name]

    $ItemHeader/NewMove.text = "Replace a move with " + str(new_move) + "?"
    $PlayerHeader/Label.text = str(pokemon["dex"]["name"])

    if moves.size() > 0:
        $VList/Move0.text = str(moves[0])
    if moves.size() > 1:
        $VList/Move1.text = str(moves[1])

    options = [$VList/Move0, $VList/Move1, $VList/Cancel]
    menu_index = 0
    update_menu_selector()
    
    # 🔹 Mostrar el sprite del Pokémon
    print(pokemon)
    var sprite_frame = pokemon["dex"]["sprite"] # índice del frame o sprite
    # 🔹 Mostrar el sprite de color según el Pokémon
    var color_name = pokemon["dex"]["color"] # por ejemplo: "green"
    var color_path = "res://Files/Sprites/ColorIcons/%s.png" % color_name

    # Cargar la textura
    var tex = load(color_path)
    $PokemonInfo/ColorSprite.texture = tex
    $PokemonInfo/ColorSprite.visible = true
    $PokemonInfo/PokeSprite.frame = sprite_frame
    $PokemonInfo/PokeSprite.visible = true

    awaiting_choice = true
    return await await_choice()

func await_choice() -> int:
    # Espera a que se emita la señal
    while awaiting_choice:
        await get_tree().process_frame
    return menu_index

func _process(_delta):
    if not is_visible_in_tree() or options.is_empty():
        return
    handle_input()

func handle_input():
    if Input.is_action_just_pressed("down"):
        play_cursor_SE()
        menu_index = (menu_index + 1) % options.size()
        update_menu_selector()
    elif Input.is_action_just_pressed("up"):
        play_cursor_SE()
        menu_index = (menu_index - 1 + options.size()) % options.size()
        update_menu_selector()
    elif Input.is_action_just_pressed("Accept"):
        play_accept_SE()
        select_current(menu_index)
    elif Input.is_action_just_pressed("Cancel"):
        play_cancel_SE()
        select_current(-1)

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
    menu_selector.global_position = target.global_position + Vector2(-10, 0)

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
