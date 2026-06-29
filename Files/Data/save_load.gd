extends Node

var save_location = "user://pokemon_overlord.save"
var save_dict = {
        "player_bp": 0, 

        "options": {
            "bgm_volume": 1.0, 
            "se_volume": 1.0, 
            "v-sync": 1, 
        }, 

        "decks": {
            "ivysaur": true, 
            "charmeleon": true, 
            "wartortle": true, 
            "pikachu": false, 

            "bayleef": false, 
            "quilava": false, 
            "croconaw": false, 
            "clefairy": false, 

            "grovyle": false, 
            "combusken": false, 
            "marshtomp": false, 
            "kirlia": false, 

            "grotle": false, 
            "monferno": false, 
            "prinplup": false, 
            "magmar": false, 

            "servine": false, 
            "pignite": false, 
            "dewott": false, 
            "zorua": false, 

            "quilladin": false, 
            "braixen": false, 
            "frogadier": false, 
            "doublade": false, 
        }, 

        "decks_cleared": {
            "ivysaur": false, 
            "charmeleon": false, 
            "wartortle": false, 
            "pikachu": false, 

            "bayleef": false, 
            "quilava": false, 
            "croconaw": false, 
            "clefairy": false, 

            "grovyle": false, 
            "combusken": false, 
            "marshtomp": false, 
            "kirlia": false, 

            "grotle": false, 
            "monferno": false, 
            "prinplup": false, 
            "magmar": false, 

            "servine": false, 
            "pignite": false, 
            "dewott": false, 
            "zorua": false, 

            "quilladin": false, 
            "braixen": false, 
            "frogadier": false, 
            "doublade": false, 
        }, 

        "LC": {
            "Brock": true, 
            "Misty": false, 
            "Surge": false, 
            "Erika": false, 
            "Koga": false, 
            "Sabrina": false, 
            "Blaine": false, 
            "Giovanni": false, 
            "Lorelei": false, 
            "Bruno": false, 
            "Agatha": false, 
            "Lance": false, 
            "Falkner": false, 
            "Bugsy": false, 
            "Whitney": false, 
            "Morty": false, 
            "Chuck": false, 
            "Janine": false, 
            "Jasmine": false, 
            "Clair": false, 
            "Karen": false, 
            "Koichi": false, 
            "Bill": false, 
            "Roxanne": false, 
            "Brawly": false, 
            "Wattson": false, 
            "Flannery": false, 
            "Norman": false, 
            "Winona": false, 
            "Wallace": false, 
            "Sidney": false, 
            "Phoebe": false, 
            "Drake": false, 
            "Steven": false, 
            "Roark": false, 
            "Gardenia": false, 
            "Fantina": false, 
            "Candice": false, 
            "Volkner": false, 
            "Flint": false, 
            "Cyrus": false, 
            "Cynthia": false, 
            "Cilan": false, 
            "Lenora": false, 
            "Burgh": false, 
            "Elesa": false, 
            "Clay": false, 
            "Skyla": false, 
            "Iris": false, 
            "Roxie": false, 
            "Alder": false, 
            "Red": false, 
            "Leaf": false, 
            "Blue": false, 
            "Gold": false, 
            "Kris": false, 
            "Silver": false, 
            "Brendan": false, 
            "May": false, 
            "Wally": false, 
            "Lucas": false, 
            "Dawn": false, 
            "Barry": false, 
            "Hilbert": false, 
            "Hilda": false, 
            "N": false, 
            "Calem": false, 
            "Serena": false, 
            "Tierno": false, 
            "Maxie": false, 
            "Archie": false, 
            "Ghetsis": false, 
            "Sycamore": false, 
            "Lysandre": false, 
            "Diantha": false, 
            "Wes": false, 
            "Oak": false, 
            "Elm": false, 
            "Birch": false, 
            "Rowan": false, 
            "Juniper": false, 
            "Demi-Fiend": false, 
            "Yugi": false, 
            "Kaiba": false
        }, 

        "LC_cleared": {
            "Brock": false, 
            "Misty": false, 
            "Surge": false, 
            "Erika": false, 
            "Koga": false, 
            "Sabrina": false, 
            "Blaine": false, 
            "Giovanni": false, 
            "Lorelei": false, 
            "Bruno": false, 
            "Agatha": false, 
            "Lance": false, 
            "Falkner": false, 
            "Bugsy": false, 
            "Whitney": false, 
            "Morty": false, 
            "Chuck": false, 
            "Janine": false, 
            "Jasmine": false, 
            "Clair": false, 
            "Karen": false, 
            "Koichi": false, 
            "Bill": false, 
            "Roxanne": false, 
            "Brawly": false, 
            "Wattson": false, 
            "Flannery": false, 
            "Norman": false, 
            "Winona": false, 
            "Wallace": false, 
            "Sidney": false, 
            "Phoebe": false, 
            "Drake": false, 
            "Steven": false, 
            "Roark": false, 
            "Gardenia": false, 
            "Fantina": false, 
            "Candice": false, 
            "Volkner": false, 
            "Flint": false, 
            "Cyrus": false, 
            "Cynthia": false, 
            "Cilan": false, 
            "Lenora": false, 
            "Burgh": false, 
            "Elesa": false, 
            "Clay": false, 
            "Skyla": false, 
            "Iris": false, 
            "Roxie": false, 
            "Alder": false, 
            "Red": false, 
            "Leaf": false, 
            "Blue": false, 
            "Gold": false, 
            "Kris": false, 
            "Silver": false, 
            "Brendan": false, 
            "May": false, 
            "Wally": false, 
            "Lucas": false, 
            "Dawn": false, 
            "Barry": false, 
            "Hilbert": false, 
            "Hilda": false, 
            "N": false, 
            "Calem": false, 
            "Serena": false, 
            "Tierno": false, 
            "Maxie": false, 
            "Archie": false, 
            "Ghetsis": false, 
            "Sycamore": false, 
            "Lysandre": false, 
            "Diantha": false, 
            "Wes": false, 
            "Oak": false, 
            "Elm": false, 
            "Birch": false, 
            "Rowan": false, 
            "Juniper": false, 
            "Demi-Fiend": false, 
            "Yugi": false, 
            "Kaiba": false
        }, 

        "event_flags":
            {
                "yugi": false, 
                "kaiba": false, 
                "demi_fiend": false, 
                "mewtwo_unlocked": false, 
                "mewtwo_cleared": false, 
        }, 

        "suspended_game":
            {
        }, 
    }




