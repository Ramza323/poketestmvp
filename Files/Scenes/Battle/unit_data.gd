extends Node2D

@onready var player: AnimationPlayer = $AnimationPlayer
@onready var blink: AnimationPlayer = $BlinkPlayer
@onready var healthbar_shadow: ColorRect = $UnitUI / HealthBar / HealthShadow
@onready var healthbar: ColorRect = $UnitUI / HealthBar / Health
@onready var box1: Node2D = $InputUI / AttackInfo1
@onready var box2: Node2D = $InputUI / AttackInfo2
@onready var dmg_label: Label = $DamagePopUp / DmgLabel
@onready var sprite_2d: Sprite2D = $Sprite / Sprite2D
@onready var anm_player: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer = $AudioPlayer
@onready var action_timer: Timer = $ActionNamePopUp / Timer







@export var signal_attack = false


var unit_name = "unit name"
var unit_id = 0.0
var sprite = 0
var color = "white"
var rarity = 2

var level = 5
var ap = 5
var pp = 5

var max_ap = 5

var health = 60
var power = 50:
    set(value):
        power = value
        if power < 1: power = 1

var speed = 40

var original_power = 50

var defense = 1.0

var max_hp = 120.0:
    set(value):
        if value < 1.0 or is_nan(value):
            value = 1.0
        max_hp = value

var cur_hp = 120.0

var temp_power = 0
var temp_defense = 0.0
var temp_speed = 0

var unit_trait = null

var slot1 = ["tackle", "tackle"]
var slot2 = ["Heal", "Heal2"]
var slot3 = ["tackle", "tackle"]

var atk1 = slot1[0]
var passive = slot2[0]
var atk2 = slot3[0]

var selected_attack = atk1

var team = 1
var team_slot = 0:
    set(value):
        team_slot = int(value)

var original_team_slot = 0

var played_turn = false
var waiting = false
var skip_turn = false

var auto_battle = false

var burn_amount = 0.0

var recorded_data = {
    "dodges": 0, 
    "protect": 0, 
    "AI_protected": false, 
    "burn_immunity": false, 
    "perma_burned": false, 
    "flame_body": false, 
    "extra_turn": 0, 
    "taunted": false, 
    "rollout": 0, 
}
var unit_immune = false

var unit_dict = {
        "species": "rattata", 
        "dex": pkmn.dex["rattata"], 
        "lv": 1, 
        "exp": 0, 
        "id": randi(), 

        "bonus_ap": 0, 
        "bonus_pp": 0, 
        "bonus_health": 0, 
        "bonus_power": 0, 
        "bonus_speed": 0, 

        "slot1_selected": slot1, 
        "slot2_selected": slot2, 
        "slot3_selected": slot3, 
    }

var home_coords = Vector2(0, 0)
var popup_id = 0.0
var getting_exp = false

func _ready() -> void :
    $AudioPlayer.volume_linear = 0.177 * globals.options["se_volume"]
    $AuxPlayer.volume_linear = 0.177 * globals.options["se_volume"]
    $AuxPlayer2.volume_linear = 0.177 * globals.options["se_volume"]

func update_home_coords():
    home_coords = position

func popup_damage(damage, popup_color, affinity):
    dmg_label.position = Vector2(-52.0, -120.0)
    dmg_label.modulate = Color("#ffffff")
    dmg_label.self_modulate = Color("#ffffff")
    dmg_label.label_settings.outline_color = Color("000000ff")

    var cur_popup_id = randf()
    popup_id = cur_popup_id
    if typeof(damage) == TYPE_INT:
        dmg_label.text = str(int(dmg_label.text) + damage)
    else:
        dmg_label.text = damage
    dmg_label.modulate = Color(poke_types.colors[popup_color][1])
    pop_shake(affinity, popup_color)
    await get_tree().create_timer(0.1).timeout

    for i in range(15):
        dmg_label.position.y -= 1

        await get_tree().create_timer(0.01).timeout
        if popup_id != cur_popup_id: return

    await get_tree().create_timer(0.6).timeout
    if popup_id != cur_popup_id: return

    dmg_label.text = ""
    dmg_label.position = Vector2(-47.0, -120.0)
    dmg_label.modulate = Color("#ffffff")

func pop_shake(affinity, popup_color):
    var cur_popup_id = popup_id

    if affinity == 1:
        dmg_label.scale = Vector2(0.85, 0.85)

        var tween = get_tree().create_tween()
        tween.tween_property(dmg_label, "scale", Vector2(1.3, 1.3), 0.1)
        tween.tween_property(dmg_label, "scale", Vector2(0.85, 0.85), 0.12)
        tween.tween_property(dmg_label, "scale", Vector2(1.0, 1.0), 0.08)

        for i in range(2):

            dmg_label.modulate = Color("ffffffff")
            await get_tree().create_timer(0.03).timeout
            if popup_id != cur_popup_id: return
            dmg_label.modulate = Color(poke_types.colors[popup_color][1])

            await get_tree().create_timer(0.03).timeout
            if popup_id != cur_popup_id: return

    if affinity == poke_types.weak:
        dmg_label.scale = Vector2(0.6, 0.6)
        await get_tree().create_timer(0.03).timeout
        if popup_id != cur_popup_id: return

        flash_label(10, popup_color, cur_popup_id)

        var tween = get_tree().create_tween()
        tween.tween_property(dmg_label, "scale", Vector2(1.8, 1.8), 0.06)
        await get_tree().create_timer(0.12).timeout
        if popup_id != cur_popup_id: return

        tween = get_tree().create_tween()
        tween.tween_property(dmg_label, "scale", Vector2(0.75, 0.75), 0.12)
        tween.tween_property(dmg_label, "scale", Vector2(1.2, 1.2), 0.16)
        tween.tween_property(dmg_label, "scale", Vector2(1.0, 1.0), 0.06)


    if affinity == poke_types.resist:


        var tween = get_tree().create_tween()
        tween.tween_property(dmg_label, "scale", Vector2(0.6, 0.6), 0.1)
        tween.tween_property(dmg_label, "scale", Vector2(1.1, 1.1), 0.16)
        tween.tween_property(dmg_label, "scale", Vector2(1.0, 1.0), 0.1)

        for i in range(4):

            dmg_label.modulate = Color("000000ff")
            await get_tree().create_timer(0.03).timeout
            if popup_id != cur_popup_id: return
            dmg_label.modulate = Color(poke_types.colors[popup_color][1])

            await get_tree().create_timer(0.03).timeout
            if popup_id != cur_popup_id: return





































        var tween2 = get_tree().create_tween()
        tween2.tween_property(get_node("DamagePopUp"), "position", Vector2(0, 0), 0.03)

    if affinity == -1:
        dmg_label.scale = Vector2(1, 1)

        dmg_label.modulate = Color("#18c320")

func flash_label(reps, popup_color, cur_popup_id, negative = false):
    var flashspeed = 0.05
    for i in range(reps):
        if not negative:
            dmg_label.modulate = Color("#ffffff")
        else:
            dmg_label.modulate = Color("ffffff00")
            flashspeed = 0.04
        await get_tree().create_timer(flashspeed).timeout
        if popup_id != cur_popup_id: return
        dmg_label.modulate = Color(poke_types.colors[popup_color][1])
        await get_tree().create_timer(flashspeed).timeout
        if popup_id != cur_popup_id: return

func stat_change_SE():
    return
