extends Node2D

@onready var actors: Node2D = $Actors
@onready var bgm_player: AudioStreamPlayer = $BGMPlayer



var game_level = 0
var champion = "Lance"

var card_shop_stock = []
var item_shop_stock = ["rare_candy", "hp_up", "atk_up", "speed_up", "ap_up", "pp_up"]

var trainers = [
    "Blue", 
    "Leaf", 
    "Gold", 
    "Silver", 
    "Kris", 
    "May", 
    "Brendan", 
    "Wally", 
    "Lucas", 
    "Dawn", 
    "Barry", 
    "Wes", 

    "Lysandre", 
    "Ghetsis", 
    "Archie", 
    "Maxie", 
    "Serena", 
    "Calem", 
    "Tierno", 

    "Brock", 
    "Misty", 
    "Surge", 
    "Erika", 
    "Koga", 
    "Sabrina", 
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
    "Cyrus", 

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

    "Lance", 
    "Red", 
    "Steven", 
    "Cynthia", 
    "Palmer", 
    "Alder", 
    "Diantha", 

    "Koichi", 
    "Bill", 
    "Jack", 
    "Joey", 
    "Megan", 
    "Weevil", 
]

var event_index = 0
var events = [

    "Blue", 

    "Brock", 
    "Misty", 
    "Erika", 
    "Surge", 

    "Falkner", 
    "Koga", 
    "Blaine", 
    "Sabrina", 
    "Giovanni", 

    "Bugsy", 
    "Janine", 
    "Clair", 
    "Flannery", 
    "Silver", 

    "BlueSilver", 
    "FlanneryCandice", 
    "ClairIris", 
    "BurghElesa", 
    "BlaineWattson", 
    "BlueGBC", 
    "WallyN", 
    "Yugi", 
    "RoxanneBrawly", 
    "SMT", 
]


func _ready() -> void :
    set_bgm()
    globals.hotel = self

    $Covers.show()
    globals.ui.screen_tint.color = Color("#181818")
    if not globals.resuming_game:


        if not globals.LC_mode:
            globals.cutscenes.game_start()
        else:
            globals.cutscenes.LC_start()


        await wait(0.02)
        events.shuffle()
        loop_tv_sprites()
        get_active_trainers()
        generate_shop_cards()
        await wait(1)
        if globals.player.player_name == "Demi-Fiend":
            globals.npc.progression["Clark"]["dialogue"] = "Demi-Fiend"

        if globals.player.player_name == "Mewtwo":
            globals.npc.progression["Clark"]["dialogue"] = "Mewtwo"
            globals.npc.progression["Marisa"]["dialogue"] = "Mewtwo"
            $Objects / OfficePC.position = Vector2(9999, 9999)
            $Objects / PCGlow.hide()






    else:
        globals.cutscenes.LC_start()

        for i in globals.suspended_game:
            if i in ["global_data", "npc_progression", "level"]: continue
            if i == "player_name":
                globals.player.player_name = globals.suspended_game["player_name"]
                continue

            globals.player_data.set(i, globals.suspended_game[i])

        for i in globals.player_data.player_party:
            if i == null: continue
            for k in globals.player_data.player_box:
                if i == k:
                    globals.player_data.player_party[globals.player_data.player_party.find(i)] = globals.player_data.player_box[globals.player_data.player_box.find(k)]


        globals.player._ready()



        globals.npc.progression = globals.suspended_game["npc_progression"]

        game_level = globals.suspended_game["level"]["game_level"]
        card_shop_stock = globals.suspended_game["level"]["card_shop_stock"]
        event_index = globals.suspended_game["level"]["event_index"]
        loop_index = globals.suspended_game["level"]["loop_index"]


        globals.ui.hud.get_node("Player/Bar").scale.x = globals.player_data.player_hp / 100

        globals.ui.setup_shop()

        for i in actors.get_children():
            if i == globals.player: continue
            i.setup_npc()

        await wait(0.3)
        globals.suspended_game = {}
        globals.resuming_game = false
        events.shuffle()
        loop_tv_sprites()
        globals.cutscenes.end()
        globals.npc.setup_trades()
        save.save_data()

