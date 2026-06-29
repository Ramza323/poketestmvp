extends Node2D

@onready var main_hotel: Node2D = $"../Covers/MainHotel"
@onready var left_side: Node2D = $"../Covers/LeftSide"
@onready var right_side: Node2D = $"../Covers/RightSide"
@onready var right_room: Node2D = $"../Covers/RightRoom"
@onready var storage: Node2D = $"../Covers/Storage"
@onready var office: Node2D = $"../Covers/Office"

@onready var right_side_aux: Node2D = $"../Covers/RightSideAux"
@onready var main_hotel_aux: Node2D = $"../Covers/MainHotelAux"


@onready var areas = [main_hotel, left_side, right_side, right_room, storage, office]
var cur_area = main_hotel
var transitioning = false

var trans_speed = 0.3

func _ready() -> void :
    await wait(0.1)
    for i in areas:
        if i == main_hotel: i.modulate = Color("#ffffff00")
        else: i.modulate = Color("#ffffff")


func hide_area(area):




    var tween = get_tree().create_tween()
    tween.tween_property(area, "modulate", Color("#ffffff"), trans_speed)
    await tween.finished


func show_area(area):




    var tween = get_tree().create_tween()
    tween.tween_property(area, "modulate", Color("#ffffff00"), trans_speed)



func transition():
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(cur_area, "modulate", Color("#ffffff00"), trans_speed)

    set_aux_covers()

    for i in areas:
        if i == cur_area: continue
        elif i.modulate == Color("#ffffff"): continue
        else: tween.tween_property(i, "modulate", Color("#ffffff"), trans_speed)

        if cur_area == main_hotel:
            tween.tween_property(globals.ui.shadow_border, "modulate", Color("#ffffff00"), trans_speed)
        else:
            tween.tween_property(globals.ui.shadow_border, "modulate", Color("#000000"), trans_speed)
func set_aux_covers():
    var tween = get_tree().create_tween().set_parallel()
    if cur_area in [right_side, right_room, storage, office]:
        tween.tween_property(right_side_aux, "modulate", Color("#ffffff00"), trans_speed)
    else:
        tween.tween_property(right_side_aux, "modulate", Color("#ffffff"), trans_speed)








func wait(time):
    await get_tree().create_timer(time).timeout


func _on_enter_left_side_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = left_side
    transition()

func _on_enter_right_side_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = right_side
    transition()

func _on_enter_right_room_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = right_room
    transition()

func _on_enter_storage_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = storage
    transition()

func _on_enter_main_hotel_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = main_hotel
    transition()

func _on_enter_office_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    cur_area = office
    transition()

func _on_up_stairs_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    globals.cutscenes.up_stairs()

func _on_down_stairs_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    globals.cutscenes.down_stairs()

func _on_silver_event_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.npc.progression["Silver"]["dialogue"] != "2": return
    globals.cutscenes.silver_event()

func _on_giovanni_event_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.npc.progression["Giovanni"]["dialogue"] != "2": return
    globals.cutscenes.giovanni_event()

func _on_falkner_event_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player_data.event_flags["endgame"] and not globals.player_data.event_flags["anything_stupid"]:
        globals.cutscenes.anything_stupid()

    if globals.npc.progression["Falkner"]["dialogue"] != "2": return
    globals.cutscenes.falkner_event()

func _on_janine_event_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.npc.progression["Janine"]["dialogue"] != "2": return
    globals.cutscenes.janine_event()

func _on_janine_event_2_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.npc.progression["Janine"]["dialogue"] != "2a": return
    globals.cutscenes.janine_event2()

func _on_office_warp_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player_data.event_flags["endgame"]: return
    globals.cutscenes.office_warp()

func _on_land_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    globals.player.sprite.texture = load("res://Files/Sprites/Characters/Old Red.png")

func _on_land_body_exited(body: Node2D) -> void :
    if body != globals.player: return
    globals.player.sprite.texture = load("res://Files/Sprites/Characters/SurfGBC.png")

func _on_leave_ss_anne_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.hotel.game_level > 2: return
    globals.cutscenes.ssanne_warp()

func _on_oak_event_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player_data.event_flags["oak_event"]: return
    globals.cutscenes.oak_event()

func _on_front_door_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player.state != globals.player.free: return
    if globals.player_data.event_flags["endgame"]:
        globals.cutscenes.end_game()
        return
    else:
        globals.cutscenes.cant_leave()
        return

func _on_rocket_room_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player.state != globals.player.free: return
    globals.cutscenes.rocket_room()

func _on_smt_room_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    if globals.player.state != globals.player.free: return
    globals.cutscenes.smt_warp_out()

func _on_demi_fiend_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    globals.cutscenes.demi_fiend_event()

func _on_cinnabar_gym_body_entered(body: Node2D) -> void :
    if body != globals.player: return
    globals.cutscenes.door_cinnabar()
