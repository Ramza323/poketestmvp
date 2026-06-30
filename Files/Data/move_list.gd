extends Node2D


var active = {}
var passive = {}

var base_power = [50, 85, 110, 130]

var priority_moves = ["quick_attack", "extreme_speed", "mach_punch", "sucker_punch", "counter"]

var metronome_moves = [
        "flamethrower", 
        "hydro_pump", 
        "giga_drain", 
        "thunderbolt", 
        "shadow_ball", 
        "psychic", 
        "tri_attack", 
        "ice_beam", 
        "sludge_bomb", 
        "flash_cannon", 
        "fire_punch", 
        "ice_punch", 
        "poison_fang", 
        "thunder_punch", 
        "shadow_punch", 
        "body_slam", 
        "hyper_voice", 
        "bulldoze", 
        "psybeam", 
        "shock_wave", 
        "bug_buzz", 
        "dragon_claw", 
        "waterfall", 
        "power_whip", 
        "rock_slide", 
        "super_fang", 
        "mega_drain", 
        "comet_punch", 
        "octazooka", 
        "steel_wing", 
        "magical_leaf", 
        "fire_blast", 
        "blizzard", 
        "thunder", 
        "hurricane", 
        "hyper_beam", 
        "earthquake", 
        "guillotine", 
        "sheer_cold", 
        "diamond_storm", 
        "roar_of_time", 
        "poison_sting", 
        "smog", 
        "tackle", 
        "pound", 
        "peck", 
        "thunder_shock", 
        "ember", 
        "water_gun", 
        "vine_whip", 
        "gust", 
        "fairy_wind", 
        "double_kick", 
        "swift", 
        "horn_attack", 
        "extrasensory", 
    ]