func get_active_trainers():
    var trainers_chosen = []




    trainers.erase(globals.player.player_name)
    events.erase(globals.player.player_name)
    var npc_node = globals.cutscenes.get_npc_node(globals.player.player_name)
    if npc_node != null:
        globals.cutscenes.get_npc_node(globals.player.player_name).position = Vector2(9999, 9999)


    if game_level == 0:
        trainers_chosen = ["Joey", "Megan", ]

    elif game_level == 2:
        if globals.player_data.event_flags["sabrina_event"]:
            trainers_chosen = ["Joey"]
        else:
            globals.npc.progression["Joey"]["dialogue"] = "-1"
            trainers.erase("Joey")


    var trainers_battling = []
    for i in trainers:
        if game_level in globals.npc.progression[i]["battle"] and i not in trainers_chosen:
            trainers_battling.append(i)



    for i in trainers:
        if i not in trainers_chosen:
            globals.npc.progression[i]["dialogue"] = "-1"

    trainers_battling.shuffle()
    if game_level == 3:
        if globals.player.player_name not in ["Yugi"]:
            trainers_chosen.append(trainers_battling[0])
            champion = trainers_battling[0]



        elif globals.player.player_name == "Yugi":
            trainers_chosen.append("Kaiba")
            champion = "Kaiba"

    else:
        trainers_chosen.append_array(trainers_battling.slice(0, 12))


    for i in trainers_chosen:







            globals.npc.progression[i]["dialogue"] = "1"


    if game_level == 0 and randi_range(0, 9) < 2:
        trainers_chosen.append("Leaf")
        globals.npc.progression["Leaf"]["dialogue"] = "2"

    if game_level < 2 and randi_range(0, 9) < 1:
        trainers_chosen.append("Falkner")
        globals.npc.progression["Falkner"]["dialogue"] = "-1"
        globals.npc.progression["Cilan"]["dialogue"] = "2"
    else:
        globals.npc.progression["Cilan"]["dialogue"] = "-1"

    for i in ["Cilan", "Cress", "Chili"]:
        actors.get_node(i).position = Vector2(9999, 9999)

    var cont = 0
    if game_level > 0:
        event_index += 1
        for i in events:
            if game_level in [0, 3]:
                break
            if game_level == 0: break
            if globals.player.player_name == "Mewtwo": break

            if i not in trainers_chosen:
                if events.find(i) < event_index: continue
                event_index += 1

                if i == "Misty":
                    if "Brock" in trainers_chosen: continue
                    trainers_chosen.append("Brock")
                    globals.npc.progression["Brock"]["dialogue"] = "-1"

                elif i == "Surge":
                    if "Erika" in trainers_chosen: continue
                    trainers_chosen.append("Erika")
                    globals.npc.progression["Erika"]["dialogue"] = "-1"

                elif i == "Giovanni":
                    trainers_chosen.append("Flannery")
                    globals.npc.progression["Flannery"]["dialogue"] = "-1"

                elif i == "Falkner":
                    if game_level > 1: continue
                    if "Cilan" in trainers_chosen: continue
                    trainers_chosen.append("Joey")
                    trainers_chosen.append("Megan")
                    trainers_chosen.append("Weevil")
                    globals.npc.progression["Joey"]["dialogue"] = "-1"
                    globals.npc.progression["Megan"]["dialogue"] = "-1"
                    globals.npc.progression["Weevil"]["dialogue"] = "-1"

                elif i == "Cilan":
                    if "Falkner" in trainers_chosen: continue
                    trainers_chosen.append("Falkner")
                    globals.npc.progression["Falkner"]["dialogue"] = "-1"
                    globals.npc.progression[i]["dialogue"] = "2"

                elif i == "BlueSilver":


                    trainers_chosen.append("Silver")
                    trainers_chosen.append("Blue")
                    blue_silver()

                elif i == "FlanneryCandice":


                    trainers_chosen.append("Flannery")
                    trainers_chosen.append("Candice")
                    flannery_candice()

                elif i == "ClairIris":


                    trainers_chosen.append("Clair")
                    trainers_chosen.append("Iris")
                    clair_iris()

                elif i == "BurghElesa":


                    trainers_chosen.append("Burgh")
                    trainers_chosen.append("Elesa")
                    trainers_chosen.append("Morty")
                    trainers_chosen.append("Brendan")

                    burgh_elesa()

                elif i == "BlaineWattson":


                    trainers_chosen.append("Blaine")
                    trainers_chosen.append("Wattson")
                    trainers_chosen.append("May")
                    blaine_wattson()

                elif i == "BlueGBC":
                    if game_level == 0: continue

                    trainers_chosen.append("Blue")

                    blue_gbc()

                elif i == "WallyN":

                    trainers_chosen.append("Wally")
                    trainers_chosen.append("N")
                    trainers_chosen.append("Lucas")
                    trainers_chosen.append("Erika")

                    wally_n()

                elif i == "Yugi":
                    if game_level == 0: continue
                    trainers_chosen.append("Clair")
                    yugi()

                elif i == "RoxanneBrawly":
                    trainers_chosen.append("Roxanne")
                    trainers_chosen.append("Brawly")
                    trainers_chosen.append("Gold")
                    trainers_chosen.append("Koichi")
                    roxanne_brawly()

                elif i == "SMT":
                    trainers_chosen.append("Morty")
                    smt()


                trainers_chosen.append(i)
                if i in trainers:
                    globals.npc.progression[i]["dialogue"] = "2"

                cont += 1
                if cont > 2: break



    var idle_queue = trainers.duplicate()
    idle_queue.shuffle()

    cont = 0
    for i in idle_queue:
        if i not in trainers_chosen:
            globals.npc.progression[i]["dialogue"] = "0"
            trainers_chosen.append(i)
            cont += 1
        if cont > 14: break



    for i in actors.get_children():
        if i != globals.player:
            i.setup_npc()

