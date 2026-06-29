extends Node2D
@onready var file_dialog: FileDialog = $FileDialog


func _ready() -> void :
    globals.core = self
    
    if FileAccess.file_exists(save.save_location):
        await save.load_data()

    if DisplayServer.is_touchscreen_available():
        $TouchControls / CanvasLayer.show()
    else:
        $TouchControls / CanvasLayer.hide()

func change_scene(scene):
    var new_scene = scene.instantiate()

    await get_tree().create_timer(0.01).timeout
    for i in get_node("Scenes").get_children():
        i.queue_free()

    get_node("Scenes").add_child(new_scene)
