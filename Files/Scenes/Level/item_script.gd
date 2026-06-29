extends StaticBody2D

@export var obj_name = ""


var dialogue_state = "off"

func _ready() -> void :
    position = position.snapped(Vector2.ONE * 48)
    position += Vector2.ONE * 48 / 2

    if obj_name == "truck":
        get_node("NPCArea/CollisionShape2D").position = Vector2(-28.5, 2)
        get_node("NPCArea/CollisionShape2D").shape.size = Vector2(93, 44)


func interact():
    if dialogue_state == "off":
        if obj_name == "koga_pokeball":
            dialogue_state = "on"
            globals.cutscenes.koga_event()

        elif obj_name == "rocket_pokeball":
            dialogue_state = "on"
            globals.npc.get_item("front_half")
            position = Vector2(9999, 9999)

        elif obj_name == "letter":
            dialogue_state = "on"
            position = Vector2(9999, 9999)
            globals.cutscenes.get_letter()

        elif obj_name == "door_wish":
            globals.cutscenes.interact_wish()

        elif obj_name == "door_smt":
            globals.cutscenes.smt_door()

        elif obj_name == "menorah":
            globals.cutscenes.menorah()

        elif obj_name == "truck":
            if globals.player.facing_direction in ["right", "left"]:
                globals.cutscenes.interact_truck()

        elif obj_name == "office_pc":
            if globals.player.facing_direction in ["right"]:
                globals.cutscenes.office_pc()

        elif obj_name == "door_cinnabar":
            globals.cutscenes.door_cinnabar()