func generate_shop_cards():
    card_shop_stock = []

    if not globals.LC_mode:
        var colors = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]
        var indexes = range(11)
        indexes.shuffle()
        var cont = 0
        for i in range(6):
            card_shop_stock.append(booster_pull(colors[indexes[cont]]))
            cont += 1

    else:
        var pool = LC_pools.pools[globals.player.player_name]["pool"].duplicate(true)
        pool.shuffle()

        for i in range(6):
            var cur_mon = pool[i]
            var booster_level

            if game_level == 0:
                booster_level = 1 + randi_range(0, 2)
            elif game_level == 1:
                booster_level = 4 + randi_range(-1, 2)
            else:
                booster_level = 6 + randi_range(-1, 2)

            if booster_level < 1: booster_level = 1
            elif booster_level > 9: booster_level = 9

            if cur_mon not in ["rotom", "eevee", "tyrogue"]:
                if pkmn.dex[cur_mon].has("evolve") and pkmn.dex[cur_mon]["evolve"][1] <= booster_level:
                    cur_mon = pkmn.dex[cur_mon]["evolve"][0]

                    if pkmn.dex[cur_mon].has("evolve") and pkmn.dex[cur_mon]["evolve"][1] <= booster_level:
                        cur_mon = pkmn.dex[cur_mon]["evolve"][0]

            card_shop_stock.append(globals.generate_pokemon(cur_mon, booster_level))

    globals.ui.setup_shop()