func save_data():
    print("saving")
    if FileAccess.file_exists(save_location):
        save_dict["player_bp"] = globals.player_bp
        save_dict["options"] = globals.options.duplicate()
        save_dict["decks"] = globals.decks_unlocked.duplicate()
        save_dict["decks_cleared"] = globals.decks_cleared.duplicate()
        save_dict["LC"] = globals.LC_unlocked.duplicate()
        save_dict["LC_cleared"] = globals.LC_cleared.duplicate()
        save_dict["event_flags"] = globals.event_flags.duplicate()
        save_dict["options"] = globals.options.duplicate()
        save_dict["suspended_game"] = globals.suspended_game.duplicate()

    var file = FileAccess.open(save_location, FileAccess.WRITE)

    file.store_var(save_dict.duplicate())
    file.close()

func load_data():
    var save_file
    var data

    if not FileAccess.file_exists(save_location):
        print("save not found")
        await save_data()

        return
    print("loading")
    save_file = FileAccess.open(save_location, FileAccess.READ)
    data = save_file.get_var()

    save_file.close()

    var saved_data = data.duplicate()
    globals.player_bp = saved_data["player_bp"]
    globals.options = saved_data["options"]
    globals.decks_unlocked = saved_data["decks"]
    globals.decks_cleared = saved_data["decks_cleared"]
    globals.LC_unlocked = saved_data["LC"]
    globals.LC_cleared = saved_data["LC_cleared"]
    globals.event_flags = saved_data["event_flags"]
    globals.options = saved_data["options"]
    globals.suspended_game = saved_data["suspended_game"]