func _ready() -> void :
    await get_tree().create_timer(0.001).timeout
    active = {
        "struggle": {
            "name": "Struggle", 
            "color": "none", 
            "power": 25, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 of enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "tackle": {
            "name": "Tackle", 
            "color": "none", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy with your color", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fire_punch": {
            "name": "Fire Punch", 
            "color": "red", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "strong": {
            "name": "strong", 
            "color": "red", 
            "power": 6000, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "cheap": {
            "name": "cheap", 
            "color": "red", 
            "power": 5000, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "burn": {
            "name": "burn", 
            "color": "red", 
            "power": 60, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_100], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "thunder_punch": {
            "name": "Thunder Punch", 
            "color": "yellow", 
            "power": base_power[2] - 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ice_punch": {
            "name": "Ice Punch", 
            "color": "ice", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "shadow_punch": {
            "name": "Shadow Punch", 
            "color": "black", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sludge_punch": {
            "name": "Sludge Punch", 
            "color": "poison", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "confusion": {
            "name": "Confusion", 
            "color": "psychic", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "water_pulse": {
            "name": "Water Pulse", 
            "color": "blue", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "swift": {
            "name": "Swift", 
            "color": "none", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "smog": {
            "name": "Smog", 
            "color": "none", 
            "power": 10, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "cut": {
            "name": "Cut", 
            "color": "none", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "psybeam": {
            "name": "Psybeam", 
            "color": "psychic", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "headbutt": {
            "name": "Headbutt", 
            "color": "none", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "zen_headbutt": {
            "name": "Zen Headbutt", 
            "color": "psychic", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "wave_splash": {
            "name": "Wave Splash", 
            "color": "blue", 
            "power": 65, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "shock_wave": {
            "name": "Shock Wave", 
            "color": "yellow", 
            "power": 65, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "leaf_blade": {
            "name": "Leaf Blade", 
            "color": "green", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bug_buzz": {
            "name": "Bug Buzz", 
            "color": "bug", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dragon_claw": {
            "name": "Dragon Claw", 
            "color": "dragon", 
            "power": base_power[1], 
            "cost": 3, 
            "effect": [deal_damage, frontrow_heal_30pc], 
            "desc": "ATK:{0} - After attacking in FRONT ROW, heal for 30% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "flamethrower": {
            "name": "Flamethrower", 
            "color": "red", 
            "power": 75, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "black_flame": {
            "name": "Flamethrower", 
            "color": "black", 
            "power": 75, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "hydro_pump": {
            "name": "Hydro Pump", 
            "color": "blue", 
            "power": base_power[2] - 10, 
            "cost": 3, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "aeroblast": {
            "name": "Aeroblast", 
            "color": "flying", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "techno_blast": {
            "name": "Techno Blast", 
            "color": "none", 
            "power": base_power[2] - 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "waterfall": {
            "name": "Waterfall", 
            "color": "blue", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "solar_beam": {
            "name": "Solar Beam", 
            "color": "green", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [solar_beam_charge], 
            "desc": "ATK:{0} - Targets whole column. Needs to charge", 

            "target": "column", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": true, 

            "hide_name": true, 
        }, 

        "solar_beam_fire": {
            "name": "Solar Beam", 
            "color": "green", 
            "power": 120, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Targets whole column.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "power_whip": {
            "name": "Power Whip", 
            "color": "green", 
            "power": base_power[2] - 20, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "thunder_shock": {
            "name": "Thunder Shock", 
            "color": "yellow", 
            "power": 25, 
            "cost": 1, 
            "effect": [deal_damage, chain], 
            "desc": "ATK:{0} - Chains to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "volt_tackle": {
            "name": "Volt Tackle", 
            "color": "yellow", 
            "power": 160, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "electro_ball": {
            "name": "Electro Ball", 
            "color": "yellow", 
            "power": 65, 
            "cost": 2, 
            "effect": [double_dmg_less_30_speed, deal_damage], 
            "desc": "ATK:{0} - Deals double damage to enemies with 30 or less SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "acrobatics": {
            "name": "Acrobatics", 
            "color": "white", 
            "power": 65, 
            "cost": 2, 
            "effect": [double_dmg_less_30_speed, deal_damage], 
            "desc": "ATK:{0} - Deals double damage to enemies with 30 or less SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rollout": {
            "name": "Rollout", 
            "color": "rock", 
            "power": 60, 
            "cost": 1, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ice_ball": {
            "name": "Ice Ball", 
            "color": "ice", 
            "power": 60, 
            "cost": 1, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "steamroller": {
            "name": "Steamroller", 
            "color": "bug", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "night_shade": {
            "name": "Night Shade", 
            "color": "none", 
            "power": 40, 
            "cost": 2, 
            "effect": [night_shade, deal_damage], 
            "desc": "ATK:{0} - Power is multiplied by target's RARITY.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sun_bloom": {
            "name": "Sun Bloom", 
            "color": "none", 
            "power": 40, 
            "cost": 2, 
            "effect": [night_shade, deal_damage], 
            "desc": "ATK:{0} - Power is multiplied by target's RARITY.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rock_slide": {
            "name": "Rock Slide", 
            "color": "rock", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "shadow_ball": {
            "name": "Shadow Ball", 
            "color": "black", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "rock_tomb": {
            "name": "Rock Tomb", 
            "color": "rock", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, lower_speed_20], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 20.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "head_smash": {
            "name": "Head Smash", 
            "color": "rock", 
            "power": base_power[2] + 30, 
            "cost": 3, 
            "effect": [deal_damage, recoil_15], 
            "desc": "ATK:{0} - User loses 15% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fire_spin": {
            "name": "Fire Spin", 
            "color": "red", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn to whole column.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "fire_blast": {
            "name": "Fire Blast", 
            "color": "red", 
            "power": 130, 
            "cost": 4, 
            "effect": [deal_damage, splash_30], 
            "desc": "ATK:{0} - Deals 40 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "fusion_flare": {
            "name": "Fusion Flare", 
            "color": "red", 
            "power": 180, 
            "cost": 5, 
            "effect": [deal_damage, splash_30], 
            "desc": "ATK:{0} - Deals 40 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "blue_flare": {
            "name": "Blue Flare", 
            "color": "blue", 
            "power": 110, 
            "cost": 4, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn to whole column.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "fusion_bolt": {
            "name": "Fusion Bolt", 
            "color": "yellow", 
            "power": 180, 
            "cost": 5, 
            "effect": [deal_damage, splash_30], 
            "desc": "ATK:{0} - Deals 40 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bolt_strike": {
            "name": "Bolt Strike", 
            "color": "yellow", 
            "power": 150, 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "flame_burst": {
            "name": "Flame Burst", 
            "color": "red", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, splash_25], 
            "desc": "ATK:{0} - Deals 25 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "extrasensory": {
            "name": "Extrasensory", 
            "color": "psychic", 
            "power": 60, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bubble_beam": {
            "name": "Bubble Beam", 
            "color": "blue", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "horn_attack": {
            "name": "Horn Attack", 
            "color": "white", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "horn_drill": {
            "name": "Horn Drill", 
            "color": "none", 
            "power": 220, 
            "cost": 5, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fissure": {
            "name": "Fissure", 
            "color": "none", 
            "power": 220, 
            "cost": 5, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "explosion": {
            "name": "Explosion", 
            "color": "none", 
            "power": 400, 
            "cost": 2, 
            "effect": [deal_damage, recoil_100], 
            "desc": "ATK:{0} - Targets row. User is knocked out.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "self-destruct": {
            "name": "Self-Destruct", 
            "color": "none", 
            "power": 150, 
            "cost": 0, 
            "effect": [deal_damage, recoil_100], 
            "desc": "ATK:{0} - Targets row. User is knocked out.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "thunderbolt": {
            "name": "Thunderbolt", 
            "color": "yellow", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "skull_bash": {
            "name": "Skull Bash", 
            "color": "white", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [skull_bash_charge], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 

            "hide_name": true, 
        }, 

        "skull_bash_fire": {
            "name": "Skull Bash", 
            "color": "none", 
            "power": 140, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "focus_punch": {
            "name": "Focus Punch", 
            "color": "fighting", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [focus_punch_charge], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 

            "hide_name": true, 
        }, 

        "focus_punch_fire": {
            "name": "Focus Punch", 
            "color": "fighting", 
            "power": 140, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "super_fang": {
            "name": "Super Fang", 
            "color": "white", 
            "power": 0, 
            "cost": 2, 
            "effect": [bonus_dmg_cur_hp_50, deal_damage], 
            "desc": "ATK:{0} - Deals 50% of targets CURRENT HP as bonus damage.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "hyper_fang": {
            "name": "Hyper Fang", 
            "color": "white", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ultima_fang": {
            "name": "Ultima Fang", 
            "color": "white", 
            "power": 180, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "crunch": {
            "name": "Crunch", 
            "color": "black", 
            "power": 85, 
            "cost": 2, 
            "effect": [nullify_target_defense, deal_damage], 
            "desc": "ATK:{0} - Nullifies target's DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sacred_sword": {
            "name": "Sacred Sword", 
            "color": "none", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [nullify_target_defense, deal_damage], 
            "desc": "ATK:{0} - Nullifies target's DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "secret_sword": {
            "name": "Secret Sword", 
            "color": "none", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [nullify_target_defense, deal_damage], 
            "desc": "ATK:{0} - Nullifies target's DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "gust": {
            "name": "Gust", 
            "color": "flying", 
            "power": 65, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "pound": {
            "name": "Pound", 
            "color": "white", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "aerial_ace": {
            "name": "Aerial Ace", 
            "color": "flying", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "poison_sting": {
            "name": "Poison Sting", 
            "color": "bug", 
            "power": 30, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "double_kick": {
            "name": "Double Kick", 
            "color": "fighting", 
            "power": 20, 
            "cost": 2, 
            "effect": [deal_damage, add_atk], 
            "desc": "ATK:{0} - Hits twice.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dual_chop": {
            "name": "Dual Chop", 
            "color": "fighting", 
            "power": 20, 
            "cost": 2, 
            "effect": [deal_damage, add_atk], 
            "desc": "ATK:{0} - Hits twice.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "wing_attack": {
            "name": "Wing Attack", 
            "color": "flying", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "peck": {
            "name": "Peck", 
            "color": "flying", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "drill_peck": {
            "name": "Drill Peck", 
            "color": "flying", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fly": {
            "name": "Fly", 
            "color": "flying", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [fly_charge], 
            "desc": "ATK:{0} - Needs to charge. Skips \"before attacked\" effects.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "fly_fire": {
            "name": "Fly", 
            "color": "flying", 
            "power": 100, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "shadow_force": {
            "name": "Shadow Force", 
            "color": "black", 
            "power": 150, 
            "cost": 5, 
            "effect": [shadow_force_charge], 
            "desc": "ATK:{0} - Needs to charge. Unit leaves the field while charging.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "shadow_force_fire": {
            "name": "Shadow Force", 
            "color": "black", 
            "power": 150, 
            "cost": 5, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "discharge": {
            "name": "Discharge", 
            "color": "yellow", 
            "power": 85, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dark_lightning": {
            "name": "Dark Lighting", 
            "color": "yellow", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "white_lightning": {
            "name": "White Lighting", 
            "color": "white", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "tri_attack": {
            "name": "Tri Attack", 
            "color": "none", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, add_burn_10, lower_speed_10], 
            "desc": "ATK:{0} - Deals 10% BURN and lowers target's SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ember": {
            "name": "Ember", 
            "color": "red", 
            "power": 25, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% BURN.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "wrap": {
            "name": "Wrap", 
            "color": "white", 
            "power": 35, 
            "cost": 1, 
            "effect": [deal_damage, lower_speed_20], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 20.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "absorb": {
            "name": "Absorb", 
            "color": "green", 
            "power": 30, 
            "cost": 1, 
            "effect": [deal_damage, heal_8pc], 
            "desc": "ATK:{0} - Heal by 8% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "mega_drain": {
            "name": "Mega Drain", 
            "color": "green", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, heal_10pc], 
            "desc": "ATK:{0} - Heal by 10% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "giga_drain": {
            "name": "Giga Drain", 
            "color": "green", 
            "power": base_power[1], 
            "cost": 3, 
            "effect": [deal_damage, heal_25pc], 
            "desc": "ATK:{0} - Heal by 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "vine_whip": {
            "name": "Vine Whip", 
            "color": "green", 
            "power": 50, 
            "cost": 1, 
            "effect": [pull, deal_damage], 
            "desc": "ATK:{0} - Pulls the target to the front row.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "water_gun": {
            "name": "Water Gun", 
            "color": "blue", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "kinesis": {
            "name": "Kinesis", 
            "color": "psychic", 
            "power": 65, 
            "cost": 2, 
            "effect": [pull, deal_damage], 
            "desc": "ATK:{0} - Pulls the target to the front row.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sludge": {
            "name": "Sludge", 
            "color": "poison", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "poison_gas": {
            "name": "Poison Gas", 
            "color": "poison", 
            "power": 0, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_sway", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "flame_charge": {
            "name": "Flame Charge", 
            "color": "red", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage, gain_speed_10], 
            "desc": "ATK:{0} - User gains 10 SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bite": {
            "name": "Bite", 
            "color": "black", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "scratch": {
            "name": "Scratch", 
            "color": "white", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "slash": {
            "name": "Slash", 
            "color": "none", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "spacial_rend": {
            "name": "Spacial Rend", 
            "color": "none", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dark_slash": {
            "name": "Dark Slash", 
            "color": "none", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "crush_claw": {
            "name": "Crush Claw", 
            "color": "none", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, lower_def_20], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "smash_punch": {
            "name": "Smash Punch", 
            "color": "fighting", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "smash_kick": {
            "name": "Smash Kick", 
            "color": "fighting", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "mega_punch": {
            "name": "Mega Punch", 
            "color": "fighting", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sledge_hammer": {
            "name": "Sledge Hammer", 
            "color": "steel", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "mega_kick": {
            "name": "Mega Kick", 
            "color": "fighting", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "high_jump_kick": {
            "name": "High Jump Kick", 
            "color": "fighting", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "jump_kick": {
            "name": "Jump Kick", 
            "color": "fighting", 
            "power": base_power[1] + 20, 
            "cost": 2, 
            "effect": [deal_damage, recoil_15], 
            "desc": "ATK:{0} - User loses 15% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "blaze_kick": {
            "name": "Blaze Kick", 
            "color": "red", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "mach_punch": {
            "name": "Mach Punch", 
            "color": "fighting", 
            "power": 40, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "comet_punch": {
            "name": "Comet Punch", 
            "color": "fighting", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "drain_punch": {
            "name": "Drain Punch", 
            "color": "fighting", 
            "power": base_power[1] - 5, 
            "cost": 3, 
            "effect": [deal_damage, frontrow_heal_30pc], 
            "desc": "ATK:{0} - After attacking in FRONT ROW, heal for 30% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "horn_leech": {
            "name": "Horn Leech", 
            "color": "green", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage, frontrow_heal_20pc], 
            "desc": "ATK:{0} - After attacking in FRONT ROW, heal for 20% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "triple_kick": {
            "name": "Triple Kick", 
            "color": "fighting", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_2_atk], 
            "desc": "ATK:{0} - Hits 3 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "triple_axel": {
            "name": "Triple Axel", 
            "color": "blue", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_2_atk], 
            "desc": "ATK:{0} - Hits 3 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "counter": {
            "name": "Counter", 
            "color": "none", 
            "power": 50, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rapid_spin": {
            "name": "Rapid Spin", 
            "color": "none", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "pursuit": {
            "name": "Pursuit", 
            "color": "black", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rolling_kick": {
            "name": "Rolling Kick", 
            "color": "fighting", 
            "power": 75, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "earth_power": {
            "name": "Earth Power", 
            "color": "ground", 
            "power": base_power[2] - 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "superpower": {
            "name": "Superpower", 
            "color": "fighting", 
            "power": 180, 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - User loses 20% DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "earthquake": {
            "name": "Earthquake", 
            "color": "ground", 
            "power": 85, 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to the whole enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 
        
        "test": {
            "name": "test", 
            "color": "white", 
            "power": 999, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to the whole enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "diamond_storm": {
            "name": "Diamond Storm", 
            "color": "red", 
            "power": 85, 
            "cost": 4, 
            "effect": [deal_damage, user_gains_defense_10], 
            "desc": "ATK:{0} - User gains 10% DEFENSE.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "magnitude": {
            "name": "Magnitude", 
            "color": "ground", 
            "power": 40, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to the whole enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "poison_jab": {
            "name": "Poison Jab", 
            "color": "poison", 
            "power": base_power[2] - 30, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "hammer_arm": {
            "name": "Hammer Arm", 
            "color": "fighting", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage, user_lose_speed_10], 
            "desc": "ATK:{0} - User loses 10 SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bulldoze": {
            "name": "Bulldoze", 
            "color": "ground", 
            "power": 75, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "thousand_waves": {
            "name": "Thousand Waves", 
            "color": "none", 
            "power": 5, 
            "cost": 4, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Deals damage to a row of enemies. Hits 4 times.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "drill_run": {
            "name": "Drill Run", 
            "color": "ground", 
            "power": 80, 
            "cost": 2, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves target into BACK ROW.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "power_gem": {
            "name": "Power Gem", 
            "color": "rock", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "seismic_toss": {
            "name": "Seismic Toss", 
            "color": "fighting", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [seismic_toss], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_stomped", 
            "retreat": "none", 
            "ranged": true, 
        }, 

        "sky_drop": {
            "name": "Sky Drop", 
            "color": "flying", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [sky_drop], 
            "desc": "ATK:{0} - Deals target's MISSING HP as bonus damage", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_stomped", 
            "retreat": "none", 
            "ranged": true, 
        }, 

        "berserker_splash": {
            "name": "Berserker Splash", 
            "color": "blue", 
            "power": base_power[2], 
            "cost": 4, 
            "effect": [deal_damage, splash_30], 
            "desc": "ATK:{0} - Deals 30 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "aqua_tail": {
            "name": "Aqua Tail", 
            "color": "blue", 
            "power": 85, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "burning_tail": {
            "name": "Burning Tail", 
            "color": "none", 
            "power": 65, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% BURN to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "hyper_beam": {
            "name": "Hyper Beam", 
            "color": "none", 
            "power": 200, 
            "cost": 5, 
            "effect": [deal_damage, user_recharge], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "psycho_boost": {
            "name": "Psycho Boost", 
            "color": "psychic", 
            "power": 200, 
            "cost": 5, 
            "effect": [deal_damage, user_recharge], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "oblivion_wing": {
            "name": "Oblivion Wing", 
            "color": "flying", 
            "power": 160, 
            "cost": 4, 
            "effect": [deal_damage, frontrow_heal_30pc], 
            "desc": "ATK:{0} - Deals damage to a column of enemies. User heals 30% MAX HP.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "roar_of_time": {
            "name": "Roar of Time", 
            "color": "yellow", 
            "power": 175, 
            "cost": 5, 
            "effect": [deal_damage, user_recharge], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "brutal_swing": {
            "name": "Brutal Swing", 
            "color": "flying", 
            "power": base_power[2] - 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "petal_dance": {
            "name": "Petal Dance", 
            "color": "green", 
            "power": 30, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "petal_blizzard": {
            "name": "Petal Blizzard", 
            "color": "green", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to the whole enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sludge_bomb": {
            "name": "Sludge Bomb", 
            "color": "poison", 
            "power": 80, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20, splash_burn_10], 
            "desc": "ATK:{0} - Deals 20% burn to target, and 10% to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "toxic": {
            "name": "Toxic", 
            "color": "poison", 
            "power": 0, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_40], 
            "desc": "ATK:{0} - Deals 40% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "leaf_storm": {
            "name": "Leaf Storm", 
            "color": "green", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, user_recharge], 
            "desc": "ATK:{0} - Deals damage to a column of enemies. User must recharge", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "razor_leaf": {
            "name": "Razor Leaf", 
            "color": "green", 
            "power": 80, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "belch": {
            "name": "Belch", 
            "color": "green", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sludge_wave": {
            "name": "Sludge Wave", 
            "color": "poison", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn to the whole row.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "psychic": {
            "name": "Psychic", 
            "color": "psychic", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "seed_flare": {
            "name": "Seed Flare", 
            "color": "green", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "mist_ball": {
            "name": "Mist Ball", 
            "color": "psychic", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "psystrike": {
            "name": "Psystrike", 
            "color": "psychic", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sky_spear": {
            "name": "Sky Spear", 
            "color": "flying", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "mind_shock": {
            "name": "Mind Shock", 
            "color": "psychic", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage, target_lose_1_ap], 
            "desc": "ATK:{0} - Target loses 1 AP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "slack_off": {
            "name": "Slack Off", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [heal_30pc], 
            "desc": "ATK:{0} - User heals by 50% MAX HP.", 

            "target": "self", 
            "approach": "none", 
            "motion": "ot_rest", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "smart_strike": {
            "name": "Smart Strike", 
            "color": "steel", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "take_down": {
            "name": "Take Down", 
            "color": "none", 
            "power": 80, 
            "cost": 2, 
            "effect": [deal_damage, lower_speed_20], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 20.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "flame_wheel": {
            "name": "Flame Wheel", 
            "color": "red", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fire_fang": {
            "name": "Fire Fang", 
            "color": "red", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dark_burn": {
            "name": "Dark Burn", 
            "color": "black", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dark_magic": {
            "name": "Dark Magic", 
            "color": "black", 
            "power": base_power[2] + 15, 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "ice_fang": {
            "name": "Ice Fang", 
            "color": "ice", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "thunder_fang": {
            "name": "Thunder Fang", 
            "color": "yellow", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "poison_fang": {
            "name": "Poison Fang", 
            "color": "poison", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "flare_blitz": {
            "name": "Flare Blitz", 
            "color": "red", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "extreme_speed": {
            "name": "Extreme Speed", 
            "color": "white", 
            "power": 60, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "none", 
            "motion": "mt_extreme_speed", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "fury_swipes": {
            "name": "Fury Swipes", 
            "color": "white", 
            "power": 8, 
            "cost": 2, 
            "effect": [deal_damage, add_2_atk], 
            "desc": "ATK:{0} - Hits 3 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "body_slam": {
            "name": "Body Slam", 
            "color": "white", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "hyper_voice": {
            "name": "Hyper Voice", 
            "color": "white", 
            "power": 80, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bounce": {
            "name": "Bounce", 
            "color": "white", 
            "power": 85, 
            "cost": 2, 
            "effect": [bounce], 
            "desc": "ATK:{0} - Bypasses \"before attacked\" effects.", 

            "target": "any", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_stomped", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "harden": {
            "name": "Harden", 
            "color": "white", 
            "power": 0, 
            "cost": 1, 
            "effect": [harden], 
            "desc": "ATK:{0} - User gains 20% DEFENSE.", 

            "target": "self", 
            "approach": "none", 
            "motion": "ot_harden", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "nuzzle": {
            "name": "Nuzzle", 
            "color": "yellow", 
            "power": 55, 
            "cost": 1, 
            "effect": [deal_damage, lower_speed_20], 
            "desc": "ATK:{0} - Target loses 20 SPEED.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "spark": {
            "name": "Spark", 
            "color": "yellow", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dragon_rage": {
            "name": "Dragon Rage", 
            "color": "dragon", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "hurricane": {
            "name": "Hurricane", 
            "color": "flying", 
            "power": 50, 
            "cost": 4, 
            "effect": [deal_damage, hurricane], 
            "desc": "ATK:{0} - Shuffles the enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "relic_song": {
            "name": "Relic Song", 
            "color": "none", 
            "power": 50, 
            "cost": 4, 
            "effect": [deal_damage, hurricane], 
            "desc": "ATK:{0} - Shuffles the enemy team.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sky_attack": {
            "name": "Sky Attack", 
            "color": "flying", 
            "power": 200, 
            "cost": 4, 
            "effect": [sky_attack_charge], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 

            "hide_name": true, 
        }, 

        "sky_attack_fire": {
            "name": "Sky Attack", 
            "color": "flying", 
            "power": 200, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "incinerate": {
            "name": "Incinerate", 
            "color": "red", 
            "power": 40, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_30], 
            "desc": "ATK:{0} - Deals 30% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sacred_fire": {
            "name": "Sacred Fire", 
            "color": "none", 
            "power": base_power[3], 
            "cost": 5, 
            "effect": [deal_damage, add_burn_30], 
            "desc": "ATK:{0} - Deals 30% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sand_tomb": {
            "name": "Sand Tomb", 
            "color": "ground", 
            "power": 40, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_30], 
            "desc": "ATK:{0} - Deals 30% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dark_pulse": {
            "name": "Dark Pulse", 
            "color": "black", 
            "power": 85, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "payback": {
            "name": "Payback", 
            "color": "black", 
            "power": 40, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "snarl": {
            "name": "Snarl", 
            "color": "black", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "night_slash": {
            "name": "Night Slash", 
            "color": "black", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ice_burn": {
            "name": "Ice Burn", 
            "color": "ice", 
            "power": base_power[3] - 30, 
            "cost": 4, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% BURN.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "freeze_shock": {
            "name": "Freeze Shock", 
            "color": "ice", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "ice_shard": {
            "name": "Ice Shard", 
            "color": "ice", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "shadow_sneak": {
            "name": "Shadow Sneak", 
            "color": "black", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "beat_up": {
            "name": "", 
            "color": "none", 
            "power": 25, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "foul_play": {
            "name": "Foul Play", 
            "color": "black", 
            "power": 60, 
            "cost": 2, 
            "effect": [double_dmg_less_50pc_hp, deal_damage], 
            "desc": "ATK:{0} - If target has less than 50% HP, deals double damage.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "submission": {
            "name": "Submission", 
            "color": "fighting", 
            "power": base_power[2] + 25, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "vital_throw": {
            "name": "Vital Throw", 
            "color": "fighting", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves target into the BACK  ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "cross_chop": {
            "name": "Cross Chop", 
            "color": "fighting", 
            "power": 65, 
            "cost": 2, 
            "effect": [double_dmg_less_50pc_hp, deal_damage], 
            "desc": "ATK:{0} - If target has less than 50% HP, deals double damage.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dynamic_punch": {
            "name": "Dynamic Punch", 
            "color": "fighting", 
            "power": 200, 
            "cost": 5, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "lava_plume": {
            "name": "Lava Plume", 
            "color": "red", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% burn to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "searing_shot": {
            "name": "Searing Shot", 
            "color": "red", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% burn to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "ice_beam": {
            "name": "Ice Beam", 
            "color": "ice", 
            "power": base_power[2] - 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "luster_purge": {
            "name": "Luster Purge", 
            "color": "none", 
            "power": base_power[2] - 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "aurora_beam": {
            "name": "Aurora Beam", 
            "color": "ice", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "blizzard": {
            "name": "Blizzard", 
            "color": "ice", 
            "power": 85, 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "glaciate": {
            "name": "Glaciate", 
            "color": "ice", 
            "power": 100, 
            "cost": 5, 
            "effect": [deal_damage, lower_speed_20], 
            "desc": "ATK:{0} - Deals damage to all enemies. They lose 20 SPEED.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "powder_snow": {
            "name": "Powder Snow", 
            "color": "ice", 
            "power": 40, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "icy_wind": {
            "name": "Icy Wind", 
            "color": "ice", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "frost_breath": {
            "name": "Frost Breath", 
            "color": "ice", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "leech_life": {
            "name": "Leech Life", 
            "color": "poison", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, heal_20pc], 
            "desc": "ATK:{0} - User heals by 20% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "leaf_tornado": {
            "name": "Leaf Tornado", 
            "color": "green", 
            "power": base_power[1] - 15, 
            "cost": 2, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "acid_spray": {
            "name": "Acid Spray", 
            "color": "poison", 
            "power": 15, 
            "cost": 1, 
            "effect": [deal_damage, lower_def_20], 
            "desc": "ATK:{0} - Lowers the target's defense by 20%.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "lick": {
            "name": "Lick", 
            "color": "white", 
            "power": 40, 
            "cost": 1, 
            "effect": [deal_damage, lower_speed_40], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 40.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lick", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "judgement": {
            "name": "Judgement", 
            "color": "none", 
            "power": 100, 
            "cost": 2, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deal damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "fury_cutter": {
            "name": "Fury Cutter", 
            "color": "bug", 
            "power": 50, 
            "cost": 1, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dig": {
            "name": "Dig", 
            "color": "ground", 
            "power": 90, 
            "cost": 2, 
            "effect": [dig_charge], 
            "desc": "ATK:{0} - Needs to charge. Skips \"before attacked\" effects.", 

            "target": "single", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "dig_fire": {
            "name": "Dig", 
            "color": "ground", 
            "power": 80, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "single", 
            "approach": "run", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "quick_attack": {
            "name": "Quick Attack", 
            "color": "white", 
            "power": 30, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "none", 
            "motion": "mt_shake", 
            "dmg_motion": "ht_flinched", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "water_shuriken": {
            "name": "Water Shuriken", 
            "color": "blue", 
            "power": 40, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "none", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "none", 
            "ranged": false, 
        }, 

        "bone_rush": {
            "name": "Bone Rush", 
            "color": "ground", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bonemerang": {
            "name": "Bonemerang", 
            "color": "ground", 
            "power": 25, 
            "cost": 2, 
            "effect": [deal_damage, second_hit], 
            "desc": "ATK:{0} - Hits twice.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "crabhammer": {
            "name": "Crabhammer", 
            "color": "blue", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "guillotine": {
            "name": "Guillotine", 
            "color": "none", 
            "power": 220, 
            "cost": 5, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sheer_cold": {
            "name": "Sheer Cold", 
            "color": "ice", 
            "power": 220, 
            "cost": 5, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_frozen", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "icicle_spear": {
            "name": "Icicle Spear", 
            "color": "ice", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "razor_shell": {
            "name": "Razor Shell", 
            "color": "blue", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "aqua_cutter": {
            "name": "Aqua Cutter", 
            "color": "blue", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "surf": {
            "name": "Surf", 
            "color": "blue", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "water_spout": {
            "name": "Water Spout", 
            "color": "blue", 
            "power": 85, 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "heat_wave": {
            "name": "Heat Wave", 
            "color": "red", 
            "power": 60, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% BURN to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "pin_missile": {
            "name": "Pin Missile", 
            "color": "bug", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "brine": {
            "name": "Brine", 
            "color": "blue", 
            "power": 65, 
            "cost": 2, 
            "effect": [double_dmg_less_50pc_hp, deal_damage], 
            "desc": "ATK:{0} - If target has less than 50% HP, deals double damage.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "x-scissor": {
            "name": "X-Scissor", 
            "color": "bug", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "firesword": {
            "name": "Firesword", 
            "color": "red", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "razor_wind": {
            "name": "Razor Wind", 
            "color": "white", 
            "power": 100, 
            "cost": 2, 
            "effect": [razor_wind_charge], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "any", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": true, 

            "hide_name": true, 
        }, 

        "razor_wind_fire": {
            "name": "Razor Wind", 
            "color": "none", 
            "power": 120, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Needs to charge.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "vice_grip": {
            "name": "Vice Grip", 
            "color": "white", 
            "power": 70, 
            "cost": 2, 
            "effect": [vice_grip, deal_damage], 
            "desc": "ATK:{0} - Shoves target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "cross_poison": {
            "name": "Cross Poison", 
            "color": "poison", 
            "power": base_power[2] - 20, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "seed_bomb": {
            "name": "Seed Bomb", 
            "color": "green", 
            "power": base_power[2] - 10, 
            "cost": 3, 
            "effect": [deal_damage, splash_25], 
            "desc": "ATK:{0} - Deals 25 damage to adjacent enemies.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "egg_barrage": {
            "name": "Egg Barrage", 
            "color": "none", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "thousand_arrows": {
            "name": "Thousand Arrows", 
            "color": "none", 
            "power": 7, 
            "cost": 4, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "constrict": {
            "name": "Constrict", 
            "color": "none", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, target_stun], 
            "desc": "ATK:{0} - Target skips their next turn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shake", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rage_fist": {
            "name": "Rage Fist", 
            "color": "none", 
            "power": 10, 
            "cost": 1, 
            "effect": [bonus_damage_user_low_hp, deal_damage, ], 
            "desc": "ATK:{0} - Deals more damage the lower HP the user is.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "karate_chop": {
            "name": "Karate Chop", 
            "color": "fighting", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rage": {
            "name": "Rage", 
            "color": "white", 
            "power": 50, 
            "cost": 1, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "brick_break": {
            "name": "Brick Break", 
            "color": "fighting", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [nullify_target_defense, deal_damage], 
            "desc": "ATK:{0} - Nullifies target's DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "final_gambit": {
            "name": "Final Gambit", 
            "color": "none", 
            "power": 300, 
            "cost": 1, 
            "effect": [deal_damage, recoil_100], 
            "desc": "ATK:{0} - User is knocked out.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bullet_punch": {
            "name": "Bullet Punch", 
            "color": "fighting", 
            "power": 40, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "metal_claw": {
            "name": "Metal Claw", 
            "color": "steel", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "iron_head": {
            "name": "Iron Head", 
            "color": "steel", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "slam": {
            "name": "Slam", 
            "color": "white", 
            "power": 70, 
            "cost": 2, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves the target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fairy_wind": {
            "name": "Fairy Wind", 
            "color": "none", 
            "power": 30, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "wish": {
            "name": "Wish", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [wish_charge], 
            "desc": "ATK:{0} - Needs to charge. Heals user by 70% MAX HP.", 

            "target": "self", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "none", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "soft-boiled": {
            "name": "Soft-Boiled", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [target_heal_40pc, ], 
            "desc": "ATK:{0} - Heal the target for 40% MAX HP.", 

            "target": "self", 
            "approach": "none", 
            "motion": "ot_skill", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "raging_bull": {
            "name": "Raging Bull", 
            "color": "white", 
            "power": base_power[2] + 15, 
            "cost": 3, 
            "effect": [nullify_target_defense, deal_damage], 
            "desc": "ATK:{0} - Nullifies target's DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "double-edge": {
            "name": "Double-Edge", 
            "color": "white", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "zap_cannon": {
            "name": "Zap Cannon", 
            "color": "yellow", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [zap_cannon_charge], 
            "desc": "ATK:{0} - Needs to charge", 

            "target": "any", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": true, 

            "hide_name": true, 
        }, 

        "zap_cannon_fire": {
            "name": "Zap Cannon", 
            "color": "yellow", 
            "power": 160, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Targets whole column.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "signal_beam": {
            "name": "Signal Beam", 
            "color": "bug", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "transform": {
            "name": "Transform", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [move_transform], 
            "desc": "ATK:{0} - User transforms into the targeted Pokémon.", 

            "target": "all", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "moonblast": {
            "name": "Moonblast", 
            "color": "white", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dazzling_gleam": {
            "name": "Dazzling Gleam", 
            "color": "fairy", 
            "power": 85, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to a row of enemies.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "meteor_mash": {
            "name": "Meteor Mash", 
            "color": "steel", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "star_mash": {
            "name": "Star Mash", 
            "color": "white", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "metronome": {
            "name": "Metronome", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [metronome], 
            "desc": "ATK:{0} - User performs a random move.", 

            "target": "self", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "thunder": {
            "name": "Thunder", 
            "color": "yellow", 
            "power": base_power[3] - 30, 
            "cost": 4, 
            "effect": [deal_damage, target_stun], 
            "desc": "ATK:{0} - Target skips their next turn.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "heavy_slam": {
            "name": "Heavy Slam", 
            "color": "none", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "protect": {
            "name": "Protect", 
            "color": "white", 
            "power": 0, 
            "cost": 2, 
            "effect": [protect], 
            "desc": "ATK:{0} - User will block the next received attack.", 

            "target": "self", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "air_slash": {
            "name": "Air Slash", 
            "color": "flying", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "twineedle": {
            "name": "Twineedle", 
            "color": "bug", 
            "power": 15, 
            "cost": 2, 
            "effect": [deal_damage, add_atk], 
            "desc": "ATK:{0} - Hits twice.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "twister": {
            "name": "Twister", 
            "color": "flying", 
            "power": 60, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dragon_tail": {
            "name": "Dragon Tail", 
            "color": "dragon", 
            "power": base_power[2] - 30, 
            "cost": 3, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves the targets into the BACK ROW.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dizzy_punch": {
            "name": "Dizzy Punch", 
            "color": "fighting", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, target_lose_1_pp], 
            "desc": "ATK:{0} - Target loses 1 PP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sucker_punch": {
            "name": "Sucker Punch", 
            "color": "black", 
            "power": 60, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "splash": {
            "name": "Splash", 
            "color": "white", 
            "power": 0, 
            "cost": 1, 
            "effect": [splash], 
            "desc": "ATK:{0} - Does nothing.", 

            "target": "self", 
            "approach": "none", 
            "motion": "ot_skill", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "cavalry": {
            "name": "", 
            "color": "none", 
            "power": 30, 
            "cost": 0, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "air_cutter": {
            "name": "Air Cutter", 
            "color": "flying", 
            "power": base_power[0] - 5, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "eruption": {
            "name": "Eruption", 
            "color": "red", 
            "power": 80, 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "meltdown": {
            "name": "Meltdown", 
            "color": "black", 
            "power": 80, 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "overheat": {
            "name": "Overheat", 
            "color": "red", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [deal_damage, user_recharge], 
            "desc": "ATK:{0} - Deals damage to a row of enemies. User must recharge.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "shadow_claw": {
            "name": "Shadow Claw", 
            "color": "black", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "toxic_thread": {
            "name": "Toxic Thread", 
            "color": "none", 
            "power": 75, 
            "cost": 3, 
            "effect": [deal_damage, lower_speed_20, add_burn_15], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 20, and deals 15% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bug_bite": {
            "name": "Bug Bite", 
            "color": "bug", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "ominous_wind": {
            "name": "Ominous Wind", 
            "color": "black", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, user_gains_attack_10], 
            "desc": "ATK:{0} - After attacking, user gains 10 ATTACK.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "charge_beam": {
            "name": "Charge Beam", 
            "color": "yellow", 
            "power": 65, 
            "cost": 2, 
            "effect": [deal_damage, user_gains_attack_10], 
            "desc": "ATK:{0} - After attacking, user gains 10 ATTACK.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "play_rough": {
            "name": "Play Rough", 
            "color": "fairy", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "wood_hammer": {
            "name": "Wood Hammer", 
            "color": "green", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rock_throw": {
            "name": "Rock Throw", 
            "color": "rock", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bullet_seed": {
            "name": "Bullet Seed", 
            "color": "green", 
            "power": 7, 
            "cost": 2, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "tail_slap": {
            "name": "Tail Slap", 
            "color": "white", 
            "power": 7, 
            "cost": 2, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "muddy_water": {
            "name": "Muddy Water", 
            "color": "blue", 
            "power": 70, 
            "cost": 3, 
            "effect": [deal_damage, lower_speed_10], 
            "desc": "ATK:{0} - Lowers the target's SPEED by 10.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "twin_beam": {
            "name": "Twin Beam", 
            "color": "black", 
            "power": 30, 
            "cost": 2, 
            "effect": [deal_damage, add_atk], 
            "desc": "ATK:{0} - Hits twice", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "stomp": {
            "name": "Stomp", 
            "color": "white", 
            "power": 85, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "gyro_ball": {
            "name": "Gyro Ball", 
            "color": "steel", 
            "power": 120, 
            "cost": 2, 
            "effect": [gyro_ball, deal_damage], 
            "desc": "ATK:{0} - Deals less damage the fastest the user is.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_stomped", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "stone_edge": {
            "name": "Stone Edge", 
            "color": "rock", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "hyper_drill": {
            "name": "Hyper Drill", 
            "color": "none", 
            "power": 80, 
            "cost": 2, 
            "effect": [nullify_protect, deal_damage, ], 
            "desc": "ATK:{0} - Nullifies the target's BLOCK.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "iron_tail": {
            "name": "Iron Tail", 
            "color": "steel", 
            "power": 80, 
            "cost": 3, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves the targets into the BACK ROW.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "dragon_breath": {
            "name": "Dragon Breath", 
            "color": "dragon", 
            "power": base_power[2] - 10, 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "burst_stream": {
            "name": "Burst Stream", 
            "color": "none", 
            "power": base_power[3] - 15, 
            "cost": 4, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to a column of enemies.", 

            "target": "column", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "megahorn": {
            "name": "Megahorn", 
            "color": "none", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "close_combat": {
            "name": "Close Combat", 
            "color": "fighting", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, user_lose_defense_20], 
            "desc": "ATK:{0} - User loses 20% DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "v-create": {
            "name": "V-create", 
            "color": "red", 
            "power": 200, 
            "cost": 4, 
            "effect": [deal_damage, user_lose_defense_20], 
            "desc": "ATK:{0} - User loses 20% DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "headlong_rush": {
            "name": "Headlong Rush", 
            "color": "red", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, user_lose_defense_20], 
            "desc": "ATK:{0} - User loses 20% DEFENSE", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "bear_hug": {
            "name": "Bear Hug", 
            "color": "none", 
            "power": 60, 
            "cost": 2, 
            "effect": [deal_damage, target_stun], 
            "desc": "ATK:{0} - Target skips their next turn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_stomp", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "crush_grip": {
            "name": "Crush Grip", 
            "color": "none", 
            "power": 40, 
            "cost": 3, 
            "effect": [deal_damage, target_stun], 
            "desc": "ATK:{0} - Target skips their next turn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "octazooka": {
            "name": "Octazooka", 
            "color": "blue", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "steel_wing": {
            "name": "Steel Wing", 
            "color": "steel", 
            "power": 75, 
            "cost": 2, 
            "effect": [deal_damage, user_gains_defense_10], 
            "desc": "ATK:{0} - User gains 10% DEFENSE.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "emerald_wing": {
            "name": "Emerald Wing", 
            "color": "bug", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, user_gains_defense_10], 
            "desc": "ATK:{0} - User gains 10% DEFENSE.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dragon_pulse": {
            "name": "Dragon Pulse", 
            "color": "dragon", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "draco_meteor": {
            "name": "Draco Meteor", 
            "color": "dragon", 
            "power": base_power[2], 
            "cost": 5, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "wave_crash": {
            "name": "Wave Crash", 
            "color": "blue", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "giga_impact": {
            "name": "Giga Impact", 
            "color": "none", 
            "power": 220, 
            "cost": 5, 
            "effect": [shove, deal_damage, user_recharge], 
            "desc": "ATK:{0} - Shoves the target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rock_wrecker": {
            "name": "Rock Wrecker", 
            "color": "rock", 
            "power": 200, 
            "cost": 4, 
            "effect": [shove, deal_damage, user_recharge], 
            "desc": "ATK:{0} - Shoves the target into the BACK ROW. User must recharge", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "psyshield_bash": {
            "name": "Psyshield Bash", 
            "color": "black", 
            "power": 80, 
            "cost": 2, 
            "effect": [deal_damage, user_gains_defense_10], 
            "desc": "ATK:{0} - User gains 10% DEFENSE.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "strength": {
            "name": "Strength", 
            "color": "none", 
            "power": 75, 
            "cost": 2, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves the target into the BACK ROW.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "sketch": {
            "name": "Sketch", 
            "color": "none", 
            "power": 0, 
            "cost": 0, 
            "effect": [sketch], 
            "desc": "ATK:{0} - This move becomes the target's last used move.", 

            "target": "all", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "whirlwind": {
            "name": "Whirlwind", 
            "color": "none", 
            "power": 50, 
            "cost": 2, 
            "effect": [shove, deal_damage], 
            "desc": "ATK:{0} - Shoves the targets into the BACK ROW.", 

            "target": "row", 
            "approach": "run_row", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "magical_leaf": {
            "name": "Magical Leaf", 
            "color": "green", 
            "power": 75, 
            "cost": 2, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "mystical_fire": {
            "name": "Mystical Fire", 
            "color": "red", 
            "power": 50, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals 15% BURN.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "mud_shot": {
            "name": "Mud Shot", 
            "color": "ground", 
            "power": 50, 
            "cost": 1, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "knock_off": {
            "name": "Knock Off", 
            "color": "black", 
            "power": 70, 
            "cost": 2, 
            "effect": [deal_damage, target_lose_1_pp], 
            "desc": "ATK:{0} - Target loses 1 PP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "brave_bird": {
            "name": "Brave Bird", 
            "color": "flying", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "draining_kiss": {
            "name": "Draining Kiss", 
            "color": "fairy", 
            "power": base_power[1] - 15, 
            "cost": 2, 
            "effect": [deal_damage, frontrow_heal_20pc], 
            "desc": "ATK:{0} - If user is in the FRONT ROW, they heal for 20% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "black_hole": {
            "name": "Black Hole", 
            "color": "black", 
            "power": base_power[1] - 15, 
            "cost": 3, 
            "effect": [pull, deal_damage, ], 
            "desc": "ATK:{0} - Pull targets to the FRONT ROW.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "sky_uppercut": {
            "name": "Sky Uppercut", 
            "color": "fighting", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "boomburst": {
            "name": "Boomburst", 
            "color": "white", 
            "power": base_power[2], 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "arm_thrust": {
            "name": "Arm Thrust", 
            "color": "fighting", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "force_palm": {
            "name": "Force Palm", 
            "color": "fighting", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "needle_arm": {
            "name": "Needle Arm", 
            "color": "bug", 
            "power": base_power[1] - 10, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% BURN.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "desert_rush": {
            "name": "Desert Arm", 
            "color": "red", 
            "power": base_power[1] - 10, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals 10% BURN.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "wild_charge": {
            "name": "Wild Charge", 
            "color": "yellow", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "heat_crash": {
            "name": "Heat Crash", 
            "color": "red", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "head_charge": {
            "name": "Head Charge", 
            "color": "white", 
            "power": base_power[2] + 35, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "icicle_crash": {
            "name": "Icicle Crash", 
            "color": "ice", 
            "power": base_power[2] + 20, 
            "cost": 3, 
            "effect": [deal_damage, recoil_25], 
            "desc": "ATK:{0} - User loses 25% MAX HP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "feint_attack": {
            "name": "Feint Attack", 
            "color": "black", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "poison_tail": {
            "name": "Poison Tail", 
            "color": "poison", 
            "power": base_power[2] - 20, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "rock_blast": {
            "name": "Rock Blast", 
            "color": "rock", 
            "power": 7, 
            "cost": 3, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "psycho_cut": {
            "name": "Psycho Cut", 
            "color": "psychic", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "freeze-dry": {
            "name": "Freeze-Dry", 
            "color": "ice", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [double_damage_to_blue, deal_damage], 
            "desc": "ATK:{0} - Deals double damage to BLUE units.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "quad_smash": {
            "name": "Quad Smash", 
            "color": "none", 
            "power": 7, 
            "cost": 4, 
            "effect": [deal_damage, add_comet_atk], 
            "desc": "ATK:{0} - Hits 4 times.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "attack_order": {
            "name": "Attack Order", 
            "color": "none", 
            "power": base_power[0] + 20, 
            "cost": 1, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fell_stinger": {
            "name": "Fell Stinger", 
            "color": "bug", 
            "power": base_power[2] + 10, 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "mud_bomb": {
            "name": "Mud Bomb", 
            "color": "ground", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "dragon_rush": {
            "name": "Dragon Rush", 
            "color": "dragon", 
            "power": base_power[1], 
            "cost": 3, 
            "effect": [deal_damage, extra_turn_on_kill], 
            "desc": "ATK:{0} - If target is knocked out, the User gains another turn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_upheave", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "vacuum_wave": {
            "name": "Vacuum Wave", 
            "color": "none", 
            "power": base_power[1] - 10, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "aura_sphere": {
            "name": "Aura Sphere", 
            "color": "fighting", 
            "power": base_power[2] - 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to any enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "flash_cannon": {
            "name": "Flash Cannon", 
            "color": "yellow", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "hex": {
            "name": "Hex", 
            "color": "black", 
            "power": 70, 
            "cost": 2, 
            "effect": [hex, deal_damage], 
            "desc": "ATK:{0} - Deals double damage if the target is burned.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "astonish": {
            "name": "Astonish", 
            "color": "black", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "night_daze": {
            "name": "Night Daze", 
            "color": "none", 
            "power": base_power[1] + 5, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "any", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ot_spooked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "avalanche": {
            "name": "Avalanche", 
            "color": "ice", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "scald": {
            "name": "Scald", 
            "color": "blue", 
            "power": base_power[2] - 30, 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals 20% burn.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "heal_pulse": {
            "name": "Heal Pulse", 
            "color": "none", 
            "power": 0, 
            "cost": 2, 
            "effect": [target_heal_40pc, ], 
            "desc": "ATK:{0} - Heal the target for 40% MAX HP.", 

            "target": "ally", 
            "approach": "none", 
            "motion": "mt_shudder", 
            "dmg_motion": "none", 
            "retreat": "none", 
            "ranged": true, 
        }, 

        "simple_beam": {
            "name": "Simple Beam", 
            "color": "none", 
            "power": base_power[1] - 20, 
            "cost": 2, 
            "effect": [deal_damage, target_lose_1_pp], 
            "desc": "ATK:{0} - The target loses 1 PP.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "rock_smash": {
            "name": "Rock Smash", 
            "color": "fighting", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_punch", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "energy_ball": {
            "name": "Energy Ball", 
            "color": "green", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, ], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "destiny_bond": {
            "name": "Destiny Bond", 
            "color": "black", 
            "power": 0, 
            "cost": 1, 
            "effect": [destiny_bond], 
            "desc": "ATK:{0} - If the user faints, their attacker faints too.", 

            "target": "self", 
            "approach": "none", 
            "motion": "none", 
            "dmg_motion": "ht_knocked", 
            "retreat": "none", 
            "ranged": true, 


        }, 

        "outrage": {
            "name": "Outrage", 
            "color": "none", 
            "power": base_power[3], 
            "cost": 4, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to 1 enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "fiery_dance": {
            "name": "Fiery Dance", 
            "color": "red", 
            "power": base_power[1] - 10, 
            "cost": 2, 
            "effect": [rollout_count, deal_damage], 
            "desc": "ATK:{0} - Gets stronger every time its used.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_slash", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "parting_shot": {
            "name": "Parting Shot", 
            "color": "black", 
            "power": base_power[1], 
            "cost": 2, 
            "effect": [deal_damage, parting_shot], 
            "desc": "ATK:{0} - User switches with the unit behind them.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_lunge", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": false, 
        }, 

        "zan": {
            "name": "Zan", 
            "color": "green", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "zanma": {
            "name": "Zanma", 
            "color": "green", 
            "power": base_power[1] + 15, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_sneeze", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "zio": {
            "name": "Zio", 
            "color": "yellow", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "megidolaon": {
            "name": "Megidolaon", 
            "color": "white", 
            "power": 1000, 
            "cost": 10, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to all enemies.", 

            "target": "team", 
            "approach": "run_team", 
            "motion": "mt_stomp", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bufu": {
            "name": "Bufu", 
            "color": "blue", 
            "power": base_power[0], 
            "cost": 1, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bufula": {
            "name": "Bufula", 
            "color": "blue", 
            "power": base_power[1] + 15, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "bufudyne": {
            "name": "Bufudyne", 
            "color": "blue", 
            "power": base_power[2] + 15, 
            "cost": 3, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "agi": {
            "name": "Agi", 
            "color": "red", 
            "power": base_power[0] - 15, 
            "cost": 1, 
            "effect": [deal_damage, add_burn_10], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_flinched", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "agilao": {
            "name": "Agilao", 
            "color": "red", 
            "power": base_power[1] - 5, 
            "cost": 2, 
            "effect": [deal_damage, add_burn_15], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "agidyne": {
            "name": "Agidyne", 
            "color": "red", 
            "power": base_power[2], 
            "cost": 3, 
            "effect": [deal_damage, add_burn_20], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_blast", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "hamaon": {
            "name": "Hamaon", 
            "color": "white", 
            "power": base_power[1] + 15, 
            "cost": 2, 
            "effect": [deal_damage], 
            "desc": "ATK:{0} - Deals damage to one enemy.", 

            "target": "single", 
            "approach": "run", 
            "motion": "mt_shudder", 
            "dmg_motion": "ht_knocked", 
            "retreat": "run", 
            "ranged": true, 
        }, 

        "mudoon": {
            "name": "Mudoon",
            "color": "black",
            "power": base_power[1] + 15,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Deals damage to one enemy.",

            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "acid": {
            "name": "Acid",
            "color": "poison",
            "power": 50,
            "cost": 1,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - May lower target's defense.",
            "target": "any",
            "approach": "run",
            "motion": "mt_sneeze",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "assurance": {
            "name": "Assurance",
            "color": "black",
            "power": 85,
            "cost": 2,
            "effect": [double_dmg_less_50pc_hp, deal_damage],
            "desc": "ATK:{0} - Deals double damage to low HP targets.",
            "target": "single",
            "approach": "run",
            "motion": "mt_slash",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "barrage": {
            "name": "Barrage",
            "color": "none",
            "power": 35,
            "cost": 1,
            "effect": [second_hit, deal_damage],
            "desc": "ATK:{0} - Hits twice.",
            "target": "any",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "bind": {
            "name": "Bind",
            "color": "none",
            "power": 35,
            "cost": 1,
            "effect": [deal_damage, lower_speed_10],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "bone_club": {
            "name": "Bone Club",
            "color": "ground",
            "power": 65,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Deals damage to 1 enemy.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "bubble": {
            "name": "Bubble",
            "color": "blue",
            "power": 50,
            "cost": 1,
            "effect": [deal_damage, lower_speed_10],
            "desc": "ATK:{0} - May lower target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "clamp": {
            "name": "Clamp",
            "color": "blue",
            "power": 35,
            "cost": 1,
            "effect": [deal_damage, lower_speed_10],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "confuse_ray": {
            "name": "Confuse Ray",
            "color": "black",
            "power": 25,
            "cost": 1,
            "effect": [target_stun],
            "desc": "ATK:{0} - Stuns the target.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "conversion": {
            "name": "Conversion",
            "color": "none",
            "power": 60,
            "cost": 1,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Deals damage to 1 enemy.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "covet": {
            "name": "Covet",
            "color": "none",
            "power": 60,
            "cost": 2,
            "effect": [deal_damage, target_lose_1_ap],
            "desc": "ATK:{0} - Removes 1 AP from target.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "curse": {
            "name": "Curse",
            "color": "black",
            "power": 50,
            "cost": 2,
            "effect": [deal_damage, lower_speed_20, user_gains_attack_10],
            "desc": "ATK:{0} - Lowers target SPEED. User gains POWER.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "defense_curl": {
            "name": "Defense Curl",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [harden, deal_damage],
            "desc": "ATK:{0} - User raises its defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "disarming_voice": {
            "name": "Disarming Voice",
            "color": "white",
            "power": 65,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Fairy attack. Never misses.",
            "target": "any",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "double_hit": {
            "name": "Double Hit",
            "color": "none",
            "power": 50,
            "cost": 1,
            "effect": [second_hit, deal_damage],
            "desc": "ATK:{0} - Hits twice.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "double_slap": {
            "name": "Double Slap",
            "color": "none",
            "power": 35,
            "cost": 1,
            "effect": [second_hit, deal_damage],
            "desc": "ATK:{0} - Hits twice.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "dream_eater": {
            "name": "Dream Eater",
            "color": "psychic",
            "power": 85,
            "cost": 2,
            "effect": [heal_20pc, deal_damage],
            "desc": "ATK:{0} - User heals 20% MAX HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "dynamicpunch": {
            "name": "DynamicPunch",
            "color": "fighting",
            "power": 130,
            "cost": 3,
            "effect": [deal_damage, lower_speed_40],
            "desc": "ATK:{0} - Severely lowers target's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "flail": {
            "name": "Flail",
            "color": "none",
            "power": 85,
            "cost": 2,
            "effect": [bonus_damage_user_low_hp, deal_damage],
            "desc": "ATK:{0} - More power when user has low HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "focus_blast": {
            "name": "Focus Blast",
            "color": "fighting",
            "power": 130,
            "cost": 4,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - May lower target's defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "freeze_dry": {
            "name": "Freeze-Dry",
            "color": "ice",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Ice attack. Super effective on water.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "fury_attack": {
            "name": "Fury Attack",
            "color": "none",
            "power": 35,
            "cost": 1,
            "effect": [second_hit, deal_damage],
            "desc": "ATK:{0} - Hits twice.",
            "target": "single",
            "approach": "run",
            "motion": "mt_slash",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "grass_knot": {
            "name": "Grass Knot",
            "color": "green",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - More power vs heavier targets.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "growl": {
            "name": "Growl",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - Lowers all targets' POWER.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "gunk_shot": {
            "name": "Gunk Shot",
            "color": "poison",
            "power": 130,
            "cost": 3,
            "effect": [deal_damage, add_burn_20],
            "desc": "ATK:{0} - Deals 20% burn.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "heal_bell": {
            "name": "Heal Bell",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [heal_burn, deal_damage],
            "desc": "ATK:{0} - Removes user's burn.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "healing_wish": {
            "name": "Healing Wish",
            "color": "psychic",
            "power": 20,
            "cost": 2,
            "effect": [heal_50pc, deal_damage],
            "desc": "ATK:{0} - User heals 50% MAX HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "high_horsepower": {
            "name": "High Horsepower",
            "color": "ground",
            "power": 110,
            "cost": 3,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Powerful Ground attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "inferno": {
            "name": "Inferno",
            "color": "red",
            "power": 110,
            "cost": 3,
            "effect": [deal_damage, add_burn_40],
            "desc": "ATK:{0} - Always inflicts 40% burn.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "last_resort": {
            "name": "Last Resort",
            "color": "none",
            "power": 130,
            "cost": 3,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Powerful last-ditch attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "leer": {
            "name": "Leer",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - Lowers targets' defense.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "light_screen": {
            "name": "Light Screen",
            "color": "psychic",
            "power": 20,
            "cost": 2,
            "effect": [deal_damage, user_gains_defense_10],
            "desc": "ATK:{0} - User gains defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "liquidation": {
            "name": "Liquidation",
            "color": "blue",
            "power": 110,
            "cost": 3,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - May lower target's defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "lock_on": {
            "name": "Lock-On",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, focus_energy],
            "desc": "ATK:{0} - User's next move is certain to hit.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "low_kick": {
            "name": "Low Kick",
            "color": "fighting",
            "power": 60,
            "cost": 1,
            "effect": [deal_damage],
            "desc": "ATK:{0} - More power vs heavier targets.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "low_sweep": {
            "name": "Low Sweep",
            "color": "fighting",
            "power": 65,
            "cost": 2,
            "effect": [deal_damage, lower_speed_20],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "magnet_rise": {
            "name": "Magnet Rise",
            "color": "yellow",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, user_gains_defense_10],
            "desc": "ATK:{0} - User levitates, gaining defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "mean_look": {
            "name": "Mean Look",
            "color": "black",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_speed_10],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "meditate": {
            "name": "Meditate",
            "color": "psychic",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, user_gains_attack_10],
            "desc": "ATK:{0} - User raises its POWER.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "mirror_move": {
            "name": "Mirror Move",
            "color": "white",
            "power": 65,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Copies the last move used.",
            "target": "any",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "mud_slap": {
            "name": "Mud-Slap",
            "color": "ground",
            "power": 35,
            "cost": 1,
            "effect": [deal_damage, lower_speed_20],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "perish_song": {
            "name": "Perish Song",
            "color": "none",
            "power": 20,
            "cost": 3,
            "effect": [lower_speed_100, deal_damage],
            "desc": "ATK:{0} - Zeroes target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "psych_up": {
            "name": "Psych Up",
            "color": "psychic",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, user_gains_attack_10],
            "desc": "ATK:{0} - User raises its POWER.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "psyshock": {
            "name": "Psyshock",
            "color": "psychic",
            "power": 110,
            "cost": 3,
            "effect": [nullify_target_defense, deal_damage],
            "desc": "ATK:{0} - Ignores target's defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "psywave": {
            "name": "Psywave",
            "color": "psychic",
            "power": 50,
            "cost": 1,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Psychic wave attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "recycle": {
            "name": "Recycle",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, heal_10pc],
            "desc": "ATK:{0} - User restores 10% HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "reflect": {
            "name": "Reflect",
            "color": "psychic",
            "power": 20,
            "cost": 2,
            "effect": [deal_damage, user_gains_defense_20],
            "desc": "ATK:{0} - User greatly raises its defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "reversal": {
            "name": "Reversal",
            "color": "fighting",
            "power": 85,
            "cost": 2,
            "effect": [bonus_damage_user_low_hp, deal_damage],
            "desc": "ATK:{0} - More power when user has low HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "rock_polish": {
            "name": "Rock Polish",
            "color": "rock",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, gain_speed_10],
            "desc": "ATK:{0} - User raises its SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "safeguard": {
            "name": "Safeguard",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, user_gains_defense_10],
            "desc": "ATK:{0} - User gains defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "scary_face": {
            "name": "Scary Face",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_speed_40],
            "desc": "ATK:{0} - Greatly lowers target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "self_destruct": {
            "name": "Self-Destruct",
            "color": "none",
            "power": 200,
            "cost": 3,
            "effect": [deal_damage, recoil_100],
            "desc": "ATK:{0} - Massive damage. User faints.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "silver_wind": {
            "name": "Silver Wind",
            "color": "bug",
            "power": 65,
            "cost": 2,
            "effect": [deal_damage, gain_speed_10],
            "desc": "ATK:{0} - May raise user's SPEED.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "soft_boiled": {
            "name": "Soft-Boiled",
            "color": "none",
            "power": 20,
            "cost": 2,
            "effect": [heal_50pc, deal_damage],
            "desc": "ATK:{0} - User heals 50% MAX HP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "spike_cannon": {
            "name": "Spike Cannon",
            "color": "none",
            "power": 35,
            "cost": 1,
            "effect": [second_hit, deal_damage],
            "desc": "ATK:{0} - Hits twice.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "spite": {
            "name": "Spite",
            "color": "black",
            "power": 25,
            "cost": 1,
            "effect": [deal_damage, target_lose_1_pp],
            "desc": "ATK:{0} - Removes 1 PP from target.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "string_shot": {
            "name": "String Shot",
            "color": "bug",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_speed_40],
            "desc": "ATK:{0} - Greatly lowers target's SPEED.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "stun_spore": {
            "name": "Stun Spore",
            "color": "green",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_speed_40],
            "desc": "ATK:{0} - Greatly lowers target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_sneeze",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "supersonic": {
            "name": "Supersonic",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_speed_20],
            "desc": "ATK:{0} - Lowers target's SPEED.",
            "target": "any",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "sweet_scent": {
            "name": "Sweet Scent",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - Lowers targets' defense.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_sneeze",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "tail_whip": {
            "name": "Tail Whip",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, lower_def_20],
            "desc": "ATK:{0} - Lowers targets' defense.",
            "target": "row",
            "approach": "run_row",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "thrash": {
            "name": "Thrash",
            "color": "none",
            "power": 130,
            "cost": 3,
            "effect": [deal_damage, user_lose_speed_10],
            "desc": "ATK:{0} - Powerful. Lowers user's SPEED after use.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "trump_card": {
            "name": "Trump Card",
            "color": "none",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Stronger at low PP.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "twin_needle": {
            "name": "Twineedle",
            "color": "bug",
            "power": 35,
            "cost": 1,
            "effect": [second_hit, deal_damage, add_burn_10],
            "desc": "ATK:{0} - Hits twice. May inflict 10% burn.",
            "target": "single",
            "approach": "run",
            "motion": "mt_slash",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "u_turn": {
            "name": "U-turn",
            "color": "bug",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Bug attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_slash",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "venoshock": {
            "name": "Venoshock",
            "color": "poison",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage, add_burn_15],
            "desc": "ATK:{0} - May inflict 15% burn.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "vicegrip": {
            "name": "Vise Grip",
            "color": "none",
            "power": 60,
            "cost": 1,
            "effect": [vice_grip, deal_damage],
            "desc": "ATK:{0} - Grips the target.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "wake_up_slap": {
            "name": "Wake-Up Slap",
            "color": "fighting",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage, heal_burn],
            "desc": "ATK:{0} - Removes burn. Fighting attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "weather_ball": {
            "name": "Weather Ball",
            "color": "none",
            "power": 85,
            "cost": 2,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Power varies by weather.",
            "target": "single",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": true,
        },
        "will_o_wisp": {
            "name": "Will-O-Wisp",
            "color": "red",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, add_burn_40],
            "desc": "ATK:{0} - Inflicts 40% burn.",
            "target": "any",
            "approach": "run",
            "motion": "mt_blast",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": true,
        },
        "withdraw": {
            "name": "Withdraw",
            "color": "blue",
            "power": 20,
            "cost": 1,
            "effect": [deal_damage, user_gains_defense_10],
            "desc": "ATK:{0} - User raises its defense.",
            "target": "single",
            "approach": "run",
            "motion": "mt_punch",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
        "x_scissor": {
            "name": "X-Scissor",
            "color": "bug",
            "power": 110,
            "cost": 3,
            "effect": [deal_damage],
            "desc": "ATK:{0} - Powerful Bug attack.",
            "target": "single",
            "approach": "run",
            "motion": "mt_slash",
            "dmg_motion": "ht_knocked",
            "retreat": "run",
            "ranged": false,
        },
        "yawn": {
            "name": "Yawn",
            "color": "none",
            "power": 20,
            "cost": 1,
            "effect": [hypnosis, deal_damage],
            "desc": "ATK:{0} - Puts target to sleep.",
            "target": "single",
            "approach": "run",
            "motion": "mt_shudder",
            "dmg_motion": "ht_flinched",
            "retreat": "run",
            "ranged": false,
        },
    }







    passive = {
        "none": {
            "name": "None", 
            "effect": none, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "", 
        }, 

        "heal_test": {
            "name": "None", 
            "effect": heal_test, 
            "cost": 1, 
            "trigger": "on_battle_end", 
            "desc": "", 
        }, 

        "lower_speed_10": {
            "name": "None", 
            "effect": lower_speed_10, 
            "cost": 1, 
            "trigger": "after_attacking", 
            "desc": "", 
        }, 

        "smokescreen": {
            "name": "Smokescreen", 
            "effect": smokescreen, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All enemies lose 10 SPEED.", 
        }, 

        "focus_energy": {
            "name": "Focus Energy", 
            "effect": focus_energy, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK.", 
        }, 

        "hypnosis": {
            "name": "Hypnosis", 
            "effect": hypnosis, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 AP.", 
        }, 

        "sing": {
            "name": "Sing", 
            "effect": sing, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 AP.", 
        }, 

        "sleep_powder": {
            "name": "Sleep Powder", 
            "effect": sleep_powder, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 AP.", 
        }, 

        "nasty_plot": {
            "name": "Nasty Plot", 
            "effect": nasty_plot, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: Gains 25 ATTACK.", 
        }, 

        "swords_dance": {
            "name": "Swords Dance", 
            "effect": swords_dance, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: Gains 25 ATTACK.", 
        }, 

        "disable": {
            "name": "Disable", 
            "effect": disable, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 PP.", 
        }, 

        "core_enforcer": {
            "name": "Core Enforcer", 
            "effect": core_enforcer, 
            "cost": 5, 
            "trigger": "after_attacking", 
            "desc": "Before attacking: Target loses all PP.", 
        }, 

        "soak": {
            "name": "Soak", 
            "effect": soak, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 20 SPEED.", 
        }, 

        "poison_powder": {
            "name": "Poison Powder", 
            "effect": poison_powder, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Deal 10% burn to enemy row.", 
        }, 

        "triumph": {
            "name": "Triumph", 
            "effect": triumph, 
            "cost": 1, 
            "trigger": "on_enemy_death", 
            "desc": "On RARITY 3 or higher enemy defeated: Heal 30% MAX HP.", 
        }, 

        "pride": {
            "name": "Pride", 
            "effect": pride, 
            "cost": 1, 
            "trigger": "before_attacking", 
            "desc": "When attacking RARITY 3 or higher enemy: Gain 20 ATTACK.", 
        }, 

        "cover": {
            "name": "Cover", 
            "effect": cover, 
            "cost": 1, 
            "trigger": "before_ally_attacked", 
            "desc": "If user is not targeted, defend adjacent ally from an attack.", 
        }, 

        "wall": {
            "name": "Wall", 
            "effect": wall, 
            "cost": 2, 
            "trigger": "before_ally_attacked", 
            "desc": "If user is not targeted, gain 20% DEFENSE and defend adjacent ally from an attack.", 
        }, 

        "guardian": {
            "name": "Guardian", 
            "effect": guardian, 
            "cost": 3, 
            "trigger": "before_ally_attacked", 
            "desc": "If user is not targeted, gain 20 DEFENSE and defend any ally from an attack.", 
        }, 

        "leech_seed": {
            "name": "Leech Seed", 
            "effect": leech_seed, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Deal 5 dmg to all enemies, user heals 5 HP per enemy.", 
        }, 

        "double_team": {
            "name": "Double Team", 
            "effect": double_team, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 1 DODGE.", 
        }, 

        "triple_team": {
            "name": "Triple Team", 
            "effect": triple_team, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 3 DODGE.", 
        }, 

        "detect": {
            "name": "Detect", 
            "effect": detect, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 1 BLOCK.", 
        }, 

        "barrier": {
            "name": "Barrier", 
            "effect": barrier, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 1 BLOCK.", 
        }, 

        "minimize": {
            "name": "Minimize", 
            "effect": minimize, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 1 DODGE.", 
        }, 

        "mind_reader": {
            "name": "Mind Reader", 
            "effect": mind_reader, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked, gain 1 DODGE.", 
        }, 

        "light_ball": {
            "name": "Light Ball", 
            "effect": light_ball, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Double unit's ATTACK.", 
        }, 

        "rock_head": {
            "name": "Rock Head", 
            "effect": rock_head, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 15% DEFENSE.", 
        }, 

        "shell_armor": {
            "name": "Shell Armor", 
            "effect": shell_armor, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 15% DEFENSE.", 
        }, 

        "iron_defense": {
            "name": "Iron Defense", 
            "effect": iron_defense, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 20% DEFENSE.", 
        }, 

        "will-o-wisp": {
            "name": "Will-o-Wisp", 
            "effect": will_o_wisp, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: deal 15% burn.", 
        }, 

        "recover": {
            "name": "Recover", 
            "effect": recover, 
            "cost": 3, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: if less than half HP, recover 50% MAX HP.", 
        }, 

        "regenerator": {
            "name": "Regenerator", 
            "effect": regenerator, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User heals for 10% MAX HP.", 
        }, 

        "swift_swim": {
            "name": "Swift Swim", 
            "effect": swift_swim, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 15 SPEED per BLUE adjacent ally.", 
        }, 

        "water_veil": {
            "name": "Water Veil", 
            "effect": water_veil, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "User is immune to BURN.", 
        }, 

        "agility": {
            "name": "Agility", 
            "effect": agility, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 30 SPEED.", 
        }, 

        "mischief": {
            "name": "Mischief", 
            "effect": mischief, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summon an identical unit.", 
        }, 

        "sand_attack": {
            "name": "Sand Attack", 
            "effect": sand_attack, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Lower targets attack by 10.", 
        }, 

        "poison_point": {
            "name": "Poison Point", 
            "effect": poison_point, 
            "cost": 2, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: deal 15% burn.", 
        }, 

        "feather_dance": {
            "name": "Feather Dance", 
            "effect": feather_dance, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All enemies lose 10 ATTACK.", 
        }, 

        "tailwind": {
            "name": "Tailwind", 
            "effect": tailwind, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All allies gain 10 SPEED.", 
        }, 

        "magnet_pull": {
            "name": "Magnet Pull", 
            "effect": magnet_pull, 
            "cost": 3, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: Pull all enemies to FRONT ROW.", 
        }, 

        "bark": {
            "name": "Bark", 
            "effect": bark, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: targets lose 10 ATTACK.", 
        }, 

        "pay_day": {
            "name": "Pay Day", 
            "effect": pay_day, 
            "cost": 3, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Rarest adjacent ally gains 1 AP.", 
        }, 

        "energy_gift": {
            "name": "Energy Gift", 
            "effect": energy_gift, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Rarest adjacent ally gains 1 AP.", 
        }, 

        "reckless": {
            "name": "Reckless", 
            "effect": reckless, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On bsttle start: User gains 20 ATTACK, but loses 15% MAX HP after attacking", 
        }, 

        "mach_punch": {
            "name": "Mach Punch", 
            "effect": mach_punch, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 40 POWER", 
        }, 

        "iron_fist": {
            "name": "Iron Fist", 
            "effect": iron_fist, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: Unit gains 15 ATTACK.", 
        }, 

        "counter": {
            "name": "Counter", 
            "effect": counter, 
            "cost": 3, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: Attack the target with the POWER of the suffered move.", 
        }, 

        "mirror_coat": {
            "name": "Mirror Coat", 
            "effect": mirror_coat, 
            "cost": 3, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: Attack the target with the POWER of the suffered move.", 
        }, 

        "dragon_dance": {
            "name": "Dragon Dance", 
            "effect": dragon_dance, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK and 10 SPEED.", 
        }, 

        "ancient_power": {
            "name": "Ancient Power", 
            "effect": ancient_power, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK and 10% DEFENSE.", 
        }, 

        "cosmic_power": {
            "name": "Cosmic Power", 
            "effect": cosmic_power, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK and 10% DEFENSE.", 
        }, 

        "tickle": {
            "name": "Tickle", 
            "effect": tickle, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking, lower enemy DEFENSE by 15%.", 
        }, 

        "petal_dance": {
            "name": "Petal Dance", 
            "effect": petal_dance, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: Attacks a random enemy with 30 POWER.", 
        }, 

        "aromatherapy": {
            "name": "Aromatherapy", 
            "effect": aromatherapy, 
            "cost": 2, 
            "trigger": "after_ally_attacked", 
            "desc": "After ally is attacked: Heals BURN from all allies.", 
        }, 

        "lunar_blessing": {
            "name": "Lunar Blessing", 
            "effect": lunar_blessing, 
            "cost": 3, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heals BURN and 15% MAX HP from all allies.", 
        }, 

        "acid_armor": {
            "name": "Acid Armor", 
            "effect": acid_armor, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User gains 20% DEFENSE.", 
        }, 

        "teleport": {
            "name": "Teleport", 
            "effect": teleport, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: User moves to the BACK ROW.", 
        }, 

        "psychic_guard": {
            "name": "Psychic Guard", 
            "effect": psychic_guard, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked by RARITY 3 or more enemy: User gains 50% defense.", 
        }, 

        "amnesia": {
            "name": "Amnesia", 
            "effect": amnesia, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User gains 15% DEFENSE.", 
        }, 

        "morning_sun": {
            "name": "Morning Sun", 
            "effect": morning_sun, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal lowest HP ally by 30% MAX HP.", 
        }, 

        "moonlight": {
            "name": "Moonlight", 
            "effect": moonlight, 
            "cost": 4, 
            "trigger": "on_turn_end", 
            "desc": "On turn end If User has less than 50% HP, they heal by 50% MAX HP.", 
        }, 

        "future_sight": {
            "name": "Future Sight", 
            "effect": future_sight, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Target lowest HP enemy. On their next turn, they will be attacked with 40 POWER.", 
        }, 

        "doom_desire": {
            "name": "Doom Desire", 
            "effect": doom_desire, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Target lowest HP enemy. On their next turn, they will be attacked with 60 POWER.", 
        }, 

        "extreme_speed": {
            "name": "Extreme Speed", 
            "effect": extreme_speed, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 60 POWER", 
        }, 

        "quick_attack": {
            "name": "Quick Attack", 
            "effect": quick_attack, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 30 POWER", 
        }, 

        "water_shuriken": {
            "name": "Water Shuriken", 
            "effect": water_shuriken, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 40 POWER", 
        }, 

        "baton_pass": {
            "name": "Baton Pass", 
            "effect": baton_pass, 
            "cost": 3, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Ally in same column acts immediately after.", 
        }, 

        "god_slayer": {
            "name": "God Slayer", 
            "effect": god_slayer, 
            "cost": 1, 
            "trigger": "before_attacking", 
            "desc": "Before attacking RARITY 4 or higher enemy: User gains 200 ATTACK.", 
        }, 

        "multiscale": {
            "name": "Multiscale", 
            "effect": multiscale, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before attacked with FULL HP: User gains 50% DEFENSE.", 
        }, 

        "eternal_punishment": {
            "name": "Eternal Punishment", 
            "effect": eternal_punishment, 
            "cost": 4, 
            "trigger": "after_attacking", 
            "desc": "After attacking: The target's burns never heal.", 
        }, 

        "payback": {
            "name": "Payback", 
            "effect": payback, 
            "cost": 2, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: User attacks the target with 40 POWER.", 
        }, 

        "beat_up": {
            "name": "Beat Up", 
            "effect": beat_up, 
            "cost": 2, 
            "trigger": "after_ally_attacking", 
            "desc": "After an ally attacks: User attacks the target with 40 POWER.", 
        }, 

        "no_guard": {
            "name": "No Guard", 
            "effect": no_guard, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: Nullify target's DODGE.", 
        }, 

        "bulk_up": {
            "name": "Bulk Up", 
            "effect": bulk_up, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User gains and 20% DEFENSE.", 
        }, 

        "flame_body": {
            "name": "Flame Body", 
            "effect": flame_body, 
            "cost": 0, 
            "trigger": "on_battle_start", 
            "desc": "User is healed by burn damage.", 
        }, 

        "step_up": {
            "name": "Step Up", 
            "effect": step_up, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: User moves to the FRONT ROW.", 
        }, 

        "life_dew": {
            "name": "Life Dew", 
            "effect": life_dew, 
            "cost": 3, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal adjacent allies by 20 HP.", 
        }, 

        "aqua_ring": {
            "name": "Aqua Ring", 
            "effect": aqua_ring, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal adjacent BLUE or WHITE allies by 20% HP.", 
        }, 

        "warmth": {
            "name": "Warmth", 
            "effect": warmth, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal adjacent RED or GREEN allies by 20% HP.", 
        }, 

        "synthesis": {
            "name": "Synthesis", 
            "effect": synthesis, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal adjacent GREEN or WHITE allies by 20% HP.", 
        }, 

        "lovely_kiss": {
            "name": "Lovely Kiss", 
            "effect": lovely_kiss, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 AP.", 
        }, 

        "colony": {
            "name": "Colony", 
            "effect": colony, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summons 2 Zubat.", 
        }, 

        "glare": {
            "name": "Glare", 
            "effect": glare, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 PP.", 
        }, 

        "coil": {
            "name": "Coil", 
            "effect": coil, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK and 10% DEFENSE.", 
        }, 

        "spook": {
            "name": "Spook", 
            "effect": spook, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target switches column position.", 
        }, 

        "spiky_shield": {
            "name": "Spiky Shield", 
            "effect": spiky_shield, 
            "cost": 2, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: The enemy loses 15% MAX HP.", 
        }, 

        "hyper_cutter": {
            "name": "Hyper Cutter", 
            "effect": hyper_cutter, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Restores ATTACK if user is debuffed.", 
        }, 

        "shell_smash": {
            "name": "Shell Smash", 
            "effect": shell_smash, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User loses 30 MAX HP and gains 30 ATTACK.", 
        }, 

        "volt_switch": {
            "name": "Volt Switch", 
            "effect": volt_switch, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: User switches ROW positions.", 
        }, 

        "u-turn": {
            "name": "U-turn", 
            "effect": u_turn, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: User switches ROW positions.", 
        }, 

        "thunder_wave": {
            "name": "Thunder Wave", 
            "effect": thunder_wave, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 30 SPEED."
        }, 

        "toxic_spikes": {
            "name": "Toxic Spikes", 
            "effect": toxic_spikes, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 10% burn to all enemies."
        }, 

        "anger_point": {
            "name": "Anger Point", 
            "effect": anger_point, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user has less than 30% HP, they gain 40 ATTACK."
        }, 

        "bullet_punch": {
            "name": "Bullet Punch", 
            "effect": bullet_punch, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 40 POWER.", 
        }, 

        "belly_drum": {
            "name": "Belly Drum", 
            "effect": belly_drum, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User loses 50% HP, and doubles their ATTACK.", 
        }, 

        "leftovers": {
            "name": "Leftovers", 
            "effect": leftovers, 
            "cost": 1, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: User heals by 10 HP.", 
        }, 

        "ice_body": {
            "name": "Ice Body", 
            "effect": leftovers, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: User heals by 10% MAX HP.", 
        }, 

        "healing_touch": {
            "name": "Healing Touch", 
            "effect": healing_touch, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heals adjacent ally with lowest HP for 25 HP.", 
        }, 

        "helping_hand": {
            "name": "Helping Hand", 
            "effect": helping_hand, 
            "cost": 2, 
            "trigger": "before_ally_attacking", 
            "desc": "Before ally attacks: Increase the attack damage by 30%.", 
        }, 

        "dark_sutra": {
            "name": "Dark Sutra", 
            "effect": dark_sutra, 
            "cost": 3, 
            "trigger": "before_ally_attacking", 
            "desc": "Before BLACK ally attacks: Increase the attack damage by 50%.", 
        }, 

        "download": {
            "name": "Download", 
            "effect": download, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: Increase the attack damage by 50%.", 
        }, 

        "overclock": {
            "name": "Overclock", 
            "effect": overclock, 
            "cost": 3, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: Increase the attack damage by 100%. User loses 40% MAX HP.", 
        }, 

        "magic_guard": {
            "name": "Magic Guard", 
            "effect": magic_guard, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "User is immune to BURN.", 
        }, 

        "leaf_guard": {
            "name": "Leaf Guard", 
            "effect": leaf_guard, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "User is immune to BURN.", 
        }, 

        "rest": {
            "name": "Rest", 
            "effect": rest, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user has 50% of less HP, they fully heal, but skip their turn.", 
        }, 

        "quiver_dance": {
            "name": "Quiver Dance", 
            "effect": quiver_dance, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "Turn start: User gains 10 ATTACK and 10 SPEED.", 
        }, 

        "swarm": {
            "name": "Swarm", 
            "effect": swarm, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summons 2 Beedrill.", 
        }, 

        "marvel_scale": {
            "name": "Marvel Scale", 
            "effect": water_veil, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "User is immune to BURN.", 
        }, 

        "parental_bond": {
            "name": "Parental Bond", 
            "effect": parental_bond, 
            "cost": 3, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: The attack does 50% more damage.", 
        }, 

        "sucker_punch": {
            "name": "Sucker Punch", 
            "effect": sucker_punch, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 40 POWER", 
        }, 

        "cavalry": {
            "name": "Cavalry", 
            "effect": cavalry, 
            "cost": 2, 
            "trigger": "after_ally_attacking", 
            "desc": "After an ally attacks: User attacks the target with 40 POWER.", 
        }, 

        "conversion2": {
            "name": "Conversion 2", 
            "effect": conversion2, 
            "cost": 1, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User changes to a resistant COLOR.", 
        }, 

        "color_change": {
            "name": "Color Change", 
            "effect": color_change, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User changes to a resistant COLOR.", 
        }, 

        "forest_curse": {
            "name": "Forest Curse", 
            "effect": forest_curse, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target's color becomes GREEN.", 
        }, 

        "electromagnetism": {
            "name": "Electromagnetism", 
            "effect": electromagnetism, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summons Minum to FRONT ROW.", 
        }, 

        "overgrowth": {
            "name": "Overgrowth", 
            "effect": overgrowth, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user has less than 30% HP, they gain 30 ATTACK."
        }, 

        "blaze": {
            "name": "Blaze", 
            "effect": blaze, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user has less than 30% HP, they gain 30 ATTACK."
        }, 

        "torrent": {
            "name": "Torrent", 
            "effect": torrent, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user has less than 30% HP, they gain 30 ATTACK."
        }, 

        "spider_web": {
            "name": "Spider Web", 
            "effect": spider_web, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All enemies lose 15 SPEED.", 
        }, 

        "illuminate": {
            "name": "Illuminate", 
            "effect": illuminate, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All allies gain 10 SPEED.", 
        }, 

        "premonition": {
            "name": "Premonition", 
            "effect": premonition, 
            "cost": 4, 
            "trigger": "before_ally_attacked", 
            "desc": "Before ally is attacked: Attacked ally gains 1 DODGE.", 
        }, 

        "cotton_spore": {
            "name": "Cotton Spore", 
            "effect": cotton_spore, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 40 SPEED."
        }, 

        "huge_power": {
            "name": "Huge Power", 
            "effect": huge_power, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Doubles users ATTACK.", 
        }, 

        "drizzle": {
            "name": "Drizzle", 
            "effect": drizzle, 
            "cost": 4, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All BLUE allies gain 15 ATTACK.", 
        }, 

        "drought": {
            "name": "Drought", 
            "effect": drought, 
            "cost": 4, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: All RED allies gain 15 ATTACK.", 
        }, 

        "run_away": {
            "name": "Run Away", 
            "effect": run_away, 
            "cost": 2, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: User moves to the BACK ROW.", 
        }, 

        "sunny_day": {
            "name": "Sunny Day", 
            "effect": sunny_day, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Adjacent RED or GREEN allies gain 10 ATTACK.", 
        }, 

        "rain_dance": {
            "name": "Rain Dance", 
            "effect": rain_dance, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Adjacent BLUE or YELLOW allies gain 10 ATTACK.", 
        }, 

        "charge": {
            "name": "Charge", 
            "effect": charge, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User gains 15 ATTACK per adjacent YELLOW ally.", 
        }, 

        "torment": {
            "name": "Torment", 
            "effect": torment, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 PP.", 
        }, 

        "mind_games": {
            "name": "Mind Games", 
            "effect": mind_games, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: User switches ROW positions.", 
        }, 

        "trick_room": {
            "name": "Trick Room", 
            "effect": trick_room, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: For the rest of the battle, slower Pokémon act first.", 
        }, 

        "spikes": {
            "name": "Spikes", 
            "effect": spikes, 
            "cost": 2, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 7 damage to all enemies."
        }, 

        "self-destruct": {
            "name": "Self-Destruct", 
            "effect": self_destruct, 
            "cost": 3, 
            "trigger": "after_attacked", 
            "desc": "After being attacked and if user has 20% HP or less: User attacks with 150 POWER. User is knocked out.", 
        }, 

        "stealth_rock": {
            "name": "Stealth Rock", 
            "effect": stealth_rock, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User deals 15 damage to the enemy."
        }, 

        "iron_barbs": {
            "name": "Iron Barbs", 
            "effect": iron_barbs, 
            "cost": 1, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User deals 8 damage to the enemy."
        }, 

        "power_trick": {
            "name": "Power Trick", 
            "effect": power_trick, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "Battle start: User's HEALTH becomes very low, but their ATTACK becomes extremelly high.", 
        }, 

        "present": {
            "name": "Present", 
            "effect": present, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Rarest adjacent ally gains 1 AP.", 
        }, 

        "milk_drink": {
            "name": "Milk Drink", 
            "effect": milk_drink, 
            "cost": 3, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal lowest HP adjacent ally by 30% MAX HP.", 
        }, 

        "sand_stream": {
            "name": "Sand Stream", 
            "effect": sand_stream, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 15 RED damage to all enemies."
        }, 

        "sandstorm": {
            "name": "Sandstorm", 
            "effect": sandstorm, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 10 RED damage to all enemies."
        }, 

        "hail": {
            "name": "Hail", 
            "effect": hail, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 10 BLUE damage to all enemies."
        }, 

        "whirlpool": {
            "name": "Whirlpool", 
            "effect": whirlpool, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 5 damage to all enemies and displaces them."
        }, 

        "makiu_mist": {
            "name": "Makiu Mist", 
            "effect": makiu_mist, 
            "cost": 1, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 7 YELLOW damage to all enemies."
        }, 

        "conqueror": {
            "name": "Conqueror", 
            "effect": conqueror, 
            "cost": 2, 
            "trigger": "on_enemy_death", 
            "desc": "On enemy defeated: User gains 20 ATTACK.", 
        }, 

        "solid_rock": {
            "name": "Solid Rock", 
            "effect": solid_rock, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked by SUPER EFFECTIVE move: User gains 25% DEFENSE.", 
        }, 

        "canvas": {
            "name": "Canvas", 
            "effect": canvas, 
            "cost": 0, 
            "trigger": "on_turn_end", 
            "desc": "After using Sketch, the user will copy the target's passive ability.", 
        }, 

        "roost": {
            "name": "Roost", 
            "effect": roost, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: if less than half HP, recover 40% MAX HP.", 
        }, 

        "nightmare": {
            "name": "Nightmare", 
            "effect": nightmare, 
            "cost": 3, 
            "trigger": "on_round_end", 
            "desc": "On round end: User deals 15 damage to all enemies."
        }, 

        "trick": {
            "name": "Trick", 
            "effect": trick, 
            "cost": 4, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User switches the enemy FRONT ROW with their BACK ROW."
        }, 

        "endure": {
            "name": "Endure", 
            "effect": endure, 
            "cost": 3, 
            "trigger": "on_death", 
            "desc": "On unit death: User survives with 1 HP."
        }, 

        "chlorophyll": {
            "name": "Chlorophyll", 
            "effect": chlorophyll, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Gain 15 SPEED per GREEN or RED adjacent ally.", 
        }, 

        "solar_power": {
            "name": "Solar Power", 
            "effect": solar_power, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: Gain 10 ATTACK per GREEN or RED adjacent ally.", 
        }, 

        "speed_boost": {
            "name": "Speed Boost", 
            "effect": speed_boost, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User gains 15 SPEED.", 
        }, 

        "howl": {
            "name": "Howl", 
            "effect": howl, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User summons a Poochyena.", 
        }, 

        "rain_dish": {
            "name": "Rain Dish", 
            "effect": rain_dish, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: If user is next to a BLUE ally, they heal for 10 HP.", 
        }, 

        "permadeath": {
            "name": "Permadeath", 
            "effect": permadeath, 
            "cost": 1, 
            "trigger": "on_death", 
            "desc": "On death: This unit is removed from the game.", 
        }, 

        "calm_mind": {
            "name": "Calm Mind", 
            "effect": calm_mind, 
            "cost": 2, 
            "trigger": "on_round_end", 
            "desc": "On round end: User gains 15 ATTACK and 15% DEFENSE.", 
        }, 

        "intimidate": {
            "name": "Intimidate", 
            "effect": intimidate, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: All enemies lose 10% ATTACK.", 
        }, 

        "spore": {
            "name": "Spore", 
            "effect": spore, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: Target loses 1 AP.", 
        }, 

        "truant": {
            "name": "Truant", 
            "effect": truant, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "On turn end: User skips their next turn.", 
        }, 

        "wonder_guard": {
            "name": "Wonder Guard", 
            "effect": wonder_guard, 
            "cost": 1, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: If attack isn't SUPER EFFECTIVE, it deals no damage.", 
        }, 

        "screech": {
            "name": "Screech", 
            "effect": screech, 
            "cost": 3, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: The target loses 25% DEFENSE.", 
        }, 

        "fake_out": {
            "name": "Fake Out", 
            "effect": fake_out, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Attacks the RAREST enemy. They skip their next turn.", 
        }, 

        "metal_burst": {
            "name": "Metal Burst", 
            "effect": metal_burst, 
            "cost": 4, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: Attack the target with the POWER of the suffered move, increased by 50%.", 
        }, 

        "rough_skin": {
            "name": "Rough Skin", 
            "effect": rough_skin, 
            "cost": 1, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: Attacker takes 10 damage.", 
        }, 

        "aqua_jet": {
            "name": "Aqua Jet", 
            "effect": aqua_jet, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attack first with 30 POWER.", 
        }, 

        "teeter_dance": {
            "name": "Teeter Dance", 
            "effect": teeter_dance, 
            "cost": 1, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Shuffles the battlefield.", 
        }, 

        "growth": {
            "name": "Growth", 
            "effect": growth, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User gains 15 ATTACK.", 
        }, 

        "cotton_guard": {
            "name": "Cotton Guard", 
            "effect": cotton_guard, 
            "cost": 3, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User gains 30% DEFENSE.", 
        }, 

        "taunt": {
            "name": "Taunt", 
            "effect": taunt, 
            "cost": 2, 
            "trigger": "before_ally_attacked", 
            "desc": "Before ally is attacked: Provokes the attacker into attacking the user.", 
        }, 

        "attract": {
            "name": "Attract", 
            "effect": attract, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attacker loses 20 ATTACK.", 
        }, 

        "roar": {
            "name": "Roar", 
            "effect": roar, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: The target moves to the BACK ROW.", 
        }, 

        "noble_roar": {
            "name": "Noble Roar", 
            "effect": noble_roar, 
            "cost": 2, 
            "trigger": "after_attacking", 
            "desc": "After attacking: The target moves to the BACK ROW and the user gains 10 ATTACK.", 
        }, 

        "hive": {
            "name": "Hive", 
            "effect": hive, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summons 3 Combee.", 
        }, 

        "defend_order": {
            "name": "Defend Order", 
            "effect": defend_order, 
            "cost": 1, 
            "trigger": "before_ally_attacked", 
            "desc": "Before VESPIQUEEN is attacked: Defend Vespiqueen from the attack.", 
        }, 

        "attack_order": {
            "name": "Attack Order", 
            "effect": attack_order, 
            "cost": 1, 
            "trigger": "after_ally_attacking", 
            "desc": "After VESPIQUEEN attacks: User attacks the same target.", 
        }, 

        "wide_guard": {
            "name": "Wide Guard", 
            "effect": wide_guard, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before user is attacked alongside an ally: User becomes the only target.", 
        }, 

        "syndicate": {
            "name": "Syndicate", 
            "effect": syndicate, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User summons a Murkrow.", 
        }, 

        "stench": {
            "name": "Stench", 
            "effect": stench, 
            "cost": 1, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: Attacker loses 1 PP.", 
        }, 

        "impervious": {
            "name": "Impervious", 
            "effect": impervious, 
            "cost": 1, 
            "trigger": "before_attacked", 
            "desc": "User takes normal damage from SUPER EFFECTIVE attacks.", 
        }, 

        "prank": {
            "name": "Prank", 
            "effect": prank, 
            "cost": 3, 
            "trigger": "before_ally_attacked", 
            "desc": "Before ally is attacked: User gains 1 DODGE and provokes the attacker into attacking them.", 
        }, 

        "pocket_thug": {
            "name": "Pocket Thug", 
            "effect": pocket_thug, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: Summons one Sneasel.", 
        }, 

        "substitute": {
            "name": "Substitute", 
            "effect": substitute, 
            "cost": 3, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User hides behind a decoy and is protected.", 
        }, 

        "commander": {
            "name": "Commander", 
            "effect": commander, 
            "cost": 3, 
            "trigger": "after_attacking", 
            "desc": "After attacking: User commands ally in the same column to attack with 70 POWER.", 
        }, 

        "illusion": {
            "name": "Illusion", 
            "effect": illusion, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User changes to a random COLOR until they're attacked.", 
        }, 

        "dark_illusion": {
            "name": "Dark Illusion", 
            "effect": dark_illusion, 
            "cost": 3, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: User changes to a random COLOR until they're attacked. User dodges and counterattacks on illusion break", 
        }, 

        "retaliate": {
            "name": "Retaliate", 
            "effect": retaliate, 
            "cost": 2, 
            "trigger": "after_ally_attacked", 
            "desc": "After ally is attacked: User attacks the enemy with 50 POWER.", 
        }, 

        "zen_mode": {
            "name": "Zen Mode", 
            "effect": zen_mode, 
            "cost": 2, 
            "trigger": "after_attacked", 
            "desc": "After being attacked: If the user has less than 40% MAX HP, they becomes weak, but durable.", 
        }, 

        "defeatist": {
            "name": "Defeatist", 
            "effect": defeatist, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "on turn start: If the user has less than 50% MAX HP, they lose 50 ATTACK.", 
        }, 

        "slow_start": {
            "name": "Slow Start", 
            "effect": slow_start, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "The user skips their first turn.", 
        }, 

        "geomancy": {
            "name": "Geomancy", 
            "effect": geomancy, 
            "cost": 4, 
            "trigger": "on_turn_start", 
            "desc": "At the start of the next turn: User gains 40 ATK.", 
        }, 

        "king's_shield": {
            "name": "King's Shield", 
            "effect": kings_shield, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before being attacked: User gains 40% DEFENSE.", 
        }, 

        "pressure": {
            "name": "Pressure", 
            "effect": pressure, 
            "cost": 4, 
            "trigger": "on_battle_start", 
            "desc": "On battle start: All enemies lose 1 AP.", 
        }, 

        "dark_void": {
            "name": "Dark Void", 
            "effect": dark_void, 
            "cost": 4, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: All enemies lose 1 AP.", 
        }, 

        "guts": {
            "name": "Guts", 
            "effect": guts, 
            "cost": 1, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: if the user is BURNED, their attack is doubled.", 
        }, 

        "dia": {
            "name": "Dia", 
            "effect": dia, 
            "cost": 1, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal lowest HP ally by 30% MAX HP.", 
        }, 

        "media": {
            "name": "Media", 
            "effect": media, 
            "cost": 2, 
            "trigger": "on_turn_end", 
            "desc": "On turn end: Heal all allies by 30% MAX HP.", 
        }, 

        "concentrate": {
            "name": "Concentrate", 
            "effect": concentrate, 
            "cost": 2, 
            "trigger": "on_turn_start", 
            "desc": "On turn start: User gains 15 ATK.", 
        }, 

        "drive_switch": {
            "name": "Drive Switch", 
            "effect": drive_switch, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: Makes TECHNO BLAST super effective.", 
        }, 

        "mutation": {
            "name": "Mutation", 
            "effect": mutation, 
            "cost": 2, 
            "trigger": "on_battle_start", 
            "desc": "User changes forms based on circunstance.", 
        }, 

        "attack_forme": {
            "name": "Attack Forme", 
            "effect": attack_forme, 
            "cost": 2, 
            "trigger": "before_attacking", 
            "desc": "Before attacking: User gains 40 ATTACK.", 
        }, 

        "defense_forme": {
            "name": "Defense Forme", 
            "effect": defense_forme, 
            "cost": 2, 
            "trigger": "before_attacked", 
            "desc": "Before attacking: User gains 80 DEFENSE.", 
        }, 

        "multitype": {
            "name": "Multitype", 
            "effect": multitype, 
            "cost": 1, 
            "trigger": "on_battle_start", 
            "desc": "User changes to an advantageous COLOR based on circunstance.", 
        }, 

    }






func deal_damage(unit):
    await globals.battle.deal_damage(unit)

func add_burn_10(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 10)

func add_burn_15(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 15)

func add_burn_20(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 20)

func add_burn_30(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 30)

func add_burn_40(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 40)

func add_burn_100(_unit):
    if not check_if_targets_alive(): return

    await globals.battle.apply_burn(globals.battle.current_target_unit, 100)


func lower_speed_10(_unit):
    if not check_if_targets_alive(): return

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 10
        i.blink.play_backwards("mod_speed")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func lower_speed_20(_unit):
    if not check_if_targets_alive(): return

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 20
        i.blink.play_backwards("mod_speed")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func lower_speed_40(_unit):
    if not check_if_targets_alive(): return

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 40
        i.blink.play_backwards("mod_speed")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func lower_speed_100(_unit):
    if not check_if_targets_alive(): return

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 100
        i.blink.play_backwards("mod_speed")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func lower_def_20(_unit):
    if not check_if_targets_alive(): return

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        globals.battle.show_action_name(i, "Defense Down")
        i.defense -= 0.2
        i.blink.play_backwards("mod_def")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func gain_speed_10(unit):

    globals.battle.show_action_name(unit, "Speed Up")
    unit.speed += 10
    unit.blink.play("mod_speed")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func user_gains_defense_10(unit):

    globals.battle.show_action_name(unit, "Defense Up")
    unit.defense += 0.1
    unit.blink.play("mod_def")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    await wait(0.15)

func user_gains_defense_20(unit):

    globals.battle.show_action_name(unit, "Defense Up")
    unit.defense += 0.2
    unit.blink.play("mod_def")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    await wait(0.15)

func user_lose_defense_20(unit):

    globals.battle.show_action_name(unit, "Defense Down")
    unit.defense -= 0.2
    unit.blink.play_backwards("mod_def")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    await wait(0.15)

func user_lose_speed_10(unit):

    globals.battle.show_action_name(unit, "Speed Down")
    unit.speed -= 10
    unit.blink.play_backwards("mod_speed")
    await wait(0.5)

    globals.battle.hide_action_name(unit)
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.15)

func user_gains_attack_10(unit):

    globals.battle.show_action_name(unit, "Attack Up")
    unit.speed += 10
    unit.blink.play("mod_atk")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    await wait(0.15)

func bonus_damage_user_low_hp(unit):


    var bonus_damage = ((unit.cur_hp / unit.max_hp)) * 100

    globals.battle.damage_flat += bonus_damage

func nullify_target_defense(_unit):
    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        i.blink.play_backwards("mod_def")
        i.defense = 1.0
    delayed_hide_action_name(globals.battle.current_target_unit)

func recoil_15(unit):
    if unit.cur_hp < 1: return

    globals.battle.suffer_damage(unit, [roundi(unit.max_hp * 0.1), "none", 1])
    await wait(0.65)

func recoil_20(unit):
    if unit.cur_hp < 1: return

    globals.battle.suffer_damage(unit, [roundi(unit.max_hp * 0.14), "none", 1])
    await wait(0.65)

func recoil_25(unit):
    if unit.cur_hp < 1: return

    globals.battle.suffer_damage(unit, [roundi(unit.max_hp * 0.18), "none", 1])
    await wait(0.65)

func recoil_100(unit):
    if unit.cur_hp < 1: return

    globals.battle.suffer_damage(unit, [roundi(unit.max_hp), "none", 1])
    await wait(0.65)

func splash_25(unit):
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in globals.battle.current_target_unit:
        var adjacent_allies_indexes = get_adjacent_allies(i)
        var adjacent_allies = []


        for k in target_team:
            if k == null: continue
            if k.team_slot in adjacent_allies_indexes:
                adjacent_allies.append(k)

        if adjacent_allies == []: return
        await wait(0.1)

        for k in adjacent_allies:

            var damage = globals.battle.calculate_damage({"power": 10, "color": active[unit.selected_attack]["color"]}, unit, k)
            globals.battle.suffer_damage(k, damage)

    await wait(0.65)

func splash_30(unit):
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in globals.battle.current_target_unit:
        var adjacent_allies_indexes = get_adjacent_allies(i)
        var adjacent_allies = []


        for k in target_team:
            if k == null: continue
            if k.team_slot in adjacent_allies_indexes:
                adjacent_allies.append(k)

        if adjacent_allies == []: return
        await wait(0.1)

        for k in adjacent_allies:

            var damage = globals.battle.calculate_damage({"power": 20, "color": active[unit.selected_attack]["color"]}, unit, k)
            globals.battle.suffer_damage(k, damage)

    await wait(0.65)

func splash_burn_10(unit):
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in globals.battle.current_target_unit:
        var adjacent_allies_indexes = get_adjacent_allies(i)
        var adjacent_allies = []


        for k in target_team:
            if k == null: continue
            if k.team_slot in adjacent_allies_indexes:
                adjacent_allies.append(k)

        if adjacent_allies == []: return



        await globals.battle.apply_burn(adjacent_allies, 10)



func frontrow_heal_30pc(unit):


    if unit.cur_hp >= unit.max_hp: return
    if unit.team == 1 and unit not in globals.battle.player_team.slice(0, 3): return
    if unit.team == 2 and unit not in globals.battle.enemy_team.slice(0, 3): return

    var healing = roundi(unit.max_hp * 0.25)

    unit_heal(unit, healing)

    await wait(0.65)

func frontrow_heal_20pc(unit):


    if unit.cur_hp >= unit.max_hp: return
    if unit.team == 1 and unit not in globals.battle.player_team.slice(0, 3): return
    if unit.team == 2 and unit not in globals.battle.enemy_team.slice(0, 3): return

    var healing = roundi(unit.max_hp * 0.15)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_8pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.08)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_10pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.1)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_15pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.15)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_20pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.2)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_25pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.25)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_30pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.3)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_40pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.4)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_50pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.5)

    unit_heal(unit, healing)

    await wait(0.65)

func heal_70pc(unit):


    if unit.cur_hp >= unit.max_hp: return

    var healing = roundi(unit.max_hp * 0.7)

    unit_heal(unit, healing)

    await wait(0.65)

func target_heal_40pc(_unit):

    var target = globals.battle.current_target_unit



    for i in target:
        var healing = roundi(i.max_hp * 0.4)

        unit_heal(i, healing)

    await wait(0.65)

func shove(unit):
    var shoved_units = []
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in globals.battle.current_target_unit:
        if i.team_slot in [1, 2, 3]: shoved_units.append(i)

    for i in shoved_units:
        if target_team[i.team_slot + 2] == null and i.recorded_data["dodges"] < 1:
            if unit_protected(i): continue
            if i.cur_hp < 1: continue
            target_team[i.team_slot - 1] = null

            i.team_slot += 3
            var tween = get_tree().create_tween()
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 0.12)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func pull(unit):
    var pulled_units = []
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in globals.battle.current_target_unit:
        if i.team_slot in [4, 5, 6]: pulled_units.append(i)

    for i in pulled_units:
        if target_team[i.team_slot - 4] == null and i.recorded_data["dodges"] < 1:
            if unit_protected(i): continue
            target_team[i.team_slot - 1] = null

            i.team_slot -= 3
            var tween = get_tree().create_tween()
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 0.1)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func user_recharge(unit):
    await wait(0.8)
    unit.skip_turn = true
    globals.battle.show_action_name(unit, "Exhausted")
    unit.player.play("ot_exhausted")
    await unit.player.animation_finished
    globals.battle.hide_action_name(unit)
    await wait(0.2)

func target_stun(_unit):
    await wait(0.8)
    var triggered = false
    for i in globals.battle.current_target_unit:
        if unit_protected(i): continue
        if i.cur_hp < 1: continue
        triggered = true
        i.skip_turn = true
        globals.battle.show_action_name(i, "Stunned")
        i.player.play("ot_stunned")
    if not triggered: return
    await wait(1.2)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)
    await wait(0.2)

func solar_beam_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, solar_beam_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Charging...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func skull_bash_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, skull_bash_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Charging...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    await wait(0.4)
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func sky_attack_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, sky_attack_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Charging...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    await wait(0.4)
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func fly_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, fly_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()





    globals.battle.hide_action_name(unit)

    unit.player.play("ot_fly_charge")

    unit.recorded_data["dodges"] = 99

    await wait(1)
    unit.get_node("Sprite/Sprite2D").visible = false

func shadow_force_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, shadow_force_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()




    globals.battle.hide_action_name(unit)



    unit.recorded_data["dodges"] = 99

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(9), 0.8)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(-4), 0.6)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(0), 0.3)

    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.get_node("Sprite/Sprite2D"), "modulate", Color("#ffffff00"), 1)

    await tween.finished
    unit.get_node("Sprite/Sprite2D").visible = false

func razor_wind_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, razor_wind_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Charging...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    await wait(0.4)
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func zap_cannon_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, zap_cannon_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Locking On...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    await wait(0.4)
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func focus_punch_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, focus_punch_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.current_act_unit.player.play("ot_charge")

    globals.battle.show_action_name(unit, "Focusing...")
    await globals.battle.spend_point(unit, "ap", moves.active[unit.selected_attack]["cost"])
    await wait(0.4)
    globals.battle.hide_action_name(unit)
    await wait(0.4)

func chain(unit):
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    await wait(0.1)

    for i in globals.battle.current_target_unit:
        var adjacent_allies_indexes = get_adjacent_allies(i)
        var adjacent_allies = []


        for k in target_team:
            if k == null: continue
            if k.team_slot in adjacent_allies_indexes:
                adjacent_allies.append(k)

        for k in adjacent_allies:

            var damage = globals.battle.calculate_damage(active[unit.selected_attack], unit, k)
            globals.battle.suffer_damage(k, damage)

    await wait(0.8)

func double_dmg_less_30_speed(unit):
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.speed < unit.speed - 31: triggered = true
    if not triggered: return

    unit.blink.play("mod_atk")
    unit.temp_power += unit.power

func double_dmg_less_50pc_hp(unit):
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp <= i.max_hp * 0.5: triggered = true
    if not triggered: return

    unit.blink.play("mod_atk")
    unit.temp_power += unit.power

func rollout_count(unit):
    globals.battle.damage_flat += 16 * unit.recorded_data["rollout"]
    unit.recorded_data["rollout"] += 1







    unit.blink.play("mod_atk")

func night_shade(_unit):
    globals.battle.damage_mod += 0.4 * (globals.battle.current_target_unit[0].rarity - 1)


func bonus_dmg_cur_hp_50(_unit):
    globals.battle.damage_flat += roundi(globals.battle.current_target_unit[0].cur_hp * 0.5)

func add_atk(unit):
    if unit.get_node("AnimationPlayer").is_playing(): await unit.get_node("AnimationPlayer").animation_finished
    if not check_if_targets_alive(): return


    var atk_data = moves.active[unit.selected_attack].duplicate(true)
    atk_data["effect"].erase(add_atk)


    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: return

    await globals.battle.execute_action(atk_data, unit)

func add_2_atk(unit):
    unit.get_node("AnimationPlayer").speed_scale = 2
    if unit.get_node("AnimationPlayer").is_playing(): await unit.get_node("AnimationPlayer").animation_finished
    if not check_if_targets_alive(): unit.get_node("AnimationPlayer").speed_scale = 1;return


    var atk_data = moves.active[unit.selected_attack].duplicate(true)
    atk_data["effect"].erase(add_2_atk)


    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: unit.get_node("AnimationPlayer").speed_scale = 1;return

    await globals.battle.execute_action(atk_data, unit)

    triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: unit.get_node("AnimationPlayer").speed_scale = 1;return
    await wait(0.2)

    await globals.battle.execute_action(atk_data, unit)
    unit.get_node("AnimationPlayer").speed_scale = 1


func add_comet_atk(unit):

    unit.get_node("AnimationPlayer").speed_scale = 3
    if unit.get_node("AnimationPlayer").is_playing(): await unit.get_node("AnimationPlayer").animation_finished
    if not check_if_targets_alive(): unit.get_node("AnimationPlayer").speed_scale = 1;return
    await wait(0.2)

    var atk_data = moves.active[unit.selected_attack].duplicate(true)
    atk_data["effect"].erase(add_comet_atk)


    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: unit.get_node("AnimationPlayer").speed_scale = 1;;return


    await globals.battle.execute_action(atk_data, unit)

    triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: unit.get_node("AnimationPlayer").speed_scale = 1;return
    await wait(0.2)

    await globals.battle.execute_action(atk_data, unit)

    triggered = false
    unit.get_node("AnimationPlayer").speed_scale = 1
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: unit.get_node("AnimationPlayer").speed_scale = 1;return
    await wait(0.2)

    await globals.battle.execute_action(atk_data, unit)

    if unit.player.is_playing():
        await unit.get_node("AnimationPlayer").animation_finished


    await wait(0.4)

func second_hit(unit):
    if not check_if_targets_alive(): return


    var atk_data = moves.active[unit.selected_attack].duplicate(true)
    atk_data["effect"].erase(second_hit)
    atk_data["motion"] = "none"

    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0: triggered = true;break
    if not triggered: return

    await wait(0.4)
    await globals.battle.execute_action(atk_data, unit)

    await wait(0.4)

func seismic_toss(unit):
    globals.battle.show_action_name(unit, "Seismic Toss")


    globals.battle.hide_action_name(unit)

    var target = globals.battle.current_target_unit

    await globals.battle.unit_approach(unit, "run", false)

    await globals.battle.trigger_before_attack_effects(unit, target)
    if unit.cur_hp < 1: return

    var direction = -1
    if unit.team == 2: direction = 1

    unit.z_index = 2

    var tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite"), "position", globals.battle.current_target_unit[0].get_node("Sprite").position + Vector2(60 * direction, 0), 0.1)
    await wait(0.2)

    unit.player.play("ot_fly_charge")
    globals.battle.current_target_unit[0].player.play("ot_fly_charge")

    await wait(1)

    unit.player.play_backwards("ot_fly_charge")
    globals.battle.current_target_unit[0].player.play_backwards("ot_fly_charge")

    await wait(0.7)


    globals.battle.deal_damage(unit)

    await globals.battle.trigger_after_attack_effects(unit, target)
    if unit.cur_hp < 1: return

    await wait(0.2)
    tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite"), "position", globals.battle.current_target_unit[0].get_node("Sprite").position + Vector2(0, 0), 0.2)

    await wait(0.6)

    unit.z_index = 0
    await globals.battle.unit_retreat(unit, "run")

    await globals.battle.trigger_after_retreat_effects(unit, target)
    if unit.cur_hp < 1: return

func sky_drop(unit):
    globals.battle.show_action_name(unit, "Sky Drop")


    globals.battle.hide_action_name(unit)

    var target = globals.battle.current_target_unit

    await globals.battle.unit_approach(unit, "run", false)

    await globals.battle.trigger_before_attack_effects(unit, target)

    var direction = -1
    if unit.team == 2: direction = 1

    unit.z_index = 2

    var tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite"), "position", globals.battle.current_target_unit[0].get_node("Sprite").position + Vector2(60 * direction, 0), 0.1)


    unit.player.play("ot_fly_charge")
    globals.battle.current_target_unit[0].player.play("ot_fly_charge")

    await wait(0.8)


    globals.battle.current_target_unit[0].player.play_backwards("ot_fly_charge")

    await wait(0.5)


    globals.battle.deal_damage(unit)




    tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite"), "position", Vector2(0, 0), 0.3)

    unit.player.play_backwards("ot_fly_charge")
    unit.z_index = 0
    await globals.battle.unit_retreat(unit, "run")


    await wait(0.2)

    await globals.battle.trigger_after_attack_effects(unit, target)

    await globals.battle.trigger_after_retreat_effects(unit, target)

func target_lose_1_ap(_unit):
    await wait(0.9)
    if not check_if_targets_alive(): return

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(0.8)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func target_lose_1_pp(_unit):
    await wait(0.9)
    if not check_if_targets_alive(): return

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "PP Down")
        globals.battle.spend_point(i, "pp", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(0.8)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func bounce(unit):
    globals.battle.show_action_name(unit, "Bounce")

    globals.battle.hide_action_name(unit)

    var target = globals.battle.current_target_unit

    var direction = -1
    if unit.team == 2: direction = 1
    unit.z_index = 2

    unit.player.play("ot_fly_charge")
    await wait(0.35)

    var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", 
                            globals.battle.current_target_unit[0].position - Vector2(40 * direction, 0), 0.6)
    await wait(0.26)

    unit.signal_attack = false
    unit.player.play_backwards("ot_fly_charge")
    while true:
        if unit.signal_attack: break
        await wait(0.01)

    globals.battle.deal_damage(unit)

    await wait(0.4)
    tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", unit.position + Vector2(60 * - direction, 0), 0.3)

    await globals.battle.trigger_after_attack_effects(unit, target)


    await globals.battle.unit_retreat(unit, "run")
    unit.z_index = 0

    await globals.battle.trigger_after_retreat_effects(unit, target)

func harden(unit):


    unit.defense += 0.2
    unit.blink.play("mod_def")
    await wait(0.5)

    globals.battle.hide_action_name(unit)

    await wait(0.15)

func invert_rows(unit):


    var target_team = get_target_team(unit)

    for i in target_team:
        if i == null: continue
        if i.team_slot <= 3:
            i.team_slot += 3
        else:
            i.team_slot -= 3

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC)
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 0.8)

    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func hurricane(unit):
    if not check_if_targets_alive(): return

    var target_team = get_target_team(unit)


    var random_indexes = range(1, 7)
    random_indexes.shuffle()

    var cont = 0
    for i in target_team:
        if i == null: continue
        i.team_slot = random_indexes[cont]
        cont += 1

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC)
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 1.4)

    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func dig_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, dig_fire])
    unit.recorded_data["target_memory"] = globals.battle.current_target_unit.duplicate()

    globals.battle.hide_action_name(unit)

    unit.player.play("ot_dig")

    unit.recorded_data["dodges"] = 99

    await wait(1)
    unit.get_node("Sprite/Sprite2D").visible = false

func vice_grip(unit):
    if not check_if_targets_alive(): return
    if globals.battle.current_target_unit[0].team_slot > 3: return

    var target_sprite = globals.battle.current_target_unit[0].get_node("Sprite/Sprite2D")

    var tween = get_tree().create_tween()
    tween.tween_property(target_sprite, "position", Vector2(0, -65), 0.05)
    await wait(0.01)
    shove(unit)
    await wait(0.08)

    tween = get_tree().create_tween()
    tween.tween_property(target_sprite, "position", Vector2(0, 0), 0.1)



func wish_charge(unit):
    globals.battle.effects_in_play["on_round_end"].append([unit, wish_trigger])

    unit.player.play_backwards("ot_rest")

    globals.battle.show_action_name(unit, "Charging...")
    await wait(0.9)

    globals.battle.hide_action_name(unit)

func soft_boiled(unit):
    var selected_unit = unit
    var adj_allies = get_adjacent_allies(unit)

    for i in get_own_team(unit):
        if i == null: continue
        if i.team_slot in adj_allies and i.cur_hp / i.max_hp <= selected_unit.cur_hp / selected_unit.max_hp:
            selected_unit = i

    unit_heal(selected_unit, roundi(selected_unit.max_hp * 0.5))
    await wait(0.6)

func move_transform(unit):



    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
    new_sprite.frame = globals.battle.current_target_unit[0].get_node("Sprite/Sprite2D").frame
    new_sprite.scale = Vector2.ZERO
    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    if unit.team != 1:
        new_sprite.flip_h = true

    unit.add_child(new_sprite)

    unit.player.play("ot_transform")
    await wait(1.5)
    unit.get_node("Sprite/Sprite2D").self_modulate = Color("#ea94ff")
    new_sprite.self_modulate = Color("#ea94ff")

    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(new_sprite, "scale", Vector2(3, 5), 0.4)
    tween.tween_property(new_sprite, "scale", Vector2(5, 3), 0.4)
    tween.tween_property(new_sprite, "scale", Vector2(3, 5), 0.2)
    tween.tween_property(new_sprite, "scale", Vector2(5, 3), 0.2)

    await wait(1.2)

    if globals.battle.current_target_unit[0].unit_name != "Ditto":
        var ditto_data = [unit.max_hp, unit.cur_hp, unit.unit_id, unit.unit_dict]
        globals.battle.setup_unit(unit, globals.battle.current_target_unit[0].unit_dict.duplicate(true))
        globals.battle.unit_post_setup(unit)
        unit.max_hp = ditto_data[0]
        unit.cur_hp = ditto_data[1]
        unit.unit_id = ditto_data[2]
        unit.unit_dict = ditto_data[3]
        globals.battle.setup_hp_dividers(unit)
        unit.visible = true


    tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.set_parallel(true)
    tween.tween_property(new_sprite, "scale", Vector2(4, 4), 0.3)
    tween.tween_property(new_sprite.get_node("BlinkTexture"), "color", Color("#ffffff00"), 0.6)
    await wait(0.61)
    unit.player.play("RESET")

    await wait(0.05)
    new_sprite.queue_free()

func metronome(unit):
    unit.player.play("ot_sing")
    await unit.player.animation_finished

    metronome_moves.shuffle()
    var chosen_move = metronome_moves[0]


    globals.battle.ai_highest_damage_memory = [-1, "unit_atk1", [Node]]
    globals.battle.AI_test_atk_slot(unit, active[chosen_move])
    unit.selected_attack = chosen_move

    await globals.battle.unit_action(unit, globals.battle.current_target_unit, true, true)

    unit.selected_attack = "metronome"

func protect(unit):
    unit.recorded_data["protect"] += 1
    unit.recorded_data["AI_protected"] = true
    unit.player.play("ot_charge")

func splash(_unit):
    pass

func gyro_ball(unit):
    globals.battle.damage_flat -= 120 * (unit.speed / 100)

func nullify_protect(_unit):
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.recorded_data["protect"] > 0:
            triggered = true
            break
    if not triggered: return

    for i in globals.battle.current_target_unit:
        if i.recorded_data["protect"] > 0:
            i.recorded_data["protect"] = 0
            globals.battle.show_action_name(i, "Guard Broken")

    delayed_hide_action_name(globals.battle.current_target_unit)

func sketch(unit):
    var new_attack = globals.battle.current_target_unit[0].selected_attack
    unit.recorded_data["sketched"] = globals.battle.current_target_unit[0].unit_dict.duplicate()

    if unit.atk1 == "sketch":
        unit.atk1 = new_attack
        unit.unit_dict["dex"]["slot1"][unit.unit_dict["slot1_selected"]] = new_attack
        unit.selected_attack = unit.atk1

    elif unit.atk2 == "sketch":
        unit.atk2 = new_attack
        unit.unit_dict["dex"]["slot3"][unit.unit_dict["slot3_selected"]] = new_attack
        unit.selected_attack = unit.atk2

    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)

    for i in unit.get_node("InputUI").get_children():
        i.modulate = Color("#ffffff")

    await anm_atk(unit, "ot_skill")
    globals.battle.show_action_name(unit, "Copied {0}".format([active[new_attack]["name"]]))
    await wait(1)
    globals.battle.hide_action_name(unit)

func double_damage_to_blue(unit):
    if globals.battle.current_target_unit[0].color != "blue": return

    unit.blink.play("mod_atk")
    unit.temp_power += unit.power

func extra_turn_on_kill(unit):
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.cur_hp < 1: triggered = true;break
    if not triggered: return

    unit.played_turn = false
    unit.recorded_data["extra_turn"] += 1
    globals.battle.show_action_name(unit, "Extra Turn")
    unit.blink.play("mod_atk")

    await wait(0.5)
    delayed_hide_action_name([unit])

func hex(unit):
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.burn_amount > 0: triggered = true;break
    if not triggered: return
    unit.blink.play("mod_atk")
    globals.battle.damage_mod += 1

func destiny_bond(unit):
    globals.battle.effects_in_play["on_death"].append([unit, destiny_bond_fire])
    globals.battle.effects_in_play["on_turn_start"].append([unit, destiny_bond_timeout])

    unit.player.play("ot_charge")
    await wait(0.4)

func destiny_bond_fire(_unit):
    var actor = get_acting_unit()
    globals.battle.effects_in_play["on_death"].erase([actor, destiny_bond_fire])
    await wait(1)
    globals.battle.show_action_name(actor, "The bell tolls...")
    await wait(1.2)
    delayed_hide_action_name([actor])
    actor.cur_hp = 0
    await globals.battle.healthbar_damage(actor)
    await globals.battle.unit_death(actor)

func destiny_bond_timeout(unit):
    globals.battle.effects_in_play["on_death"].erase([unit, destiny_bond_fire])
    globals.battle.effects_in_play["on_turn_start"].erase([unit, destiny_bond_timeout])

func parting_shot(unit):
    globals.battle.effects_in_play["on_turn_end"].append([unit, parting_shot_fire])

func parting_shot_fire(unit):
    await switch_with_unit_behind(unit)
    globals.battle.effects_in_play["on_turn_end"].erase([unit, parting_shot_fire])











func none(_unit):
    pass

func heal_test(unit):
    if unit.cur_hp >= unit.max_hp: return
    if unit.pp < 1: return

    globals.battle.show_action_name(unit, "Heal")
    await globals.battle.spend_point(unit, "pp", 1)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    var healing = clamp(20, 20, roundi(unit.max_hp - unit.cur_hp))

    unit.cur_hp += healing

    unit.blink.play("heal")
    await wait(0.1)
    unit.popup_damage(healing, "none", -1)

    globals.battle.healthbar_damage(unit)

    await wait(0.8)

func smokescreen(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Smokescreen")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            i.speed -= 10
            i.blink.play_backwards("mod_speed")
            globals.battle.show_action_name(i, "Speed Down")

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func focus_energy(unit):
    if unit.pp < 1: return

    globals.battle.show_action_name(unit, "Focus Energy")
    await globals.battle.spend_point(unit, "pp", 1)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)

    unit.power += 10


    await wait(0.65)

func hypnosis(unit):
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if globals.battle.current_target_unit[0].ap < 1: return
    if unit.pp < 3: return

    await show_effect_name(unit, "hypnosis")
    unit.player.play("ot_charge")
    await wait(0.4)






    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(1)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.65)

func sing(unit):
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if globals.battle.current_target_unit[0].ap < 1: return
    if unit.pp < 3: return

    await show_effect_name(unit, "sing")











    await anm_atk(unit, "ot_sing")

    globals.battle.show_action_name(globals.battle.current_target_unit[0], "AP Down")
    globals.battle.spend_point(globals.battle.current_target_unit[0], "ap", 1)
    globals.battle.current_target_unit[0].blink.play_backwards("mod_def")

    await wait(0.8)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.65)

func lovely_kiss(unit):
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if globals.battle.current_target_unit[0].ap < 1: return
    if unit.pp < 3: return

    await show_effect_name(unit, "lovely_kiss")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(1)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.65)

func sleep_powder(unit):
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if globals.battle.current_target_unit[0].ap < 1: return
    if unit.pp < 3: return

    await show_effect_name(unit, "sleep_powder")
    await anm_atk(unit, "mt_sway")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(1)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.65)

func nasty_plot(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Nasty Plot")
    await globals.battle.spend_point(unit, "pp", 3)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)
    unit.power += 25

    await wait(0.65)

func swords_dance(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Swords Dance")
    await globals.battle.spend_point(unit, "pp", 3)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)
    unit.power += 25

    await wait(0.65)

func disable(unit):
    if globals.battle.current_target_unit == []: return
    if unit.cur_hp < 1: return
    if globals.battle.current_target_unit[0].pp < 1: return
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Disable")
    await globals.battle.spend_point(unit, "pp", 2)
    await wait(0.3)
    globals.battle.hide_action_name(unit)


    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "PP Down")
        globals.battle.spend_point(i, "pp", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(0.5)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.2)

func core_enforcer(unit):
    if globals.battle.current_target_unit == []: return
    if unit.cur_hp < 1: return
    if globals.battle.current_target_unit[0].pp < 1: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if unit.pp < 5: return

    globals.battle.show_action_name(unit, "Core Enforcer")
    await globals.battle.spend_point(unit, "pp", 5)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    globals.battle.show_action_name(globals.battle.current_target_unit[0], "PP Down")
    globals.battle.current_target_unit[0].blink.play_backwards("mod_def")
    await globals.battle.spend_point(globals.battle.current_target_unit[0], "pp", globals.battle.current_target_unit[0].pp)


    await wait(0.3)

    globals.battle.hide_action_name(globals.battle.current_target_unit[0])



func glare(unit):
    if globals.battle.current_target_unit == []: return
    if unit.cur_hp < 1: return
    if globals.battle.current_target_unit[0].pp < 1: return
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "glare")

    unit.player.play("ot_charge")
    await wait(0.3)

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "PP Down")
        globals.battle.spend_point(i, "pp", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(0.5)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.2)

func soak(unit):

    if unit.pp < 2: return

    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Soak")
    await globals.battle.spend_point(unit, "pp", 2)
    await wait(0.3)
    globals.battle.hide_action_name(unit)


    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 20
        i.blink.play_backwards("mod_speed")

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.3)

func poison_powder(unit):
    if unit.pp < 2: return


    var target_team = get_target_team(unit)
    var targeted_back = check_if_front_row_empty(target_team)

    var targeted_units = target_team.slice(0, 3)
    if targeted_back:
        targeted_units = target_team.slice(3, 6)

    if targeted_units == [null, null, null]: return

    await show_effect_name(unit, "poison_powder")
    await anm_atk(unit, "mt_sway")

    await globals.battle.apply_burn(targeted_units, 15)

func triumph(unit):
    if unit.cur_hp >= unit.max_hp: return
    if unit.pp < 1: return
    if unit != globals.battle.current_act_unit: return

    var rare_enemy = false
    for i in globals.battle.current_target_unit:
        if i.rarity > 2: rare_enemy = true
    if not rare_enemy: return

    globals.battle.show_action_name(unit, "Triumph")
    await globals.battle.spend_point(unit, "pp", 1)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    var healing = roundi(unit.max_hp * 0.3)
    unit_heal(unit, healing)

    await wait(0.65)

func cover(unit):

    if unit.pp < 1: return
    if unit.recorded_data["dodges"] > 90: return

    var protected_unit = null
    var adj_allies = get_adjacent_allies(unit)
    for i in globals.battle.current_target_unit:
        if i == unit: continue

        if i.team_slot in adj_allies and i not in globals.battle.units_covering:
            protected_unit = i
            break

    if protected_unit == null: return

    if protected_unit.recorded_data["dodges"] > 0: return
    if protected_unit.recorded_data["protect"] > 0: return

    if unit in globals.battle.units_covering: return
    if protected_unit in globals.battle.units_covering: return

    globals.battle.units_covering.append(unit)
    globals.battle.units_covering.append(protected_unit)

    var direction = -1
    if unit.team == 2: direction = 1


    globals.battle.show_action_name(unit, "Cover")
    await globals.battle.spend_point(unit, "pp", 1)
    await wait(0.3)
    globals.battle.hide_action_name(unit)



    if unit in globals.battle.current_target_unit: globals.battle.current_target_unit.erase(unit)
    globals.battle.current_target_unit[globals.battle.current_target_unit.find(protected_unit)] = unit

    globals.battle.units_out_of_place.append(protected_unit)
    globals.battle.units_out_of_place.append(unit)

    unit.z_index = 1
    protected_unit.z_index = 0

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(unit, "position", protected_unit.position, 0.2)
    tween.tween_property(protected_unit, "position", protected_unit.position - Vector2(80 * direction, 0), 0.2)

    await wait(0.3)

func wall(unit):

    if unit.pp < 2: return
    if unit.recorded_data["dodges"] > 90: return

    var protected_unit = null
    var adj_allies = get_adjacent_allies(unit)
    for i in globals.battle.current_target_unit:
        if i == unit: continue

        if i.team_slot in adj_allies and i not in globals.battle.units_covering:
            protected_unit = i
            break

    if protected_unit == null: return
    if protected_unit.recorded_data["dodges"] > 0: return
    if protected_unit.recorded_data["protect"] > 0: return

    if unit in globals.battle.units_covering: return
    if protected_unit in globals.battle.units_covering: return

    globals.battle.units_covering.append(unit)
    globals.battle.units_covering.append(protected_unit)

    var direction = -1
    if unit.team == 2: direction = 1

    globals.battle.show_action_name(unit, "Wall")
    await globals.battle.spend_point(unit, "pp", 2)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    unit.temp_defense += 0.2

    if unit in globals.battle.current_target_unit: globals.battle.current_target_unit.erase(unit)
    globals.battle.current_target_unit[globals.battle.current_target_unit.find(protected_unit)] = unit

    globals.battle.units_out_of_place.append(protected_unit)
    globals.battle.units_out_of_place.append(unit)

    unit.z_index = 1
    protected_unit.z_index = 0

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(unit, "position", protected_unit.position, 0.3)
    tween.tween_property(protected_unit, "position", protected_unit.position - Vector2(80 * direction, 0), 0.2)

    await wait(0.3)

func guardian(unit):

    if unit.pp < 2: return
    if unit.recorded_data["dodges"] > 90: return

    var protected_unit = null

    for i in globals.battle.current_target_unit:
        if i == unit: continue

        if i != unit and i not in globals.battle.units_covering:
            protected_unit = i
            break

    if protected_unit == null: return
    if protected_unit.recorded_data["dodges"] > 0: return
    if protected_unit.recorded_data["protect"] > 0: return

    if unit in globals.battle.units_covering: return
    if protected_unit in globals.battle.units_covering: return

    globals.battle.units_covering.append(unit)
    globals.battle.units_covering.append(protected_unit)

    var direction = -1
    if unit.team == 2: direction = 1

    await show_effect_name(unit, "guardian")

    unit.temp_defense += 0.2

    if unit in globals.battle.current_target_unit: globals.battle.current_target_unit.erase(unit)
    globals.battle.current_target_unit[globals.battle.current_target_unit.find(protected_unit)] = unit

    globals.battle.units_out_of_place.append(protected_unit)
    globals.battle.units_out_of_place.append(unit)

    unit.z_index = 1
    protected_unit.z_index = 0

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(unit, "position", protected_unit.position, 0.3)
    tween.tween_property(protected_unit, "position", protected_unit.position - Vector2(80 * direction, 0), 0.2)

    await wait(0.3)

func pride(unit):
    if unit.pp < 1: return

    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.rarity > 2: triggered = true

    if not triggered: return

    globals.battle.show_action_name(unit, "Pride")
    await globals.battle.spend_point(unit, "pp", 1)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)

    unit.temp_power += 20


    await wait(0.65)

func god_slayer(unit):
    if unit.pp < 1: return
    if globals.battle.current_target_unit == []: return

    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.rarity > 3: triggered = true

    if not triggered: return

    globals.battle.show_action_name(unit, "God Slayer")
    await globals.battle.spend_point(unit, "pp", 5)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)

    unit.temp_power += 200

    await wait(0.65)

func solar_beam_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, solar_beam_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack

    globals.battle.current_delayed_actor = unit

    unit.selected_attack = "solar_beam_fire"
    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func leech_seed(unit):
    if unit.cur_hp >= unit.max_hp: return
    if unit.pp < 2: return


    await wait(0.2)
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    var triggered = false
    for i in target_team:
        if i != null and i.cur_hp > 0:
            triggered = true

    if not triggered: return

    globals.battle.show_action_name(unit, "Leech Seed")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)


    var enemies_hit = 0
    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [5, "none", 1])
        enemies_hit += 1

    await wait(0.5)

    await heal_hp(unit, 5 * enemies_hit)


    await wait(0.2)

func double_team(unit):
    if unit.pp < 2: return
    globals.battle.show_action_name(unit, "Double Team")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.recorded_data["dodges"] += 1


func triple_team(unit):
    if unit.pp < 3: return
    globals.battle.show_action_name(unit, "Triple Team")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    unit.recorded_data["dodges"] += 3


func detect(unit):
    if unit.pp < 3: return
    if unit.recorded_data["protect"] > 0: return

    await show_effect_name(unit, "detect")

    unit.recorded_data["protect"] += 1


func barrier(unit):
    if unit.pp < 3: return
    if unit.recorded_data["protect"] > 0: return

    await show_effect_name(unit, "barrier")

    unit.recorded_data["protect"] += 1


func minimize(unit):
    if unit.pp < 2: return
    globals.battle.show_action_name(unit, "Minimize")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.recorded_data["dodges"] += 1


func mind_reader(unit):
    if unit.pp < 3: return
    globals.battle.show_action_name(unit, "Mind Reader")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    unit.recorded_data["dodges"] += 1


func light_ball(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Light Ball")
    await globals.battle.spend_point(unit, "pp", 3)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)
    unit.power *= 2

    await wait(0.65)

func rock_head(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Rock Head")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_def")


    globals.battle.hide_action_name(unit)
    unit.defense += 0.15

    await wait(0.65)

func shell_armor(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Shell Armor")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_def")


    globals.battle.hide_action_name(unit)
    unit.defense += 0.15

    await wait(0.65)

func iron_defense(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "iron_defense")

    unit.blink.play("mod_def")

    unit.defense += 0.2

    await wait(0.65)

func will_o_wisp(unit):
    if unit.pp < 3: return
    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Will-o-Wisp")
    await globals.battle.spend_point(unit, "pp", 3)


    globals.battle.hide_action_name(unit)

    var prev_target = globals.battle.current_target_unit
    globals.battle.current_target_unit = [globals.battle.current_target_unit[0]]
    await add_burn_15(unit)
    globals.battle.current_target_unit = prev_target

    await wait(0.4)

func recover(unit):
    if unit.cur_hp < 1: return
    if unit.cur_hp > (unit.max_hp / 2): return
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Recover")
    await globals.battle.spend_point(unit, "pp", 3)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    await anm_atk(unit, "ot_skill")
    heal_40pc(unit)

    await wait(0.8)

func regenerator(unit):
    if unit.cur_hp >= unit.max_hp: return
    if unit.pp < 1: return

    await show_effect_name(unit, "regenerator")

    var healing = roundi(unit.max_hp * 0.1)

    unit_heal(unit, healing)

    await wait(0.65)

func roost(unit):
    if unit.cur_hp < 1: return
    if unit.cur_hp > (unit.max_hp * 0.7): return
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Roost")
    await globals.battle.spend_point(unit, "pp", 2)
    await wait(0.3)
    globals.battle.hide_action_name(unit)

    await anm_atk(unit, "ot_rest")
    heal_30pc(unit)

    await wait(0.8)

func swift_swim(unit):
    if unit.pp < 2: return

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    var blue_count = 0
    for i in own_team:
        if i == null: continue
        if i == unit: continue
        if (i.team_slot in adj_allies or i == unit) and i.color == "blue":
            blue_count += 1
    if not blue_count: return

    globals.battle.show_action_name(unit, "Swift Swim")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_speed")


    globals.battle.hide_action_name(unit)
    unit.speed += 15 * blue_count

    await wait(0.65)

func chlorophyll(unit):
    if unit.pp < 2: return

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    var blue_count = 0
    for i in own_team:
        if i == null: continue
        if i == unit: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["green", "red"]:
            blue_count += 1
    if not blue_count: return

    globals.battle.show_action_name(unit, "Chlorophyll")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_speed")


    globals.battle.hide_action_name(unit)
    unit.speed += 15 * blue_count

    await wait(0.65)

func solar_power(unit):
    if unit.pp < 2: return

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    var blue_count = 0
    for i in own_team:
        if i == null: continue
        if i == unit: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["green", "red"]:
            blue_count += 1
    if not blue_count: return

    globals.battle.show_action_name(unit, "Solar Power")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)
    unit.power += 10 * blue_count

    await wait(0.65)

func speed_boost(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "speed_boost")

    unit.blink.play("mod_speed")


    globals.battle.hide_action_name(unit)
    unit.speed += 15

    await wait(0.65)

func water_veil(unit):
    unit.recorded_data["burn_immunity"] = true

func agility(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Agility")
    await globals.battle.spend_point(unit, "pp", 3)

    unit.blink.play("mod_speed")


    globals.battle.hide_action_name(unit)
    unit.speed += 30
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

func skull_bash_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, skull_bash_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack
    unit.selected_attack = "skull_bash_fire"

    globals.battle.current_delayed_actor = unit

    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func focus_punch_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, focus_punch_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack
    unit.selected_attack = "focus_punch_fire"

    globals.battle.current_delayed_actor = unit

    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func sky_attack_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, sky_attack_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack
    unit.selected_attack = "sky_attack_fire"

    globals.battle.current_delayed_actor = unit

    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func fly_fire(unit):
    unit.recorded_data["dodges"] = 0

    globals.battle.effects_in_play["on_round_end"].erase([unit, fly_fire])

    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    var prev_attack = unit.selected_attack
    globals.battle.current_delayed_actor = unit

    unit.selected_attack = "fly_fire"

    var direction = -1
    if unit.team == 2: direction = 1
    unit.z_index = 2

    globals.battle.show_action_name(unit, "Fly")
    await wait(0.4)

    var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", 
                            globals.battle.current_target_unit[0].position - Vector2(40 * direction, 0), 0.6)
    await wait(0.26)
    globals.battle.hide_action_name(unit)

    unit.signal_attack = false
    unit.player.play_backwards("ot_fly_charge")
    while true:
        if unit.signal_attack: break
        await wait(0.01)
        unit.get_node("Sprite/Sprite2D").visible = true

    globals.battle.deal_damage(unit)

    await wait(0.4)
    tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", unit.position + Vector2(60 * - direction, 0), 0.3)

    await globals.battle.trigger_after_attack_effects(unit, globals.battle.current_target_unit)

    while globals.battle.effect_triggering:
        await wait(0.1)

    await globals.battle.unit_retreat(unit, "run")
    unit.z_index = 0

    await globals.battle.trigger_after_retreat_effects(unit, globals.battle.current_target_unit)

    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null
    unit.temp_speed -= 100

func razor_wind_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, razor_wind_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack
    globals.battle.current_delayed_actor = unit

    unit.selected_attack = "razor_wind_fire"
    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func zap_cannon_fire(unit):
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    globals.battle.effects_in_play["on_round_end"].erase([unit, razor_wind_fire])

    if not check_if_targets_alive(): return
    var prev_attack = unit.selected_attack
    unit.selected_attack = "zap_cannon_fire"
    globals.battle.current_delayed_actor = unit

    await globals.battle.unit_action(unit, unit.recorded_data["target_memory"])
    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null

func dig_fire(unit):
    unit.recorded_data["dodges"] = 0
    globals.battle.effects_in_play["on_round_end"].erase([unit, dig_fire])
    globals.battle.current_target_unit = unit.recorded_data["target_memory"]

    var prev_attack = unit.selected_attack
    unit.selected_attack = "dig_fire"
    globals.battle.current_delayed_actor = unit

    globals.battle.show_action_name(unit, "Dig")
    await wait(0.8)
    globals.battle.hide_action_name(unit)

    var target = globals.battle.current_target_unit

    var direction = -1
    if unit.team == 2: direction = 1
    unit.z_index = 2

    var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", 
                            globals.battle.current_target_unit[0].position - Vector2(40 * direction, 0), 0.6)
    await wait(0.6)

    unit.player.speed_scale = 2
    unit.get_node("Sprite/Sprite2D").visible = true
    unit.signal_attack = false
    unit.player.play_backwards("ot_dig")
    while true:
        if unit.signal_attack: break
        await wait(0.01)

    globals.battle.deal_damage(unit)

    await wait(0.2)
    unit.player.speed_scale = 1
    tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", unit.position + Vector2(60 * - direction, 0), 0.3)

    await wait(0.6)
    await globals.battle.trigger_after_attack_effects(unit, target)

    await globals.battle.unit_retreat(unit, "run")
    unit.z_index = 0

    await globals.battle.trigger_after_retreat_effects(unit, target)

    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null
    unit.temp_speed -= 100

func shadow_force_fire(unit):
    unit.recorded_data["dodges"] = 0

    globals.battle.effects_in_play["on_round_end"].erase([unit, shadow_force_fire])

    globals.battle.current_target_unit = unit.recorded_data["target_memory"]
    var prev_attack = unit.selected_attack
    globals.battle.current_delayed_actor = unit

    unit.selected_attack = "shadow_force_fire"

    var direction = -1
    if unit.team == 2: direction = 1
    unit.z_index = 2

    globals.battle.show_action_name(unit, "Shadow Force")
    await wait(0.4)

    var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", 
                            globals.battle.current_target_unit[0].position - Vector2(90 * direction, 0), 0.5)



    await wait(0.26)
    globals.battle.hide_action_name(unit)

    unit.signal_attack = false
    unit.player.play("mt_shadow_force")
    while true:
        if unit.signal_attack: break
        await wait(0.01)

    globals.battle.deal_damage(unit)

    await wait(0.5)
    tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween.tween_property(unit, "position", unit.position + Vector2(60 * - direction, 0), 0.3)

    await globals.battle.trigger_after_attack_effects(unit, globals.battle.current_target_unit)

    while globals.battle.effect_triggering:
        await wait(0.1)

    await wait(0.3)
    await globals.battle.unit_retreat(unit, "run")
    unit.z_index = 0

    await globals.battle.trigger_after_retreat_effects(unit, globals.battle.current_target_unit)

    unit.recorded_data["target_memory"] = []
    unit.selected_attack = prev_attack
    globals.battle.current_delayed_actor = null
    unit.temp_speed -= 100


func mischief(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    globals.battle.show_action_name(unit, "Mischief")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)


    var target_slot_index
    if unit.team_slot < 3:
        target_slot_index = target_team.slice(0, 3).find(null)
    else:
        target_slot_index = target_team.slice(3, 6).find(null)
        if target_slot_index != -1: target_slot_index += 3

    if target_slot_index == -1:
        target_slot_index = target_team.find(null)

    var new_unit_dict = unit.unit_dict.duplicate()
    new_unit_dict["slot2_selected"] = 2
    new_unit_dict["bonus_health"] -= 15

    unit.player.play("ot_charge")
    await wait(0.4)

    globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
    globals.battle.unit_post_setup(target_team[target_slot_index])
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    if target_team[target_slot_index].max_hp < 1.0:
        target_team[target_slot_index].max_hp = 1.0
        target_team[target_slot_index].cur_hp = 1.0
    await wait(0.8)

func sand_attack(unit):
    if unit.pp < 2: return

    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Sand Attack")
    await globals.battle.spend_point(unit, "pp", 2)

    globals.battle.hide_action_name(unit)

    await anm_atk(unit, "mt_sneeze")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "Attack Down")
        i.power -= 10
        i.blink.play_backwards("mod_atk")

    await wait(0.6)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.3)

func poison_point(unit):

    if unit.pp < 2: return
    if globals.battle.current_act_unit == null or globals.battle.current_act_unit.cur_hp < 1: return
    if not check_if_targets_alive(): return


    globals.battle.show_action_name(unit, "Poison Point")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    var target = globals.battle.current_act_unit
    if target == null: target = globals.battle.current_delayed_actor

    await globals.battle.apply_burn([target], 15)
    await wait(0.2)

func feather_dance(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Feather Dance")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            i.power -= 10
            i.blink.play_backwards("mod_atk")
            globals.battle.show_action_name(i, "Attack Down")

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func tailwind(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Tailwind")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            i.speed += 10
            i.blink.play("mod_speed")
            globals.battle.show_action_name(i, "Speed Up")

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func magnet_pull(unit):
    if unit.pp < 3: return

    var pulled_units = []
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    for i in target_team:
        if i == null: continue
        if i.team_slot in [4, 5, 6]: pulled_units.append(i)

    if pulled_units == []: return

    globals.battle.show_action_name(unit, "Magnet Pull")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    await wait(0.2)

    for i in pulled_units:
        if target_team[i.team_slot - 4] == null:
            target_team[i.team_slot - 1] = null

            i.team_slot -= 3
            var tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC)
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 1.4)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)
    update_row_targets(unit)

    await wait(1)

func bark(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Bark")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.current_target_unit:
        i.power -= 10
        i.blink.play_backwards("mod_atk")
        globals.battle.show_action_name(i, "Attack Down")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.3)

func pay_day(unit):

    if unit.pp < 3: return

    var selected_unit = unit
    var adj_allies = get_adjacent_allies(unit)

    for i in get_own_team(unit):
        if i == null: continue
        if i.team_slot in adj_allies and i.rarity >= selected_unit.rarity:
            selected_unit = i

    if selected_unit == null: return

    await show_effect_name(unit, "pay_day")
    globals.battle.hide_action_name(unit)


    selected_unit.ap += 1
    globals.battle.update_unit_ap(selected_unit)

    unit.player.play("ot_skill")
    unit.signal_attack = false
    while not unit.signal_attack:
        await wait(0.01)

    selected_unit.blink.play("mod_atk")
    globals.battle.show_action_name(selected_unit, "AP Up")
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = true

    var box = selected_unit.get_node("UnitUI/PointBar/APBox")
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    selected_unit.get_node("UnitUI/PointBar/APBox").get_child(-1).get_node("PointColor").color = Color(poke_types.colors["ap"])

    await wait(0.5)
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = false
    globals.battle.hide_action_name(selected_unit)

func energy_gift(unit):

    if unit.pp < 2: return

    var selected_unit = unit
    var adj_allies = get_adjacent_allies(unit)

    for i in get_own_team(unit):
        if i == null: continue
        if i.team_slot in adj_allies and i.rarity >= selected_unit.rarity:
            selected_unit = i

    if selected_unit == null: return

    await show_effect_name(unit, "energy_gift")
    globals.battle.hide_action_name(unit)


    selected_unit.ap += 1
    globals.battle.update_unit_ap(selected_unit)

    unit.player.play("ot_skill")
    unit.signal_attack = false
    while not unit.signal_attack:
        await wait(0.01)

    selected_unit.blink.play("mod_atk")
    globals.battle.show_action_name(selected_unit, "AP Up")
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = true

    var box = selected_unit.get_node("UnitUI/PointBar/APBox")
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    selected_unit.get_node("UnitUI/PointBar/APBox").get_child(-1).get_node("PointColor").color = Color(poke_types.colors["ap"])

    await wait(0.5)
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = false
    globals.battle.hide_action_name(selected_unit)

func present(unit):

    if unit.pp < 2: return

    var selected_unit = unit
    var adj_allies = get_adjacent_allies(unit)

    for i in get_own_team(unit):
        if i == null or i == unit: continue
        if i.team_slot in adj_allies and i.rarity >= selected_unit.rarity:
            selected_unit = i

    if selected_unit in [null, unit]: return

    await show_effect_name(unit, "present")
    globals.battle.hide_action_name(unit)


    selected_unit.ap += 1
    globals.battle.update_unit_ap(selected_unit)

    unit.player.play("ot_skill")
    unit.signal_attack = false
    while not unit.signal_attack:
        await wait(0.01)

    selected_unit.blink.play("mod_atk")
    globals.battle.show_action_name(selected_unit, "AP Up")
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = true

    var box = selected_unit.get_node("UnitUI/PointBar/APBox")
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    await globals.battle.blink_point(box, selected_unit.ap, Color(poke_types.colors["ap"]))
    selected_unit.get_node("UnitUI/PointBar/APBox").get_child(-1).get_node("PointColor").color = Color(poke_types.colors["ap"])

    await wait(0.5)
    selected_unit.get_node("UnitUI/PointBar/APBox").visible = false
    globals.battle.hide_action_name(selected_unit)

func reckless(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Reckless")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.power += 20
    unit.blink.play("mod_atk")

    await wait(0.25)
    globals.battle.show_action_name(unit, "Attack Up")

    globals.battle.effects_in_play["after_attacking"].append([unit, reckless_recoil])

    await wait(0.65)

    globals.battle.hide_action_name(unit)

    await wait(0.3)

func reckless_recoil(unit):
    await wait(0.25)

    globals.battle.show_action_name(unit, "Reckless")
    await wait(0.3)

    globals.battle.suffer_damage(unit, [roundi(unit.max_hp * 0.15), "none", 1])
    await wait(0.65)
    globals.battle.hide_action_name(unit)

func mach_punch(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Mach Punch")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "mach_punch"

    unit.get_node("AnimationPlayer").speed_scale = 3
    await globals.battle.execute_action(active["mach_punch"], unit)
    unit.get_node("AnimationPlayer").speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func bullet_punch(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "bullet_punch")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "bullet_punch"

    unit.get_node("AnimationPlayer").speed_scale = 3
    await globals.battle.execute_action(active["bullet_punch"], unit)
    unit.get_node("AnimationPlayer").speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func iron_fist(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Iron Fist")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)

    unit.power += 15

    await wait(0.65)

func counter(unit):
    if unit.pp < 3: return
    if get_acting_unit() == null: return

    await wait(0.3)

    globals.battle.show_action_name(unit, "Counter")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()


    globals.battle.current_target_unit = [get_acting_unit()]
    unit.selected_attack = "counter"

    active["counter"]["power"] = active[globals.battle.current_target_unit[0].selected_attack]["power"]

    await globals.battle.execute_action(active["counter"], unit)


    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func mirror_coat(unit):
    if unit.pp < 3: return
    if get_acting_unit() == null: return

    await wait(0.3)

    globals.battle.show_action_name(unit, "Mirror Coat")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()


    globals.battle.current_target_unit = [get_acting_unit()]
    unit.selected_attack = "counter"

    active["counter"]["power"] = active[globals.battle.current_target_unit[0].selected_attack]["power"]

    await globals.battle.execute_action(active["counter"], unit)


    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func dragon_dance(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Dragon Dance")
    await globals.battle.spend_point(unit, "pp", 3)

    await wait(0.2)
    globals.battle.show_action_name(unit, "ATK, SPD Up!")
    unit.blink.play("mod_atk")

    await wait(0.8)
    globals.battle.hide_action_name(unit)

    unit.power += 10
    unit.speed += 10

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

func quiver_dance(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Quiver Dance")
    await globals.battle.spend_point(unit, "pp", 2)
    delayed_hide_action_name([unit])


    await anm_atk(unit, "ot_sing")




    unit.blink.play("mod_atk")

    unit.power += 10
    unit.speed += 10

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

func ancient_power(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Ancient Power")
    await globals.battle.spend_point(unit, "pp", 3)

    globals.battle.show_action_name(unit, "ATK, DEF Up!")
    unit.blink.play("mod_atk")

    await wait(0.8)
    globals.battle.hide_action_name(unit)

    unit.power += 10
    unit.defense += 0.1


    await wait(0.65)

func cosmic_power(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Cosmic Power")
    await globals.battle.spend_point(unit, "pp", 3)

    globals.battle.show_action_name(unit, "ATK, DEF Up!")
    unit.blink.play("mod_atk")

    await wait(0.8)
    globals.battle.hide_action_name(unit)

    unit.power += 10
    unit.defense += 0.1


    await wait(0.65)

func calm_mind(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "calm_mind")
    unit.blink.play("mod_atk")
    await wait(0.2)

    globals.battle.show_action_name(unit, "ATK, DEF Up!")

    await wait(0.8)
    globals.battle.hide_action_name(unit)

    unit.power += 15
    unit.defense += 0.15


    await wait(0.65)

func coil(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "coil")
    await wait(0.4)
    globals.battle.show_action_name(unit, "ATK, DEF Up!")
    unit.blink.play("mod_atk")
    await wait(0.8)
    globals.battle.hide_action_name(unit)
    unit.power += 10
    unit.defense += 0.1

    await wait(0.65)

func tickle(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    globals.battle.show_action_name(unit, "Tickle")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    delayed_hide_action_name(globals.battle.current_target_unit)
    for i in globals.battle.current_target_unit:
        i.defense -= 0.15
        globals.battle.show_action_name(i, "Defense Down")
        i.blink.play_backwards("mod_def")

    await wait(0.8)

func petal_dance(unit):
    if unit.pp < 3: return

    var targetable_units = []
    var target_team = get_target_team(unit)


    if not check_if_front_row_empty(target_team):
        targetable_units = target_team.slice(0, 3)
    else:
        targetable_units = target_team.slice(3, 6)


    if targetable_units == [null, null, null]: return

    while null in targetable_units: targetable_units.erase(null)



    var target = targetable_units.pick_random()

    if target == null: return

    globals.battle.show_action_name(unit, "Petal Dance")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    globals.battle.current_target_unit = [target]



    var prev_selected = unit.selected_attack
    unit.selected_attack = "petal_dance"
    await globals.battle.unit_action(unit, [target])

    unit.selected_attack = prev_selected

func aromatherapy(unit):
    if unit.pp < 2: return

    var my_team = get_own_team(unit)

    var triggered = false
    for i in my_team:
        if i == null: continue
        if i.burn_amount > 0: triggered = true

    if not triggered: return

    globals.battle.show_action_name(unit, "Aromatherapy")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    for i in my_team:
        if i == null: continue
        if i.burn_amount > 0:
            heal_burn(i)

    await wait(0.8)

    for i in my_team:
        if i == null: continue
        globals.battle.hide_action_name(i)

    await wait(0.3)

func lunar_blessing(unit):
    if unit.pp < 3: return

    var my_team = get_own_team(unit)

    var triggered = false
    for i in my_team:
        if i == null: continue
        if i.burn_amount > 0 or i.cur_hp < i.max_hp: triggered = true

    if not triggered: return

    globals.battle.show_action_name(unit, "Lunar Blessing")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    for i in my_team:
        if i == null: continue
        if i.burn_amount > 0:
            heal_burn(i)

        if i.cur_hp < i.max_hp:
            heal_15pc(i)

    await wait(0.8)

    for i in my_team:
        if i == null: continue
        globals.battle.hide_action_name(i)

    await wait(0.3)

func acid_armor(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Acid Armor")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.defense += 0.2
    unit.blink.play("mod_def")

    await wait(0.3)

func amnesia(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Amnesia")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.defense += 0.15
    unit.blink.play("mod_def")

    await wait(0.3)

func teleport(unit):
    if unit.pp < 2: return



    if unit.team_slot + 3 > 6: return


    globals.battle.show_action_name(unit, "Teleport")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    unit.player.play("ot_teleport")
    await unit.player.animation_finished


    await switch_with_unit_behind(unit)

    unit.player.play_backwards("ot_teleport")
    await unit.player.animation_finished



func step_up(unit):
    if unit.pp < 2: return

    var target_team = get_own_team(unit)

    if unit.team_slot - 3 < 1 or target_team[unit.team_slot - 4] != null: return

    globals.battle.show_action_name(unit, "Step Up")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)

    var shoved_units = []

    if unit.team == 2: target_team = globals.battle.enemy_team

    if unit.team_slot in [4, 5, 6]: shoved_units.append(unit)

    for i in shoved_units:
        if target_team[i.team_slot - 4] == null:
            target_team[i.team_slot - 1] = null

            i.team_slot -= 3
            target_team[i.team_slot - 1] = i

            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]

    globals.battle.sort_by_speed(globals.battle.units_in_play)





func psychic_guard(unit):
    if unit.pp < 2: return

    if globals.battle.current_act_unit.rarity < 3: return

    globals.battle.show_action_name(unit, "Psychic Guard")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_def")

    unit.temp_defense += 0.5

    globals.battle.hide_action_name(unit)

    await wait(0.65)

func morning_sun(unit):
    if unit.pp < 2: return

    var lowest_hp_ally = get_lowest_hp_ally(unit)

    if lowest_hp_ally == null: return
    if lowest_hp_ally.cur_hp >= lowest_hp_ally.max_hp: return

    await show_effect_name(unit, "morning_sun")

    unit.signal_attack = false
    unit.player.play("ot_skill")
    while not unit.signal_attack:
        await wait(0.01)

    await heal_30pc(lowest_hp_ally)

func moonlight(unit):
    if unit.pp < 4: return
    if unit.cur_hp > unit.max_hp * 0.6: return






    await show_effect_name(unit, "moonlight")

    unit.signal_attack = false
    unit.player.play("ot_skill")
    while not unit.signal_attack:
        await wait(0.01)

    await heal_50pc(unit)

func dia(unit):
    if unit.pp < 2: return

    var lowest_hp_ally = get_lowest_hp_ally(unit)

    if lowest_hp_ally == null: return
    if lowest_hp_ally.cur_hp >= lowest_hp_ally.max_hp: return

    await show_effect_name(unit, "dia")

    unit.signal_attack = false
    unit.player.play("ot_skill")
    while not unit.signal_attack:
        await wait(0.01)

    await heal_30pc(lowest_hp_ally)

func media(unit):
    if unit.pp < 2: return






    var own_team = get_own_team(unit)
    var triggered = false

    for i in own_team:
        if i == null: continue
        if i.cur_hp < i.max_hp * 0.75:
            triggered = true
            break

    if not triggered: return

    await show_effect_name(unit, "media")

    unit.signal_attack = false
    unit.player.play("ot_skill")
    while not unit.signal_attack:
        await wait(0.01)

    for i in own_team:
        if i == null: continue
        heal_30pc(i)

    await wait(0.8)

func future_sight(unit):
    if unit.pp < 3: return

    var lowest_hp_enemy = get_lowest_hp_enemy(unit)

    if lowest_hp_enemy == null: return
    if lowest_hp_enemy.cur_hp < 1: return

    await show_effect_name(unit, "future_sight")


    lowest_hp_enemy.recorded_data["future_sight_damage"] = globals.battle.calculate_damage({"power": 40, "color": "none"}, unit, lowest_hp_enemy)

    globals.battle.effects_in_play["on_turn_start"].append([lowest_hp_enemy, future_sight_damage])
    unit.player.play("mt_shudder")

    await wait(0.8)

    globals.battle.show_action_name(lowest_hp_enemy, "Shuddered...")
    await wait(0.8)
    globals.battle.hide_action_name(lowest_hp_enemy, )

func future_sight_damage(unit):
    globals.battle.show_action_name(unit, "Future Sight")
    await wait(0.8)
    globals.battle.hide_action_name(unit)
    unit.blink.play("hurt")
    unit.player.play("ht_knocked")

    var damage = unit.recorded_data["future_sight_damage"]
    await globals.battle.suffer_damage(unit, damage)
    globals.battle.effects_in_play["on_turn_start"].erase([unit, future_sight_damage])
    await wait(1)

func doom_desire(unit):
    if unit.pp < 3: return

    var lowest_hp_enemy = get_lowest_hp_enemy(unit)

    if lowest_hp_enemy == null: return
    if lowest_hp_enemy.cur_hp < 1: return

    await show_effect_name(unit, "doom_desire")


    lowest_hp_enemy.recorded_data["future_sight_damage"] = globals.battle.calculate_damage({"power": 60, "color": "yellow"}, unit, lowest_hp_enemy)

    globals.battle.effects_in_play["on_turn_start"].append([lowest_hp_enemy, doom_desire_damage])
    unit.player.play("mt_shudder")

    await wait(0.8)

    globals.battle.show_action_name(lowest_hp_enemy, "Shuddered...")
    await wait(0.8)
    globals.battle.hide_action_name(lowest_hp_enemy, )

func doom_desire_damage(unit):
    globals.battle.show_action_name(unit, "Doom Desire")
    await wait(0.8)
    globals.battle.hide_action_name(unit)
    unit.blink.play("hurt")
    unit.player.play("ht_knocked")

    var damage = unit.recorded_data["future_sight_damage"]
    await globals.battle.suffer_damage(unit, damage)
    globals.battle.effects_in_play["on_turn_start"].erase([unit, doom_desire_damage])
    await wait(1)


func quick_attack(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "quick_attack")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "quick_attack"

    unit.player.speed_scale = 2
    await globals.battle.execute_action(active["quick_attack"], unit)
    unit.player.speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func extreme_speed(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Extreme Speed")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "extreme_speed"

    await globals.battle.execute_action(active["extreme_speed"], unit)


    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func aqua_jet(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "aqua_jet")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "quick_attack"

    unit.player.speed_scale = 2
    await globals.battle.execute_action(active["quick_attack"], unit)
    unit.player.speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func baton_pass(unit):
    if unit.pp < 3: return

    var column_ally = get_ally_in_column(unit)

    if column_ally == null: return
    if column_ally.played_turn: return
    if column_ally.waiting: return

    column_ally.temp_speed = unit.speed + unit.temp_speed + 1
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await show_effect_name(unit, "baton_pass")
    await anm_atk(unit, "ot_sing")

    globals.battle.show_action_name(column_ally, "Early Turn")
    column_ally.player.play("ot_skill")
    await wait(0.8)
    globals.battle.hide_action_name(column_ally)

func multiscale(unit):
    if unit.pp < 3: return
    if unit.cur_hp < unit.max_hp: return

    globals.battle.show_action_name(unit, "Multiscale")
    await globals.battle.spend_point(unit, "pp", 3)

    unit.blink.play("mod_def")


    globals.battle.hide_action_name(unit)
    unit.temp_defense += 0.5

    await wait(0.65)

func eternal_punishment(unit):
    if unit.pp < 4: return
    if not check_if_targets_alive(): return

    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.burn_amount > 0 and i.cur_hp > 0:
            triggered = true
    if not triggered: return

    await show_effect_name(unit, "eternal_punishment")

    unit.player.play("ot_charge")
    await wait(0.3)

    for i in globals.battle.current_target_unit:
        if i == null: continue
        if i.cur_hp < 1: continue
        if i.recorded_data["burn_immunity"]: continue
        if i.burn_amount == 0: continue
        globals.battle.show_action_name(i, "Perma Burned")
        i.blink.play("burn")

        i.recorded_data["perma_burned"] = true

    await wait(0.8)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func payback(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "payback")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "payback"

    await globals.battle.execute_action(active["payback"], unit)

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func beat_up(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "beat_up")

    var prev_selected_attack = unit.selected_attack
    var prev_unit = get_acting_unit()

    globals.battle.current_act_unit = unit

    unit.selected_attack = "beat_up"

    await globals.battle.unit_approach(unit, "run", false)
    await globals.battle.execute_action(active["beat_up"], unit)
    await globals.battle.unit_retreat(unit, "run")

    globals.battle.current_act_unit = prev_unit
    unit.selected_attack = prev_selected_attack


func no_guard(unit):
    if unit.pp < 2: return

    var triggered = false
    for i in globals.battle.current_target_unit:
        if i.recorded_data["dodges"] > 0 or i.recorded_data["protect"] > 0:
            triggered = true
    if not triggered: return

    await show_effect_name(unit, "no_guard")

    for i in globals.battle.current_target_unit:
        if i.recorded_data["dodges"] > 0 or i.recorded_data["protect"] > 0:
            i.recorded_data["dodges"] = 0
            i.recorded_data["protect"] = 0
            i.blink.play_backwards("mod_speed")

    await wait(0.65)

func bulk_up(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "bulk_up")

    unit.blink.play("mod_def")
    await wait(0.2)
    globals.battle.show_action_name(unit, "DEF Up!")


    await wait(0.8)
    globals.battle.hide_action_name(unit)


    unit.defense += 0.2

    await wait(0.65)

func flame_body(unit):
    unit.recorded_data["flame_body"] = true

func life_dew(unit):
    if unit.pp < 2: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if i.team_slot in adj_allies:
            if i.cur_hp < i.max_hp:
                healed_units.append(i)

    if healed_units == []: return

    await show_effect_name(unit, "life_dew")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        unit_heal(i, 20)

    await wait(0.6)

func aqua_ring(unit):
    if unit.pp < 2: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["blue", "white"]:
            if i.cur_hp < i.max_hp:
                healed_units.append(i)

    if healed_units == []: return


    await show_effect_name(unit, "aqua_ring")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        unit_heal(i, roundi(i.max_hp * 0.2))

    await wait(0.6)

func colony(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    await show_effect_name(unit, "colony")

    for i in range(2):
        if target_team.find(null) == -1: return

        var target_slot_index
        if unit.team_slot < 3:
            target_slot_index = target_team.slice(0, 3).find(null)
        else:
            target_slot_index = target_team.slice(3, 6).find(null)
            if target_slot_index != -1: target_slot_index += 3

        if target_slot_index == -1:
            target_slot_index = target_team.find(null)

        var new_unit_dict = globals.generate_pokemon("zubat", ceil(unit.level / 2))


        globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
        globals.battle.unit_post_setup(target_team[target_slot_index])

    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.8)

func spook(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "spook")
    unit.player.play("ot_charge")
    await wait(0.3)

    var target_team = get_target_team(unit)

    var switched_units = []

    for i in globals.battle.current_target_unit:
        if i.cur_hp > 0:
            switched_units.append(i)

        if i.team_slot <= 3:
            if target_team[i.team_slot + 2] != null:
                switched_units.append(target_team[i.team_slot + 2])
        else:
            if target_team[i.team_slot - 4] != null:
                switched_units.append(target_team[i.team_slot - 4])

    for i in switched_units:
        i.player.play("ot_spooked")
    await wait(0.3)

    for i in switched_units:
        if i == null: continue
        if i.team_slot <= 3:
            i.team_slot += 3
        else:
            i.team_slot -= 3


        var tween = get_tree().create_tween()
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 0.3)

    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func spiky_shield(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "spiky_shield")

    var enemy = get_acting_unit()

    if enemy == null: return

    globals.battle.suffer_damage(enemy, [roundi(enemy.max_hp * 0.15), "none", 1])

    await wait(0.3)

func warmth(unit):
    if unit.pp < 2: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["red", "green"]:
            if i.cur_hp < i.max_hp:
                healed_units.append(i)

    if healed_units == []: return


    await show_effect_name(unit, "warmth")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        unit_heal(i, roundi(i.max_hp * 0.2))

    await wait(0.6)

func synthesis(unit):
    if unit.pp < 2: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["white", "green"]:
            if i.cur_hp < i.max_hp:
                healed_units.append(i)

    if healed_units == []: return


    await show_effect_name(unit, "synthesis")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        unit_heal(i, roundi(i.max_hp * 0.2))

    await wait(0.6)

func hyper_cutter(unit):
    if unit.pp < 2: return

    if unit.power >= unit.original_power: return
    unit.power = unit.original_power

    await show_effect_name(unit, "hyper_cutter")
    unit.blink.play("mod_atk")

    await wait(0.6)

func shell_smash(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "shell_smash")

    globals.battle.show_action_name(unit, "Health Down")
    unit.blink.play_backwards("mod_def")
    globals.battle.setup_hp_dividers(unit)
    await unit.blink.animation_finished
    await wait(0.45)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.blink.play("mod_atk")

    unit.power += 30
    unit.max_hp -= 60
    if unit.max_hp < 5: unit.max_hp = 5
    unit.cur_hp = unit.max_hp
    globals.battle.setup_hp_dividers(unit)


    globals.battle.healthbar_damage(unit)

    await wait(0.6)
    globals.battle.hide_action_name(unit)

func volt_switch(unit):
    if unit.pp < 2: return
    if unit.team_slot > 3: return
    await show_effect_name(unit, "volt_switch")

    unit.player.play("ot_teleport")
    await unit.player.animation_finished
    await switch_with_unit_behind(unit)
    unit.player.play_backwards("ot_teleport")

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func u_turn(unit):
    if unit.pp < 2: return
    if unit.team_slot > 3: return
    await show_effect_name(unit, "u-turn")

    unit.player.play("ot_fly_charge")
    await wait(0.6)

    switch_with_unit_behind(unit)
    await wait(0.1)
    unit.player.play_backwards("ot_fly_charge")

    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await unit.player.animation_finished

func thunder_wave(unit):
    if unit.pp < 2: return

    if not check_if_targets_alive(): return

    await show_effect_name(unit, "thunder_wave")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 30
        i.blink.play_backwards("mod_speed")

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.3)

func toxic_spikes(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "toxic_spikes")
    await anm_atk(unit, "mt_sway")
    globals.battle.apply_burn(target_team, 10)

    await wait(0.8)

func anger_point(unit):
    if unit.pp < 2: return
    if unit.cur_hp > unit.max_hp / 3: return

    await show_effect_name(unit, "anger_point")
    unit.player.play("ot_angry")

    await wait(0.3)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 80

    await wait(0.7)

    globals.battle.hide_action_name(unit)
    await wait(0.3)

func belly_drum(unit):
    if unit.pp < 2: return
    if unit.cur_hp < floor(unit.max_hp / 2): return
    if unit.recorded_data.has("belly_drum"): return

    await show_effect_name(unit, "belly_drum")
    unit.power *= 2

    unit.player.play("ot_skill")
    unit.recorded_data["belly_drum"] = true
    await wait(0.55)
    globals.battle.suffer_damage(unit, [floori(unit.max_hp / 2), "none", 1])

    await wait(0.7)
    globals.battle.show_action_name(unit, "Attack Soars")
    unit.blink.play("mod_atk")
    await wait(0.8)
    globals.battle.hide_action_name(unit)

func leftovers(unit):
    if unit.pp < 1: return
    if unit.cur_hp >= unit.max_hp: return

    await show_effect_name(unit, "leftovers")

    await anm_atk(unit, "ot_skill")
    unit_heal(unit, 10)
    await wait(0.4)

func ice_body(unit):
    if unit.pp < 2: return
    if unit.cur_hp >= unit.max_hp: return

    await show_effect_name(unit, "ice_body")

    await anm_atk(unit, "ot_skill")
    unit_heal(unit, round(unit.max_hp * 0.1))
    await wait(0.4)

func healing_touch(unit):
    if unit.pp < 2: return

    var selected_unit = unit
    var adj_allies = get_adjacent_allies(unit)

    for i in get_own_team(unit):
        if i == null: continue
        if i == unit: continue
        if i.team_slot in adj_allies and i.cur_hp / i.max_hp <= selected_unit.cur_hp / selected_unit.max_hp:
            selected_unit = i

    if selected_unit == unit: return
    if selected_unit.cur_hp / selected_unit.max_hp == 1.0: return

    await show_effect_name(unit, "healing_touch")

    unit.player.play("ot_skill")
    unit.signal_attack = false
    while not unit.signal_attack:
        await wait(0.01)

    unit_heal(selected_unit, 25)
    await wait(0.6)

func wish_trigger(unit):
    globals.battle.effects_in_play["on_round_end"].erase([unit, wish_trigger])


    globals.battle.show_action_name(unit, "Wish")
    await wait(0.6)
    heal_70pc(unit)
    await wait(0.6)
    globals.battle.hide_action_name(unit)

func helping_hand(unit):
    if unit.pp < 2: return
    if globals.battle.helping_hand: return

    globals.battle.helping_hand = true
    await show_effect_name(unit, "helping_hand")

    globals.battle.units_out_of_place.append(unit)
    var direction = 1
    if unit.team == 2: direction = -1

    var target = get_acting_unit()

    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(unit, "position", target.position + Vector2(100 * direction, 0), 0.4)

    await wait(0.6)
    await anm_atk(unit, "ot_skill")

    globals.battle.damage_mod += 0.3

    target.blink.play("mod_atk")
    await wait(0.65)

func dark_sutra(unit):
    if unit.pp < 3: return
    if globals.battle.helping_hand: return
    var target = get_acting_unit()
    if target.color != "black": return

    globals.battle.helping_hand = true
    await show_effect_name(unit, "dark_sutra")

    globals.battle.units_out_of_place.append(unit)
    var direction = 1
    if unit.team == 2: direction = -1

    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(unit, "position", target.position + Vector2(100 * direction, 0), 0.4)

    await wait(0.6)
    await anm_atk(unit, "ot_skill")

    globals.battle.damage_mod += 0.5

    target.blink.play("mod_atk")
    await wait(0.65)

func download(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "download")

    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()

    new_sprite.z_index = 99
    new_sprite.position.y -= 90
    new_sprite.scale = Vector2(-2, -2)
    new_sprite.self_modulate = Color("#ffffffc8")
    new_sprite.get_node("BlinkTexture").color = Color("#ffffff23")
    new_sprite.frame = globals.battle.current_target_unit[0].get_node("Sprite/Sprite2D").frame


    unit.add_child(new_sprite)
    download_blink(new_sprite)
    var tween = get_tree().create_tween()
    tween.tween_property(new_sprite, "position", Vector2(0, -28), 1.2)

    unit.player.play("ot_charge")
    await wait(1.2)
    var target = get_acting_unit()

    target.temp_power += 20
    target.blink.play("mod_atk")
    await wait(0.9)

func download_blink(sprite):
    for i in range(3):
        var tween = get_tree().create_tween()
        tween.tween_property(sprite.get_node("BlinkTexture"), "color", Color("#ffffff50"), 0.2)
        tween.tween_property(sprite.get_node("BlinkTexture"), "color", Color("#ffffff23"), 0.2)
        await wait(0.4)

    var tween2 = get_tree().create_tween()
    tween2.tween_property(sprite.get_node("BlinkTexture"), "color", Color("#ffffff"), 0.4)
    tween2.tween_property(sprite, "self_modulate", Color("#ffffff00"), 0.4)
    await wait(1)
    sprite.queue_free()

func magic_guard(unit):
    unit.recorded_data["burn_immunity"] = true

func leaf_guard(unit):
    unit.recorded_data["burn_immunity"] = true

func rest(unit):
    if unit.pp < 3: return
    if unit.cur_hp > unit.max_hp / 2: return

    await show_effect_name(unit, "rest")
    unit.skip_turn = true

    await anm_atk(unit, "ot_rest")
    unit_heal(unit, roundi(unit.max_hp))
    await wait(1.3)

func swarm(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    await show_effect_name(unit, "swarm")

    for i in range(2):
        if target_team.find(null) == -1: return

        var target_slot_index
        if unit.team_slot < 3:
            target_slot_index = target_team.slice(0, 3).find(null)
        else:
            target_slot_index = target_team.slice(3, 6).find(null)
            if target_slot_index != -1: target_slot_index += 3

        if target_slot_index == -1:
            target_slot_index = target_team.find(null)

        var new_unit_dict = globals.generate_pokemon("beedrill", unit.level)
        new_unit_dict["slot2_selected"] = 2
        new_unit_dict["bonus_power"] = -10
        new_unit_dict["bonus_health"] = -20

        unit.player.play("ot_charge")
        await wait(0.4)

        globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
        globals.battle.unit_post_setup(target_team[target_slot_index])


    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.8)

func parental_bond(unit):
    if unit.get_node("Sprite/Sprite2D").frame == 158: return
    if unit.pp < 3: return

    await show_effect_name(unit, "parental_bond")

    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()

    new_sprite.frame = 158

    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    new_sprite.self_modulate = Color("#ffffff00")
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    var tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("#ffffff"), 0.4)
    await wait(0.4)

    tween = get_tree().create_tween()
    tween.tween_property(new_sprite, "self_modulate", Color("#ffffff"), 0.4)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff00"), 0.2)



    await wait(0.4)

    var tween2 = get_tree().create_tween()
    tween2.tween_property(new_sprite.get_node("BlinkTexture"), "color", Color("#ffffff00"), 0.3)

    unit.power += 20

    await wait(0.51)
    unit.player.play("RESET")
    unit.get_node("Sprite/Sprite2D").frame = 158
    unit.get_node("Sprite/Sprite2D").self_modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D/BlinkTexture").color = Color("#ffffff00")
    unit.get_node("Sprite/Sprite2D").scale = Vector2(4, 4)
    new_sprite.queue_free()

func sucker_punch(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "sucker_punch")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "sucker_punch"

    unit.get_node("AnimationPlayer").speed_scale = 3
    await globals.battle.execute_action(active["sucker_punch"], unit)
    unit.get_node("AnimationPlayer").speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func cavalry(unit):
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "cavalry")

    var prev_selected_attack = unit.selected_attack
    var prev_unit = globals.battle.current_act_unit
    var prev_target = globals.battle.current_target_unit.duplicate()
    globals.battle.current_target_unit = [globals.battle.current_target_unit[0]]

    globals.battle.current_act_unit = unit

    unit.selected_attack = "cavalry"

    await globals.battle.unit_approach(unit, "run", false)
    await globals.battle.execute_action(active["cavalry"], unit)
    await globals.battle.unit_retreat(unit, "run")

    globals.battle.current_target_unit = prev_target
    globals.battle.current_act_unit = prev_unit
    unit.selected_attack = prev_selected_attack


func conversion2(unit):
    if unit.pp < 1: return

    var target = get_acting_unit()

    var attack_color = active[target.selected_attack]["color"]
    var conversion_color = ""

    if attack_color == "none":
        attack_color = target.color

    for i in poke_types.affinity[attack_color]:
        if poke_types.affinity[attack_color][i] == poke_types.weak:
            conversion_color = i
            break

    if conversion_color == unit.color: return

    await show_effect_name(unit, "conversion2")

    unit.color = conversion_color
    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)

    await globals.battle.switch_attack_ui(unit)
    globals.battle.switch_attack_ui(unit)

    await anm_atk(unit, "ot_skill")

    conversion_blink(unit)
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    globals.battle.show_action_name(unit, "Color Changed")
    await wait(0.65)
    globals.battle.hide_action_name(unit)

func conversion_blink(unit):
    for i in range(8):
        unit.get_node("UnitUI/ColorIcon").visible = false
        await wait(0.02)
        unit.get_node("UnitUI/ColorIcon").visible = true
        await wait(0.02)

func color_change(unit):
    if unit.pp < 2: return
    var target = get_acting_unit()
    var attack_color = active[target.selected_attack]["color"]
    var conversion_color = ""

    if attack_color == "none":
        attack_color = target.color

    for i in poke_types.affinity[attack_color]:
        if poke_types.affinity[attack_color][i] == poke_types.weak:
            conversion_color = i
            break

    if conversion_color == unit.color: return

    await show_effect_name(unit, "color_change")

    unit.color = conversion_color
    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)

    await globals.battle.switch_attack_ui(unit)


    await anm_atk(unit, "ot_skill")

    conversion_blink(unit)
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    globals.battle.show_action_name(unit, "Color Changed")
    await wait(0.65)
    globals.battle.hide_action_name(unit)

func forest_curse(unit):
    if unit.pp < 2: return
    var target = globals.battle.current_target_unit[0]













    await show_effect_name(unit, "forest_curse")

    target.color = "green"
    globals.battle.setup_attack_data(target, unit.atk1, 1)
    globals.battle.setup_attack_data(target, unit.atk2, 2)

    await globals.battle.switch_attack_ui(target)


    anm_atk(unit, "ot_charge")
    await wait(0.4)
    conversion_blink(target)
    target.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    globals.battle.show_action_name(target, "Color Changed")
    await wait(0.9)
    globals.battle.hide_action_name(target)

func electromagnetism(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    await show_effect_name(unit, "electromagnetism")

    if target_team.find(null) == -1: return

    var target_slot_index

    if target_team.slice(0, 3).find(null) != -1:
        target_slot_index = target_team.slice(0, 3).find(null)
    else:
        target_slot_index = target_team.find(null)

    if target_slot_index == -1:
        target_slot_index = target_team.find(null)

    var new_unit_dict = globals.generate_pokemon("minun", unit.level)


    globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
    globals.battle.unit_post_setup(target_team[target_slot_index])
    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.8)

func overgrowth(unit):
    if unit.pp < 3: return
    if unit.cur_hp > unit.max_hp * 0.3: return

    await show_effect_name(unit, "overgrowth")
    unit.blink.play("mod_atk")
    await wait(0.2)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 30

    await wait(0.6)

    globals.battle.hide_action_name(unit)
    await wait(0.3)

func blaze(unit):
    if unit.pp < 3: return
    if unit.cur_hp > unit.max_hp * 0.3: return

    await show_effect_name(unit, "blaze")
    unit.blink.play("mod_atk")
    await wait(0.2)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 30

    await wait(0.6)

    globals.battle.hide_action_name(unit)
    await wait(0.3)

func torrent(unit):
    if unit.pp < 3: return
    if unit.cur_hp > unit.max_hp * 0.3: return

    await show_effect_name(unit, "torrent")
    unit.blink.play("mod_atk")
    await wait(0.2)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 30

    await wait(0.6)

    globals.battle.hide_action_name(unit)
    await wait(0.3)

func spider_web(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Spider Web")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            i.speed -= 15
            i.blink.play_backwards("mod_speed")
            globals.battle.show_action_name(i, "Speed Down")

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team != unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func illuminate(unit):
    if unit.pp < 3: return

    globals.battle.show_action_name(unit, "Illuminate")
    await globals.battle.spend_point(unit, "pp", 3)
    globals.battle.hide_action_name(unit)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            i.speed += 10
            i.blink.play("mod_speed")
            globals.battle.show_action_name(i, "Speed Up")

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func premonition(unit):
    if unit.pp < 4: return
    await show_effect_name(unit, "premonition")

    await anm_atk(unit, "mt_shudder")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "Dodge Up")
        i.blink.play("mod_speed")
        i.recorded_data["dodges"] += 1

    await wait(0.7)
    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func cotton_spore(unit):
    if unit.pp < 3: return

    if not check_if_targets_alive(): return

    await show_effect_name(unit, "cotton_spore")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "Speed Down")
        i.speed -= 40
        i.blink.play_backwards("mod_speed")

    await wait(0.4)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.3)

func huge_power(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "huge_power")

    unit.blink.play("mod_atk")


    unit.power *= 2

    await wait(0.65)

func drizzle(unit):
    if unit.pp < 4: return

    await show_effect_name(unit, "drizzle")

    for i in globals.battle.units_in_play:
        if i.team == unit.team and i.color == "blue":
            i.power += 15
            i.blink.play("mod_atk")
            globals.battle.show_action_name(i, "Attack Up")

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func drought(unit):
    if unit.pp < 4: return

    await show_effect_name(unit, "drought")

    for i in globals.battle.units_in_play:
        if i.team == unit.team and i.color == "red":
            i.power += 15
            i.blink.play("mod_atk")
            globals.battle.show_action_name(i, "Attack Up")

    await wait(0.65)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)

    await wait(0.3)

func run_away(unit):
    if unit.pp < 2: return
    if unit.team_slot > 3: return
    await show_effect_name(unit, "run_away")


    await switch_with_unit_behind(unit)


    globals.battle.sort_by_speed(globals.battle.units_in_play)

func sunny_day(unit):
    if unit.pp < 3: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["red", "green"]:
            healed_units.append(i)

    if healed_units == []: return


    await show_effect_name(unit, "sunny_day")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        i.power += 10
        i.blink.play("mod_atk")
        globals.battle.show_action_name(i, "Attack Up")

    await wait(0.7)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)
    await wait(0.5)

func rain_dance(unit):
    if unit.pp < 3: return

    var healed_units = []

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies or i == unit) and i.color in ["blue", "yellow"]:
            healed_units.append(i)

    if healed_units == []: return


    await show_effect_name(unit, "rain_dance")
    await anm_atk(unit, "ot_skill")

    for i in healed_units:
        i.power += 10
        i.blink.play("mod_atk")
        globals.battle.show_action_name(i, "Attack Up")

    await wait(0.7)

    for i in globals.battle.units_in_play:
        if i.team == unit.team:
            globals.battle.hide_action_name(i)
    await wait(0.5)

func charge(unit):
    if unit.pp < 2: return

    var yellows = 0
    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies) and i.color in ["yellow"]:
            yellows += 1

    if yellows == 0: return

    await show_effect_name(unit, "charge")
    await anm_atk(unit, "mt_sneeze")

    unit.power += 15 * yellows
    unit.blink.play("mod_atk")
    globals.battle.show_action_name(unit, "Attack Up")

    await wait(0.7)

    globals.battle.hide_action_name(unit)
    await wait(0.4)

func torment(unit):
    if globals.battle.current_target_unit == []: return
    if unit.cur_hp < 1: return
    if globals.battle.current_target_unit[0].pp < 1: return
    if unit.pp < 2: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "torment")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "PP Down")
        globals.battle.spend_point(i, "pp", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(0.7)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func mind_games(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "mind_games")



    if unit.team_slot <= 3:
        await switch_with_unit_behind(unit)
    else:
        await switch_with_unit_in_front(unit)


    globals.battle.sort_by_speed(globals.battle.units_in_play)

func trick_room(unit):
    if globals.battle.trick_room: return
    if unit.pp < 3: return
    await show_effect_name(unit, "trick_room")

    globals.battle.trick_room = true
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    unit.player.play("ot_charge")
    await wait(0.5)
    globals.battle.show_action_name(unit, "Slow becomes fast!")
    await wait(1.5)
    globals.battle.hide_action_name(unit)

func spikes(unit):
    if unit.pp < 2: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "spikes")
    await anm_atk(unit, "mt_sway")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [7, "none", 1])


    await wait(0.65)

func self_destruct(unit):
    if unit.pp < 3: return
    if unit.cur_hp > unit.max_hp * 0.2: return

    await show_effect_name(unit, "self-destruct")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "self-destruct"
    await globals.battle.execute_action(active["self-destruct"], unit)

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func stealth_rock(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "stealth_rock")
    await anm_atk(unit, "mt_shake")

    globals.battle.suffer_damage(get_acting_unit(), [15, "none", 1])


    await wait(0.65)

func iron_barbs(unit):
    if unit.pp < 1: return

    await show_effect_name(unit, "iron_barbs")
    await anm_atk(unit, "mt_shake")

    globals.battle.suffer_damage(get_acting_unit(), [12, "none", 1])


    await wait(0.65)

func power_trick(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "power_trick")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Health Plummets")
    unit.blink.play_backwards("mod_def")

    unit.max_hp = 20.0
    if unit.cur_hp > 20.0: unit.cur_hp = 20.0
    globals.battle.healthbar_damage(unit)
    globals.battle.setup_hp_dividers(unit)
    unit.power += 70
    await wait(1)
    globals.battle.hide_action_name(unit)
    await wait(0.2)

    globals.battle.show_action_name(unit, "Attack Soars")
    unit.blink.play("mod_atk")

    await wait(1)
    globals.battle.hide_action_name(unit)

func milk_drink(unit):
    if unit.pp < 3: return

    var lowest_hp_ally = get_lowest_hp_adjacent_ally(unit)

    if lowest_hp_ally == null:
        lowest_hp_ally = unit

    if lowest_hp_ally.cur_hp >= lowest_hp_ally.max_hp: return

    await show_effect_name(unit, "milk_drink")

    await anm_atk(unit, "ot_skill")

    await heal_30pc(lowest_hp_ally)

func sand_stream(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "sand_stream")
    await anm_atk(unit, "mt_sneeze")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [roundi(15 * poke_types.affinity[i.color]["red"]), "red", poke_types.affinity[i.color]["red"]])

    await wait(0.65)

func sandstorm(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "sandstorm")
    await anm_atk(unit, "mt_sneeze")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [roundi(10 * poke_types.affinity[i.color]["red"]), "red", poke_types.affinity[i.color]["red"]])

    await wait(0.65)

func hail(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "hail")
    await anm_atk(unit, "mt_sneeze")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [roundi(10 * poke_types.affinity[i.color]["blue"]), "blue", poke_types.affinity[i.color]["blue"]])

    await wait(0.65)

func makiu_mist(unit):
    if unit.pp < 1: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "makiu_mist")
    await anm_atk(unit, "mt_sneeze")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [roundi(10 * poke_types.affinity[i.color]["yellow"]), "yellow", poke_types.affinity[i.color]["yellow"]])

    await wait(0.65)

func conqueror(unit):
    if unit.pp < 3: return
    if unit != globals.battle.current_act_unit: return

    await wait(0.4)
    await show_effect_name(unit, "conqueror")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 20
    unit.blink.play("mod_atk")

    await wait(1)
    globals.battle.hide_action_name(unit)
    await wait(0.3)

func solid_rock(unit):
    if unit.pp < 2: return

    var active_move_color = active[globals.battle.current_act_unit.selected_attack]["color"]
    if active_move_color == "none": active_move_color = globals.battle.current_act_unit.color

    if poke_types.affinity[unit.color][active_move_color] != poke_types.weak: return


    await show_effect_name(unit, "solid_rock")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Defense Up")
    unit.temp_defense += 0.25
    unit.blink.play("mod_def")

    await wait(0.65)

    globals.battle.hide_action_name(unit)

func canvas(unit):
    if not unit.recorded_data.has("sketched"): return
    if unit.recorded_data["sketched"] == null: return

    var copied_passive = unit.recorded_data["sketched"]["dex"]["slot2"][unit.recorded_data["sketched"]["slot2_selected"]]
    if copied_passive == "none": return

    await wait(0.3)
    globals.battle.show_action_name(unit, "Canvas")
    await wait(0.8)
    globals.battle.hide_action_name(unit)

    unit.recorded_data["sketched"] = null

    var new_attack = copied_passive

    globals.battle.effects_in_play["after_attacking"].erase([unit, moves.passive[unit.passive]["effect"]])

    unit.passive = new_attack
    unit.unit_dict["dex"]["slot2"][unit.unit_dict["slot2_selected"]] = new_attack

    globals.battle.effects_in_play[moves.passive[unit.passive]["trigger"]].append([unit, moves.passive[unit.passive]["effect"]])

    await anm_atk(unit, "ot_skill")
    globals.battle.show_action_name(unit, "Copied {0}".format([passive[new_attack]["name"]]))
    await wait(1)
    globals.battle.hide_action_name(unit)

func nightmare(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "nightmare")
    unit.player.play("ot_charge")

    await wait(0.4)

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [12, "none", 1])

    await wait(0.65)

func trick(unit):
    if unit.pp < 4: return

    await show_effect_name(unit, "trick")

    invert_rows(unit)
    await wait(0.65)

func endure(unit):
    if unit.pp < 3: return
    if unit == get_acting_unit(): return
    await wait(1)

    await show_effect_name(unit, "endure")
    await anm_atk(unit, "ot_skill")

    unit.cur_hp = 1
    globals.battle.healthbar_damage(unit)

    unit.blink.play("heal")

    await wait(0.65)

func howl(unit):
    if unit.pp < 2: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    globals.battle.show_action_name(unit, "Howl")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)


    var target_slot_index
    if unit.team_slot < 3:
        target_slot_index = target_team.slice(0, 3).find(null)
    else:
        target_slot_index = target_team.slice(3, 6).find(null)
        if target_slot_index != -1: target_slot_index += 3

    if target_slot_index == -1:
        target_slot_index = target_team.find(null)

    var new_unit_dict = globals.generate_pokemon("poochyena", unit.level)

    unit.player.play("ot_charge")
    await wait(0.4)

    globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
    globals.battle.unit_post_setup(target_team[target_slot_index])

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.8)

func rain_dish(unit):
    if unit.pp < 1: return
    if unit.cur_hp >= unit.max_hp: return

    var adj_allies = get_adjacent_allies(unit)
    var own_team = get_own_team(unit)

    var triggered = false
    for i in own_team:
        if i == null: continue
        if (i.team_slot in adj_allies) and i.color == "blue":
            triggered = true
    if not triggered: return

    await show_effect_name(unit, "rain_dish")

    await anm_atk(unit, "ot_skill")
    unit_heal(unit, roundi(unit.max_hp * 0.1))
    await wait(0.4)

func permadeath(unit):
    if unit.pp < 1: return
    await wait(1.2)

    await show_effect_name(unit, "permadeath")
    await wait(0.4)


    await globals.battle.speak(unit, ["I believe...", "This is all happening for a reason."])









    if unit.team == 1:
        globals.battle.player_team_copy[globals.battle.player_team_copy.find(unit)] = null
        globals.player_data.player_box.erase(unit.unit_dict)
        globals.player_data.player_party[globals.player_data.player_party.find(unit.unit_dict)] = null

func intimidate(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "intimidate")

    var target_team = get_target_team(unit)

    unit.player.play("ot_charge")
    await wait(0.4)


    for i in target_team:
        if i == null: continue
        i.power -= roundi(i.power * 0.1)
        globals.battle.show_action_name(i, "Attack Down")
        i.blink.play_backwards("mod_atk")

    await wait(0.8)

    for i in target_team:
        if i == null: continue
        globals.battle.hide_action_name(i)

func spore(unit):
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].cur_hp < 1: return
    if globals.battle.current_target_unit[0].ap < 1: return
    if unit.pp < 2: return

    await show_effect_name(unit, "spore")

    await anm_atk(unit, "mt_sway")

    for i in globals.battle.current_target_unit:
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)
        i.blink.play_backwards("mod_def")
        break

    await wait(1)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

    await wait(0.65)

func truant(unit):
    if unit.pp < 1: return
    if unit.recorded_data.has("truant") and unit.recorded_data["truant"] == -1:
        unit.recorded_data["truant"] *= -1
        return

    if not unit.recorded_data.has("truant"):
        unit.recorded_data["truant"] = 1
        return
    else:
        unit.recorded_data["truant"] *= -1

    await show_effect_name(unit, "truant")
    await anm_atk(unit, "ot_rest")
    unit.skip_turn = true
    globals.battle.show_action_name(unit, "Lazy...")
    await wait(0.8)
    globals.battle.hide_action_name(unit)
    await wait(0.3)

func slow_start(unit):
    if unit.pp < 1: return
    if unit.recorded_data.has("slow_start"): return

    unit.recorded_data["slow_start"] = -1

    await show_effect_name(unit, "slow_start")
    unit.player.play("ot_charge")
    unit.skip_turn = true
    await wait(1.2)

func geomancy(unit):
    if not unit.recorded_data.has("geomancy") or unit.recorded_data.has("geomancy") and not unit.recorded_data.has("geomancy"):
        if unit.pp < 1: return
        unit.recorded_data["geomancy"] = true
        await show_effect_name(unit, "geomancy")
        await wait(0.3)
        globals.battle.show_action_name(unit, "Charging...")
        unit.player.play("ot_charge")
        unit.skip_turn = true
        await wait(1.2)
        globals.battle.hide_action_name(unit)
        return

    elif unit.recorded_data.has("geomancy") and unit.recorded_data["geomancy"]:
        unit.recorded_data["geomancy"] = false
        globals.battle.show_action_name(unit, "Geomancy")

        var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
        new_sprite.frame = unit.sprite_2d.frame
        if unit.team != 1:
            new_sprite.flip_h = true
        unit.add_child(new_sprite)

        unit.sprite_2d.frame = 1019

        var tween2 = get_tree().create_tween().set_parallel(true).set_ease(Tween.EASE_IN)
        tween2.tween_property(new_sprite, "self_modulate", Color(0.93, 0.502, 0.288, 0.0), 0.4)

        globals.battle.show_action_name(unit, "Power Blooms")

        await wait(0.6)
        globals.battle.hide_action_name(unit)
        unit.power += 40

func wonder_guard(unit):
    if unit.pp < 1: return
    var target = get_acting_unit()
    var attack_color = target.selected_attack

    if typeof(attack_color) == TYPE_STRING:
        attack_color = moves.active[attack_color]

    attack_color = attack_color["color"]
    if attack_color == "none":
        attack_color = target.color

    if poke_types.affinity[unit.color][attack_color] == poke_types.weak: return

    await show_effect_name(unit, "wonder_guard")
    unit.blink.play("mod_def")
    unit.temp_defense += 99999999999

    await wait(0.65)

func screech(unit):
    if unit.pp < 3: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "screech")
    await anm_atk(unit, "mt_shudder")

    for i in globals.battle.current_target_unit:
        if i == null: continue
        globals.battle.show_action_name(i, "Defense Down")
        i.defense -= 0.25
        i.blink.play_backwards("mod_def")

    await wait(0.65)

    for i in globals.battle.current_target_unit:
        globals.battle.hide_action_name(i)

func fake_out(unit):
    if unit.pp < 3: return

    var target_team = get_target_team(unit)

    var rarest_enemy = ["enemy", 0]

    for i in target_team:
        if i == null: continue
        if i.skip_turn: continue
        if i.rarity > rarest_enemy[1]: rarest_enemy = [i, i.rarity]

    if rarest_enemy == ["enemy", 0]: return

    await show_effect_name(unit, "fake_out")

    var speed = 0.2
    var target_distance = 124
    var direction = -1
    if unit.team == 2:
        direction = 1

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(-8), 0.1)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4.5, 3.5), 0.15)
    await wait(0.2)

    tween = get_tree().create_tween().set_parallel(false)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(3.5, 4.5), 0.05)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "scale", Vector2(4, 4), 0.1)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "rotation", deg_to_rad(0), 0.05)

    var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_SINE)
    tween2.tween_property(unit, "position", 
                            rarest_enemy[0].position - Vector2(target_distance * direction, 0), speed)



    await anm_atk(unit, "mt_lunge")

    rarest_enemy[0].player.play("ht_knocked")
    globals.battle.show_action_name(rarest_enemy[0], "Flinched!")
    delayed_hide_action_name([rarest_enemy[0]])

    rarest_enemy[0].skip_turn = true

    await wait(1)

    globals.battle.unit_retreat(unit, "run")
    await wait(0.6)

func water_shuriken(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "water_shuriken")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "water_shuriken"

    unit.player.speed_scale = 2
    await globals.battle.execute_action(active["water_shuriken"], unit)
    unit.player.speed_scale = 1

    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func metal_burst(unit):
    if unit.pp < 4: return

    await wait(0.3)

    await show_effect_name(unit, "metal_burst")

    var prev_selected_attack = unit.selected_attack
    var prev_target = globals.battle.current_target_unit.duplicate()

    globals.battle.current_target_unit = [globals.battle.current_act_unit]
    if globals.battle.current_target_unit == [null]:
        globals.battle.current_target_unit = [globals.battle.current_delayed_actor]

    unit.selected_attack = "counter"

    active["counter"]["power"] = roundi(active[globals.battle.current_target_unit[0].selected_attack]["power"] * 1.5)

    await globals.battle.execute_action(active["counter"], unit)


    globals.battle.current_target_unit = prev_target
    unit.selected_attack = prev_selected_attack
    await wait(0.4)

func rough_skin(unit):

    if unit.pp < 1: return
    if globals.battle.current_act_unit == null or globals.battle.current_act_unit.cur_hp < 1: return
    if not check_if_targets_alive(): return
    await wait(0.6)

    await show_effect_name(unit, "rough_skin")

    var target = globals.battle.current_act_unit
    if target == null: target = globals.battle.current_delayed_actor

    await globals.battle.suffer_damage(target, [12, "none", 1])

    await wait(0.4)

func whirlpool(unit):
    if unit.pp < 3: return
    var target_team = get_target_team(unit)

    await show_effect_name(unit, "whirlpool")
    await anm_atk(unit, "mt_sneeze")

    for i in target_team:
        if i == null: continue
        globals.battle.suffer_damage(i, [5, "blue", poke_types.affinity[i.color]["blue"]])

    for i in target_team:
        if i == null: continue
        if i.team_slot == 6:
            i.team_slot = 1
        else:
            i.team_slot += 1


        var tween = get_tree().create_tween().set_trans(Tween.TRANS_BACK)
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 0.8)

    await wait(0.9)
    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    globals.battle.sort_by_speed(globals.battle.units_in_play)


    await wait(0.65)

func teeter_dance(unit):
    if unit.pp < 1: return

    await show_effect_name(unit, "teeter_dance")
    await anm_atk(unit, "ot_sing")

    var target_team = get_target_team(unit)
    var own_team = get_own_team(unit)

    var random_indexes = range(1, 7)
    random_indexes.shuffle()

    var cont = 0
    for i in target_team:
        if i == null: continue
        i.team_slot = random_indexes[cont]
        cont += 1

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_BACK)
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 1)

    random_indexes.shuffle()
    cont = 0
    for i in own_team:
        if i == null: continue
        i.team_slot = random_indexes[cont]
        cont += 1

        var tween = get_tree().create_tween().set_trans(Tween.TRANS_BACK)
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 1)

    var team_ordered = sort_team(target_team)
    if unit.team == 1:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    team_ordered = sort_team(own_team)
    if unit.team == 2:
        globals.battle.enemy_team = team_ordered
    else:
        globals.battle.player_team = team_ordered

    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.8)

func growth(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "growth")

    var sprite = unit.get_node("Sprite/Sprite2D")
    var tween = get_tree().create_tween()
    tween.tween_property(sprite, "scale", Vector2(3.5, 3.5), 0.1)
    tween.tween_property(sprite, "scale", Vector2(5, 5), 0.2)
    await wait(0.3)

    unit.blink.play("mod_atk")
    await wait(0.2)
    globals.battle.show_action_name(unit, "Attack Up")
    unit.power += 15

    await wait(0.7)
    tween = get_tree().create_tween()
    tween.tween_property(sprite, "scale", Vector2(4, 4), 0.3)

    globals.battle.hide_action_name(unit)

func cotton_guard(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "cotton_guard")

    unit.blink.play("mod_def")

    unit.defense += 0.3

    await wait(0.65)

func taunt(unit):
    if unit.pp < 2: return
    if globals.battle.current_act_unit.recorded_data["taunted"]: return

    var target = get_acting_unit()
    if target == null: return

    globals.battle.current_act_unit.recorded_data["taunted"] = true
    await show_effect_name(unit, "taunt")

    globals.battle.current_target_unit = [unit]

    unit.player.play("ot_sing")
    await wait(0.3)
    target.player.play("ot_angry")
    await wait(1)

    await globals.battle.unit_approach(target, "run", false)

func attract(unit):
    if unit.pp < 3: return

    var target = get_acting_unit()
    if target == null: return

    await show_effect_name(unit, "attract")
    await anm_atk(unit, "ot_attract")

    target.blink.play_backwards("mod_atk")

    globals.battle.show_action_name(target, "Attack Down")
    target.temp_power -= 20
    await wait(0.8)

    globals.battle.hide_action_name(target)

func roar(unit):
    if unit.pp < 3: return
    if globals.battle.current_target_unit == []: return
    if globals.battle.current_target_unit[0].pp < 1: return
    if not check_if_targets_alive(): return

    await show_effect_name(unit, "roar")
    await anm_atk(unit, "mt_shudder")
    shove(unit)
    await wait(0.6)

func noble_roar(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "noble_roar")
    await anm_atk(unit, "mt_shudder")
    shove(unit)
    await wait(0.6)

    await user_gains_attack_10(unit)

func hive(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    await show_effect_name(unit, "hive")

    var cont = 0
    for i in range(3):
        if target_team.find(null) == -1: return

        var target_slot_index
        if target_team.slice(3, 6).find(null) != -1:
            target_slot_index = target_team.slice(3, 6).find(null)
            if target_slot_index != -1: target_slot_index += 3

        else:
            target_slot_index = target_team.slice(0, 3).find(null)

        if target_slot_index == -1:
            target_slot_index = target_team.find(null)

        var new_unit_dict = globals.generate_pokemon("combee", unit.level)
        if cont == 1:
            new_unit_dict["slot2_selected"] = 1
            new_unit_dict["bonus_pp"] = 1

        unit.player.play("ot_charge")
        await wait(0.3)

        globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
        globals.battle.unit_post_setup(target_team[target_slot_index])

        cont += 1

    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.7)

func defend_order(unit):

    if unit.pp < 1: return

    var protected_unit = null

    for i in globals.battle.current_target_unit:
        if i != unit and i not in globals.battle.units_covering and i.unit_name == "Vespiqueen":
            protected_unit = i
            break

    if protected_unit == null: return

    if unit in globals.battle.units_covering: return
    if protected_unit in globals.battle.units_covering: return

    globals.battle.units_covering.append(unit)
    globals.battle.units_covering.append(protected_unit)

    var direction = -1
    if unit.team == 2: direction = 1


    globals.battle.show_action_name(protected_unit, "Defend Order")

    await wait(0.3)
    await anm_atk(protected_unit, "ot_skill")
    delayed_hide_action_name([protected_unit])
    await globals.battle.spend_point(unit, "pp", 1)


    await wait(0.2)

    unit.temp_defense += 0.2

    if unit in globals.battle.current_target_unit: globals.battle.current_target_unit.erase(unit)
    globals.battle.current_target_unit[globals.battle.current_target_unit.find(protected_unit)] = unit

    globals.battle.units_out_of_place.append(protected_unit)
    globals.battle.units_out_of_place.append(unit)

    unit.z_index = 1
    protected_unit.z_index = 0

    var tween = get_tree().create_tween().set_parallel()
    tween.tween_property(unit, "position", protected_unit.position, 0.3)
    tween.tween_property(protected_unit, "position", protected_unit.position - Vector2(80 * direction, 0), 0.2)

    await wait(0.3)

func attack_order(unit):
    if unit.pp < 1: return
    if not check_if_targets_alive(): return

    var own_team = get_own_team(unit)
    var vespiqueen_node = null
    for i in own_team:
        if i == null: continue
        if i.unit_name == "Vespiqueen":
            vespiqueen_node = i
            break
    if vespiqueen_node == null: return

    globals.battle.show_action_name(vespiqueen_node, "Attack Order")
    await wait(0.3)
    await globals.battle.spend_point(unit, "pp", 1)
    await anm_atk(vespiqueen_node, "ot_skill")
    delayed_hide_action_name([vespiqueen_node])


    var prev_selected_attack = unit.selected_attack
    var prev_unit = get_acting_unit()

    globals.battle.current_act_unit = unit

    unit.selected_attack = "attack_order"

    await globals.battle.unit_approach(unit, "run", false)
    await globals.battle.execute_action(active["attack_order"], unit)
    await globals.battle.unit_retreat(unit, "run")

    globals.battle.current_act_unit = prev_unit
    unit.selected_attack = prev_selected_attack


func wide_guard(unit):
    if unit.pp < 2: return

    if globals.battle.current_target_unit == [unit]: return

    await show_effect_name(unit, "wide_guard")
    await anm_atk(unit, "ot_harden")

    globals.battle.current_target_unit = [unit]

    await wait(0.3)

func syndicate(unit):
    if unit.pp < 2: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    globals.battle.show_action_name(unit, "Syndicate")
    await globals.battle.spend_point(unit, "pp", 2)
    globals.battle.hide_action_name(unit)


    var target_slot_index
    if unit.team_slot < 3:
        target_slot_index = target_team.slice(0, 3).find(null)
    else:
        target_slot_index = target_team.slice(3, 6).find(null)
        if target_slot_index != -1: target_slot_index += 3

    if target_slot_index == -1:
        target_slot_index = target_team.find(null)


    var new_unit_dict = globals.generate_pokemon("murkrow", unit.level, {"bonus_health": -20})

    unit.player.play("ot_charge")
    await wait(0.4)

    globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
    globals.battle.unit_post_setup(target_team[target_slot_index])

    globals.battle.sort_by_speed(globals.battle.units_in_play)

    await wait(0.8)

func stench(unit):
    if unit.pp < 2: return

    await show_effect_name(unit, "stench")

    var target = get_acting_unit()

    globals.battle.show_action_name(target, "PP Down")
    globals.battle.spend_point(target, "pp", 1)
    target.blink.play_backwards("mod_def")

    await wait(0.7)
    globals.battle.hide_action_name(target)

func impervious(unit):
    if unit.pp < 1: return
    var target = get_acting_unit()

    var attack_color = active[target.selected_attack]["color"]
    if attack_color == "none":
        attack_color = target.color

    if poke_types.affinity[unit.color][attack_color] != poke_types.weak: return

    await show_effect_name(unit, "impervious")
    unit.temp_defense += 0.6

    unit.blink.play("mod_def")

    await wait(0.2)
    globals.battle.show_action_name(unit, "Defense Up")

    await wait(0.7)
    globals.battle.hide_action_name(unit)

func prank(unit):
    if unit.pp < 3: return
    if globals.battle.current_act_unit.recorded_data["taunted"]: return

    var target = get_acting_unit()
    if target == null: return

    globals.battle.current_act_unit.recorded_data["taunted"] = true
    await show_effect_name(unit, "prank")
    unit.recorded_data["dodges"] += 1

    globals.battle.current_target_unit = [unit]

    unit.player.play("ot_sing")
    await wait(0.3)
    target.player.play("ot_angry")
    await wait(1)

    await globals.battle.unit_approach(target, "run", false)

func pocket_thug(unit):
    if unit.pp < 3: return

    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if target_team.find(null) == -1: return

    await show_effect_name(unit, "pocket_thug")


    if target_team.find(null) == -1: return

    var target_slot_index
    if target_team.slice(3, 6).find(null) != -1:
        target_slot_index = target_team.slice(3, 6).find(null)
        if target_slot_index != -1: target_slot_index += 3

    else:
        target_slot_index = target_team.slice(0, 3).find(null)

    if target_slot_index == -1:
        target_slot_index = target_team.find(null)

    var new_unit_dict = globals.generate_pokemon("sneasel", unit.level - 1)
    new_unit_dict["bonus_power"] -= 10
    new_unit_dict["bonus_health"] -= 20


    unit.player.play("ot_skill")
    await wait(0.4)

    globals.battle.spawn_unit(new_unit_dict, unit.team - 1, target_slot_index)
    globals.battle.unit_post_setup(target_team[target_slot_index])


    globals.battle.sort_by_speed(globals.battle.units_in_play)
    await wait(0.7)

func overclock(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "overclock")

    var target = get_acting_unit()

    globals.battle.damage_mod += 0.5
    target.player.play("ot_overclock")
    await wait(0.4)
    globals.battle.show_action_name(unit, "Attack Up")
    await wait(0.2)
    delayed_hide_action_name([unit])

    await wait(1.0)
    globals.battle.suffer_damage(unit, [roundi(unit.max_hp * 0.3), "none", 1])
    await target.player.animation_finished

func substitute(unit):
    if unit.pp < 3: return

    await show_effect_name(unit, "substitute")

    var target = get_acting_unit()
    globals.battle.current_target_unit.erase(unit)

    var direction = -1
    if unit.team == 2: direction = 1

    var new_sprite = Sprite2D.new()
    new_sprite.texture = load("res://Files/Sprites/substitute.png")
    new_sprite.scale = Vector2(1.5, 0)
    new_sprite.modulate = Color("#ffffff00")
    unit.add_child(new_sprite)
    await wait(0.05)
    substitute_attacked(unit, target, new_sprite)

    var tween = get_tree().create_tween().set_parallel(true)
    tween.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.1)
    tween.tween_property(new_sprite, "scale", Vector2(1.8, 4), 0.18)
    tween.tween_property(unit.get_node("Sprite"), "position", Vector2(-50 * direction, 0), 0.2)
    tween.tween_property(unit.get_node("Sprite"), "modulate", Color("#999999"), 0.2)

    await wait(0.25)
    tween = get_tree().create_tween()
    tween.tween_property(new_sprite, "scale", Vector2(3.5, 2.5), 0.3)
    tween.tween_property(new_sprite, "scale", Vector2(3, 3), 0.15)

    await wait(0.3)

func substitute_attacked(unit, attacker, substitute_spr):
    attacker.signal_attack = false
    await wait(0.2)
    var timer = get_tree().create_timer(7)
    while not attacker.signal_attack:
        await wait(0.01)
        if not timer.time_left: break

    play_sound(load("res://Files/SoundEffects/Battle/Hit_Weak_Not_Very_Effective.mp3"))
    substitute_spr.modulate = Color("#000000")

    var tween = get_tree().create_tween()
    tween.tween_property(substitute_spr, "rotation", deg_to_rad(-18), 0.06)
    tween.tween_property(substitute_spr, "rotation", deg_to_rad(24), 0.12)

    var tween3 = get_tree().create_tween()
    tween3.tween_property(substitute_spr, "scale", Vector2(2.5, 3.5), 0.06)
    tween3.tween_property(substitute_spr, "scale", Vector2(3.2, 2.8), 0.06)
    tween3.tween_property(substitute_spr, "scale", Vector2(3, 3), 0.06)

    await wait(0.12)
    substitute_spr.modulate = Color("#ffffff")
    await wait(0.06)

    tween = get_tree().create_tween()

    tween.tween_property(substitute_spr, "rotation", deg_to_rad(-6), 0.12)
    tween.tween_property(substitute_spr, "rotation", deg_to_rad(6), 0.24)
    tween.tween_property(substitute_spr, "rotation", deg_to_rad(0), 0.24)

    await wait(0.66)
    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.get_node("Sprite"), "position", Vector2(0, 0), 0.4)
    tween2.tween_property(unit.get_node("Sprite"), "modulate", Color("#ffffff"), 0.4)
    tween2.tween_property(substitute_spr, "modulate", Color("#ffffff00"), 0.12)
    await wait(0.3)

    substitute_spr.queue_free()

func commander(unit):
    if unit.pp < 3: return
    if not check_if_targets_alive(): return

    var column_ally = get_ally_in_column(unit)
    if column_ally == null: return

    await show_effect_name(unit, "commander")

    var direction = 1
    if unit.team == 2: direction = -1
    var tween = get_tree().create_tween()
    tween.tween_property(unit, "position", unit.position + Vector2(60 * direction, 0), 0.3)

    await anm_atk(unit, "ot_harden")



    column_ally.player.play("ot_skill")
    await wait(0.6)

    var prev_selected_attack = column_ally.selected_attack
    var prev_unit = get_acting_unit()

    globals.battle.current_act_unit = column_ally

    column_ally.selected_attack = "attack_order"

    await globals.battle.unit_approach(column_ally, "run", false)
    await globals.battle.execute_action(active["attack_order"], column_ally)
    await globals.battle.unit_retreat(column_ally, "run")

    globals.battle.current_act_unit = prev_unit
    column_ally.selected_attack = prev_selected_attack
    await wait(0.1)


func illusion(unit):
    if unit.pp < 3: return
    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate(true)

    globals.battle.effects_in_play["after_attacked"].append([unit, break_illusion])

    var colors = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]
    var indexes = range(11)
    indexes.shuffle()
    var pulled_mon = booster_pull(colors[indexes[0]])
    new_sprite.frame = pulled_mon["dex"]["sprite"]
    new_sprite.modulate = Color("#ffffff00")
    unit.get_node("Sprite").add_child(new_sprite)


    await show_effect_name(unit, "illusion")

    unit.get_node("AuxPlayer2").stream = load("res://Files/SoundEffects/Battle/Illusion.mp3")
    unit.get_node("AuxPlayer2").play()

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(9), 0.8)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(-4), 0.6)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(0), 0.3)

    var tween3 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(-9), 0.8)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(4), 0.6)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(0), 0.3)

    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.get_node("Sprite/Sprite2D"), "modulate", Color("#ffffff00"), 1)
    tween2.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.6)


    await wait(0.3)
    unit.color = pulled_mon["dex"]["color"]
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)

    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)
    await globals.battle.switch_attack_ui(unit)
    globals.battle.switch_attack_ui(unit)
    await wait(1.0)

    unit.get_node("Sprite/Sprite2D").modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D").frame = pulled_mon["dex"]["sprite"]

    new_sprite.queue_free()

func break_illusion(unit):
    globals.battle.effects_in_play["after_attacked"].erase([unit, break_illusion])
    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate(true)

    var pulled_mon = unit.unit_dict.duplicate(true)
    new_sprite.frame = pulled_mon["dex"]["sprite"]
    new_sprite.modulate = Color("#ffffff00")
    unit.get_node("Sprite").add_child(new_sprite)







    unit.get_node("AuxPlayer2").stream = load("res://Files/SoundEffects/Battle/Illusion.mp3")
    unit.get_node("AuxPlayer2").play()

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(9), 0.4)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(-4), 0.2)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(0), 0.1)

    var tween3 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(-9), 0.4)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(4), 0.2)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(0), 0.1)

    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.get_node("Sprite/Sprite2D"), "modulate", Color("#ffffff00"), 0.4)
    tween2.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.3)

    await wait(0.1)
    unit.color = pulled_mon["dex"]["color"]
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)

    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)
    await globals.battle.switch_attack_ui(unit)
    globals.battle.switch_attack_ui(unit)

    tween2 = get_tree().create_tween()
    tween2.tween_property(new_sprite, "position", Vector2.ZERO, 0.3)

    await wait(0.4)

    unit.get_node("Sprite/Sprite2D").modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D").frame = pulled_mon["dex"]["sprite"]

    new_sprite.queue_free()

func dark_illusion(unit):
    if unit.pp < 3: return
    unit.recorded_data["dodges"] += 1
    unit.recorded_data["dark_illusion"] = true
    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate(true)

    globals.battle.effects_in_play["after_attacked"].append([unit, break_dark_illusion])

    var colors = [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]
    var indexes = range(11)
    indexes.shuffle()
    var pulled_mon = booster_pull(colors[indexes[0]])
    new_sprite.frame = pulled_mon["dex"]["sprite"]
    new_sprite.modulate = Color("#ffffff00")
    unit.get_node("Sprite").add_child(new_sprite)

    await show_effect_name(unit, "dark_illusion")
    globals.battle.units_out_of_place.append(unit)

    unit.get_node("AuxPlayer2").stream = load("res://Files/SoundEffects/Battle/Illusion.mp3")
    unit.get_node("AuxPlayer2").play()

    var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(9), 0.8)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(-4), 0.6)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "skew", deg_to_rad(0), 0.3)

    var tween3 = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(-9), 0.8)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(4), 0.6)
    tween3.tween_property(new_sprite, "skew", deg_to_rad(0), 0.3)

    var tween2 = get_tree().create_tween().set_parallel(true)
    tween2.tween_property(unit.get_node("Sprite/Sprite2D"), "modulate", Color("#ffffff00"), 1)
    tween2.tween_property(new_sprite, "modulate", Color("#ffffff"), 0.6)

    await wait(1)
    unit.color = pulled_mon["dex"]["color"]
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)

    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)
    await globals.battle.switch_attack_ui(unit)
    globals.battle.switch_attack_ui(unit)
    await wait(0.4)

    unit.get_node("Sprite/Sprite2D").modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D").frame = pulled_mon["dex"]["sprite"]

    new_sprite.queue_free()

func break_dark_illusion(unit):
    globals.battle.effects_in_play["after_attacked"].erase([unit, break_dark_illusion])
    globals.battle.units_out_of_place.append(unit)
    var direction = -1
    if unit.team == 2: direction = 1

    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate(true)
    var pulled_mon = unit.unit_dict.duplicate(true)
    new_sprite.frame = pulled_mon["dex"]["sprite"]
    new_sprite.modulate = Color("#ffffff00")
    unit.get_node("Sprite").add_child(new_sprite)

    var actor = get_acting_unit()

    unit.color = pulled_mon["dex"]["color"]
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)

    unit.player.speed_scale = 2.5
    unit.player.play_backwards("ot_fly_charge")

    var tween = get_tree().create_tween()
    tween.tween_property(unit, "position", unit.position + Vector2(80 * direction, 0), 0.1)

    await wait(0.23)
    unit.get_node("Sprite/Sprite2D").modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D").frame = pulled_mon["dex"]["sprite"]

    unit.signal_attack = false
    while not unit.signal_attack:
        await wait(0.01)
    unit.player.speed_scale = 1
    globals.battle.suffer_damage(actor, [roundi(20 * poke_types.affinity[actor.color]["black"]), "black", poke_types.affinity[actor.color]["black"]])
    actor.player.play("ht_knocked")

    await wait(0.4)

    tween = get_tree().create_tween()
    tween.tween_property(unit, "position", unit.position + Vector2(40 * - direction, 0), 0.3)

    globals.battle.setup_attack_data(unit, unit.atk1, 1)
    globals.battle.setup_attack_data(unit, unit.atk2, 2)
    await globals.battle.switch_attack_ui(unit)
    globals.battle.switch_attack_ui(unit)
    new_sprite.queue_free()

func retaliate(unit):
    if unit.pp < 2: return
    await show_effect_name(unit, "retaliate")

    var prev_selected_attack = unit.selected_attack
    var prev_unit = get_acting_unit()
    var prev_target = globals.battle.current_target_unit.duplicate()
    globals.battle.current_target_unit = [globals.battle.current_target_unit[0]]

    globals.battle.current_act_unit = unit
    globals.battle.current_target_unit = [prev_unit]

    unit.selected_attack = "beat_up"

    await globals.battle.unit_approach(unit, "run", false)
    await globals.battle.execute_action(active["beat_up"], unit)
    await globals.battle.unit_retreat(unit, "run")

    globals.battle.current_act_unit = prev_unit
    unit.selected_attack = prev_selected_attack

    globals.battle.current_target_unit = prev_target


func zen_mode(unit):
    if unit.pp < 2: return
    if unit.get_node("Sprite/Sprite2D").frame == 762: return

    await wait(0.5)
    await show_effect_name(unit, "zen_mode")

    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()

    new_sprite.frame = 762

    new_sprite.get_node("BlinkTexture").color = Color("#ffffff")
    new_sprite.self_modulate = Color("#ffffff00")
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    var tween = get_tree().create_tween()
    tween.tween_property(unit.get_node("Sprite/Sprite2D/BlinkTexture"), "color", Color("#ffffff"), 0.3)
    await wait(0.3)

    tween = get_tree().create_tween()
    tween.tween_property(new_sprite, "self_modulate", Color("#ffffff"), 0.3)
    tween.tween_property(unit.get_node("Sprite/Sprite2D"), "self_modulate", Color("#ffffff00"), 0.2)



    await wait(0.3)

    var tween2 = get_tree().create_tween()
    tween2.tween_property(new_sprite.get_node("BlinkTexture"), "color", Color("#ffffff00"), 0.2)

    unit.power *= 0.3
    unit.max_hp += 35
    unit.cur_hp += 50
    if unit.cur_hp > unit.max_hp: unit.cur_hp = unit.max_hp

    unit.speed -= 25

    globals.battle.setup_hp_dividers(unit)
    globals.battle.sort_by_speed(globals.battle.units_in_play)

    globals.battle.healthbar_damage(unit)

    await wait(0.3)
    unit.player.play("RESET")
    unit.get_node("Sprite/Sprite2D").frame = 762
    unit.get_node("Sprite/Sprite2D").self_modulate = Color("#ffffff")
    unit.get_node("Sprite/Sprite2D/BlinkTexture").color = Color("#ffffff00")
    unit.get_node("Sprite/Sprite2D").scale = Vector2(4, 4)
    new_sprite.queue_free()

func defeatist(unit):
    if unit.pp < 1: return
    if unit.cur_hp > unit.max_hp * 0.5: return
    globals.battle.effects_in_play["on_turn_start"].erase([unit, defeatist])
    await show_effect_name(unit, "defeatist")
    unit.power *= 0.25
    unit.blink.play_backwards("mod_atk")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Attack Down")

    await wait(0.2)
    await delayed_hide_action_name([unit])
    await wait(0.3)

func kings_shield(unit):
    if unit.pp < 2: return

    globals.battle.effects_in_play["on_turn_start"].append([unit, kings_shield_end])
    await show_effect_name(unit, "king's_shield")

    unit.player.play("ot_skill")
    await wait(0.25)
    unit.sprite_2d.frame = 979

    unit.temp_defense += 0.25
    unit.blink.play("mod_def")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Defense Up")

    delayed_hide_action_name([unit])
    await wait(0.6)

func kings_shield_end(unit):
    if unit.sprite_2d.frame == 978: return
    globals.battle.effects_in_play["on_turn_end"].erase([unit, kings_shield_end])
    unit.player.play("ot_skill")
    await wait(0.25)
    unit.sprite_2d.frame = 978

func guts(unit):
    if unit.pp < 1: return
    if unit.burn_amount < 1: return

    await show_effect_name(unit, "guts")
    unit.temp_power += unit.power
    unit.blink.play("mod_atk")
    await wait(0.2)

    globals.battle.show_action_name(unit, "Attack Soars!")

    await wait(0.2)
    delayed_hide_action_name([unit])
    await wait(0.7)

func mewtwo_death(unit):
    unit.player.play("mewtwo_defeat")
    await unit.player.animation_finished
    mewtwo_flash(unit)
    await wait(1)
    await globals.battle.speak(unit, ["Damn...", "You got my ass..."])

func mewtwo_flash(unit):
    while not unit.player.is_playing():
        unit.get_node("Sprite/Sprite2D").modulate = Color("#ff8080")
        await wait(0.04)
        if unit.player.is_playing(): return
        unit.get_node("Sprite/Sprite2D").modulate = Color("#ff9c9c")
        await wait(0.04)
        if unit.player.is_playing(): return

func pressure(unit):
    if unit.pp < 4: return

    var target_team = get_target_team(unit)

    await show_effect_name(unit, "pressure")

    unit.player.play("ot_charge")
    await wait(0.6)

    for i in target_team:
        if i == null: continue
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)

    await wait(1.2)

    for i in target_team:
        globals.battle.hide_action_name(i)

func dark_void(unit):
    if unit.pp < 4: return

    await show_effect_name(unit, "dark_void")


    var target_team = get_target_team(unit)
    unit.player.play("ot_charge")
    await wait(0.6)

    for i in target_team:
        if i == null: continue
        globals.battle.show_action_name(i, "AP Down")
        globals.battle.spend_point(i, "ap", 1)

    await wait(1.2)

    for i in target_team:
        globals.battle.hide_action_name(i)

func concentrate(unit):
    if unit.pp < 2: return

    globals.battle.show_action_name(unit, "Concentrate")
    await globals.battle.spend_point(unit, "pp", 2)

    unit.blink.play("mod_atk")


    globals.battle.hide_action_name(unit)

    unit.temp_power += 15


    await wait(0.65)

func drive_switch(unit):
    if unit.pp < 2: return
    if unit.selected_attack != "techno_blast": return

    globals.battle.effects_in_play["after_attacking"].append([unit, reset_drive_switch])

    globals.battle.show_action_name(unit, "Drive Switch")
    await globals.battle.spend_point(unit, "pp", 2)

    var enemy_color = globals.battle.current_target_unit[0].color
    var conversion_color = ""

    for i in poke_types.affinity[enemy_color]:
        if poke_types.affinity[enemy_color][i] == poke_types.weak:
            conversion_color = i
            break


    unit.color = conversion_color

    await wait(0.3)
    globals.battle.show_action_name(unit, "Weakness Detected")
    await wait(0.3)
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([conversion_color]))
    conversion_blink(unit)

    await wait(1)
    globals.battle.hide_action_name(unit)

func reset_drive_switch(unit):
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/green.png")
    await conversion_blink(unit)
    globals.battle.effects_in_play["after_attacking"].erase([unit, reset_drive_switch])
    unit.color = "green"
    await wait(0.2)

func mutation(unit):
    globals.battle.effects_in_play["before_attacking"].append([unit, attack_forme])
    globals.battle.effects_in_play["before_attacked"].append([unit, defense_forme])

func attack_forme(unit):
    if unit.pp < 2: return


    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
    new_sprite.frame = 543
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    unit.sprite_2d.frame = 541
    unit.sprite_2d.self_modulate = Color("ffffff00")


    await show_effect_name(unit, "attack_forme")

    await deoxys_transform(unit, new_sprite)

    await wait(0.3)





    unit.temp_power += 25

    var cur_actor = get_acting_unit()
    monitor_deoxys_revert(unit, cur_actor)

func defense_forme(unit):
    if unit.pp < 2: return

    var cur_actor = get_acting_unit()


    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
    new_sprite.frame = 543
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    unit.sprite_2d.frame = 542
    unit.sprite_2d.self_modulate = Color("ffffff00")


    await show_effect_name(unit, "defense_forme")

    await deoxys_transform(unit, new_sprite)

    await wait(0.3)





    unit.temp_defense += 1

    monitor_deoxys_revert(unit, cur_actor)

func deoxys_revert(unit):
    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()

    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    unit.sprite_2d.frame = 543
    unit.sprite_2d.self_modulate = Color("ffffff00")


    deoxys_transform(unit, new_sprite)

func monitor_deoxys_revert(unit, cur_actor):
    if globals.battle.current_act_unit != null:
        while globals.battle.current_act_unit == cur_actor:
            await wait(0.05)
    else:
        while globals.battle.current_delayed_actor == cur_actor:
            await wait(0.05)
    deoxys_revert(unit)

func deoxys_transform(unit, new_sprite):
    globals.battle.effects_in_play["on_turn_end"].erase([unit, deoxys_revert])






    var tween2 = get_tree().create_tween().set_parallel(true).set_ease(Tween.EASE_IN)
    tween2.tween_property(unit.sprite_2d, "self_modulate", Color(1.0, 1.0, 1.0, 1.0), 0.1)
    tween2.tween_property(new_sprite, "self_modulate", Color(0.93, 0.502, 0.288, 0.0), 0.2)


    await tween2.finished

func multitype(unit):
    globals.battle.effects_in_play["before_attacking"].append([unit, multitype_atk])
    globals.battle.effects_in_play["before_attacked"].append([unit, multitype_def])
    globals.battle.effects_in_play["on_turn_start"].append([unit, reset_multitype])

func multitype_def(unit):
    if unit.pp < 1: return
    var target = get_acting_unit()
    var attack_color = active[target.selected_attack]["color"]
    var conversion_color = ""

    if attack_color == "none":
        attack_color = target.color

    for i in poke_types.affinity[attack_color]:
        if poke_types.affinity[attack_color][i] == poke_types.weak:
            conversion_color = i
            break

    if conversion_color == unit.color: return

    globals.battle.show_action_name(unit, "Multitype")
    await globals.battle.spend_point(unit, "pp", 1)

    unit.color = conversion_color

    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)
    await arceus_transform(unit)
    globals.battle.hide_action_name(unit)












func multitype_atk(unit):
    if unit.pp < 1: return


    var enemy_color = globals.battle.current_target_unit[0].color
    var conversion_color = ""

    for i in poke_types.affinity[enemy_color]:
        if poke_types.affinity[enemy_color][i] == poke_types.weak:
            conversion_color = i
            break
    if conversion_color == "white": return

    globals.battle.effects_in_play["on_turn_end"].append([unit, reset_multitype])

    globals.battle.show_action_name(unit, "Multitype")
    await globals.battle.spend_point(unit, "pp", 1)


    unit.color = conversion_color

    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([unit.color]))
    conversion_blink(unit)
    await arceus_transform(unit)






    globals.battle.hide_action_name(unit)

func reset_multitype(unit):
    if unit.color == "white": return
    unit.color = "white"
    unit.get_node("UnitUI/ColorIcon").texture = load("res://Files/Sprites/ColorIcons/white.png")
    arceus_transform(unit)
    await conversion_blink(unit)
    globals.battle.effects_in_play["on_turn_end"].erase([unit, reset_multitype])


var arceus_colors = {
    "white": 687, 
    "green": 887, 
    "red": 888, 
    "blue": 889, 
    "yellow": 890, 
    "black": 891, 
    }
func arceus_transform(unit):
    var new_sprite = unit.get_node("Sprite/Sprite2D").duplicate()
    new_sprite.frame = unit.sprite_2d.frame
    if unit.team != 1:
        new_sprite.flip_h = true
    unit.add_child(new_sprite)

    unit.sprite_2d.frame = arceus_colors[unit.color]


    var tween2 = get_tree().create_tween().set_parallel(true).set_ease(Tween.EASE_IN)

    tween2.tween_property(new_sprite, "self_modulate", Color(0.93, 0.502, 0.288, 0.0), 0.4)

    await tween2.finished






func anm_atk(unit, animation):
    unit.signal_attack = false
    unit.player.play(animation)
    while true:
        if unit == null: return
        if unit.signal_attack: break
        await wait(0.01)

func show_effect_name(unit, effect_name):
    globals.battle.show_action_name(unit, passive[effect_name]["name"])
    await globals.battle.spend_point(unit, "pp", passive[effect_name]["cost"])
    globals.battle.hide_action_name(unit)

func get_target_team(unit):
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team
    return target_team

func get_own_team(unit):
    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team
    return target_team

func check_if_front_row_empty(target_team):
    if target_team.slice(0, 3) == [null, null, null]:
        return true
    else:
        return false

func check_if_adjacent(slot1, slot2):
    slot1 -= 1
    slot2 -= 1
    if slot1 == 0:
        if slot2 == 1 or slot2 == 3: return true

    if slot1 == 1:
        if slot2 == 0 or slot2 == 2 or slot2 == 4: return true

    if slot1 == 2:
        if slot2 == 1 or slot2 == 5: return true

    if slot1 == 3:
        if slot2 == 0 or slot2 == 4: return true

    if slot1 == 4:
        if slot2 == 1 or slot2 == 3 or slot2 == 5: return true

    if slot1 == 5:
        if slot2 == 4 or slot2 == 2: return true

    return false

func get_adjacent_allies(unit):
    if unit.team_slot == 1:
        return [2, 4]
    elif unit.team_slot == 2:
        return [1, 5, 3]
    elif unit.team_slot == 3:
        return [2, 6]
    elif unit.team_slot == 4:
        return [1, 5]
    elif unit.team_slot == 5:
        return [4, 2, 6]
    elif unit.team_slot == 6:
        return [5, 3]

func get_ally_in_column(unit):
    var own_team = get_own_team(unit)

    if unit.team_slot < 3:
        return own_team[unit.team_slot + 2]
    else:
        return own_team[unit.team_slot - 4]

func check_if_targets_alive():
    if globals.battle.current_target_unit == []: return false
    var triggered = false
    for i in globals.battle.current_target_unit:
        if i == null: continue
        if i.unit_immune: continue
        if i.cur_hp > 0: triggered = true

    if triggered:
        return true
    else:
        return false

func get_lowest_hp_ally(unit):
    var own_team = get_own_team(unit)
    var lowest_hp_ally = null

    for i in own_team:
        if i == null: continue

        if lowest_hp_ally == null or (i.cur_hp < lowest_hp_ally.cur_hp and i.cur_hp < i.max_hp):
            lowest_hp_ally = i

    return lowest_hp_ally

func get_lowest_hp_adjacent_ally(unit):
    var own_team = get_own_team(unit)
    var adjacent_allies = get_adjacent_allies(unit)
    var lowest_hp_ally = null

    adjacent_allies.append(unit.team_slot)

    for i in own_team:
        if i == null: continue
        if i.team_slot not in adjacent_allies: continue
        if lowest_hp_ally == null or (i.cur_hp < lowest_hp_ally.cur_hp and i.cur_hp < i.max_hp):
            lowest_hp_ally = i

    return lowest_hp_ally

func get_lowest_hp_enemy(unit):
    var own_team = get_target_team(unit)
    var lowest_hp_enemy = null

    for i in own_team:
        if i == null: continue

        if lowest_hp_enemy == null or (i.cur_hp < lowest_hp_enemy.cur_hp):
            lowest_hp_enemy = i

    return lowest_hp_enemy

func heal_hp(unit, healing_value):
    var healing = roundi(healing_value)

    unit.cur_hp += clamp(healing, 0, unit.max_hp)

    unit.blink.play("heal")
    await wait(0.1)
    unit.popup_damage(healing, "none", -1)

    globals.battle.healthbar_damage(unit)

func update_row_targets(unit):
    if active[unit.selected_attack]["target"] != "row": return

    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    var front_row = target_team.slice(0, 3)

    for i in front_row:
        if i == null: continue
        if i not in globals.battle.current_target_unit:
            globals.battle.current_target_unit.append(i)

func move_to_back_row(unit):
    var shoved_units = []
    var target_team = globals.battle.enemy_team
    if unit.team == 2: target_team = globals.battle.player_team

    if unit.team_slot in [1, 2, 3]: shoved_units.append(unit)

    for i in shoved_units:
        if target_team[i.team_slot + 2] == null and i.recorded_data["dodges"] < 1:
            target_team[i.team_slot - 1] = null

            i.team_slot += 3
            var tween = get_tree().create_tween()
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 0.1)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func move_to_back_row_friendly(unit):
    var shoved_units = []
    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if unit.team_slot in [1, 2, 3]: shoved_units.append(unit)

    for i in shoved_units:
        if target_team[i.team_slot + 2] == null:
            target_team[i.team_slot - 1] = null

            i.team_slot += 3
            var tween = get_tree().create_tween()
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 0.1)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func move_to_front_row_friendly(unit):
    var shoved_units = []
    var target_team = globals.battle.player_team
    if unit.team == 2: target_team = globals.battle.enemy_team

    if unit.team_slot in [4, 5, 6]: shoved_units.append(unit)

    for i in shoved_units:
        if target_team[i.team_slot - 4] == null:
            target_team[i.team_slot - 1] = null

            i.team_slot -= 3
            var tween = get_tree().create_tween()
            i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
            tween.tween_property(i, "position", i.home_coords, 0.1)

            target_team[i.team_slot - 1] = i

    globals.battle.sort_by_speed(globals.battle.units_in_play)

func switch_with_unit_behind(unit):


    if unit.team_slot > 3: return
    var target_team = get_own_team(unit)

    var switched_units = [unit, target_team[unit.team_slot - 1 + 3]]
    if null in switched_units: switched_units.erase(null)

    for i in switched_units:
        if i == null: continue
        if i.team_slot <= 3:
            i.team_slot += 3
        else:
            i.team_slot -= 3

        var tween = get_tree().create_tween()
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 0.3)

    await wait(0.32)

    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.player_team = team_ordered
    else:
        globals.battle.enemy_team = team_ordered

func switch_with_unit_in_front(unit):



    var target_team = get_own_team(unit)

    var switched_units = [unit, target_team[unit.team_slot - 1 - 3]]
    if null in switched_units: switched_units.erase(null)

    for i in switched_units:
        if i == null: continue
        if i.team_slot <= 3:
            i.team_slot += 3
        else:
            i.team_slot -= 3

        var tween = get_tree().create_tween()
        i.home_coords = globals.battle.battle_positions[i.team - 1][i.team_slot - 1]
        tween.tween_property(i, "position", i.home_coords, 0.3)

    await wait(0.32)

    var team_ordered = sort_team(target_team)

    if unit.team == 1:
        globals.battle.player_team = team_ordered
    else:
        globals.battle.enemy_team = team_ordered

func sort_team(target_team):
    var team_ordered = []

    for i in range(6):
        var index_found = false
        for k in target_team:
            if k != null and k.team_slot - 1 == i:
                team_ordered.append(k)
                index_found = true
                break
        if not index_found:
            team_ordered.append(null)
    return team_ordered

func unit_heal(unit, value):
    unit.cur_hp += clamp(value, 0, unit.max_hp - unit.cur_hp)


    unit.blink.play("heal")
    await wait(0.1)
    unit.popup_damage(value, "none", -1)

    globals.battle.healthbar_damage(unit)

func heal_burn(unit):
    unit.burn_amount = 0.0
    unit.blink.play("heal")
    globals.battle.show_action_name(unit, "Burn Healed")
    unit.get_node("UnitUI/Burn").visible = false
    unit.recorded_data["perma_burned"] = false

func delayed_hide_action_name(units):
    await wait(0.7)

    for i in units:
        globals.battle.hide_action_name(i)

func unit_protected(unit):

    return unit.unit_immune

func get_acting_unit():
    var target = globals.battle.current_act_unit
    if target == null: target = globals.battle.current_delayed_actor
    return target

func wait(time):
    await get_tree().create_timer(time).timeout

func booster_pull(booster_index):
    var game_level = 1
    var colors = ["red", "blue", "green", "yellow", "white", "black"]
    var pulling_pool1 = []
    var pulling_pool2 = []
    var pulling_pool3 = []
    var pulling_pool4 = []
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
    pulling_pool1.shuffle()
    pulling_pool2.shuffle()
    pulling_pool3.shuffle()
    pulling_pool4.shuffle()
    var pulled_mon

    var rng = randi_range(1, 100)

    var common_pull = 80
    var uncommon_pull = 95
    var rare_pull = 100
    var super_pull = 0

    if super_pull: pass

    if game_level == 0:
        common_pull = 75
        uncommon_pull = 98
        rare_pull = 100
        super_pull = 0

    elif game_level == 1:
        common_pull = 50
        uncommon_pull = 90
        rare_pull = 99
        super_pull = 100

    elif game_level == 2:
        common_pull = 20
        uncommon_pull = 80
        rare_pull = 98
        super_pull = 100


    else:
        common_pull = 5
        uncommon_pull = 70
        rare_pull = 95
        super_pull = 100


    if rng <= common_pull:
        pulled_mon = pulling_pool1[0]
    elif rng <= uncommon_pull:
        pulled_mon = pulling_pool2[0]
    elif rng <= rare_pull:
        pulled_mon = pulling_pool3[0]

    else:
        if pulling_pool4:
            pulled_mon = pulling_pool4[0]
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

func play_sound(resource):
    if globals.test_mode: return
    globals.ui.gui_player.stop()
    globals.ui.gui_player.stream = resource
    globals.ui.gui_player.play()