func booster_pull(booster_index):
    var colors = ["red", "blue", "green", "yellow", "white", "black"]
    var pulling_pool1 = []
    var pulling_pool2 = []
    var pulling_pool3 = []
    var pulling_pool4 = []
    var pulling_pool5 = []
    for i in pkmn.dex:
        if i in pkmn.booster_excluded: continue
        if pkmn.dex[i]["color"] == colors[booster_index]:
            if pkmn.dex[i]["rarity"] == 1:
                pulling_pool1.append(i)
            elif pkmn.dex[i]["rarity"] == 2:
                pulling_pool2.append(i)
            elif pkmn.dex[i]["rarity"] == 3:
                pulling_pool3.append(i)
            elif pkmn.dex[i]["rarity"] == 4:
                pulling_pool4.append(i)
            elif pkmn.dex[i]["rarity"] == 5:
                pulling_pool5.append(i)

    pulling_pool1.shuffle()
    pulling_pool2.shuffle()
    pulling_pool3.shuffle()
    pulling_pool4.shuffle()
    pulling_pool5.shuffle()
    var pulled_mon

    var rng = randi_range(1, 100)

    var common_pull = 80
    var uncommon_pull = 95
    var rare_pull = 100
    var super_pull = 0
    var shiny_pull = 0

    if shiny_pull: pass

    if game_level == 0:
        common_pull = 75
        uncommon_pull = 98
        rare_pull = 99
        super_pull = 0
        shiny_pull = 100

    elif game_level == 1:
        common_pull = 65
        uncommon_pull = 95
        rare_pull = 98
        super_pull = 99
        shiny_pull = 100

    elif game_level == 2:
        common_pull = 20
        uncommon_pull = 88
        rare_pull = 98
        super_pull = 99
        shiny_pull = 100


    else:
        common_pull = 5
        uncommon_pull = 80
        rare_pull = 96
        super_pull = 99
        shiny_pull = 100


    if rng <= common_pull:
        pulled_mon = pulling_pool1[0]
    elif rng <= uncommon_pull:
        pulled_mon = pulling_pool2[0]
    elif rng <= rare_pull:
        pulled_mon = pulling_pool3[0]
    elif rng <= super_pull:
        if pulling_pool4:
            pulled_mon = pulling_pool4[0]
        else:
            pulled_mon = pulling_pool3[-1]
    else:
        if pulling_pool5:
            pulled_mon = pulling_pool5[0]
        else:
            pulled_mon = pulling_pool3[-1]

    var booster_level

    if game_level == 0:
        booster_level = 1 + randi_range(0, 2)
    elif game_level == 1:
        booster_level = 4 + randi_range(-1, 2)
    else:
        booster_level = 6 + randi_range(-1, 2)

    if booster_level < 1: booster_level = 1
    elif booster_level > 9: booster_level = 9

    return globals.generate_pokemon(pulled_mon, booster_level)

func advance_time():
    game_level += 1


    $Objects / Pokeball.position = Vector2(9999, 9999)
    get_node("Objects/TV Screen/GBC").hide()
    get_active_trainers()
    for i in actors.get_children():
        if i != globals.player:
            i.setup_npc()
    await wait(0.01)
    globals.npc.setup_trades()

func set_bgm():
    if game_level == 0:
        bgm_player.stream = load("res://Files/BGMs/HGSS New Bark Town.mp3")
        bgm_player.stream.loop_offset = 7.2

    elif game_level == 1:
        bgm_player.stream = load("res://Files/BGMs/HGSS Goldenrod City.mp3")
        bgm_player.stream.loop_offset = 7.2

    elif game_level == 2:
        bgm_player.stream = load("res://Files/BGMs/HGSS Battle Frontier.mp3")
        bgm_player.stream.loop_offset = 4

    elif game_level == 3:
        bgm_player.stream = load("res://Files/BGMs/HGSS Indigo Plateau.mp3")
        bgm_player.stream.loop_offset = 13

    bgm_player.play()



@onready var sprite_1: Sprite2D = $"Objects/TV Screen/Sprites/Sprite1"
@onready var sprite_2: Sprite2D = $"Objects/TV Screen/Sprites/Sprite2"
@onready var bg: Sprite2D = $"Objects/TV Screen/Sprites/BG"
@onready var sprite_shadow: Sprite2D = $"Objects/TV Screen/Sprites/SpriteShadow"
@onready var hp: ColorRect = $"Objects/TV Screen/Sprites/Bars/HP"
@onready var power: ColorRect = $"Objects/TV Screen/Sprites/Bars/Power"
@onready var speed: ColorRect = $"Objects/TV Screen/Sprites/Bars/Speed"