func initialize():
    var file = FileAccess.open(save_location, FileAccess.WRITE)
    file.store_var(save_dict.duplicate())
    file.close()



@onready var export_dialog
var exporting: = false
var importing: = false

const SAVE_FILE: = "user://pokemon_overlord.save"
const DEFAULT_EXPORT_NAME: = "pokemon_overlord.save"

func _ready():
    await get_tree().create_timer(0.1).timeout
    export_dialog = globals.core.file_dialog
    export_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
    export_dialog.current_file = DEFAULT_EXPORT_NAME
    export_dialog.file_selected.connect(_on_export_path_selected)







    if OS.get_name() == "Web":
        globals.ui.get_node("../Options/ImportBrowserHint/Label").text = "To import a save file in the BROWSER, drag the save file HERE."

    get_tree().root.files_dropped.connect(_on_files_dropped)

func _on_files_dropped(files: PackedStringArray):

        if files.is_empty():
            return

        _import_file(files[0])

func export_save():
    importing = false
    exporting = true

    export_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE

    var platform: = OS.get_name()

    if platform == "Web":
        _export_web()
        return

    export_dialog.access = FileDialog.ACCESS_FILESYSTEM
    export_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
    export_dialog.current_file = DEFAULT_EXPORT_NAME

    if platform == "Android":
        export_dialog.current_dir = "/storage/emulated/0/Download"
    else:
        export_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

    export_dialog.popup_centered()









func import_save():
    importing = true
    exporting = false

    export_dialog.access = FileDialog.ACCESS_FILESYSTEM
    export_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE

    if OS.get_name() not in ["Web", "Android"]:
        export_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
    elif OS.get_name() == "Android":
        export_dialog.current_dir = "/storage/emulated/0/Download"
    export_dialog.popup_centered()

func _open_desktop_file_picker():
    export_dialog.current_file = DEFAULT_EXPORT_NAME
    export_dialog.popup_centered()

func _import_file(source_path: String):
    if not FileAccess.file_exists(source_path):
        return

    var src: = FileAccess.open(source_path, FileAccess.READ)
    var data: = src.get_buffer(src.get_length())
    src.close()


    var dst: = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
    dst.store_buffer(data)
    dst.close()

    importing = false
    await save.load_data()
    globals.core.change_scene(load("res://Files/Title/title_scene.tscn"))

func _on_export_path_selected(path: String):
    if exporting:
        _export_file(path)
    elif importing:
        _import_file(path)






func _export_file(target_path: String):
    if not FileAccess.file_exists(SAVE_FILE):
        return

    var src: = FileAccess.open(SAVE_FILE, FileAccess.READ)
    var data: = src.get_buffer(src.get_length())
    src.close()

    var dst: = FileAccess.open(target_path, FileAccess.WRITE)
    dst.store_buffer(data)
    dst.close()

    exporting = false

func _export_android():
    var downloads_path: = "/storage/emulated/0/Download/" + DEFAULT_EXPORT_NAME
    _copy_file(SAVE_FILE, downloads_path)

func _export_web():
    if not FileAccess.file_exists(SAVE_FILE):
        return

    var file: = FileAccess.open(SAVE_FILE, FileAccess.READ)
    var data: = file.get_buffer(file.get_length())
    file.close()

    var base64: = Marshalls.raw_to_base64(data)

    var js: = "\n\t\tconst link = document.createElement('a');\n\t\tlink.href = 'data:application/octet-stream;base64,%s';\n\t\tlink.download = '%s';\n\t\tdocument.body.appendChild(link);\n\t\tlink.click();\n\t\tdocument.body.removeChild(link);\n\t"\
\
\
\
\
\
\
%[base64, DEFAULT_EXPORT_NAME]

    JavaScriptBridge.eval(js)

func _copy_file(from_path: String, to_path: String):
    if not FileAccess.file_exists(from_path):
        return

    var src: = FileAccess.open(from_path, FileAccess.READ)
    var data: = src.get_buffer(src.get_length())
    src.close()

    var dst: = FileAccess.open(to_path, FileAccess.WRITE)
    dst.store_buffer(data)
    dst.close()