var loop_index = 0
func loop_tv_sprites():
    await wait(0.1)
    sprite_1.frame = pkmn.dex[pkmn.dex.keys().pick_random()]["sprite"]
    while true:
        await set_tv_sprite()
        await wait(3)

func set_tv_sprite():
    var cur_sprite = sprite_1
    var switched_sprite = sprite_2
    if sprite_2.position == Vector2(38, 13):
        cur_sprite = sprite_2
        switched_sprite = sprite_1
    var mon
    if globals.LC_mode:
        mon = pkmn.dex[pkmn.dex.keys().pick_random()]
    else:
        mon = card_shop_stock[loop_index]["dex"]
    switched_sprite.frame = mon["sprite"]

    if loop_index < 5: loop_index += 1
    else: loop_index = 0

    var tween_speed = 0.5
    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(cur_sprite, "position", Vector2(-25, 13), tween_speed)
    tween.tween_property(switched_sprite, "position", Vector2(38, 13), tween_speed)
    tween.tween_property(bg, "modulate", Color(poke_types.colors[mon["color"]][3]), tween_speed)
    tween.tween_property(sprite_shadow, "modulate", Color(poke_types.colors[mon["color"]][2]), tween_speed)

    tween.tween_property(hp, "scale", Vector2(clamp(float(mon["health"]) / 100, 0, 1), 1), 0.3)
    tween.tween_property(power, "scale", Vector2(clamp(float(mon["power"]) / 100, 0, 1), 1), 0.3)
    tween.tween_property(speed, "scale", Vector2(clamp(float(mon["speed"]) / 100, 0, 1), 1), 0.3)

    await tween.finished
    cur_sprite.position = Vector2(84, 13)




func blue_silver():
    await wait(0.1)
    globals.npc.progression["Blue"]["dialogue"] = "BlueSilver"
    globals.npc.progression["Silver"]["dialogue"] = "BlueSilver"

    var blue = globals.cutscenes.get_npc_node("Blue")
    var silver = globals.cutscenes.get_npc_node("Silver")

    globals.cutscenes.place_actor(blue, Vector2(1131, 1231))
    globals.cutscenes.place_actor(silver, Vector2(1081, 1231))
    globals.cutscenes.face_direction(silver, "right")
    globals.cutscenes.face_direction(blue, "left")

    blue.direction_locked = true
    silver.direction_locked = true

func flannery_candice():
    await wait(0.1)
    globals.npc.progression["Flannery"]["dialogue"] = "FlanneryCandice"
    globals.npc.progression["Candice"]["dialogue"] = "FlanneryCandice"

    var flannery = globals.cutscenes.get_npc_node("Flannery")
    var candice = globals.cutscenes.get_npc_node("Candice")

    globals.cutscenes.place_actor(flannery, Vector2(1402, 775))
    globals.cutscenes.place_actor(candice, Vector2(1352, 775))
    globals.cutscenes.face_direction(candice, "right")
    globals.cutscenes.face_direction(flannery, "left")

    flannery.direction_locked = true
    candice.direction_locked = true

func clair_iris():
    await wait(0.1)
    globals.npc.progression["Clair"]["dialogue"] = "ClairIris"
    globals.npc.progression["Iris"]["dialogue"] = "ClairIris"

    var clair = globals.cutscenes.get_npc_node("Clair")
    var iris = globals.cutscenes.get_npc_node("Iris")

    globals.cutscenes.place_actor(iris, Vector2(639, 1050))
    globals.cutscenes.place_actor(clair, Vector2(589, 1050))
    globals.cutscenes.face_direction(clair, "right")
    globals.cutscenes.face_direction(iris, "left")

    clair.direction_locked = true
    iris.direction_locked = true

func burgh_elesa():
    await wait(0.1)
    globals.npc.progression["Burgh"]["dialogue"] = "BurghElesa"
    globals.npc.progression["Elesa"]["dialogue"] = "BurghElesa"

    var burgh = globals.cutscenes.get_npc_node("Burgh")
    var elesa = globals.cutscenes.get_npc_node("Elesa")

    globals.cutscenes.place_actor(burgh, Vector2(201, 1105))
    globals.cutscenes.place_actor(elesa, Vector2(201, 1166))
    globals.cutscenes.face_direction(burgh, "down")
    globals.cutscenes.face_direction(elesa, "down")

    burgh.direction_locked = true
    elesa.direction_locked = true

func blaine_wattson():
    await wait(0.1)
    globals.npc.progression["Blaine"]["dialogue"] = "BlaineWattson"
    globals.npc.progression["Wattson"]["dialogue"] = "BlaineWattson"

    var blaine = globals.cutscenes.get_npc_node("Blaine")
    var wattson = globals.cutscenes.get_npc_node("Wattson")

    globals.cutscenes.place_actor(blaine, Vector2(1833, 778))
    globals.cutscenes.place_actor(wattson, Vector2(1878, 778))
    globals.cutscenes.face_direction(blaine, "right")
    globals.cutscenes.face_direction(wattson, "left")

    blaine.direction_locked = true
    wattson.direction_locked = true

func blue_gbc():
    await wait(0.1)
    globals.hotel.get_node("Objects/TV Screen/GBC").show()
    globals.npc.progression["Blue"]["dialogue"] = "BlueGBC"

    var blue = globals.cutscenes.get_npc_node("Blue")

    globals.cutscenes.place_actor(blue, Vector2(865, 722))
    globals.cutscenes.face_direction(blue, "up")

    blue.direction_locked = true

func wally_n():
    await wait(0.1)
    globals.npc.progression["Wally"]["dialogue"] = "WallyN"
    globals.npc.progression["N"]["dialogue"] = "WallyN"

    var wally = globals.cutscenes.get_npc_node("Wally")
    var n = globals.cutscenes.get_npc_node("N")

    globals.cutscenes.place_actor(n, Vector2(1407, 873))
    globals.cutscenes.place_actor(wally, Vector2(1448, 873))
    globals.cutscenes.face_direction(n, "right")
    globals.cutscenes.face_direction(wally, "left")

    wally.direction_locked = true
    n.direction_locked = true

func yugi():
    await wait(0.1)
    globals.npc.progression["Yugi"]["dialogue"] = "1"

    var yugi_node = globals.cutscenes.get_npc_node("Yugi")

    globals.cutscenes.place_actor(yugi_node, Vector2(70, 888))
    globals.cutscenes.face_direction(yugi_node, "right")

    yugi_node.direction_locked = false

func roxanne_brawly():
    await wait(0.1)
    globals.npc.progression["Roxanne"]["dialogue"] = "RoxanneBrawly"
    globals.npc.progression["Brawly"]["dialogue"] = "RoxanneBrawly"

    var roxanne = globals.cutscenes.get_npc_node("Roxanne")
    var brawly = globals.cutscenes.get_npc_node("Brawly")

    globals.cutscenes.place_actor(brawly, Vector2(683, 460))
    globals.cutscenes.place_actor(roxanne, Vector2(727, 460))
    globals.cutscenes.face_direction(brawly, "right")
    globals.cutscenes.face_direction(roxanne, "up")

    roxanne.direction_locked = true
    brawly.direction_locked = true

func smt():
    await wait(0.1)
    globals.npc.progression["Morty"]["dialogue"] = "smt"

    var morty = globals.cutscenes.get_npc_node("Morty")

    globals.cutscenes.place_actor(morty, Vector2(1120, 324))
    globals.cutscenes.face_direction(morty, "up")

    morty.direction_locked = true



func wait(time):
    await get_tree().create_timer(time).timeout
