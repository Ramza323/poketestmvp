extends Node2D

var booster_excluded = [
    "joey rattata", 
    "minun", 
    "zubat", 
    "PIKACHU", 

    "bulbasaur", 
    "ivysaur", 
    "charmander", 
    "charmeleon", 
    "squirtle", 
    "wartortle", 
    "chikorita", 
    "bayleef", 
    "cyndaquil", 
    "quilava", 
    "totodile", 
    "croconaw", 
    "grovyle", 
    "combusken", 
    "marshtomp", 
    "grotle", 
    "monferno", 
    "prinplup", 
    "servine", 
    "pignite", 
    "dewott", 
    "quilladin", 
    "braixen", 
    "frogadier", 

    "geodude", 
    "goldeen", 
    "voltorb", 
    "rattata", 
    "pidgey", 
    "spearow", 
    "oddish", 
    "mareep", 
    "zigzagoon", 
    "skitty", 
    "mankey", 
    "wurmple", 
    "silcoon", 
    "spinarak", 
    "slugma", 
    "luvdisc", 
    "poochyena", 

    "shieldon", 
    "heat_rotom", 
    "wash_rotom", 
    "frost_rotom", 
    "fan_rotom", 
    "mow_rotom", 

    "palpitoad", 
    "trubbish", 
    "drilbur", 

    "mewtwo", 
    "mew", 
    "arceus", 

    "MISSINGNO.", 

    "dark_magician_girl", 
    "dark_magician", 
    "summoned_skull", 
    "blue_eyes_white_dragon", 
    "hitotsu-me-giant", 
    "swordstalker", 

    "jack_frost", 
    "jacko_lantern", 
    "pixie", 
]

var versus_included = [
    "PIKACHU", 

    "ivysaur", 
    "charmeleon", 
    "wartortle", 
    "bayleef", 
    "quilava", 
    "croconaw", 
    "grovyle", 
    "combusken", 
    "marshtomp", 
    "grotle", 
    "monferno", 
    "prinplup", 
    "servine", 
    "pignite", 
    "dewott", 
    "quilladin", 
    "braixen", 
    "frogadier", 
    "luvdisc", 
    "skitty", 

    "heat_rotom", 
    "wash_rotom", 
    "frost_rotom", 
    "fan_rotom", 
    "mow_rotom", 

    "mewtwo", 
    "mew", 
    "arceus", 

]

var shiny = [
    "venusaur", 
    "charizard", 
    "blastoise", 
    "gyarados", 
    "ninetales", 
    "arcanine", 
    "rapidash", 
    "nidoking", 
    "machamp", 
    "lapras", 
    "dragonite", 
    "gengar", 
    "scyther", 
    "arbok", 
    "marowak", 

    "meganium", 
    "typhlosion", 
    "feraligator", 
    "azumarill", 
    "ampharos", 
    "steelix", 
    "skarmory", 
    "houndoom", 
    "kingdra", 

    "sceptile", 
    "blaziken", 
    "swampert", 
]

var dex = {
    "sandbag": {
        "name": "Sandbag", 
        "sprite": 1, 
        "color": "red", 
        "rarity": 0, 

        "ap": 0, 
        "pp": 2, 

        "health": 5500, 
        "power": 30, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["tackle", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 
    }, 




















    "magmar": {
        "name": "Magmar", 
        "sprite": 169, 
        "color": "red", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 45, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["fire_punch", "lava_plume", "ember", "flame_charge"], 
        "slot2": ["flame_body", "smokescreen"], 
        "slot3": ["smog", "fire_blast", "lava_plume"], 
        "learn_slot1": ["tackle", "incinerate", "protect"],
        "learn_slot3": ["tackle", "body_slam", "substitute"],

        "evolve": ["magmortar", 6]
    }, 

    "magmortar": {
        "name": "Magmortar", 
        "sprite": 649, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 55, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["fire_punch", "lava_plume", "ember", "flame_charge"], 
        "slot2": ["flame_body", "smokescreen"], 
        "slot3": ["fire_blast", "belch", "smog", "earth_power"], 
        "learn_slot1": ["tackle", "incinerate", "protect" ],
        "learn_slot3": ["body_slam", "substitute", "flamethrower"],
    }, 

    "electabuzz": {
        "name": "Electabuzz", 
        "sprite": 168, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 30, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["thunder_punch", "shock_wave", "quick_attack"], 
        "slot2": ["charge", "thunder_wave"], 
        "slot3": ["swift", "spark", "thunder_shock"], 
        "learn_slot1": ["ice_punch", "rest", "fire_punch"],
        "learn_slot3": ["body_slam", "substitute", "focus_punch"],

        "evolve": ["electivire", 6]
    }, 

    "electivire": {
        "name": "Electivire", 
        "sprite": 648, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 7, 
        "pp": 2, 

        "health": 40, 
        "power": 60, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["thunder_punch", "discharge"], 
        "slot2": ["charge", "thunder_wave"], 
        "slot3": ["thunder", "shock_wave"], 
    }, 

    "farfetch'd": {
        "name": "Farfetch'd", 
        "sprite": 118, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 20, 
        "power": 40, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["cut", "brave_bird"], 
        "slot2": ["focus_energy", "agility"], 
        "slot3": ["leaf_blade", "slash"], 
    }, 

    "golduck": {
        "name": "Golduck", 
        "sprite": 83, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 35, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["water_pulse", "water_gun"], 
        "slot2": ["soak", "disable"], 
        "slot3": ["confusion", "wave_splash"], 
    }, 

    "hypno": {
        "name": "Hypno", 
        "sprite": 136, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 55, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["psybeam", "zen_headbutt"], 
        "slot2": ["hypnosis", "nasty_plot"], 
        "slot3": ["confusion", "headbutt"], 
    }, 

    "venomoth": {
        "name": "Venomoth", 
        "sprite": 72, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["bug_buzz", "air_slash"], 
        "slot2": ["poison_powder", "sleep_powder"], 
        "slot3": ["confusion", "psybeam"], 
    }, 

    "charizard": {
        "name": "Charizard", 
        "sprite": 6, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["flamethrower", "dragon_claw"], 
        "slot2": ["pride", "belly_drum"], 
        "slot3": ["fly", "seismic_toss"], 
    }, 

    "*charizard": {
        "name": "Charizard", 
        "sprite": 1156, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["black_flame", "flamethrower"], 
        "slot2": ["pride", "belly_drum"], 
        "slot3": ["fly", "seismic_toss"], 
    }, 

    "charmeleon": {
        "name": "Charmeleon", 
        "sprite": 5, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 1, 

        "health": 25, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["fire_fang", "dragon_claw"], 
        "slot2": ["blaze", "pride"], 
        "slot3": ["scratch", "ember"], 

        "evolve": ["charizard", 6]
    }, 

    "charmander": {
        "name": "Charmander", 
        "sprite": 4, 
        "color": "red", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 15, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["ember", "scratch"], 
        "slot2": ["none", "none"], 
        "slot3": ["scratch", "scratch"], 

        "evolve": ["charmeleon", 3]
    }, 
    
    "ivysaur": {
        "name": "Ivysaur", 
        "sprite": 1, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 35, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["tackle", "razor_leaf", "smog", "cut"], 
        "slot2": ["leech_seed", "poison_powder"], 
        "slot3": ["vine_whip", "sludge", "headbutt", "vine_whip"], 
        "learn_slot1": ["tackle", "toxic", "seed_bomb"],
        "learn_slot3": ["tackle", "fury_cutter", "substitute"],
        "evolve": ["venusaur", 6]
    }, 

    "venusaur": {
        "name": "Venusaur", 
        "sprite": 2, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 70, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["solar_beam", "sludge_bomb"], 
        "slot2": ["leech_seed", "growth"], 
        "slot3": ["power_whip", "vine_whip"], 
    }, 

    "*venusaur": {
        "name": "Venusaur", 
        "sprite": 1157, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 70, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["zap_cannon", "solar_beam"], 
        "slot2": ["leech_seed", "growth"], 
        "slot3": ["power_whip", "vine_whip"], 
    }, 

    

    "blastoise": {
        "name": "Blastoise", 
        "sprite": 11, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 5, 

        "health": 80, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["hydro_pump", "surf"], 
        "slot2": ["wall", "torrent"], 
        "slot3": ["waterfall", "wave_crash"], 
    }, 

    "*blastoise": {
        "name": "Blastoise", 
        "sprite": 1158, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["hydro_pump", "surf"], 
        "slot2": ["wall", "torrent"], 
        "slot3": ["psychic", "wave_crash"], 
    }, 

    "wartortle": {
        "name": "Wartortle", 
        "sprite": 10, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 50, 
        "power": 35, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["bubble_beam", "water_gun"], 
        "slot2": ["cover", "torrent"], 
        "slot3": ["rapid_spin", "skull_bash"], 

        "evolve": ["blastoise", 6]
    }, 

    "pikachu": {
        "name": "Pikachu", 
        "sprite": 32, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["thunder_shock", "shock_wave"], 
        "slot2": ["double_team", "light_ball"], 
        "slot3": ["electro_ball", "volt_tackle"], 

        "evolve": ["raichu", 6]
    }, 

    "PIKACHU": {
        "name": "Pikachu", 
        "sprite": 38, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 30, 
        "power": 90, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["thunderbolt", "iron_tail"], 
        "slot2": ["double_team", "charge"], 
        "slot3": ["volt_tackle", "electro_ball"], 
    }, 

    "golem": {
        "name": "Golem", 
        "sprite": 109, 
        "color": "rock", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 70, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["steamroller", "gyro_ball"], 
        "slot2": ["rock_head", "self-destruct"], 
        "slot3": ["stone_edge", "rock_slide"], 
    }, 

    "graveler": {
        "name": "Graveler", 
        "sprite": 107, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 55, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["rollout", "rock_throw"], 
        "slot2": ["rock_head", "self-destruct"], 
        "slot3": ["rock_slide", "stone_edge"], 

        "evolve": ["golem", 6]
    }, 

    "geodude": {
        "name": "Geodude", 
        "sprite": 105, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 1, 

        "health": 35, 
        "power": 25, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["rollout", "tackle"], 
        "slot2": ["rock_head", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["graveler", 3]
    }, 

    "gengar": {
        "name": "Gengar", 
        "sprite": 132, 
        "color": "ghost", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 30, 
        "power": 80, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["night_shade", "lick"], 
        "slot2": ["hypnosis", "spook"], 
        "slot3": ["shadow_ball", "shadow_sneak"], 
    }, 

    "*gengar": {
        "name": "Gengar", 
        "sprite": 1171, 
        "color": "ghost", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 30, 
        "power": 80, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["sun_bloom", "lick"], 
        "slot2": ["spook", "hypnosis"], 
        "slot3": ["dazzling_gleam", "shadow_ball"], 
    }, 

    "haunter": {
        "name": "Haunter", 
        "sprite": 131, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 20, 
        "power": 45, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["shadow_punch", "lick"], 
        "slot2": ["hypnosis", "spook"], 
        "slot3": ["night_shade", "shadow_sneak"], 

        "evolve": ["gengar", 6]
    }, 

    "onix": {
        "name": "Onix", 
        "sprite": 134, 
        "color": "rock", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 2, 

        "health": 75, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["rock_tomb", "head_smash"], 
        "slot2": ["cover", "stealth_rock"], 
        "slot3": ["dig", "rock_throw"], 
    }, 

    "steelix": {
        "name": "Steelix", 
        "sprite": 316, 
        "color": "steel", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 90, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["iron_tail", "dragon_breath"], 
        "slot2": ["stealth_rock", "sandstorm"], 
        "slot3": ["head_smash", "crunch"], 
    }, 

    "*steelix": {
        "name": "Steelix", 
        "sprite": 1175, 
        "color": "steel", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 90, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["power_whip", "iron_tail"], 
        "slot2": ["stealth_rock", "sandstorm"], 
        "slot3": ["head_smash", "wood_hammer"], 
    }, 

    "ninetales": {
        "name": "Ninetales", 
        "sprite": 58, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["fire_spin", "extrasensory"], 
        "slot2": ["will-o-wisp", "drought"], 
        "slot3": ["mystical_fire", "fire_blast"], 
    }, 

    "*ninetales": {
        "name": "Ninetales", 
        "sprite": 1160, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["fire_spin", "fire_blast"], 
        "slot2": ["will-o-wisp", "hypnosis"], 
        "slot3": ["shadow_ball", "hex"], 
    }, 

    "starmie": {
        "name": "Starmie", 
        "sprite": 164, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 65, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["bubble_beam", "water_gun"], 
        "slot2": ["recover", "rain_dance"], 
        "slot3": ["psybeam", "psychic"], 
    }, 

    "seaking": {
        "name": "Seaking", 
        "sprite": 162, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 60, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["horn_attack", "water_pulse"], 
        "slot2": ["swift_swim", "water_veil"], 
        "slot3": ["waterfall", "horn_drill"], 
    }, 

    "goldeen": {
        "name": "Goldeen", 
        "sprite": 161, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 20, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["horn_attack", "tackle"], 
        "slot2": ["water_veil", "none"], 
        "slot3": ["tackle", "tackle"], 
    }, 

    "staryu": {
        "name": "Staryu", 
        "sprite": 163, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 25, 
        "power": 35, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["bubble_beam", "tackle"], 
        "slot2": ["recover", "none"], 
        "slot3": ["confusion", "tackle"], 

        "evolve": ["starmie", 4]
    }, 

    "electrode": {
        "name": "Electrode", 
        "sprite": 141, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 20, 
        "power": 50, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["electro_ball", "spark"], 
        "slot2": ["self-destruct", "thunder_wave"], 
        "slot3": ["explosion", "shock_wave"], 
    }, 

    "voltorb": {
        "name": "Voltorb", 
        "sprite": 140, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 1, 

        "health": 15, 
        "power": 30, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["electro_ball", "spark"], 
        "slot2": ["self-destruct", "none"], 
        "slot3": ["explosion", "tackle"], 

        "evolve": ["electrode", 4]
    }, 

    "raichu": {
        "name": "Raichu", 
        "sprite": 40, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 65, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["thunderbolt", "skull_bash"], 
        "slot2": ["agility", "charge"], 
        "slot3": ["play_rough", "thunder"], 
    }, 

    "raticate": {
        "name": "Raticate", 
        "sprite": 26, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 15, 
        "power": 25, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["super_fang", "hyper_fang"], 
        "slot2": ["mischief", "swords_dance"], 
        "slot3": ["bite", "crunch"], 
    }, 

    "rattata": {
        "name": "Rattata", 
        "sprite": 24, 
        "color": "white", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 1, 

        "health": 10, 
        "power": 25, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bite", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["raticate", 3]
    }, 

    "joey rattata": {
        "name": "Rattata", 
        "sprite": 24, 
        "color": "white", 
        "rarity": 4, 

        "ap": 9, 
        "pp": 4, 

        "health": 100, 
        "power": 100, 
        "speed": 100, 

        "trait": null, 
        "slot1": ["ultima_fang", "hyper_beam"], 
        "slot2": ["triple_team", "none"], 
        "slot3": ["bite", "tackle"], 
    }, 

    "pidgey": {
        "name": "Pidgey", 
        "sprite": 20, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 15, 
        "power": 15, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["gust", "tackle"], 
        "slot2": ["sand_attack", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["pidgeotto", 3]
    }, 

    "pidgeotto": {
        "name": "Pidgeotto", 
        "sprite": 21, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 35, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["wing_attack", "whirlwind"], 
        "slot2": ["roost", "sand_attack"], 
        "slot3": ["gust", "peck"], 

        "evolve": ["pidgeot", 6]
    }, 

    "pidgeot": {
        "name": "Pidgeot", 
        "sprite": 22, 
        "color": "flying", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 65, 
        "power": 50, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["fly", "sky_attack"], 
        "slot2": ["tailwind", "roost"], 
        "slot3": ["wing_attack", "whirlwind"], 
    }, 

    "spearow": {
        "name": "Spearow", 
        "sprite": 28, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 15, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["peck", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["fearow", 4]
    }, 

    "fearow": {
        "name": "Fearow", 
        "sprite": 29, 
        "color": "flying", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 30, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["wing_attack", "peck"], 
        "slot2": ["focus_energy", "agility"], 
        "slot3": ["drill_peck", "fly"], 
    }, 

    "jigglypuff": {
        "name": "Jigglypuff", 
        "sprite": 60, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 3, 

        "health": 35, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["pound", "tackle"], 
        "slot2": ["sing", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["wigglytuff", 4]
    }, 

    "wigglytuff": {
        "name": "Wigglytuff", 
        "sprite": 62, 
        "color": "fairy", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 75, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["pound", "slam"], 
        "slot2": ["sing", "taunt"], 
        "slot3": ["hyper_voice", "body_slam"], 
    }, 

    "nidorino": {
        "name": "Nidorino", 
        "sprite": 50, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["horn_attack", "double_kick"], 
        "slot2": ["poison_point", "none"], 
        "slot3": ["poison_sting", "headbutt"], 

        "evolve": ["nidoking", 7]
    }, 

    "nidoking": {
        "name": "Nidoking", 
        "sprite": 51, 
        "color": "poison", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["earthquake", "poison_jab"], 
        "slot2": ["poison_point", "conqueror"], 
        "slot3": ["horn_attack", "ice_punch"], 
    }, 

    "*nidoking": {
        "name": "Nidoking", 
        "sprite": 1159, 
        "color": "poison", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["earthquake", "surf"], 
        "slot2": ["poison_point", "conqueror"], 
        "slot3": ["horn_attack", "ice_punch"], 
    }, 

    "nidorina": {
        "name": "Nidorina", 
        "sprite": 47, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 40, 
        "power": 25, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["double_kick", "horn_attack"], 
        "slot2": ["poison_point", "none"], 
        "slot3": ["poison_sting", "headbutt"], 

        "evolve": ["nidoqueen", 6]
    }, 

    "nidoqueen": {
        "name": "Nidoqueen", 
        "sprite": 48, 
        "color": "poison", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 70, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["earth_power", "superpower"], 
        "slot2": ["leftovers", "poison_point"], 
        "slot3": ["double_kick", "thunder_punch"], 
    }, 

    "magneton": {
        "name": "Magneton", 
        "sprite": 117, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 50, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["discharge", "tri_attack"], 
        "slot2": ["magnet_pull", "download"], 
        "slot3": ["smart_strike", "spark"], 

        "evolve": ["magnezone", 6]
    }, 

    "magnemite": {
        "name": "Magnemite", 
        "sprite": 116, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 3, 

        "health": 30, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["thunder_shock", "tackle"], 
        "slot2": ["magnet_pull", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["magneton", 3]
    }, 

    "vulpix": {
        "name": "Vulpix", 
        "sprite": 56, 
        "color": "red", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 20, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["ember", "mystical_fire"], 
        "slot2": ["will-o-wisp", "none"], 
        "slot3": ["incinerate", "tackle"], 

        "evolve": ["ninetales", 4]
    }, 

    "tangela": {
        "name": "Tangela", 
        "sprite": 156, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 40, 
        "power": 15, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["wrap", "knock_off"], 
        "slot2": ["tickle", "none"], 
        "slot3": ["vine_whip", "tackle"], 

        "evolve": ["tangrowth", 6]
    }, 

    "tangrowth": {
        "name": "Tangrowth", 
        "sprite": 647, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 65, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["power_whip", "seed_bomb"], 
        "slot2": ["ancient_power", "tickle"], 
        "slot3": ["brutal_swing", "vine_whip"], 
    }, 

    "oddish": {
        "name": "Oddish", 
        "sprite": 66, 
        "color": "green", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 2, 

        "health": 25, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["absorb", "tackle"], 
        "slot2": ["poison_powder", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["gloom", 3]
    }, 

    "gloom": {
        "name": "Gloom", 
        "sprite": 67, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["mega_drain", "sludge_bomb"], 
        "slot2": ["poison_powder", "none"], 
        "slot3": ["absorb", "smog"], 

        "evolve": ["vileplume", 6]
    }, 

    "vileplume": {
        "name": "Vileplume", 
        "sprite": 68, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 6, 

        "health": 55, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["giga_drain", "sludge_bomb"], 
        "slot2": ["petal_dance", "poison_powder"], 
        "slot3": ["petal_blizzard", "toxic"], 
    }, 

    "bellossom": {
        "name": "Bellossom", 
        "sprite": 244, 
        "color": "green", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 6, 

        "health": 40, 
        "power": 40, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["giga_drain", "razor_leaf"], 
        "slot2": ["aromatherapy", "sunny_day"], 
        "slot3": ["petal_blizzard", "solar_beam"], 
    }, 

    "bellsprout": {
        "name": "Bellsprout", 
        "sprite": 100, 
        "color": "green", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 10, 
        "power": 30, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["vine_whip", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["victreebel", 4]
    }, 

    "victreebel": {
        "name": "Victreebel", 
        "sprite": 102, 
        "color": "green", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 2, 

        "health": 35, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["vine_whip", "acid_spray"], 
        "slot2": ["chlorophyll", "growth"], 
        "slot3": ["razor_leaf", "leaf_storm"], 
    }, 

    "slowpoke": {
        "name": "Slowpoke", 
        "sprite": 113, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 30, 
        "power": 15, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["water_gun", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["confusion", "tackle"], 

        "evolve": ["slowbro", 4]
    }, 

    "slowbro": {
        "name": "Slowbro", 
        "sprite": 114, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["waterfall", "zen_headbutt"], 
        "slot2": ["amnesia", "disable"], 
        "slot3": ["slack_off", "wave_crash"], 
    }, 

    "kadabra": {
        "name": "Kadabra", 
        "sprite": 94, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 60, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["kinesis", "psybeam"], 
        "slot2": ["teleport", "disable"], 
        "slot3": ["confusion", "psychic"], 

        "evolve": ["alakazam", 6]
    }, 

    "alakazam": {
        "name": "Alakazam", 
        "sprite": 95, 
        "color": "psychic", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 35, 
        "power": 80, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["kinesis", "confusion"], 
        "slot2": ["teleport", "psychic_guard"], 
        "slot3": ["psychic", "mind_shock"], 
    }, 

    "grimer": {
        "name": "Grimer", 
        "sprite": 123, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 25, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["pound", "sludge_wave"], 
        "slot2": ["poison_point", "minimize"], 
        "slot3": ["sludge", "toxic"], 

        "evolve": ["muk", 4]
    }, 

    "muk": {
        "name": "Muk", 
        "sprite": 125, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 2, 

        "health": 65, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["sludge_punch", "sludge_wave"], 
        "slot2": ["minimize", "wide_guard"], 
        "slot3": ["sludge_bomb", "sludge"], 
    }, 

    "koffing": {
        "name": "Koffing", 
        "sprite": 151, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 30, 
        "power": 15, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["poison_gas", "tackle"], 
        "slot2": ["smokescreen", "self-destruct"], 
        "slot3": ["sludge", "tackle"], 

        "evolve": ["weezing", 4]
    }, 

    "weezing": {
        "name": "Weezing", 
        "sprite": 152, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 5, 
        "pp": 4, 

        "health": 40, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["poison_gas", "explosion"], 
        "slot2": ["smokescreen", "self-destruct"], 
        "slot3": ["belch", "sludge_bomb"], 
    }, 

    "ponyta": {
        "name": "Ponyta", 
        "sprite": 111, 
        "color": "red", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 20, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["flame_wheel", "stomp"], 
        "slot2": ["cavalry", "run_away"], 
        "slot3": ["horn_attack", "flame_charge"], 

        "evolve": ["rapidash", 4]
    }, 

    "rapidash": {
        "name": "Rapidash", 
        "sprite": 112, 
        "color": "red", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["flame_wheel", "smart_strike"], 
        "slot2": ["cavalry", "run_away"], 
        "slot3": ["bounce", "flame_charge"], 
    }, 

    "*rapidash": {
        "name": "Rapidash", 
        "sprite": 1163, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 5, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["wave_crash", "smart_strike"], 
        "slot2": ["cavalry", "rain_dance"], 
        "slot3": ["bounce", "flame_wheel"], 
    }, 

    "growlithe": {
        "name": "Growlithe", 
        "sprite": 86, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 20, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["fire_fang", "ember"], 
        "slot2": ["bark", "none"], 
        "slot3": ["bite", "ember"], 

        "evolve": ["arcanine", 4]
    }, 

    "arcanine": {
        "name": "Arcanine", 
        "sprite": 87, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["fire_fang", "take_down"], 
        "slot2": ["extreme_speed", "agility"], 
        "slot3": ["flare_blitz", "flamethrower"], 
    }, 

    "*arcanine": {
        "name": "Arcanine", 
        "sprite": 1161, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 65, 
        "power": 60, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["wild_charge", "fire_fang"], 
        "slot2": ["extreme_speed", "agility"], 
        "slot3": ["flare_blitz", "thunder_fang"], 
    }, 

    "rhyhorn": {
        "name": "Rhyhorn", 
        "sprite": 153, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 40, 
        "power": 35, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["horn_attack", "stone_edge"], 
        "slot2": ["cover", "solid_rock"], 
        "slot3": ["headbutt", "drill_run"], 

        "evolve": ["rhydon", 4]
    }, 

    "rhydon": {
        "name": "Rhydon", 
        "sprite": 154, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 65, 
        "power": 55, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["horn_attack", "bulldoze"], 
        "slot2": ["cover", "solid_rock"], 
        "slot3": ["hammer_arm", "drill_run"], 

        "evolve": ["rhyperior", 8]
    }, 

    "rhyperior": {
        "name": "Rhyperior", 
        "sprite": 646, 
        "color": "ground", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 75, 
        "power": 75, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["horn_attack", "bulldoze"], 
        "slot2": ["solid_rock", "wall"], 
        "slot3": ["rock_wrecker", "stone_edge"], 
    }, 

    "meowth": {
        "name": "Meowth", 
        "sprite": 78, 
        "color": "white", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 3, 

        "health": 15, 
        "power": 35, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["scratch", "scratch"], 
        "slot2": ["pay_day", "none"], 
        "slot3": ["slash", "scratch"], 

        "evolve": ["persian", 4]
    }, 

    "persian": {
        "name": "Persian", 
        "sprite": 80, 
        "color": "white", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 30, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["slash", "play_rough"], 
        "slot2": ["pay_day", "nasty_plot"], 
        "slot3": ["power_gem", "shadow_claw"], 
    }, 

    "zigzagoon": {
        "name": "Zigzagoon", 
        "sprite": 389, 
        "color": "white", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 1, 

        "health": 20, 
        "power": 25, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["headbutt", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["linoone", 4]
    }, 

    "linoone": {
        "name": "Linoone", 
        "sprite": 390, 
        "color": "white", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 2, 

        "health": 20, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["slash", "dig"], 
        "slot2": ["double_team", "helping_hand"], 
        "slot3": ["headbutt", "double-edge"], 
    }, 

    "tyrogue": {
        "name": "Tyrogue", 
        "sprite": 350, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 0, 

        "health": 25, 
        "power": 25, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["smash_punch", "smash_kick"], 
        "slot2": ["endure", "none"], 
        "slot3": ["karate_chop", "tackle"], 

        "evolve": ["hitmonlee", 4]
    }, 

    "hitmonlee": {
        "name": "Hitmonlee", 
        "sprite": 148, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 30, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["rolling_kick", "mega_kick"], 
        "slot2": ["reckless", "fake_out"], 
        "slot3": ["high_jump_kick", "blaze_kick"], 
    }, 

    "hitmonchan": {
        "name": "Hitmonchan", 
        "sprite": 149, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 55, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["mega_punch", "drain_punch"], 
        "slot2": ["mach_punch", "endure"], 
        "slot3": ["comet_punch", "ice_punch"], 
    }, 

    "hitmontop": {
        "name": "Hitmontop", 
        "sprite": 351, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["triple_kick", "rolling_kick"], 
        "slot2": ["counter", "focus_energy"], 
        "slot3": ["rapid_spin", "pursuit"], 
    }, 

    "eevee": {
        "name": "Eevee", 
        "sprite": 178, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 25, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["take_down", "double-edge"], 
        "slot2": ["helping_hand", "run_away"], 
        "slot3": ["swift", "headbutt"], 

        "evolve": ["vaporeon", 4]
    }, 

    "vaporeon": {
        "name": "Vaporeon", 
        "sprite": 179, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 60, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["water_pulse", "aurora_beam"], 
        "slot2": ["acid_armor", "aqua_ring"], 
        "slot3": ["hydro_pump", "surf"], 
    }, 

    "jolteon": {
        "name": "Jolteon", 
        "sprite": 180, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 25, 
        "power": 65, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["charge_beam", "pin_missile"], 
        "slot2": ["volt_switch", "thunder_wave"], 
        "slot3": ["thunderbolt", "thunder_fang"], 
    }, 

    "flareon": {
        "name": "Flareon", 
        "sprite": 181, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 40, 
        "power": 70, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["fire_fang", "bite"], 
        "slot2": ["quick_attack", "warmth"], 
        "slot3": ["flare_blitz", "fire_spin"], 
    }, 

    "espeon": {
        "name": "Espeon", 
        "sprite": 259, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 25, 
        "power": 70, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["psybeam", "confusion"], 
        "slot2": ["morning_sun", "future_sight"], 
        "slot3": ["psychic", "shadow_ball"], 
    }, 

    "umbreon": {
        "name": "Umbreon", 
        "sprite": 260, 
        "color": "black", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 6, 

        "health": 65, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["snarl", "knock_off"], 
        "slot2": ["moonlight", "guardian"], 
        "slot3": ["dark_pulse", "take_down"], 
    }, 

    "leafeon": {
        "name": "Leafeon", 
        "sprite": 654, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 45, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["leaf_blade", "razor_leaf"], 
        "slot2": ["leaf_guard", "growth"], 
        "slot3": ["energy_ball", "aerial_ace"], 
    }, 

    "glaceon": {
        "name": "Glaceon", 
        "sprite": 655, 
        "color": "ice", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 45, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["ice_fang", "aurora_beam"], 
        "slot2": ["spiky_shield", "ice_body"], 
        "slot3": ["icy_wind", "ice_shard"], 
    }, 

    "sylveon": {
        "name": "Sylveon", 
        "sprite": 1001, 
        "color": "fairy", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 60, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["moonblast", "double_kick"], 
        "slot2": ["helping_hand", "baton_pass"], 
        "slot3": ["magical_leaf", "draining_kiss"], 
    }, 

    "gyarados": {
        "name": "Gyarados", 
        "sprite": 174, 
        "color": "blue", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 4, 

        "health": 65, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["berserker_splash", "crunch"], 
        "slot2": ["dragon_dance", "rain_dance"], 
        "slot3": ["aqua_tail", "hyper_beam"], 
    }, 

    "*gyarados": {
        "name": "Gyarados", 
        "sprite": 1155, 
        "color": "red", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 65, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["berserker_splash", "hyper_beam"], 
        "slot2": ["dragon_dance", "sunny_day"], 
        "slot3": ["burning_tail", "aqua_tail"], 
    }, 

    "skitty": {
        "name": "Skitty", 
        "sprite": 427, 
        "color": "white", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 15, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["fury_swipes", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 
    }, 

    "bidoof": {
        "name": "Bidoof", 
        "sprite": 568, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 15, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["headbutt", "tackle"], 
        "slot2": ["taunt", "leftovers"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["bibarel", 3]
    }, 

    "lopunny": {
        "name": "Lopunny", 
        "sprite": 606, 
        "color": "white", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 50, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["bounce", "double_kick"], 
        "slot2": ["baton_pass", "attract"], 
        "slot3": ["high_jump_kick", "dizzy_punch"], 
    }, 

    "buneary": {
        "name": "Buneary", 
        "sprite": 605, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["pound", "double_kick"], 
        "slot2": ["baton_pass", "attract"], 
        "slot3": ["jump_kick", "pound"], 

        "evolve": ["lopunny", 5]
    }, 

    "metapod": {
        "name": "Metapod", 
        "sprite": 14, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 0, 

        "health": 30, 
        "power": 0, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["harden", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["harden", "tackle"], 

        "evolve": ["butterfree", 3]
    }, 

    "butterfree": {
        "name": "Butterfree", 
        "sprite": 15, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 30, 
        "power": 35, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["bug_buzz", "confusion"], 
        "slot2": ["poison_powder", "quiver_dance"], 
        "slot3": ["air_slash", "psybeam"], 
    }, 

    "kakuna": {
        "name": "Kakuna", 
        "sprite": 17, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 0, 

        "health": 30, 
        "power": 0, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["harden", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["harden", "tackle"], 

        "evolve": ["beedrill", 3]
    }, 

    "beedrill": {
        "name": "Beedrill", 
        "sprite": 18, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 2, 
        "pp": 3, 

        "health": 15, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["twineedle", "fell_stinger"], 
        "slot2": ["swarm", "swords_dance"], 
        "slot3": ["poison_sting", "x-scissor"], 
    }, 

    "pachirisu": {
        "name": "Pachirisu", 
        "sprite": 592, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 40, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["nuzzle", "super_fang"], 
        "slot2": ["charge", "god_slayer"], 
        "slot3": ["spark", "wild_charge"], 
    }, 

    "dragonite": {
        "name": "Dragonite", 
        "sprite": 195, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 9, 
        "pp": 6, 

        "health": 80, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["outrage", "fly"], 
        "slot2": ["multiscale", "agility"], 
        "slot3": ["hyper_beam", "hurricane"], 
    }, 

    "*dragonite": {
        "name": "Dragonite", 
        "sprite": 195, 
        "color": "dragon", 
        "rarity": 5, 

        "ap": 9, 
        "pp": 6, 

        "health": 80, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["outrage", "fly"], 
        "slot2": ["multiscale", "agility"], 
        "slot3": ["hyper_beam", "hurricane"], 
    }, 

    "dragonair": {
        "name": "Dragonair", 
        "sprite": 194, 
        "color": "dragon", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 45, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["dragon_rage", "twister"], 
        "slot2": ["marvel_scale", "multiscale"], 
        "slot3": ["dragon_tail", "slam"], 

        "evolve": ["dragonite", 8]
    }, 

    "dratini": {
        "name": "Dratini", 
        "sprite": 193, 
        "color": "dragon", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["dragon_rage", "twister"], 
        "slot2": ["marvel_scale", "multiscale"], 
        "slot3": ["twister", "slam"], 

        "evolve": ["dragonair", 4]
    }, 

    "aerodactyl": {
        "name": "Aerodactyl", 
        "sprite": 187, 
        "color": "rock", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 55, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["stone_edge", "thunder_fang"], 
        "slot2": ["ancient_power", "rock_head"], 
        "slot3": ["sky_attack", "fly"], 
    }, 

    "mewtwo": {
        "name": "Mewtwo", 
        "sprite": 196, 
        "color": "psychic", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 6, 

        "health": 75, 
        "power": 160, 
        "speed": 125, 

        "trait": null, 
        "slot1": ["psystrike", "psychic"], 
        "slot2": ["recover", "disable"], 
        "slot3": ["shadow_ball", "swift"], 
    }, 

    "mew": {
        "name": "Mew", 
        "sprite": 199, 
        "color": "psychic", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 60, 
        "power": 60, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["psychic", "transform"], 
        "slot2": ["barrier", "baton_pass"], 
        "slot3": ["aura_sphere", "metronome"], 
    }, 

    "lugia": {
        "name": "Lugia", 
        "sprite": 364, 
        "color": "psychic", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 9, 

        "health": 140, 
        "power": 70, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["aeroblast", "sky_attack"], 
        "slot2": ["wall", "rain_dance"], 
        "slot3": ["hydro_pump", "psychic"], 
    }, 

    "ho-oh": {
        "name": "Ho-Oh", 
        "sprite": 365, 
        "color": "red", 
        "rarity": 5, 

        "ap": 9, 
        "pp": 6, 

        "health": 90, 
        "power": 130, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["sacred_fire", "sky_attack"], 
        "slot2": ["recover", "sunny_day"], 
        "slot3": ["overheat", "fire_blast"], 
    }, 

    "groudon": {
        "name": "Groudon", 
        "sprite": 536, 
        "color": "ground", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 150, 
        "power": 120, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["earthquake", "fissure"], 
        "slot2": ["drought", "impervious"], 
        "slot3": ["earth_power", "solar_beam"], 
    }, 

    "kyogre": {
        "name": "Kyogre", 
        "sprite": 535, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 120, 
        "power": 150, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["water_spout", "sheer_cold"], 
        "slot2": ["drizzle", "aqua_ring"], 
        "slot3": ["hydro_pump", "aqua_tail"], 
    }, 

    "rayquaza": {
        "name": "Rayquaza", 
        "sprite": 539, 
        "color": "dragon", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 6, 

        "health": 90, 
        "power": 160, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["outrage", "dragon_pulse"], 
        "slot2": ["extreme_speed", "dragon_dance"], 
        "slot3": ["fly", "hyper_beam"], 
    }, 

    "deoxys": {
        "name": "Deoxys", 
        "sprite": 543, 
        "color": "psychic", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 6, 

        "health": 60, 
        "power": 120, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["psycho_boost", "zap_cannon"], 
        "slot2": ["mutation", "nasty_plot"], 
        "slot3": ["psychic", "signal_beam"], 
    }, 

    "dialga": {
        "name": "Dialga", 
        "sprite": 674, 
        "color": "dragon", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 140, 
        "power": 130, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["roar_of_time", "metal_claw"], 
        "slot2": ["screech", "trick_room"], 
        "slot3": ["flash_cannon", "power_gem"], 
    }, 

    "palkia": {
        "name": "Palkia", 
        "sprite": 675, 
        "color": "dragon", 
        "rarity": 5, 

        "ap": 9, 
        "pp": 4, 

        "health": 110, 
        "power": 140, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["spacial_rend", "dragon_claw"], 
        "slot2": ["whirlpool", "trick"], 
        "slot3": ["aqua_tail", "dragon_breath"], 
    }, 

    "giratina": {
        "name": "Giratina", 
        "sprite": 679, 
        "color": "ghost", 
        "rarity": 5, 

        "ap": 9, 
        "pp": 4, 

        "health": 100, 
        "power": 140, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["shadow_force", "shadow_ball"], 
        "slot2": ["disable", "spook"], 
        "slot3": ["shadow_claw", "aura_sphere"], 
    }, 

    "regigigas": {
        "name": "Regigigas", 
        "sprite": 677, 
        "color": "white", 
        "rarity": 5, 

        "ap": 10, 
        "pp": 10, 

        "health": 150, 
        "power": 160, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["crush_grip", "heavy_slam"], 
        "slot2": ["slow_start", "slow_start"], 
        "slot3": ["giga_impact", "hammer_arm"], 
    }, 

    "reshiram": {
        "name": "Reshiram", 
        "sprite": 870, 
        "color": "red", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 90, 
        "power": 160, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["fusion_flare", "dragon_pulse"], 
        "slot2": ["blaze", "noble_roar"], 
        "slot3": ["blue_flare", "flamethrower"], 
    }, 

    "zekrom": {
        "name": "Zekrom", 
        "sprite": 871, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 4, 

        "health": 90, 
        "power": 160, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["fusion_bolt", "dragon_claw"], 
        "slot2": ["charge", "noble_roar"], 
        "slot3": ["bolt_strike", "thunderbolt"], 
    }, 

    "kyurem": {
        "name": "Kyurem", 
        "sprite": 874, 
        "color": "ice", 
        "rarity": 5, 

        "ap": 9, 
        "pp": 3, 

        "health": 100, 
        "power": 120, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["glaciate", "ice_beam"], 
        "slot2": ["endure", "noble_roar"], 
        "slot3": ["ice_burn", "freeze_shock"], 
    }, 

    "xerneas": {
        "name": "Xerneas", 
        "sprite": 1020, 
        "color": "fairy", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 5, 

        "health": 120, 
        "power": 140, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["moonblast", "giga_impact"], 
        "slot2": ["geomancy", "detect"], 
        "slot3": ["horn_attack", "horn_leech"], 
    }, 

    "yveltal": {
        "name": "Yveltal", 
        "sprite": 1021, 
        "color": "black", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 5, 

        "health": 80, 
        "power": 160, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["oblivion_wing", "hyper_beam"], 
        "slot2": ["disable", "sucker_punch"], 
        "slot3": ["dark_pulse", "dragon_rush"], 
    }, 

    "zygarde": {
        "name": "Zygarde", 
        "sprite": 1026, 
        "color": "ground", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 6, 

        "health": 200, 
        "power": 80, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["thousand_arrows", "outrage"], 
        "slot2": ["core_enforcer", "extreme_speed"], 
        "slot3": ["thousand_waves", "earthquake"], 
    }, 

    "celebi": {
        "name": "Celebi", 
        "sprite": 366, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 60, 
        "power": 60, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["energy_ball", "magical_leaf"], 
        "slot2": ["healing_touch", "future_sight"], 
        "slot3": ["psychic", "solar_beam"], 
    }, 

    "jirachi": {
        "name": "Jirachi", 
        "sprite": 540, 
        "color": "fairy", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 60, 
        "power": 60, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["meteor_mash", "aura_sphere"], 
        "slot2": ["doom_desire", "cosmic_power"], 
        "slot3": ["psychic", "wish"], 
    }, 

    "victini": {
        "name": "Victini", 
        "sprite": 690, 
        "color": "red", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 60, 
        "power": 60, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["v-create", "overheat"], 
        "slot2": ["endure", "counter"], 
        "slot3": ["searing_shot", "final_gambit"], 
    }, 

    "houndoom": {
        "name": "Houndoom", 
        "sprite": 342, 
        "color": "black", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 35, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["fire_fang", "crunch"], 
        "slot2": ["eternal_punishment", "beat_up"], 
        "slot3": ["flamethrower", "dark_pulse"], 
    }, 

    "*houndoom": {
        "name": "Houndoom", 
        "sprite": 1177, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 65, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["scald", "fire_fang"], 
        "slot2": ["eternal_punishment", "beat_up"], 
        "slot3": ["dark_pulse", "flamethrower"], 
    }, 

    "houndour": {
        "name": "Houndour", 
        "sprite": 341, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["fire_fang", "bite"], 
        "slot2": ["beat_up", "none"], 
        "slot3": ["bite", "ember"], 

        "evolve": ["houndoom", 4]
    }, 

    "weavile": {
        "name": "Weavile", 
        "sprite": 643, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 30, 
        "power": 65, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["triple_axel", "ice_shard"], 
        "slot2": ["pocket_thug", "beat_up"], 
        "slot3": ["night_slash", "foul_play"], 
    }, 

    "sneasel": {
        "name": "Sneasel", 
        "sprite": 326, 
        "color": "black", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 20, 
        "power": 45, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["ice_punch", "scratch"], 
        "slot2": ["beat_up", "double_team"], 
        "slot3": ["foul_play", "scratch"], 

        "evolve": ["weavile", 6]
    }, 

    "machamp": {
        "name": "Machamp", 
        "sprite": 99, 
        "color": "fighting", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 75, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["vital_throw", "cross_chop"], 
        "slot2": ["no_guard", "bulk_up"], 
        "slot3": ["submission", "dynamic_punch"], 
    }, 

    "*machamp": {
        "name": "Machamp", 
        "sprite": 1162, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 75, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["wood_hammer", "vital_throw"], 
        "slot2": ["no_guard", "leech_seed"], 
        "slot3": ["cross_chop", "submission"], 
    }, 

    "machoke": {
        "name": "Machoke", 
        "sprite": 98, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["strength", "submission"], 
        "slot2": ["bulk_up", "guts"], 
        "slot3": ["karate_chop", "brick_break"], 

        "evolve": ["machamp", 6]
    }, 

    "poliwrath": {
        "name": "Poliwrath", 
        "sprite": 91, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 55, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["waterfall", "mega_punch"], 
        "slot2": ["hypnosis", "belly_drum"], 
        "slot3": ["submission", "dynamic_punch"], 
    }, 

    "poliwhirl": {
        "name": "Poliwhirl", 
        "sprite": 89, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 30, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["bubble_beam", "tackle"], 
        "slot2": ["hypnosis", "step_up"], 
        "slot3": ["water_gun", "tackle"], 

        "evolve": ["poliwrath", 5]
    }, 

    "lapras": {
        "name": "Lapras", 
        "sprite": 176, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["water_pulse", "aurora_beam"], 
        "slot2": ["life_dew", "whirlpool"], 
        "slot3": ["blizzard", "surf"], 
    }, 

    "*lapras": {
        "name": "Lapras", 
        "sprite": 1164, 
        "color": "white", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["moonblast", "psybeam"], 
        "slot2": ["future_sight", "life_dew"], 
        "slot3": ["ice_beam", "blizzard"], 
    }, 

    "jynx": {
        "name": "Jynx", 
        "sprite": 167, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 60, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["frost_breath", "powder_snow"], 
        "slot2": ["lovely_kiss", "attract"], 
        "slot3": ["confusion", "psybeam"], 
    }, 

    "dewgong": {
        "name": "Dewgong", 
        "sprite": 122, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 35, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["aurora_beam", "headbutt"], 
        "slot2": ["aqua_ring", "ice_body"], 
        "slot3": ["ice_shard", "ice_beam"], 
    }, 

    "golbat": {
        "name": "Golbat", 
        "sprite": 65, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 35, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["leech_life", "poison_fang"], 
        "slot2": ["colony", "none"], 
        "slot3": ["bite", "fly"], 

        "evolve": ["crobat", 5]
    }, 

    "crobat": {
        "name": "Crobat", 
        "sprite": 228, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 50, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["cross_poison", "fly"], 
        "slot2": ["double_team", "colony"], 
        "slot3": ["poison_fang", "leech_life"], 
    }, 

    "zubat": {
        "name": "Zubat", 
        "sprite": 64, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 2, 
        "pp": 1, 

        "health": 1, 
        "power": 15, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["leech_life", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["bite", "tackle"], 
    }, 

    "arbok": {
        "name": "Arbok", 
        "sprite": 31, 
        "color": "green", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 40, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["poison_fang", "crunch"], 
        "slot2": ["glare", "coil"], 
        "slot3": ["acid_spray", "wrap"], 
    }, 

    "*arbok": {
        "name": "Arbok", 
        "sprite": 1165, 
        "color": "poison", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 55, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["thunder_fang", "crunch"], 
        "slot2": ["glare", "coil"], 
        "slot3": ["poison_fang", "acid_spray"], 
    }, 

    "sandslash": {
        "name": "Sandslash", 
        "sprite": 44, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["fury_cutter", "bulldoze"], 
        "slot2": ["spiky_shield", "wall"], 
        "slot3": ["dig", "slash"], 
    }, 

    "sandshrew": {
        "name": "Sandshrew", 
        "sprite": 42, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 0, 

        "health": 25, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["fury_cutter", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["dig", "tackle"], 

        "evolve": ["sandslash", 3]
    }, 

    "marowak": {
        "name": "Marowak", 
        "sprite": 146, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 40, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bone_rush", "headbutt"], 
        "slot2": ["rock_head", "cover"], 
        "slot3": ["bonemerang", "bulldoze"], 
    }, 

    "*marowak": {
        "name": "Marowak", 
        "sprite": 1166, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bone_rush", "headbutt"], 
        "slot2": ["rock_head", "cover"], 
        "slot3": ["bonemerang", "bulldoze"], 
    }, 

    "cubone": {
        "name": "Cubone", 
        "sprite": 145, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["bonemerang", "tackle"], 
        "slot2": ["rock_head", "cover"], 
        "slot3": ["headbutt", "tackle"], 

        "evolve": ["marowak", 4]
    }, 

    "kingler": {
        "name": "Kingler", 
        "sprite": 138, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 40, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["crabhammer", "hammer_arm"], 
        "slot2": ["hyper_cutter", "shell_armor"], 
        "slot3": ["bubble_beam", "guillotine"], 
    }, 

    "krabby": {
        "name": "Krabby", 
        "sprite": 137, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["crabhammer", "water_gun"], 
        "slot2": ["hyper_cutter", "shell_armor"], 
        "slot3": ["bubble_beam", "tackle"], 

        "evolve": ["kingler", 4]
    }, 

    "cloyster": {
        "name": "Cloyster", 
        "sprite": 129, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 70, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["icicle_spear", "razor_shell"], 
        "slot2": ["cover", "shell_smash"], 
        "slot3": ["water_gun", "razor_shell"], 
    }, 

    "kabutops": {
        "name": "Kabutops", 
        "sprite": 186, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["razor_shell", "slash"], 
        "slot2": ["ancient_power", "swift_swim"], 
        "slot3": ["fury_cutter", "brine"], 
    }, 

    "kabuto": {
        "name": "Kabuto", 
        "sprite": 185, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["razor_shell", "scratch"], 
        "slot2": ["ancient_power", "swift_swim"], 
        "slot3": ["fury_cutter", "water_gun"], 

        "evolve": ["kabutops", 6]
    }, 

    "scyther": {
        "name": "Scyther", 
        "sprite": 166, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 20, 
        "power": 50, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["x-scissor", "fury_cutter"], 
        "slot2": ["swords_dance", "focus_energy"], 
        "slot3": ["wing_attack", "razor_wind"], 

        "evolve": ["scizor", 6]
    }, 

    "*scyther": {
        "name": "Scyther", 
        "sprite": 1172, 
        "color": "red", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 25, 
        "power": 65, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["firesword", "fury_cutter"], 
        "slot2": ["swords_dance", "focus_energy"], 
        "slot3": ["x-scissor", "razor_wind"], 
    }, 

    "pinsir": {
        "name": "Pinsir", 
        "sprite": 170, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["vice_grip", "x-scissor"], 
        "slot2": ["focus_energy", "shell_armor"], 
        "slot3": ["seismic_toss", "guillotine"], 
    }, 

    "exeggutor": {
        "name": "Exeggutor", 
        "sprite": 143, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 65, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["egg_barrage", "psychic"], 
        "slot2": ["hypnosis", "leech_seed"], 
        "slot3": ["seed_bomb", "explosion"], 
    }, 

    "tentacruel": {
        "name": "Tentacruel", 
        "sprite": 104, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 6, 

        "health": 55, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["constrict", "water_pulse"], 
        "slot2": ["toxic_spikes", "acid_armor"], 
        "slot3": ["poison_jab", "surf"], 
    }, 

    "tentacool": {
        "name": "Tentacool", 
        "sprite": 103, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["constrict", "water_pulse"], 
        "slot2": ["toxic_spikes", "none"], 
        "slot3": ["water_gun", "poison_sting"], 

        "evolve": ["tentacruel", 5]
    }, 

    "primeape": {
        "name": "Primeape", 
        "sprite": 85, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 60, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["rage", "brick_break"], 
        "slot2": ["anger_point", "none"], 
        "slot3": ["rage_fist", "final_gambit"], 
    }, 

    "mankey": {
        "name": "Mankey", 
        "sprite": 84, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 0, 

        "health": 20, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["rage", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["brick_break", "tackle"], 

        "evolve": ["primeape", 3]
    }, 

    "scizor": {
        "name": "Scizor", 
        "sprite": 321, 
        "color": "steel", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 4, 

        "health": 55, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["metal_claw", "fury_cutter"], 
        "slot2": ["bullet_punch", "iron_defense"], 
        "slot3": ["x-scissor", "iron_head"], 
    }, 

    "*scizor": {
        "name": "Scizor", 
        "sprite": 1193, 
        "color": "green", 
        "rarity": 5, 

        "ap": 5, 
        "pp": 4, 

        "health": 55, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["leaf_blade", "metal_claw"], 
        "slot2": ["bullet_punch", "iron_defense"], 
        "slot3": ["iron_head", "x-scissor"], 
    }, 

    "lickitung": {
        "name": "Lickitung", 
        "sprite": 150, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 45, 
        "power": 35, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["lick", "power_whip"], 
        "slot2": ["leftovers", "belly_drum"], 
        "slot3": ["slam", "body_slam"], 
    }, 

    "togepi": {
        "name": "Togepi", 
        "sprite": 236, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 20, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["metronome", "tackle"], 
        "slot2": ["healing_touch", "energy_gift"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["togetic", 3]
    }, 

    "togetic": {
        "name": "Togetic", 
        "sprite": 237, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 35, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["fairy_wind", "metronome"], 
        "slot2": ["healing_touch", "energy_gift"], 
        "slot3": ["wish", "air_slash"], 

        "evolve": ["togekiss", 6]
    }, 

    "togekiss": {
        "name": "Togekiss", 
        "sprite": 651, 
        "color": "fairy", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 5, 

        "health": 55, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["moonblast", "metronome"], 
        "slot2": ["healing_touch", "energy_gift"], 
        "slot3": ["air_slash", "wish"], 
    }, 

    "blissey": {
        "name": "Blissey", 
        "sprite": 356, 
        "color": "white", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 90, 
        "power": 5, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["soft-boiled", "pound"], 
        "slot2": ["helping_hand", "minimize"], 
        "slot3": ["seismic_toss", "egg_barrage"], 
    }, 

    "chansey": {
        "name": "Chansey", 
        "sprite": 155, 
        "color": "white", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 75, 
        "power": 5, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["soft-boiled", "pound"], 
        "slot2": ["helping_hand", "minimize"], 
        "slot3": ["pound", "egg_barrage"], 
    }, 

    "tauros": {
        "name": "Tauros", 
        "sprite": 172, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 40, 
        "power": 50, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["raging_bull", "double-edge"], 
        "slot2": ["anger_point", "none"], 
        "slot3": ["horn_attack", "bulldoze"], 
    }, 

    "porygon": {
        "name": "Porygon", 
        "sprite": 182, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["tri_attack", "zap_cannon"], 
        "slot2": ["download", "conversion2"], 
        "slot3": ["signal_beam", "psybeam"], 
    }, 

    "porygon 2": {
        "name": "Porygon 2", 
        "sprite": 347, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 50, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["tri_attack", "discharge"], 
        "slot2": ["conversion2", "download"], 
        "slot3": ["signal_beam", "psybeam"], 
    }, 

    "porygon-z": {
        "name": "Porygon-Z", 
        "sprite": 658, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 25, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["hyper_beam", "hyper_beam"], 
        "slot2": ["overclock", "download"], 
        "slot3": ["tackle", "psybeam"], 
    }, 

    "ditto": {
        "name": "Ditto", 
        "sprite": 177, 
        "color": "white", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 20, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["transform", "transform"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 
    }, 

    "clefable": {
        "name": "Clefable", 
        "sprite": 54, 
        "color": "fairy", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["moonblast", "dazzling_gleam"], 
        "slot2": ["cosmic_power", "magic_guard"], 
        "slot3": ["metronome", "meteor_mash"], 
    }, 

    "clefairy": {
        "name": "Clefairy", 
        "sprite": 52, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 35, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["metronome", "moonblast"], 
        "slot2": ["magic_guard", "none"], 
        "slot3": ["pound", "fairy_wind"], 

        "evolve": ["clefable", 6]
    }, 

    "snorlax": {
        "name": "Snorlax", 
        "sprite": 189, 
        "color": "white", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 80, 
        "power": 65, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["body_slam", "double-edge"], 
        "slot2": ["rest", "belly_drum"], 
        "slot3": ["heavy_slam", "hyper_beam"], 
    }, 

    "mr. mime": {
        "name": "Mr. Mime", 
        "sprite": 165, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["confusion", "psybeam"], 
        "slot2": ["wall", "substitute"], 
        "slot3": ["protect", "zen_headbutt"], 
    }, 

    "dodrio": {
        "name": "Dodrio", 
        "sprite": 120, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 25, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["drill_peck", "tri_attack"], 
        "slot2": ["no_guard", "quick_attack"], 
        "slot3": ["peck", "rage"], 
    }, 

    "kangaskhan": {
        "name": "Kangaskhan", 
        "sprite": 157, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["comet_punch", "mega_punch"], 
        "slot2": ["substitute", "parental_bond"], 
        "slot3": ["dizzy_punch", "body_slam"], 
    }, 

    "seadra": {
        "name": "Seadra", 
        "sprite": 160, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 15, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["water_gun", "twister"], 
        "slot2": ["swift_swim", "focus_energy"], 
        "slot3": ["hydro_pump", "bubble_beam"], 

        "evolve": ["kingdra", 6]
    }, 

    "magikarp": {
        "name": "Magikarp", 
        "sprite": 173, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 0, 

        "health": 20, 
        "power": 0, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["splash", "splash"], 
        "slot2": ["swift_swim", "none"], 
        "slot3": ["splash", "splash"], 

        "evolve": ["gyarados", 8]
    }, 

    "omastar": {
        "name": "Omastar", 
        "sprite": 184, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 65, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["crunch", "rollout"], 
        "slot2": ["ancient_power", "swift_swim"], 
        "slot3": ["hydro_pump", "protect"], 
    }, 

    "omanite": {
        "name": "Omanite", 
        "sprite": 183, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["bite", "tackle"], 
        "slot2": ["swift_swim", "none"], 
        "slot3": ["water_gun", "protect"], 

        "evolve": ["omastar", 6]
    }, 

    "wurmple": {
        "name": "Wurmple", 
        "sprite": 391, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 10, 
        "power": 25, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["poison_sting", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["silcoon", 3]
    }, 

    "silcoon": {
        "name": "Silcoon", 
        "sprite": 392, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 0, 

        "health": 35, 
        "power": 0, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["harden", "harden"], 
        "slot2": ["none", "none"], 
        "slot3": ["harden", "harden"], 

        "evolve": ["beautifly", 4]
    }, 

    "beautifly": {
        "name": "Beautifly", 
        "sprite": 393, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 45, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["leech_life", "protect"], 
        "slot2": ["quiver_dance", "none"], 
        "slot3": ["air_cutter", "bug_buzz"], 
    }, 

    "plusle": {
        "name": "Plusle", 
        "sprite": 443, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 45, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["thunder_shock", "discharge"], 
        "slot2": ["electromagnetism", "none"], 
        "slot3": ["spark", "electro_ball"], 
    }, 

    "minun": {
        "name": "Minun", 
        "sprite": 444, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 4, 

        "health": 30, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["nuzzle", "thunder_shock"], 
        "slot2": ["helping_hand", "none"], 
        "slot3": ["protect", "spark"], 
    }, 

    "meganium": {
        "name": "Meganium", 
        "sprite": 212, 
        "color": "green", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 6, 

        "health": 60, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["razor_leaf", "giga_drain"], 
        "slot2": ["synthesis", "petal_dance"], 
        "slot3": ["solar_beam", "body_slam"], 
    }, 

    "*meganium": {
        "name": "Meganium", 
        "sprite": 1167, 
        "color": "red", 
        "rarity": 5, 

        "ap": 5, 
        "pp": 6, 

        "health": 60, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["heat_wave", "flame_wheel"], 
        "slot2": ["synthesis", "petal_dance"], 
        "slot3": ["razor_leaf", "solar_beam"], 
    }, 

    "bayleef": {
        "name": "Bayleef", 
        "sprite": 211, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 25, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["razor_leaf", "mega_drain"], 
        "slot2": ["synthesis", "petal_dance"], 
        "slot3": ["headbutt", "body_slam"], 

        "evolve": ["meganium", 6]
    }, 

    "typhlosion": {
        "name": "Typhlosion", 
        "sprite": 215, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["lava_plume", "flamethrower"], 
        "slot2": ["blaze", "smokescreen"], 
        "slot3": ["eruption", "overheat"], 
    }, 

    "*typhlosion": {
        "name": "Typhlosion", 
        "sprite": 1168, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["meltdown", "eruption"], 
        "slot2": ["disable", "smokescreen"], 
        "slot3": ["shadow_claw", "lava_plume"], 
    }, 

    "quilava": {
        "name": "Quilava", 
        "sprite": 214, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 35, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["flame_wheel", "ember"], 
        "slot2": ["blaze", "smokescreen"], 
        "slot3": ["rollout", "lava_plume"], 

        "evolve": ["typhlosion", 6]
    }, 

    "feraligator": {
        "name": "Feraligator", 
        "sprite": 219, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["waterfall", "crunch"], 
        "slot2": ["torrent", "glare"], 
        "slot3": ["aqua_tail", "superpower"], 
    }, 

    "*feraligator": {
        "name": "Feraligator", 
        "sprite": 1169, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["wood_hammer", "waterfall"], 
        "slot2": ["overgrowth", "glare"], 
        "slot3": ["aqua_tail", "superpower"], 
    }, 

    "croconaw": {
        "name": "Croconaw", 
        "sprite": 217, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["bite", "water_gun"], 
        "slot2": ["torrent", "none"], 
        "slot3": ["waterfall", "crunch"], 

        "evolve": ["feraligator", 6]
    }, 

    "furret": {
        "name": "Furret", 
        "sprite": 221, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 35, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["fury_swipes", "dig"], 
        "slot2": ["helping_hand", "agility"], 
        "slot3": ["slam", "body_slam"], 
    }, 

    "noctowl": {
        "name": "Noctowl", 
        "sprite": 223, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["wing_attack", "zen_headbutt"], 
        "slot2": ["hypnosis", "future_sight"], 
        "slot3": ["confusion", "sky_attack"], 
    }, 

    "ledian": {
        "name": "Ledian", 
        "sprite": 225, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 15, 
        "power": 40, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["comet_punch", "swift"], 
        "slot2": ["mach_punch", "baton_pass"], 
        "slot3": ["bug_buzz", "air_slash"], 
    }, 

    "ledyba": {
        "name": "Ledyba", 
        "sprite": 224, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 15, 
        "power": 20, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["bug_buzz", "tackle"], 
        "slot2": ["baton_pass", "none"], 
        "slot3": ["swift", "tackle"], 

        "evolve": ["ledian", 3]
    }, 

    "ariados": {
        "name": "Ariados", 
        "sprite": 227, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bug_bite", "pin_missile"], 
        "slot2": ["spider_web", "swords_dance"], 
        "slot3": ["toxic_thread", "fell_stinger"], 
    }, 

    "spinarak": {
        "name": "Spinarak", 
        "sprite": 226, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 15, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["bug_bite", "tackle"], 
        "slot2": ["spider_web", "none"], 
        "slot3": ["poison_sting", "tackle"], 

        "evolve": ["ariados", 4]
    }, 

    "lanturn": {
        "name": "Lanturn", 
        "sprite": 230, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 60, 
        "power": 35, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["bubble_beam", "water_gun"], 
        "slot2": ["illuminate", "thunder_wave"], 
        "slot3": ["spark", "discharge"], 
    }, 

    "chinchou": {
        "name": "Chinchou", 
        "sprite": 229, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 30, 
        "power": 20, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["bubble_beam", "water_gun"], 
        "slot2": ["illuminate", "none"], 
        "slot3": ["spark", "thunder_shock"], 

        "evolve": ["lanturn", 3]
    }, 

    "xatu": {
        "name": "Xatu", 
        "sprite": 239, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 25, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["ominous_wind", "air_slash"], 
        "slot2": ["premonition", "future_sight"], 
        "slot3": ["extrasensory", "gust"], 
    }, 

    "ampharos": {
        "name": "Ampharos", 
        "sprite": 242, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 60, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["charge_beam", "discharge"], 
        "slot2": ["cotton_spore", "illuminate"], 
        "slot3": ["thunder", "power_gem"], 
    }, 

    "*ampharos": {
        "name": "Ampharos", 
        "sprite": 1174, 
        "color": "white", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 60, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["moonblast", "discharge"], 
        "slot2": ["cotton_spore", "illuminate"], 
        "slot3": ["dazzling_gleam", "thunder"], 
    }, 

    "flaafy": {
        "name": "Flaaffy", 
        "sprite": 241, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 45, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["spark", "discharge"], 
        "slot2": ["cotton_spore", "illuminate"], 
        "slot3": ["thunder_shock", "shock_wave"], 

        "evolve": ["ampharos", 6]
    }, 

    "mareep": {
        "name": "Mareep", 
        "sprite": 240, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 30, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["spark", "tackle"], 
        "slot2": ["cotton_spore", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["flaafy", 3]
    }, 

    "marill": {
        "name": "Marill", 
        "sprite": 245, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["water_gun", "rollout"], 
        "slot2": ["helping_hand", "huge_power"], 
        "slot3": ["bubble_beam", "tackle"], 

        "evolve": ["azumarill", 4]
    }, 

    "azumarill": {
        "name": "Azumarill", 
        "sprite": 246, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 30, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["wave_crash", "water_gun"], 
        "slot2": ["huge_power", "helping_hand"], 
        "slot3": ["play_rough", "superpower"], 
    }, 

    "*azumarill": {
        "name": "Azumarill", 
        "sprite": 1173, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 5, 

        "health": 60, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["wild_charge", "bubble_beam"], 
        "slot2": ["huge_power", "helping_hand"], 
        "slot3": ["bounce", "waterfall"], 
    }, 

    "sudowoodo": {
        "name": "Sudowoodo", 
        "sprite": 247, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 60, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["rock_throw", "slam"], 
        "slot2": ["cover", "counter"], 
        "slot3": ["rock_tomb", "wood_hammer"], 
    }, 

    "politoed": {
        "name": "Politoed", 
        "sprite": 248, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 4, 

        "health": 55, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["bubble_beam", "surf"], 
        "slot2": ["drizzle", "hypnosis"], 
        "slot3": ["bounce", "hyper_voice"], 
    }, 

    "aipom": {
        "name": "Aipom", 
        "sprite": 253, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["fury_swipes", "tackle"], 
        "slot2": ["run_away", "baton_pass"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["ambipom", 4]
    }, 

    "sunflora": {
        "name": "Sunflora", 
        "sprite": 255, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 35, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["bullet_seed", "razor_leaf"], 
        "slot2": ["sunny_day", "aromatherapy"], 
        "slot3": ["solar_beam", "tackle"], 
    }, 

    "quagsire": {
        "name": "Quagsire", 
        "sprite": 258, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["water_pulse", "water_gun"], 
        "slot2": ["rain_dish", "rain_dance"], 
        "slot3": ["slam", "muddy_water"], 
    }, 

    "murkrow": {
        "name": "Murkrow", 
        "sprite": 261, 
        "color": "black", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["wing_attack", "peck"], 
        "slot2": ["torment", "none"], 
        "slot3": ["foul_play", "peck"], 

        "evolve": ["honchkrow", 5]
    }, 

    "slowking": {
        "name": "Slowking", 
        "sprite": 262, 
        "color": "psychic", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 5, 

        "health": 55, 
        "power": 50, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["water_pulse", "wave_splash"], 
        "slot2": ["trick_room", "mind_games"], 
        "slot3": ["psychic", "power_gem"], 
    }, 

    "misdreavus": {
        "name": "Misdreavus", 
        "sprite": 263, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["shadow_ball", "destiny_bond"], 
        "slot2": ["nightmare", "none"], 
        "slot3": ["psybeam", "hex"], 

        "evolve": ["mismagius", 4]
    }, 

    "mismagius": {
        "name": "Mismagius", 
        "sprite": 608, 
        "color": "ghost", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 30, 
        "power": 50, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["shadow_ball", "mystical_fire"], 
        "slot2": ["nightmare", "trick"], 
        "slot3": ["hex", "magical_leaf"], 
    }, 

    "wobbuffet": {
        "name": "Wobbuffet", 
        "sprite": 310, 
        "color": "black", 
        "rarity": 2, 

        "ap": 0, 
        "pp": 6, 

        "health": 80, 
        "power": 70, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["splash", "splash"], 
        "slot2": ["counter", "counter"], 
        "slot3": ["splash", "splash"], 
    }, 

    "*wobbuffet": {
        "name": "Wobbuffet", 
        "sprite": 1192, 
        "color": "white", 
        "rarity": 5, 

        "ap": 0, 
        "pp": 9, 

        "health": 100, 
        "power": 70, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["splash", "splash"], 
        "slot2": ["counter", "counter"], 
        "slot3": ["splash", "splash"], 
    }, 

    "girafarig": {
        "name": "Girafarig", 
        "sprite": 311, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 35, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["twin_beam", "confusion"], 
        "slot2": ["baton_pass", "nasty_plot"], 
        "slot3": ["stomp", "psybeam"], 
    }, 

    "forretress": {
        "name": "Forretress", 
        "sprite": 313, 
        "color": "steel", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 75, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["bug_bite", "rapid_spin"], 
        "slot2": ["spikes", "self-destruct"], 
        "slot3": ["heavy_slam", "gyro_ball"], 
    }, 

    "dunsparce": {
        "name": "Dunsparce", 
        "sprite": 314, 
        "color": "white", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 50, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["hyper_drill", "tackle"], 
        "slot2": ["run_away", "coil"], 
        "slot3": ["dig", "horn_drill"], 
    }, 

    "gligar": {
        "name": "Gligar", 
        "sprite": 315, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["fury_cutter", "poison_sting"], 
        "slot2": ["u-turn", "quick_attack"], 
        "slot3": ["slash", "guillotine"], 

        "evolve": ["gliscor", 4]
    }, 

    "gliscor": {
        "name": "Gliscor", 
        "sprite": 656, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 45, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["x-scissor", "poison_jab"], 
        "slot2": ["u-turn", "swords_dance"], 
        "slot3": ["slash", "guillotine"], 
    }, 

    "granbull": {
        "name": "Granbull", 
        "sprite": 319, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["rage", "fire_fang"], 
        "slot2": ["glare", "focus_energy"], 
        "slot3": ["play_rough", "thunder_fang"], 
    }, 

    "shuckle": {
        "name": "Shuckle", 
        "sprite": 323, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 80, 
        "power": 10, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["bug_bite", "rollout"], 
        "slot2": ["cover", "power_trick"], 
        "slot3": ["rock_tomb", "rock_slide"], 
    }, 

    "heracross": {
        "name": "Heracross", 
        "sprite": 324, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["megahorn", "close_combat"], 
        "slot2": ["counter", "focus_energy"], 
        "slot3": ["horn_attack", "brick_break"], 
    }, 

    "ursaring": {
        "name": "Ursaring", 
        "sprite": 330, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 65, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["crush_claw", "hammer_arm"], 
        "slot2": ["bulk_up", "rest"], 
        "slot3": ["bear_hug", "strength"], 
    }, 

    "teddiursa": {
        "name": "Teddiursa", 
        "sprite": 328, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["fury_swipes", "metal_claw"], 
        "slot2": ["bulk_up", "rest"], 
        "slot3": ["scratch", "slash"], 

        "evolve": ["ursaring", 5]
    }, 

    "*ursaring": {
        "name": "Ursaring", 
        "sprite": 1194, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 50, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["wood_hammer", "crush_claw"], 
        "slot2": ["bulk_up", "rest"], 
        "slot3": ["bear_hug", "strength"], 
    }, 

    "magcargo": {
        "name": "Magcargo", 
        "sprite": 332, 
        "color": "red", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 50, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["incinerate", "rock_throw"], 
        "slot2": ["flame_body", "cover"], 
        "slot3": ["lava_plume", "flamethrower"], 
    }, 

    "slugma": {
        "name": "Slugma", 
        "sprite": 331, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 0, 

        "health": 35, 
        "power": 20, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["incinerate", "tackle"], 
        "slot2": ["flame_body", "none"], 
        "slot3": ["ember", "tackle"], 

        "evolve": ["magcargo", 4]
    }, 

    "octillery": {
        "name": "Octillery", 
        "sprite": 337, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 50, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["octazooka", "hyper_beam"], 
        "slot2": ["focus_energy", "helping_hand"], 
        "slot3": ["water_gun", "bubble_beam"], 
    }, 

    "delibird": {
        "name": "Delibird", 
        "sprite": 338, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 5, 

        "health": 25, 
        "power": 20, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["ice_punch", "drill_peck"], 
        "slot2": ["present", "helping_hand"], 
        "slot3": ["peck", "water_gun"], 
    }, 

    "skarmory": {
        "name": "Skarmory", 
        "sprite": 340, 
        "color": "steel", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 65, 
        "power": 35, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["steel_wing", "drill_peck"], 
        "slot2": ["spikes", "guardian"], 
        "slot3": ["wing_attack", "peck"], 
    }, 

    "*skarmory": {
        "name": "Skarmory", 
        "sprite": 1176, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 65, 
        "power": 35, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["emerald_wing", "steel_wing"], 
        "slot2": ["spikes", "guardian"], 
        "slot3": ["drill_peck", "razor_leaf"], 
    }, 

    "kingdra": {
        "name": "Kingdra", 
        "sprite": 344, 
        "color": "dragon", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["hydro_pump", "bubble_beam"], 
        "slot2": ["rain_dance", "swift_swim"], 
        "slot3": ["dragon_breath", "dragon_pulse"], 
    }, 

    "*kingdra": {
        "name": "Kingdra", 
        "sprite": 1178, 
        "color": "white", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["moonblast", "bubble_beam"], 
        "slot2": ["smokescreen", "swift_swim"], 
        "slot3": ["hydro_pump", "dragon_pulse"], 
    }, 

    "donphan": {
        "name": "Donphan", 
        "sprite": 346, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 0, 

        "health": 50, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["rollout", "horn_attack"], 
        "slot2": ["ancient_power", "none"], 
        "slot3": ["earthquake", "giga_impact"], 
    }, 

    "phanpy": {
        "name": "Phanpy", 
        "sprite": 345, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 0, 

        "health": 40, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["rollout", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["bulldoze", "tackle"], 

        "evolve": ["donphan", 5]
    }, 

    "stantler": {
        "name": "Stantler", 
        "sprite": 348, 
        "color": "white", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 35, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["stomp", "take_down"], 
        "slot2": ["hypnosis", "baton_pass"], 
        "slot3": ["psyshield_bash", "body_slam"], 
    }, 

    "miltank": {
        "name": "Miltank", 
        "sprite": 355, 
        "color": "white", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 55, 
        "power": 40, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["rollout", "zen_headbutt"], 
        "slot2": ["milk_drink", "wall"], 
        "slot3": ["stomp", "body_slam"], 
    }, 

    "tyranitar": {
        "name": "Tyranitar", 
        "sprite": 362, 
        "color": "ground", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 6, 

        "health": 60, 
        "power": 80, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["stone_edge", "crunch"], 
        "slot2": ["sand_stream", "conqueror"], 
        "slot3": ["earthquake", "hyper_beam"], 
    }, 

    "*tyranitar": {
        "name": "Tyranitar", 
        "sprite": 362, 
        "color": "white", 
        "rarity": 5, 

        "ap": 8, 
        "pp": 6, 

        "health": 60, 
        "power": 80, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["play_rough", "stone_edge"], 
        "slot2": ["sand_stream", "conqueror"], 
        "slot3": ["earthquake", "hyper_beam"], 
    }, 

    "pupitar": {
        "name": "Pupitar", 
        "sprite": 361, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 50, 
        "power": 50, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["crunch", "stone_edge"], 
        "slot2": ["conqueror", "none"], 
        "slot3": ["rock_slide", "headbutt"], 

        "evolve": ["tyranitar", 8]
    }, 

    "larvitar": {
        "name": "Larvitar", 
        "sprite": 360, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["bite", "tackle"], 
        "slot2": ["conqueror", "none"], 
        "slot3": ["rock_throw", "tackle"], 

        "evolve": ["pupitar", 4]
    }, 

    "smeargle": {
        "name": "Smeargle", 
        "sprite": 349, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 5, 

        "health": 35, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["sketch", "sketch"], 
        "slot2": ["canvas", "canvas"], 
        "slot3": ["sketch", "sketch"], 
    }, 

    "grovyle": {
        "name": "Grovyle", 
        "sprite": 376, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["leaf_blade", "acrobatics"], 
        "slot2": ["quick_attack", "overgrowth"], 
        "slot3": ["absorb", "fury_cutter"], 

        "evolve": ["sceptile", 6]
    }, 

    "sceptile": {
        "name": "Sceptile", 
        "sprite": 377, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 35, 
        "power": 50, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["leaf_blade", "acrobatics"], 
        "slot2": ["extreme_speed", "double_team"], 
        "slot3": ["energy_ball", "leaf_storm"], 
    }, 

    "*sceptile": {
        "name": "Sceptile", 
        "sprite": 1180, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 35, 
        "power": 50, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["razor_shell", "giga_drain"], 
        "slot2": ["double_team", "torrent"], 
        "slot3": ["leaf_blade", "leaf_storm"], 
    }, 

    "combusken": {
        "name": "Combusken", 
        "sprite": 380, 
        "color": "red", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["double_kick", "brick_break"], 
        "slot2": ["detect", "blaze"], 
        "slot3": ["flame_charge", "ember"], 

        "evolve": ["blaziken", 6]
    }, 

    "blaziken": {
        "name": "Blaziken", 
        "sprite": 381, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 5, 

        "health": 40, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["blaze_kick", "flare_blitz"], 
        "slot2": ["detect", "speed_boost"], 
        "slot3": ["sky_uppercut", "brave_bird"], 
    }, 

    "*blaziken": {
        "name": "Blaziken", 
        "sprite": 1181, 
        "color": "white", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 5, 

        "health": 40, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["mega_kick", "blaze_kick"], 
        "slot2": ["detect", "speed_boost"], 
        "slot3": ["sky_uppercut", "brave_bird"], 
    }, 

    "marshtomp": {
        "name": "Marshtomp", 
        "sprite": 384, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["water_pulse", "tackle"], 
        "slot2": ["torrent", "torrent"], 
        "slot3": ["mud_shot", "water_gun"], 

        "evolve": ["swampert", 6]
    }, 

    "swampert": {
        "name": "Swampert", 
        "sprite": 385, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 65, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["muddy_water", "waterfall"], 
        "slot2": ["torrent", "swift_swim"], 
        "slot3": ["bulldoze", "earthquake"], 
    }, 

    "*swampert": {
        "name": "Swampert", 
        "sprite": 1182, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 65, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["ominous_wind", "muddy_water"], 
        "slot2": ["torrent", "swift_swim"], 
        "slot3": ["earthquake", "bulldoze"], 
    }, 

    "mightyena": {
        "name": "Mightyena", 
        "sprite": 388, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["crunch", "ice_fang"], 
        "slot2": ["howl", "sucker_punch"], 
        "slot3": ["snarl", "bite"], 
    }, 

    "*mightyena": {
        "name": "Mightyena", 
        "sprite": 1195, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 50, 
        "power": 40, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["thunder_fang", "headbutt"], 
        "slot2": ["howl", "sucker_punch"], 
        "slot3": ["crunch", "ice_fang"], 
    }, 

    "poochyena": {
        "name": "Poochyena", 
        "sprite": 387, 
        "color": "black", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 1, 

        "health": 4, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["bite", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["mightyena", 3]
    }, 

    "lombre": {
        "name": "Lombre", 
        "sprite": 397, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 25, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["water_pulse", "water_gun"], 
        "slot2": ["rain_dish", "rain_dance"], 
        "slot3": ["absorb", "mega_drain"], 

        "evolve": ["ludicolo", 4]
    }, 

    "ludicolo": {
        "name": "Ludicolo", 
        "sprite": 398, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["water_pulse", "hydro_pump"], 
        "slot2": ["rain_dish", "rain_dance"], 
        "slot3": ["giga_drain", "mega_drain"], 
    }, 

    "nuzleaf": {
        "name": "Nuzleaf", 
        "sprite": 400, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["razor_leaf", "tackle"], 
        "slot2": ["permadeath", "permadeath"], 
        "slot3": ["rock_throw", "tackle"], 

        "evolve": ["shiftry", 4]
    }, 

    "shiftry": {
        "name": "Shiftry", 
        "sprite": 401, 
        "color": "green", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 3, 

        "health": 30, 
        "power": 50, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["leaf_blade", "razor_leaf"], 
        "slot2": ["beat_up", "sucker_punch"], 
        "slot3": ["knock_off", "explosion"], 
    }, 

    "swellow": {
        "name": "Swellow", 
        "sprite": 403, 
        "color": "flying", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 40, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["brave_bird", "fly"], 
        "slot2": ["baton_pass", "guts"], 
        "slot3": ["wing_attack", "peck"], 
    }, 

    "taillow": {
        "name": "Taillow", 
        "sprite": 402, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["wing_attack", "tackle"], 
        "slot2": ["quick_attack", "guts"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["swellow", 4]
    }, 

    "pelipper": {
        "name": "Pelipper", 
        "sprite": 405, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["water_pulse", "protect"], 
        "slot2": ["rain_dish", "soak"], 
        "slot3": ["water_gun", "peck"], 
    }, 

    "wingull": {
        "name": "Wingull", 
        "sprite": 404, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 30, 
        "power": 25, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["water_gun", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["pelipper", 3]
    }, 

    "kirlia": {
        "name": "Kirlia", 
        "sprite": 407, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 20, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["psybeam", "draining_kiss"], 
        "slot2": ["calm_mind", "future_sight"], 
        "slot3": ["confusion", "psychic"], 

        "evolve": ["gardevoir", 6]
    }, 

    "gardevoir": {
        "name": "Gardevoir", 
        "sprite": 408, 
        "color": "fairy", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 45, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["dazzling_gleam", "draining_kiss"], 
        "slot2": ["calm_mind", "future_sight"], 
        "slot3": ["psychic", "black_hole"], 
    }, 

    "*gardevoir": {
        "name": "Gardevoir", 
        "sprite": 1191, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 45, 
        "power": 65, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["ice_beam", "draining_kiss"], 
        "slot2": ["hail", "future_sight"], 
        "slot3": ["moonblast", "black_hole"], 
    }, 

    "gallade": {
        "name": "Gallade", 
        "sprite": 659, 
        "color": "fighting", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 30, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["psycho_cut", "slash"], 
        "slot2": ["detect", "wide_guard"], 
        "slot3": ["close_combat", "leaf_blade"], 
    }, 

    "probopass": {
        "name": "Probopass", 
        "sprite": 661, 
        "color": "rock", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 85, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["rock_slide", "discharge"], 
        "slot2": ["cover", "solid_rock"], 
        "slot3": ["rock_tomb", "zap_cannon"], 
    }, 

    "masquerain": {
        "name": "Masquerain", 
        "sprite": 411, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["bug_buzz", "air_slash"], 
        "slot2": ["intimidate", "none"], 
        "slot3": ["air_cutter", "peck"], 
    }, 

    "breloom": {
        "name": "Breloom", 
        "sprite": 413, 
        "color": "green", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 35, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["mega_drain", "absorb"], 
        "slot2": ["spore", "substitute"], 
        "slot3": ["force_palm", "focus_punch"], 
    }, 

    "shroomish": {
        "name": "Shroomish", 
        "sprite": 412, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["mega_drain", "bullet_seed"], 
        "slot2": ["spore", "poison_powder"], 
        "slot3": ["absorb", "tackle"], 

        "evolve": ["breloom", 4]
    }, 

    "vigoroth": {
        "name": "Vigoroth", 
        "sprite": 415, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 35, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["fury_swipes", "slash"], 
        "slot2": ["counter", "none"], 
        "slot3": ["scratch", "tackle"], 

        "evolve": ["slaking", 6]
    }, 

    "slaking": {
        "name": "Slaking", 
        "sprite": 416, 
        "color": "white", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 6, 

        "health": 80, 
        "power": 90, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["mega_punch", "giga_impact"], 
        "slot2": ["truant", "truant"], 
        "slot3": ["hammer_arm", "double-edge"], 
    }, 

    "ninjask": {
        "name": "Ninjask", 
        "sprite": 418, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 20, 
        "power": 45, 
        "speed": 90, 

        "trait": null, 
        "slot1": ["fury_cutter", "metal_claw"], 
        "slot2": ["double_team", "swords_dance"], 
        "slot3": ["x-scissor", "fury_cutter"], 
    }, 

    "shedinja": {
        "name": "Shedinja", 
        "sprite": 419, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 8, 

        "health": 1, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["shadow_claw", "metal_claw"], 
        "slot2": ["wonder_guard", "wonder_guard"], 
        "slot3": ["fury_cutter", "shadow_sneak"], 
    }, 

    "exploud": {
        "name": "Exploud", 
        "sprite": 422, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 55, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["hyper_voice", "bite"], 
        "slot2": ["screech", "roar"], 
        "slot3": ["stomp", "boomburst"], 
    }, 

    "loudred": {
        "name": "Loudred", 
        "sprite": 421, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["stomp", "bite"], 
        "slot2": ["screech", "roar"], 
        "slot3": ["bite", "hyper_voice"], 

        "evolve": ["exploud", 4]
    }, 

    "hariyama": {
        "name": "Hariyama", 
        "sprite": 424, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 70, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["arm_thrust", "tackle"], 
        "slot2": ["bulk_up", "belly_drum"], 
        "slot3": ["whirlwind", "heavy_slam"], 
    }, 

    "makuhita": {
        "name": "Makuhita", 
        "sprite": 423, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["arm_thrust", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["hariyama", 4]
    }, 

    "nosepass": {
        "name": "Nosepass", 
        "sprite": 426, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 75, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["rock_tomb", "discharge"], 
        "slot2": ["cover", "solid_rock"], 
        "slot3": ["rock_throw", "zap_cannon"], 

        "evolve": ["probopass", 6]
    }, 

    "delcatty": {
        "name": "Delcatty", 
        "sprite": 428, 
        "color": "white", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 25, 
        "power": 35, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["fury_swipes", "play_rough"], 
        "slot2": ["fake_out", "baton_pass"], 
        "slot3": ["scratch", "scratch"], 
    }, 

    "sableye": {
        "name": "Sableye", 
        "sprite": 429, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 40, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["shadow_sneak", "scratch"], 
        "slot2": ["substitute", "fake_out"], 
        "slot3": ["protect", "shadow_claw"], 
    }, 

    "mawile": {
        "name": "Mawile", 
        "sprite": 431, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["metal_claw", "vice_grip"], 
        "slot2": ["wall", "swords_dance"], 
        "slot3": ["crunch", "play_rough"], 
    }, 

    "*mawile": {
        "name": "Mawile", 
        "sprite": 1184, 
        "color": "red", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 55, 
        "power": 60, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["fire_fang", "vice_grip"], 
        "slot2": ["wall", "swords_dance"], 
        "slot3": ["crunch", "play_rough"], 
    }, 

    "lairon": {
        "name": "Lairon", 
        "sprite": 434, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 50, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["iron_head", "tackle"], 
        "slot2": ["cover", "none"], 
        "slot3": ["rock_slide", "heavy_slam"], 

        "evolve": ["aggron", 7]
    }, 

    "aggron": {
        "name": "Aggron", 
        "sprite": 435, 
        "color": "steel", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 55, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["iron_head", "heavy_slam"], 
        "slot2": ["metal_burst", "wall"], 
        "slot3": ["iron_tail", "rock_slide"], 
    }, 

    "medicham": {
        "name": "Medicham", 
        "sprite": 438, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 35, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["force_palm", "focus_punch"], 
        "slot2": ["detect", "calm_mind"], 
        "slot3": ["zen_headbutt", "confusion"], 
    }, 

    "manectric": {
        "name": "Manectric", 
        "sprite": 441, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 55, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["wild_charge", "thunder_fang"], 
        "slot2": ["thunder_wave", "charge"], 
        "slot3": ["fire_fang", "flamethrower"], 
    }, 

    "*manectric": {
        "name": "Manectric", 
        "sprite": 1183, 
        "color": "green", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 35, 
        "power": 65, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["energy_ball", "wild_charge"], 
        "slot2": ["chlorophyll", "thunder_wave"], 
        "slot3": ["thunderbolt", "flamethrower"], 
    }, 

    "electrike": {
        "name": "Electrike", 
        "sprite": 440, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["thunder_fang", "shock_wave"], 
        "slot2": ["thunder_wave", "none"], 
        "slot3": ["bite", "tackle"], 

        "evolve": ["manectric", 4]
    }, 

    "roselia": {
        "name": "Roselia", 
        "sprite": 447, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 25, 
        "power": 40, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["magical_leaf", "poison_sting"], 
        "slot2": ["aromatherapy", "toxic_spikes"], 
        "slot3": ["mega_drain", "toxic"], 

        "evolve": ["roserade", 4]
    }, 

    "swalot": {
        "name": "Swalot", 
        "sprite": 450, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 55, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["acid_spray", "poison_gas"], 
        "slot2": ["leftovers", "amnesia"], 
        "slot3": ["belch", "sludge_bomb"], 
    }, 

    "sharpedo": {
        "name": "Sharpedo", 
        "sprite": 452, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 25, 
        "power": 70, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["crunch", "slash"], 
        "slot2": ["aqua_jet", "rough_skin"], 
        "slot3": ["waterfall", "skull_bash"], 
    }, 

    "*sharpedo": {
        "name": "Sharpedo", 
        "sprite": 1187, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 30, 
        "power": 80, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["crunch", "night_slash"], 
        "slot2": ["aqua_jet", "rough_skin"], 
        "slot3": ["wave_crash", "skull_bash"], 
    }, 

    "carvanha": {
        "name": "Carvanha", 
        "sprite": 451, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 15, 
        "power": 45, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["bite", "crunch"], 
        "slot2": ["aqua_jet", "rough_skin"], 
        "slot3": ["water_gun", "wave_crash"], 

        "evolve": ["sharpedo", 4]
    }, 

    "wailord": {
        "name": "Wailord", 
        "sprite": 455, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 80, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["water_spout", "water_pulse"], 
        "slot2": ["whirlpool", "water_veil"], 
        "slot3": ["water_gun", "hydro_pump"], 
    }, 

    "wailmer": {
        "name": "Wailmer", 
        "sprite": 454, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 50, 
        "power": 25, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["water_pulse", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["water_gun", "tackle"], 

        "evolve": ["wailord", 4]
    }, 

    "camerupt": {
        "name": "Camerupt", 
        "sprite": 457, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 50, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["eruption", "magnitude"], 
        "slot2": ["flame_body", "warmth"], 
        "slot3": ["lava_plume", "incinerate"], 
    }, 

    "*camerupt": {
        "name": "Camerupt", 
        "sprite": 1188, 
        "color": "black", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 65, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["meltdown", "eruption"], 
        "slot2": ["flame_body", "none"], 
        "slot3": ["stone_edge", "lava_plume"], 
    }, 

    "numel": {
        "name": "Numel", 
        "sprite": 456, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 1, 

        "health": 40, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["lava_plume", "headbutt"], 
        "slot2": ["flame_body", "warmth"], 
        "slot3": ["ember", "incinerate"], 

        "evolve": ["camerupt", 4]
    }, 

    "torkoal": {
        "name": "Torkoal", 
        "sprite": 459, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 70, 
        "power": 40, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["heat_wave", "overheat"], 
        "slot2": ["smokescreen", "iron_defense"], 
        "slot3": ["lava_plume", "ember"], 
    }, 

    "*torkoal": {
        "name": "Torkoal", 
        "sprite": 1189, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 80, 
        "power": 55, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["discharge", "thunderbolt"], 
        "slot2": ["thunder_wave", "iron_defense"], 
        "slot3": ["heat_wave", "overheat"], 
    }, 

    "grumpig": {
        "name": "Grumpig", 
        "sprite": 461, 
        "color": "black", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 40, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["psybeam", "confusion"], 
        "slot2": ["payback", "none"], 
        "slot3": ["power_gem", "bounce"], 
    }, 

    "spinda": {
        "name": "Spinda", 
        "sprite": 462, 
        "color": "white", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["dizzy_punch", "tackle"], 
        "slot2": ["teeter_dance", "none"], 
        "slot3": ["tackle", "tackle"], 
    }, 

    "flygon": {
        "name": "Flygon", 
        "sprite": 465, 
        "color": "dragon", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["dragon_claw", "dragon_breath"], 
        "slot2": ["sandstorm", "dragon_dance"], 
        "slot3": ["sand_tomb", "bulldoze"], 
    }, 

    "*flygon": {
        "name": "Flygon", 
        "sprite": 1185, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["ice_beam", "dragon_breath"], 
        "slot2": ["hail", "dragon_dance"], 
        "slot3": ["avalanche", "sand_tomb"], 
    }, 

    "cacturne": {
        "name": "Cacturne", 
        "sprite": 467, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 45, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["needle_arm", "pin_missile"], 
        "slot2": ["spiky_shield", "growth"], 
        "slot3": ["feint_attack", "absorb"], 
    }, 

    "*cacturne": {
        "name": "Cacturne", 
        "sprite": 1196, 
        "color": "red", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["desert_rush", "pin_missile"], 
        "slot2": ["spiky_shield", "growth"], 
        "slot3": ["needle_arm", "giga_drain"], 
    }, 

    "altaria": {
        "name": "Altaria", 
        "sprite": 469, 
        "color": "dragon", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 50, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["dragon_pulse", "moonblast"], 
        "slot2": ["cotton_guard", "sing"], 
        "slot3": ["twister", "peck"], 
    }, 

    "*altaria": {
        "name": "Altaria", 
        "sprite": 1186, 
        "color": "yellow", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 65, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["thunderbolt", "thunder"], 
        "slot2": ["cotton_guard", "sing"], 
        "slot3": ["moonblast", "twister"], 
    }, 

    "swablu": {
        "name": "Swablu", 
        "sprite": 468, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 50, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["peck", "tackle"], 
        "slot2": ["sing", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["altaria", 4]
    }, 

    "zangoose": {
        "name": "Zangoose", 
        "sprite": 471, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 50, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["crush_claw", "scratch"], 
        "slot2": ["double_team", "swords_dance"], 
        "slot3": ["metal_claw", "slash"], 
    }, 

    "*zangoose": {
        "name": "Zangoose", 
        "sprite": 1190, 
        "color": "blue", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["triple_axel", "avalanche"], 
        "slot2": ["double_team", "swords_dance"], 
        "slot3": ["crush_claw", "slash"], 
    }, 

    "seviper": {
        "name": "Seviper", 
        "sprite": 473, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["poison_tail", "crunch"], 
        "slot2": ["coil", "swords_dance"], 
        "slot3": ["poison_fang", "ice_fang"], 
    }, 

    "lunatone": {
        "name": "Lunatone", 
        "sprite": 475, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 5, 

        "health": 65, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["moonblast", "stone_edge"], 
        "slot2": ["moonlight", "wall"], 
        "slot3": ["rock_slide", "explosion"], 
    }, 

    "solrock": {
        "name": "Solrock", 
        "sprite": 476, 
        "color": "rock", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 65, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["solar_beam", "fire_spin"], 
        "slot2": ["morning_sun", "cosmic_power"], 
        "slot3": ["rock_slide", "explosion"], 
    }, 

    "crawdaunt": {
        "name": "Crawdaunt", 
        "sprite": 480, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["crabhammer", "guillotine"], 
        "slot2": ["hyper_cutter", "taunt"], 
        "slot3": ["crunch", "vice_grip"], 
    }, 

    "corphish": {
        "name": "Corphish", 
        "sprite": 479, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["crabhammer", "guillotine"], 
        "slot2": ["hyper_cutter", "taunt"], 
        "slot3": ["bite", "vice_grip"], 

        "evolve": ["crawdaunt", 4]
    }, 

    "armaldo": {
        "name": "Armaldo", 
        "sprite": 486, 
        "color": "rock", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["x-scissor", "fury_cutter"], 
        "slot2": ["ancient_power", "wall"], 
        "slot3": ["rock_blast", "metal_claw"], 
    }, 

    "anorith": {
        "name": "Anorith", 
        "sprite": 485, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["fury_cutter", "rock_blast"], 
        "slot2": ["ancient_power", "none"], 
        "slot3": ["rock_throw", "metal_claw"], 

        "evolve": ["armaldo", 5]
    }, 

    "cradily": {
        "name": "Cradily", 
        "sprite": 484, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["giga_drain", "rock_slide"], 
        "slot2": ["ancient_power", "leech_seed"], 
        "slot3": ["mega_drain", "rock_tomb"], 
    }, 

    "feebas": {
        "name": "Feebas", 
        "sprite": 487, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 1, 
        "pp": 0, 

        "health": 20, 
        "power": 0, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["splash", "splash"], 
        "slot2": ["swift_swim", "none"], 
        "slot3": ["splash", "splash"], 

        "evolve": ["milotic", 6]
    }, 

    "milotic": {
        "name": "Milotic", 
        "sprite": 488, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 6, 

        "health": 50, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["water_pulse", "draining_kiss"], 
        "slot2": ["attract", "recover"], 
        "slot3": ["surf", "aqua_tail"], 
    }, 

    "*milotic": {
        "name": "Milotic", 
        "sprite": 1197, 
        "color": "white", 
        "rarity": 5, 

        "ap": 5, 
        "pp": 6, 

        "health": 50, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["moonblast", "draining_kiss"], 
        "slot2": ["attract", "recover"], 
        "slot3": ["water_pulse", "aqua_tail"], 
    }, 

    "kecleon": {
        "name": "Kecleon", 
        "sprite": 494, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["fury_swipes", "shadow_claw"], 
        "slot2": ["color_change", "sucker_punch"], 
        "slot3": ["lick", "headbutt"], 
    }, 

    "banette": {
        "name": "Banette", 
        "sprite": 496, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 30, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["knock_off", "shadow_ball"], 
        "slot2": ["trick", "will-o-wisp"], 
        "slot3": ["shadow_sneak", "hex"], 
    }, 

    "dusclops": {
        "name": "Dusclops", 
        "sprite": 499, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 45, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["shadow_punch", "shadow_ball"], 
        "slot2": ["cover", "payback"], 
        "slot3": ["shadow_sneak", "thunder_punch"], 

        "evolve": ["dusknoir", 6]
    }, 

    "dusknoir": {
        "name": "Dusknoir", 
        "sprite": 662, 
        "color": "ghost", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 65, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["shadow_punch", "shadow_sneak"], 
        "slot2": ["guardian", "payback"], 
        "slot3": ["shadow_ball", "thunder_punch"], 
    }, 

    "tropius": {
        "name": "Tropius", 
        "sprite": 500, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 45, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["razor_leaf", "whirlwind"], 
        "slot2": ["solar_power", "synthesis"], 
        "slot3": ["air_slash", "stomp"], 
    }, 

    "absol": {
        "name": "Absol", 
        "sprite": 502, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 35, 
        "power": 70, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["psycho_cut", "slash"], 
        "slot2": ["double_team", "future_sight"], 
        "slot3": ["night_slash", "razor_wind"], 
    }, 

    "*absol": {
        "name": "Absol", 
        "sprite": 1198, 
        "color": "red", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 3, 

        "health": 35, 
        "power": 70, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["firesword", "slash"], 
        "slot2": ["double_team", "future_sight"], 
        "slot3": ["psycho_cut", "razor_wind"], 
    }, 

    "glalie": {
        "name": "Glalie", 
        "sprite": 508, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 45, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["ice_fang", "freeze-dry"], 
        "slot2": ["double_team", "hail"], 
        "slot3": ["powder_snow", "blizzard"], 
    }, 

    "froslass": {
        "name": "Froslass", 
        "sprite": 663, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 25, 
        "power": 45, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["hex", "ominous_wind"], 
        "slot2": ["double_team", "hail"], 
        "slot3": ["powder_snow", "blizzard"], 
    }, 

    "walrein": {
        "name": "Walrein", 
        "sprite": 512, 
        "color": "ice", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["ice_fang", "ice_ball"], 
        "slot2": ["hail", "rest"], 
        "slot3": ["blizzard", "powder_snow"], 
    }, 

    "sealeo": {
        "name": "Sealeo", 
        "sprite": 511, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["ice_ball", "tackle"], 
        "slot2": ["rest", "none"], 
        "slot3": ["powder_snow", "tackle"], 

        "evolve": ["walrein", 6]
    }, 

    "relicanth": {
        "name": "Relicanth", 
        "sprite": 516, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 60, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["waterfall", "water_gun"], 
        "slot2": ["rock_head", "swift_swim"], 
        "slot3": ["rock_tomb", "head_smash"], 
    }, 

    "luvdisc": {
        "name": "Luvdisc", 
        "sprite": 517, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 30, 
        "power": 20, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["draining_kiss", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["water_gun", "tackle"], 
    }, 

    "salamence": {
        "name": "Salamence", 
        "sprite": 520, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 6, 

        "health": 60, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["dragon_claw", "twister"], 
        "slot2": ["dragon_dance", "none"], 
        "slot3": ["fly", "flamethrower"], 
    }, 

    "shelgon": {
        "name": "Shelgon", 
        "sprite": 519, 
        "color": "dragon", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 40, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["dragon_claw", "protect"], 
        "slot2": ["dragon_dance", "none"], 
        "slot3": ["ember", "fire_fang"], 

        "evolve": ["salamence", 8]
    }, 

    "metang": {
        "name": "Metang", 
        "sprite": 523, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 40, 
        "power": 30, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["metal_claw", "meteor_mash"], 
        "slot2": ["bullet_punch", "none"], 
        "slot3": ["confusion", "tackle"], 

        "evolve": ["metagross", 8]
    }, 

    "metagross": {
        "name": "Metagross", 
        "sprite": 524, 
        "color": "steel", 
        "rarity": 4, 

        "ap": 6, 
        "pp": 6, 

        "health": 70, 
        "power": 80, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["meteor_mash", "quad_smash"], 
        "slot2": ["bullet_punch", "iron_defense"], 
        "slot3": ["psychic", "hyper_beam"], 
    }, 

    "*metagross": {
        "name": "Metagross", 
        "sprite": 1199, 
        "color": "steel", 
        "rarity": 5, 

        "ap": 6, 
        "pp": 6, 

        "health": 70, 
        "power": 80, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["star_mash", "quad_smash"], 
        "slot2": ["bullet_punch", "iron_defense"], 
        "slot3": ["psychic", "hyper_beam"], 
    }, 

    "grotle": {
        "name": "Grotle", 
        "sprite": 556, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 50, 
        "power": 30, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["razor_leaf", "bulldoze"], 
        "slot2": ["cover", "shell_armor"], 
        "slot3": ["absorb", "mud_shot"], 

        "evolve": ["torterra", 6]
    }, 

    "torterra": {
        "name": "Torterra", 
        "sprite": 557, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 75, 
        "power": 50, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["razor_leaf", "wood_hammer"], 
        "slot2": ["wall", "shell_armor"], 
        "slot3": ["earthquake", "headlong_rush"], 
    }, 

    "monferno": {
        "name": "Monferno", 
        "sprite": 560, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 35, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["flame_wheel", "double_kick"], 
        "slot2": ["mach_punch", "taunt"], 
        "slot3": ["ember", "karate_chop"], 

        "evolve": ["infernape", 6]
    }, 

    "infernape": {
        "name": "Infernape", 
        "sprite": 561, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 35, 
        "power": 55, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["flare_blitz", "flame_wheel"], 
        "slot2": ["mach_punch", "fake_out"], 
        "slot3": ["close_combat", "brick_break"], 
    }, 

    "prinplup": {
        "name": "Prinplup", 
        "sprite": 563, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["water_gun", "drill_peck"], 
        "slot2": ["commander", "torrent"], 
        "slot3": ["metal_claw", "peck"], 

        "evolve": ["empoleon", 6]
    }, 

    "empoleon": {
        "name": "Empoleon", 
        "sprite": 564, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 5, 

        "health": 50, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bubble_beam", "wave_crash"], 
        "slot2": ["commander", "aqua_jet"], 
        "slot3": ["iron_head", "drill_peck"], 
    }, 

    "staravia": {
        "name": "Staravia", 
        "sprite": 566, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["wing_attack", "tackle"], 
        "slot2": ["beat_up", "sand_attack"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["staraptor", 6]
    }, 

    "staraptor": {
        "name": "Staraptor", 
        "sprite": 567, 
        "color": "flying", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 65, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["brave_bird", "wing_attack"], 
        "slot2": ["beat_up", "quick_attack"], 
        "slot3": ["close_combat", "final_gambit"], 
    }, 

    "bibarel": {
        "name": "Bibarel", 
        "sprite": 569, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["waterfall", "water_gun"], 
        "slot2": ["taunt", "leftovers"], 
        "slot3": ["super_fang", "superpower"], 
    }, 

    "luxio": {
        "name": "Luxio", 
        "sprite": 573, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["thunder_fang", "wild_charge"], 
        "slot2": ["charge", "guts"], 
        "slot3": ["bite", "tackle"], 

        "evolve": ["luxray", 6]
    }, 

    "luxray": {
        "name": "Luxray", 
        "sprite": 574, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 40, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["thunder_fang", "wild_charge"], 
        "slot2": ["charge", "guts"], 
        "slot3": ["crunch", "wild_charge"], 
    }, 

    "roserade": {
        "name": "Roserade", 
        "sprite": 577, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 5, 

        "health": 30, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["magical_leaf", "toxic"], 
        "slot2": ["aromatherapy", "toxic_spikes"], 
        "slot3": ["giga_drain", "mega_drain"], 
    }, 

    "cranidos": {
        "name": "Cranidos", 
        "sprite": 579, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 15, 
        "power": 50, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["head_smash", "brick_break"], 
        "slot2": ["none", "none"], 
        "slot3": ["headbutt", "slam"], 

        "evolve": ["rampardos", 5]
    }, 

    "rampardos": {
        "name": "Rampardos", 
        "sprite": 580, 
        "color": "rock", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 75, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["head_smash", "dragon_tail"], 
        "slot2": ["reckless", "none"], 
        "slot3": ["zen_headbutt", "slam"], 
    }, 

    "shieldon": {
        "name": "Shieldon", 
        "sprite": 581, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 1, 

        "health": 50, 
        "power": 15, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["iron_head", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["bastiodon", 4]
    }, 

    "bastiodon": {
        "name": "Bastiodon", 
        "sprite": 582, 
        "color": "rock", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 75, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["iron_head", "heavy_slam"], 
        "slot2": ["wide_guard", "none"], 
        "slot3": ["headbutt", "tackle"], 
    }, 

    "vespiqueen": {
        "name": "Vespiqueen", 
        "sprite": 591, 
        "color": "bug", 
        "rarity": 3, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["bug_buzz", "fell_stinger"], 
        "slot2": ["hive", "none"], 
        "slot3": ["air_slash", "bug_bite"], 
    }, 

    "combee": {
        "name": "Combee", 
        "sprite": 590, 
        "color": "bug", 
        "rarity": 0, 

        "ap": 0, 
        "pp": 1, 

        "health": 1, 
        "power": 10, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["tackle", "tackle"], 
        "slot2": ["defend_order", "attack_order"], 
        "slot3": ["tackle", "tackle"], 
    }, 

    "floatzel": {
        "name": "Floatzel", 
        "sprite": 594, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 45, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["waterfall", "wave_crash"], 
        "slot2": ["aqua_jet", "rain_dance"], 
        "slot3": ["water_gun", "tackle"], 
    }, 

    "gastrodon1": {
        "name": "Gastrodon", 
        "sprite": 600, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 50, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["water_pulse", "mud_bomb"], 
        "slot2": ["recover", "none"], 
        "slot3": ["water_gun", "mud_shot"], 
    }, 

    "gastrodon2": {
        "name": "Gastrodon", 
        "sprite": 601, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 50, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["mud_bomb", "water_pulse"], 
        "slot2": ["recover", "none"], 
        "slot3": ["mud_shot", "water_gun"], 
    }, 

    "ambipom": {
        "name": "Ambipom", 
        "sprite": 602, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 50, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["tail_slap", "fury_swipes"], 
        "slot2": ["fake_out", "baton_pass"], 
        "slot3": ["body_slam", "bounce"], 
    }, 

    "honchkrow": {
        "name": "Honchkrow", 
        "sprite": 609, 
        "color": "black", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["foul_play", "sky_attack"], 
        "slot2": ["syndicate", "nasty_plot"], 
        "slot3": ["wing_attack", "night_slash"], 
    }, 

    "skuntank": {
        "name": "Skuntank", 
        "sprite": 614, 
        "color": "black", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 45, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["sludge", "flamethrower"], 
        "slot2": ["stench", "none"], 
        "slot3": ["poison_gas", "scratch"], 
    }, 

    "bronzong": {
        "name": "Bronzong", 
        "sprite": 616, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 55, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["gyro_ball", "tackle"], 
        "slot2": ["wall", "rain_dance"], 
        "slot3": ["extrasensory", "tackle"], 
    }, 

    "spiritomb": {
        "name": "Spiritomb", 
        "sprite": 621, 
        "color": "ghost", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 5, 

        "health": 60, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["ominous_wind", "shadow_sneak"], 
        "slot2": ["impervious", "nasty_plot"], 
        "slot3": ["dark_pulse", "shadow_ball"], 
    }, 

    "gabite": {
        "name": "Gabite", 
        "sprite": 623, 
        "color": "dragon", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["dragon_rage", "slash"], 
        "slot2": ["rough_skin", "none"], 
        "slot3": ["dig", "scratch"], 

        "evolve": ["garchomp", 8]
    }, 

    "garchomp": {
        "name": "Garchomp", 
        "sprite": 624, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 3, 

        "health": 50, 
        "power": 90, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["dragon_rush", "dragon_claw"], 
        "slot2": ["rough_skin", "none"], 
        "slot3": ["bulldoze", "dig"], 
    }, 

    "munchlax": {
        "name": "Munchlax", 
        "sprite": 626, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 5, 

        "trait": null, 
        "slot1": ["body_slam", "tackle"], 
        "slot2": ["rest", "none"], 
        "slot3": ["headbutt", "tackle"], 

        "evolve": ["snorlax", 7]
    }, 

    "riolu": {
        "name": "Riolu", 
        "sprite": 627, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["force_palm", "bone_rush"], 
        "slot2": ["endure", "quick_attack"], 
        "slot3": ["vacuum_wave", "final_gambit"], 

        "evolve": ["lucario", 6]
    }, 

    "lucario": {
        "name": "Lucario", 
        "sprite": 628, 
        "color": "fighting", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 5, 

        "health": 40, 
        "power": 60, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["aura_sphere", "force_palm"], 
        "slot2": ["detect", "extreme_speed"], 
        "slot3": ["bone_rush", "vacuum_wave"], 
    }, 

    "hippopotas": {
        "name": "Hippopotas", 
        "sprite": 630, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 40, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["bulldoze", "slack_off"], 
        "slot2": ["sandstorm", "none"], 
        "slot3": ["crunch", "bite"], 

        "evolve": ["hippowdon", 5]
    }, 

    "hippowdon": {
        "name": "Hippowdon", 
        "sprite": 631, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 40, 
        "power": 20, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["bulldoze", "earthquake"], 
        "slot2": ["sand_stream", "none"], 
        "slot3": ["crunch", "slack_off"], 
    }, 

    "toxicroak": {
        "name": "Toxicroak", 
        "sprite": 635, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 5, 

        "health": 35, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["poison_jab", "mud_bomb"], 
        "slot2": ["prank", "sucker_punch"], 
        "slot3": ["poison_sting", "pursuit"], 
    }, 

    "croagunk": {
        "name": "Croagunk", 
        "sprite": 634, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 15, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["poison_sting", "belch"], 
        "slot2": ["prank", "sucker_punch"], 
        "slot3": ["mud_bomb", "poison_jab"], 

        "evolve": ["toxicroak", 5]
    }, 

    "abomasnow": {
        "name": "Abomasnow", 
        "sprite": 641, 
        "color": "ice", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 50, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["razor_leaf", "wood_hammer"], 
        "slot2": ["hail", "leech_seed"], 
        "slot3": ["ice_punch", "ice_shard"], 
    }, 

    "snover": {
        "name": "Snover", 
        "sprite": 640, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["razor_leaf", "tackle"], 
        "slot2": ["hail", "none"], 
        "slot3": ["ice_punch", "icy_wind"], 

        "evolve": ["abomasnow", 4]
    }, 

    "magnezone": {
        "name": "Magnezone", 
        "sprite": 644, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 55, 
        "power": 65, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["discharge", "thunderbolt"], 
        "slot2": ["magnet_pull", "download"], 
        "slot3": ["flash_cannon", "zap_cannon"], 
    }, 

    "mamoswine": {
        "name": "Mamoswine", 
        "sprite": 657, 
        "color": "ice", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 50, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["ice_fang", "icy_wind"], 
        "slot2": ["ancient_power", "none"], 
        "slot3": ["bulldoze", "ice_shard"], 
    }, 

    "piloswine": {
        "name": "Piloswine", 
        "sprite": 334, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 30, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["ice_fang", "powder_snow"], 
        "slot2": ["ancient_power", "none"], 
        "slot3": ["mud_shot", "tackle"], 

        "evolve": ["mamoswine", 5]
    }, 

    "rotom": {
        "name": "Rotom", 
        "sprite": 668, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 10, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["thunder_shock", "shock_wave"], 
        "slot2": ["trick", "substitute"], 
        "slot3": ["hex", "astonish"], 

        "evolve": ["heat_rotom", 4]
    }, 

    "heat_rotom": {
        "name": "Heat Rotom", 
        "sprite": 667, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 25, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["overheat", "shock_wave"], 
        "slot2": ["will-o-wisp", "substitute"], 
        "slot3": ["thunder_shock", "hex"], 
    }, 

    "wash_rotom": {
        "name": "Wash Rotom", 
        "sprite": 669, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["hydro_pump", "shock_wave"], 
        "slot2": ["rain_dance", "substitute"], 
        "slot3": ["thunder_shock", "hex"], 
    }, 

    "frost_rotom": {
        "name": "Frost Rotom", 
        "sprite": 664, 
        "color": "ice", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 50, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["blizzard", "shock_wave"], 
        "slot2": ["hail", "substitute"], 
        "slot3": ["thunder_shock", "hex"], 
    }, 

    "fan_rotom": {
        "name": "Fan Rotom", 
        "sprite": 666, 
        "color": "flying", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["air_slash", "shock_wave"], 
        "slot2": ["tailwind", "substitute"], 
        "slot3": ["whirlwind", "hex"], 
    }, 

    "mow_rotom": {
        "name": "Mow Rotom", 
        "sprite": 665, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["leaf_storm", "shock_wave"], 
        "slot2": ["petal_dance", "substitute"], 
        "slot3": ["thunder_shock", "hex"], 
    }, 

    "cresselia": {
        "name": "Cresselia", 
        "sprite": 680, 
        "color": "psychic", 
        "rarity": 4, 

        "ap": 6, 
        "pp": 6, 

        "health": 70, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["moonblast", "slash"], 
        "slot2": ["lunar_blessing", "moonlight"], 
        "slot3": ["psycho_cut", "aurora_beam"], 
    }, 

    "darkrai": {
        "name": "Darkrai", 
        "sprite": 683, 
        "color": "black", 
        "rarity": 4, 

        "ap": 6, 
        "pp": 6, 

        "health": 35, 
        "power": 70, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["dark_pulse", "ominous_wind"], 
        "slot2": ["dark_void", "nightmare"], 
        "slot3": ["shadow_ball", "focus_punch"], 
    }, 

    "zorua": {
        "name": "Zorua", 
        "sprite": 778, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["night_daze", "fury_swipes"], 
        "slot2": ["illusion", "double_team"], 
        "slot3": ["pursuit", "scratch"], 

        "evolve": ["zoroark", 6]
    }, 

    "zoroark": {
        "name": "Zoroark", 
        "sprite": 779, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 30, 
        "power": 60, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["night_daze", "dark_pulse"], 
        "slot2": ["dark_illusion", "nasty_plot"], 
        "slot3": ["night_slash", "fury_swipes"], 
    }, 

    "articuno": {
        "name": "Articuno", 
        "sprite": 190, 
        "color": "ice", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 5, 

        "health": 65, 
        "power": 55, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["sheer_cold", "blizzard"], 
        "slot2": ["mind_reader", "hail"], 
        "slot3": ["ice_beam", "icy_wind"], 
    }, 

    "zapdos": {
        "name": "Zapdos", 
        "sprite": 191, 
        "color": "yellow", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["thunder", "thunderbolt"], 
        "slot2": ["detect", "thunder_wave"], 
        "slot3": ["drill_peck", "discharge"], 
    }, 

    "moltres": {
        "name": "Moltres", 
        "sprite": 192, 
        "color": "red", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 5, 

        "health": 35, 
        "power": 70, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["fire_blast", "fire_spin"], 
        "slot2": ["endure", "agility"], 
        "slot3": ["sky_attack", "heat_wave"], 
    }, 

    "suicune": {
        "name": "Suicune", 
        "sprite": 359, 
        "color": "ice", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 80, 
        "power": 45, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["hydro_pump", "bubble_beam"], 
        "slot2": ["extreme_speed", "mirror_coat"], 
        "slot3": ["aurora_beam", "sheer_cold"], 
    }, 

    "raikou": {
        "name": "Raikou", 
        "sprite": 357, 
        "color": "yellow", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 4, 

        "health": 40, 
        "power": 75, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["zap_cannon", "discharge"], 
        "slot2": ["volt_switch", "charge"], 
        "slot3": ["thunder_fang", "aura_sphere"], 
    }, 

    "entei": {
        "name": "Entei", 
        "sprite": 358, 
        "color": "red", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 70, 
        "power": 55, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["fire_spin", "flare_blitz"], 
        "slot2": ["guardian", "calm_mind"], 
        "slot3": ["fire_fang", "crush_claw"], 
    }, 

    "regirock": {
        "name": "Regirock", 
        "sprite": 526, 
        "color": "rock", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 85, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["stone_edge", "earthquake"], 
        "slot2": ["stealth_rock", "sandstorm"], 
        "slot3": ["superpower", "explosion"], 
    }, 

    "regice": {
        "name": "Regice", 
        "sprite": 528, 
        "color": "ice", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 6, 

        "health": 60, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["avalanche", "ice_beam"], 
        "slot2": ["ice_body", "hail"], 
        "slot3": ["ice_punch", "icy_wind"], 
    }, 

    "registeel": {
        "name": "Registeel", 
        "sprite": 529, 
        "color": "steel", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 90, 
        "power": 35, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["iron_head", "metal_claw"], 
        "slot2": ["iron_defense", "self-destruct"], 
        "slot3": ["zap_cannon", "hyper_beam"], 
    }, 

    "latias": {
        "name": "Latias", 
        "sprite": 530, 
        "color": "psychic", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 60, 
        "power": 55, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["mist_ball", "psychic"], 
        "slot2": ["recover", "tailwind"], 
        "slot3": ["dragon_breath", "heal_pulse"], 
    }, 

    "latios": {
        "name": "Latios", 
        "sprite": 532, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 40, 
        "power": 70, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["luster_purge", "fly"], 
        "slot2": ["helping_hand", "baton_pass"], 
        "slot3": ["draco_meteor", "aura_sphere"], 
    }, 

    "servine": {
        "name": "Servine", 
        "sprite": 692, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 25, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["leaf_tornado", "vine_whip"], 
        "slot2": ["coil", "growth"], 
        "slot3": ["wrap", "razor_leaf"], 

        "evolve": ["serperior", 6]
    }, 

    "serperior": {
        "name": "Serperior", 
        "sprite": 693, 
        "color": "green", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 6, 

        "health": 40, 
        "power": 40, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["leaf_storm", "energy_ball"], 
        "slot2": ["coil", "growth"], 
        "slot3": ["leaf_tornado", "constrict"], 
    }, 

    "pignite": {
        "name": "Pignite", 
        "sprite": 695, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 50, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["flame_charge", "smog"], 
        "slot2": ["reckless", "blaze"], 
        "slot3": ["arm_thrust", "fire_punch"], 

        "evolve": ["emboar", 6]
    }, 

    "emboar": {
        "name": "Emboar", 
        "sprite": 696, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 3, 

        "health": 60, 
        "power": 65, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["heat_crash", "fire_punch"], 
        "slot2": ["reckless", "blaze"], 
        "slot3": ["arm_thrust", "brick_break"], 
    }, 

    "dewott": {
        "name": "Dewott", 
        "sprite": 699, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["razor_shell", "water_pulse"], 
        "slot2": ["aqua_jet", "torrent"], 
        "slot3": ["water_gun", "fury_cutter"], 

        "evolve": ["samurott", 6]
    }, 

    "samurott": {
        "name": "Samurott", 
        "sprite": 700, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["aqua_cutter", "aqua_tail"], 
        "slot2": ["swords_dance", "aqua_jet"], 
        "slot3": ["razor_shell", "slash"], 
    }, 

    "herdier": {
        "name": "Herdier", 
        "sprite": 704, 
        "color": "white", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 4, 

        "health": 40, 
        "power": 25, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["take_down", "tackle"], 
        "slot2": ["retaliate", "guardian"], 
        "slot3": ["bite", "tackle"], 

        "evolve": ["stoutland", 4]
    }, 

    "stoutland": {
        "name": "Stoutland", 
        "sprite": 705, 
        "color": "white", 
        "rarity": 2, 

        "ap": 3, 
        "pp": 6, 

        "health": 60, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["take_down", "fire_fang"], 
        "slot2": ["retaliate", "guardian"], 
        "slot3": ["bite", "wild_charge"], 
    }, 

    "liepard": {
        "name": "Liepard", 
        "sprite": 707, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 25, 
        "power": 40, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["fury_swipes", "knock_off"], 
        "slot2": ["prank", "fake_out"], 
        "slot3": ["pursuit", "night_slash"], 
    }, 

    "pansage": {
        "name": "Pansage", 
        "sprite": 708, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bullet_seed", "scratch"], 
        "slot2": ["synthesis", "helping_hand"], 
        "slot3": ["vine_whip", "scratch"], 

        "evolve": ["simisage", 4]
    }, 

    "simisage": {
        "name": "Simisage", 
        "sprite": 709, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 30, 
        "power": 55, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["seed_bomb", "fury_swipes"], 
        "slot2": ["synthesis", "helping_hand"], 
        "slot3": ["bullet_seed", "vine_whip"], 
    }, 

    "pansear": {
        "name": "Pansear", 
        "sprite": 710, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 20, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["flame_charge", "scratch"], 
        "slot2": ["blaze", "helping_hand"], 
        "slot3": ["flame_wheel", "incinerate"], 

        "evolve": ["simisear", 4]
    }, 

    "simisear": {
        "name": "Simisear", 
        "sprite": 712, 
        "color": "red", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 55, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["flame_burst", "fury_swipes"], 
        "slot2": ["blaze", "helping_hand"], 
        "slot3": ["incinerate", "flame_charge"], 
    }, 

    "panpour": {
        "name": "Panpour", 
        "sprite": 714, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["water_gun", "scratch"], 
        "slot2": ["torrent", "helping_hand"], 
        "slot3": ["brine", "scratch"], 

        "evolve": ["simipour", 4]
    }, 

    "simipour": {
        "name": "Simipour", 
        "sprite": 715, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 55, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["scald", "fury_swipes"], 
        "slot2": ["torrent", "helping_hand"], 
        "slot3": ["brine", "water_pulse"], 
    }, 

    "musharna": {
        "name": "Musharna", 
        "sprite": 717, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 50, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["psybeam", "psychic"], 
        "slot2": ["premonition", "future_sight"], 
        "slot3": ["confusion", "tackle"], 
    }, 

    "munna": {
        "name": "Munna", 
        "sprite": 716, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 4, 

        "health": 30, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["psybeam", "tackle"], 
        "slot2": ["premonition", "future_sight"], 
        "slot3": ["confusion", "tackle"], 

        "evolve": ["musharna", 5]
    }, 

    "blitzle": {
        "name": "Blitzle", 
        "sprite": 722, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 25, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["spark", "shock_wave"], 
        "slot2": ["charge", "quick_attack"], 
        "slot3": ["flame_charge", "tackle"], 

        "evolve": ["zebstrika", 4]
    }, 

    "zebstrika": {
        "name": "Zebstrika", 
        "sprite": 723, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 35, 
        "power": 50, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["wild_charge", "discharge"], 
        "slot2": ["charge", "extreme_speed"], 
        "slot3": ["spark", "flame_charge"], 
    }, 

    "boldore": {
        "name": "Boldore", 
        "sprite": 725, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 55, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["power_gem", "rock_throw"], 
        "slot2": ["stealth_rock", "iron_defense"], 
        "slot3": ["rock_throw", "rock_slide"], 

        "evolve": ["gigalith", 6]
    }, 

    "gigalith": {
        "name": "Gigalith", 
        "sprite": 726, 
        "color": "rock", 
        "rarity": 3, 

        "ap": 5, 
        "pp": 6, 

        "health": 80, 
        "power": 60, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["stone_edge", "rock_slide"], 
        "slot2": ["stealth_rock", "iron_defense"], 
        "slot3": ["power_gem", "explosion"], 
    }, 

    "excadrill": {
        "name": "Excadrill", 
        "sprite": 731, 
        "color": "ground", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["horn_drill", "crush_claw"], 
        "slot2": ["swords_dance", "sandstorm"], 
        "slot3": ["metal_claw", "drill_run"], 
    }, 

    "drilbur": {
        "name": "Drilbur", 
        "sprite": 729, 
        "color": "ground", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["dig", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["rock_throw", "tackle"], 

        "evolve": ["excadrill", 4]
    }, 

    "audino": {
        "name": "Audino", 
        "sprite": 733, 
        "color": "white", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 55, 
        "power": 20, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["heal_pulse", "tackle"], 
        "slot2": ["healing_touch", "helping_hand"], 
        "slot3": ["simple_beam", "take_down"], 
    }, 

    "seismitoad": {
        "name": "Seismitoad", 
        "sprite": 740, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 50, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["drain_punch", "muddy_water"], 
        "slot2": ["rain_dance", "aqua_ring"], 
        "slot3": ["bubble_beam", "mud_shot"], 
    }, 

    "palpitoad": {
        "name": "Palpitoad", 
        "sprite": 739, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["bubble_beam", "tackle"], 
        "slot2": ["rain_dance", "none"], 
        "slot3": ["water_gun", "mud_shot"], 

        "evolve": ["seismitoad", 4]
    }, 

    "throh": {
        "name": "Throh", 
        "sprite": 741, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 70, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["vital_throw", "brick_break"], 
        "slot2": ["wide_guard", "bulk_up"], 
        "slot3": ["rock_smash", "seismic_toss"], 
    }, 

    "scrafty": {
        "name": "Scrafty", 
        "sprite": 767, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 60, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["head_smash", "focus_punch"], 
        "slot2": ["payback", "beat_up"], 
        "slot3": ["foul_play", "parting_shot"], 
    }, 

    "sawk": {
        "name": "Sawk", 
        "sprite": 742, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["close_combat", "karate_chop"], 
        "slot2": ["counter", "retaliate"], 
        "slot3": ["double_kick", "brick_break"], 
    }, 

    "leavanny": {
        "name": "Leavanny", 
        "sprite": 746, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bug_bite", "slash"], 
        "slot2": ["swords_dance", "helping_hand"], 
        "slot3": ["leaf_blade", "tackle"], 
    }, 

    "whirlipede": {
        "name": "Whirlipede", 
        "sprite": 748, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 20, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["steamroller", "protect"], 
        "slot2": ["iron_defense", "none"], 
        "slot3": ["poison_sting", "tackle"], 

        "evolve": ["scolipede", 4]
    }, 

    "scolipede": {
        "name": "Scolipede", 
        "sprite": 749, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["steamroller", "poison_tail"], 
        "slot2": ["iron_defense", "baton_pass"], 
        "slot3": ["poison_sting", "megahorn"], 
    }, 

    "whimsicott": {
        "name": "Whimsicott", 
        "sprite": 751, 
        "color": "fairy", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["giga_drain", "play_rough"], 
        "slot2": ["prank", "substitute"], 
        "slot3": ["razor_leaf", "mega_drain"], 
    }, 

    "lilligant": {
        "name": "Lilligant", 
        "sprite": 753, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 30, 
        "power": 50, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["magical_leaf", "mega_drain"], 
        "slot2": ["quiver_dance", "petal_dance"], 
        "slot3": ["energy_ball", "leaf_storm"], 
    }, 

    "krokorok": {
        "name": "Krokorok", 
        "sprite": 758, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bite", "crunch"], 
        "slot2": ["torment", "anger_point"], 
        "slot3": ["dig", "mud_shot"], 

        "evolve": ["krookodile", 6]
    }, 

    "krookodile": {
        "name": "Krookodile", 
        "sprite": 759, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 45, 
        "power": 65, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["crunch", "earthquake"], 
        "slot2": ["conqueror", "anger_point"], 
        "slot3": ["bulldoze", "bite"], 
    }, 

    "darmanitan": {
        "name": "Darmanitan", 
        "sprite": 761, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 25, 
        "power": 70, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["flare_blitz", "hammer_arm"], 
        "slot2": ["zen_mode", "anger_point"], 
        "slot3": ["fire_punch", "headbutt"], 
    }, 

    "maractus": {
        "name": "Maractus", 
        "sprite": 763, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["needle_arm", "pin_missile"], 
        "slot2": ["spiky_shield", "sunny_day"], 
        "slot3": ["absorb", "tackle"], 
    }, 

    "crustle": {
        "name": "Crustle", 
        "sprite": 765, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 60, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["x-scissor", "fury_cutter"], 
        "slot2": ["stealth_rock", "wall"], 
        "slot3": ["rock_slide", "rock_wrecker"], 
    }, 

    "yamask": {
        "name": "Yamask", 
        "sprite": 769, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["hex", "astonish"], 
        "slot2": ["disable", "will-o-wisp"], 
        "slot3": ["destiny_bond", "astonish"], 

        "evolve": ["cofagrigus", 6]
    }, 

    "cofagrigus": {
        "name": "Cofagrigus", 
        "sprite": 770, 
        "color": "ghost", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 80, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["shadow_claw", "ominous_wind"], 
        "slot2": ["disable", "will-o-wisp"], 
        "slot3": ["dark_pulse", "destiny_bond"], 
    }, 

    "carracosta": {
        "name": "Carracosta", 
        "sprite": 772, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 70, 
        "power": 40, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["hydro_pump", "stone_edge"], 
        "slot2": ["ancient_power", "shell_smash"], 
        "slot3": ["rock_slide", "waterfall"], 
    }, 

    "archeops": {
        "name": "Archeops", 
        "sprite": 774, 
        "color": "flying", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 5, 

        "health": 30, 
        "power": 75, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["wing_attack", "dragon_breath"], 
        "slot2": ["defeatist", "defeatist"], 
        "slot3": ["rock_slide", "crunch"], 
    }, 

    "trubbish": {
        "name": "Trubbish", 
        "sprite": 775, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 2, 

        "health": 30, 
        "power": 20, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["sludge", "tackle"], 
        "slot2": ["stench", "none"], 
        "slot3": ["tackle", "tackle"], 

        "evolve": ["garbodor", 3]
    }, 

    "garbodor": {
        "name": "Garbodor", 
        "sprite": 776, 
        "color": "poison", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 65, 
        "power": 40, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["sludge_bomb", "belch"], 
        "slot2": ["stench", "toxic_spikes"], 
        "slot3": ["acid_spray", "sludge"], 
    }, 

    "minccino": {
        "name": "Minccino", 
        "sprite": 780, 
        "color": "white", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["tail_slap", "tackle"], 
        "slot2": ["helping_hand", "tickle"], 
        "slot3": ["swift", "tackle"], 

        "evolve": ["cinccino", 4]
    }, 

    "cinccino": {
        "name": "Cinccino", 
        "sprite": 781, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 30, 
        "power": 50, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["tail_slap", "swift"], 
        "slot2": ["helping_hand", "tickle"], 
        "slot3": ["rock_blast", "bullet_seed"], 
    }, 

    "gothorita": {
        "name": "Gothorita", 
        "sprite": 783, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 35, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["psybeam", "tackle"], 
        "slot2": ["future_sight", "trick_room"], 
        "slot3": ["pound", "tackle"], 

        "evolve": ["gothitelle", 5]
    }, 

    "gothitelle": {
        "name": "Gothitelle", 
        "sprite": 784, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 5, 

        "health": 50, 
        "power": 45, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["psybeam", "psychic"], 
        "slot2": ["future_sight", "trick_room"], 
        "slot3": ["confusion", "pound"], 
    }, 

    "reuniclus": {
        "name": "Reuniclus", 
        "sprite": 788, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 60, 
        "power": 65, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["psychic", "hammer_arm"], 
        "slot2": ["regenerator", "none"], 
        "slot3": ["psybeam", "dizzy_punch"], 
    }, 

    "swanna": {
        "name": "Swanna", 
        "sprite": 790, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["water_pulse", "wing_attack"], 
        "slot2": ["rain_dance", "soak"], 
        "slot3": ["water_gun", "peck"], 
    }, 

    "sawsbuck": {
        "name": "Sawsbuck", 
        "sprite": 801, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["horn_leech", "horn_attack"], 
        "slot2": ["chlorophyll", "synthesis"], 
        "slot3": ["double_kick", "megahorn"], 
    }, 

    "emolga": {
        "name": "Emolga", 
        "sprite": 803, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 65, 

        "trait": null, 
        "slot1": ["acrobatics", "thunder_shock"], 
        "slot2": ["double_team", "quick_attack"], 
        "slot3": ["electro_ball", "shock_wave"], 
    }, 

    "escavalier": {
        "name": "Escavalier", 
        "sprite": 805, 
        "color": "steel", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 60, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["fell_stinger", "twineedle"], 
        "slot2": ["iron_defense", "swords_dance"], 
        "slot3": ["metal_claw", "giga_impact"], 
    }, 

    "amoonguss": {
        "name": "Amoonguss", 
        "sprite": 807, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 25, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["mega_drain", "toxic"], 
        "slot2": ["spore", "synthesis"], 
        "slot3": ["smog", "tackle"], 
    }, 

    "jellicent_m": {
        "name": "Jellicent", 
        "sprite": 812, 
        "color": "blue", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["surf", "shadow_ball"], 
        "slot2": ["rain_dance", "recover"], 
        "slot3": ["water_pulse", "hex"], 
    }, 

    "jellicent_f": {
        "name": "Jellicent", 
        "sprite": 811, 
        "color": "black", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["ominous_wind", "brine"], 
        "slot2": ["recover", "rain_dance"], 
        "slot3": ["night_shade", "water_pulse"], 
    }, 

    "galvantula": {
        "name": "Galvantula", 
        "sprite": 815, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 45, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["discharge", "electro_ball"], 
        "slot2": ["spider_web", "volt_switch"], 
        "slot3": ["bug_buzz", "signal_beam"], 
    }, 

    "ferrothorn": {
        "name": "Ferrothorn", 
        "sprite": 817, 
        "color": "steel", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 70, 
        "power": 30, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["power_whip", "iron_head"], 
        "slot2": ["iron_barbs", "self-destruct"], 
        "slot3": ["metal_claw", "bullet_seed"], 
    }, 

    "eelektrik": {
        "name": "Eelektrik", 
        "sprite": 825, 
        "color": "yellow", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 35, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["spark", "crunch"], 
        "slot2": ["impervious", "charge"], 
        "slot3": ["bite", "tackle"], 

        "evolve": ["eelektross", 4]
    }, 

    "eelektross": {
        "name": "Eelektross", 
        "sprite": 826, 
        "color": "yellow", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 50, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["discharge", "wild_charge"], 
        "slot2": ["impervious", "charge"], 
        "slot3": ["spark", "acid_spray"], 
    }, 

    "lampent": {
        "name": "Lampent", 
        "sprite": 831, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["hex", "flame_burst"], 
        "slot2": ["will-o-wisp", "spook"], 
        "slot3": ["astonish", "fire_spin"], 

        "evolve": ["chandelure", 6]
    }, 

    "chandelure": {
        "name": "Chandelure", 
        "sprite": 832, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 35, 
        "power": 75, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["shadow_ball", "overheat"], 
        "slot2": ["will-o-wisp", "spook"], 
        "slot3": ["fire_spin", "hex"], 
    }, 

    "fraxure": {
        "name": "Fraxure", 
        "sprite": 834, 
        "color": "dragon", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 20, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["dual_chop", "crunch"], 
        "slot2": ["focus_energy", "none"], 
        "slot3": ["bite", "slash"], 

        "evolve": ["haxorus", 8]
    }, 

    "haxorus": {
        "name": "Haxorus", 
        "sprite": 835, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 3, 

        "health": 40, 
        "power": 85, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["outrage", "guillotine"], 
        "slot2": ["dragon_dance", "swords_dance"], 
        "slot3": ["dragon_tail", "crunch"], 
    }, 

    "beartic": {
        "name": "Beartic", 
        "sprite": 837, 
        "color": "ice", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 40, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["icicle_crash", "avalanche"], 
        "slot2": ["bulk_up", "none"], 
        "slot3": ["ice_punch", "tackle"], 
    }, 

    "accelgor": {
        "name": "Accelgor", 
        "sprite": 840, 
        "color": "bug", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 50, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["bug_buzz", "acid_spray"], 
        "slot2": ["double_team", "u-turn"], 
        "slot3": ["leech_life", "final_gambit"], 
    }, 

    "mienshao": {
        "name": "Mienshao", 
        "sprite": 843, 
        "color": "fighting", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 65, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["force_palm", "drain_punch"], 
        "slot2": ["detect", "fake_out"], 
        "slot3": ["high_jump_kick", "bounce"], 
    }, 

    "mienfoo": {
        "name": "Mienfoo", 
        "sprite": 842, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 15, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["karate_chop", "force_palm"], 
        "slot2": ["detect", "fake_out"], 
        "slot3": ["jump_kick", "pound"], 

        "evolve": ["mienshao", 4]
    }, 

    "druddigon": {
        "name": "Druddigon", 
        "sprite": 844, 
        "color": "dragon", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 50, 
        "power": 55, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["dragon_rage", "dragon_claw"], 
        "slot2": ["rough_skin", "retaliate"], 
        "slot3": ["bite", "dragon_tail"], 
    }, 

    "golurk": {
        "name": "Golurk", 
        "sprite": 847, 
        "color": "ghost", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 50, 
        "power": 55, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["shadow_punch", "hammer_arm"], 
        "slot2": ["iron_defense", "iron_fist"], 
        "slot3": ["magnitude", "rock_throw"], 
    }, 

    "pawniard": {
        "name": "Pawniard", 
        "sprite": 849, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 40, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["metal_claw", "night_slash"], 
        "slot2": ["iron_barbs", "none"], 
        "slot3": ["scratch", "scratch"], 

        "evolve": ["bisharp", 5]
    }, 

    "bisharp": {
        "name": "Bisharp", 
        "sprite": 850, 
        "color": "steel", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 55, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["iron_head", "guillotine"], 
        "slot2": ["iron_barbs", "sucker_punch"], 
        "slot3": ["night_slash", "metal_claw"], 
    }, 

    "bouffalant": {
        "name": "Bouffalant", 
        "sprite": 851, 
        "color": "white", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 50, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["head_charge", "giga_impact"], 
        "slot2": ["counter", "reckless"], 
        "slot3": ["horn_attack", "bulldoze"], 
    }, 

    "rufflet": {
        "name": "Rufflet", 
        "sprite": 852, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["wing_attack", "tackle"], 
        "slot2": ["pride", "reckless"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["braviary", 5]
    }, 

    "braviary": {
        "name": "Braviary", 
        "sprite": 853, 
        "color": "flying", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 2, 

        "health": 40, 
        "power": 60, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["sky_drop", "superpower"], 
        "slot2": ["pride", "reckless"], 
        "slot3": ["wing_attack", "peck"], 
    }, 

    "vullaby": {
        "name": "Vullaby", 
        "sprite": 854, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["knock_off", "tackle"], 
        "slot2": ["wall", "attract"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["mandibuzz", 4]
    }, 

    "mandibuzz": {
        "name": "Mandibuzz", 
        "sprite": 855, 
        "color": "black", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 65, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["bone_rush", "sky_attack"], 
        "slot2": ["wall", "attract"], 
        "slot3": ["knock_off", "peck"], 
    }, 

    "durant": {
        "name": "Durant", 
        "sprite": 857, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 60, 
        "power": 25, 
        "speed": 10, 

        "trait": null, 
        "slot1": ["metal_claw", "vice_grip"], 
        "slot2": ["iron_defense", "none"], 
        "slot3": ["bug_bite", "tackle"], 
    }, 

    "zweilous": {
        "name": "Zweilous", 
        "sprite": 859, 
        "color": "black", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 40, 
        "power": 45, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["dragon_rage", "crunch"], 
        "slot2": ["reckless", "roar"], 
        "slot3": ["bite", "tackle"], 

        "evolve": ["hydreigon", 8]
    }, 

    "hydreigon": {
        "name": "Hydreigon", 
        "sprite": 860, 
        "color": "black", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 5, 

        "health": 50, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["draco_meteor", "outrage"], 
        "slot2": ["nasty_plot", "roar"], 
        "slot3": ["dragon_pulse", "dark_pulse"], 
    }, 

    "larvesta": {
        "name": "Larvesta", 
        "sprite": 861, 
        "color": "bug", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 30, 
        "power": 35, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["flame_wheel", "flame_charge"], 
        "slot2": ["flame_body", "none"], 
        "slot3": ["bug_buzz", "bug_bite"], 

        "evolve": ["volcarona", 8]
    }, 

    "volcarona": {
        "name": "Volcarona", 
        "sprite": 862, 
        "color": "bug", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 6, 

        "health": 45, 
        "power": 75, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["fiery_dance", "fire_blast"], 
        "slot2": ["quiver_dance", "flame_body"], 
        "slot3": ["solar_beam", "bug_buzz"], 
    }, 

    "cobalion": {
        "name": "Cobalion", 
        "sprite": 863, 
        "color": "steel", 
        "rarity": 4, 

        "ap": 6, 
        "pp": 6, 

        "health": 75, 
        "power": 55, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["sacred_sword", "iron_head"], 
        "slot2": ["guardian", "metal_burst"], 
        "slot3": ["zen_headbutt", "close_combat"], 
    }, 

    "terrakion": {
        "name": "Terrakion", 
        "sprite": 864, 
        "color": "ground", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 3, 

        "health": 50, 
        "power": 80, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["sacred_sword", "stone_edge"], 
        "slot2": ["wide_guard", "solid_rock"], 
        "slot3": ["rock_slide", "close_combat"], 
    }, 

    "virizion": {
        "name": "Virizion", 
        "sprite": 865, 
        "color": "green", 
        "rarity": 4, 

        "ap": 6, 
        "pp": 6, 

        "health": 60, 
        "power": 60, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["sacred_sword", "leaf_blade"], 
        "slot2": ["retaliate", "synthesis"], 
        "slot3": ["bounce", "close_combat"], 
    }, 

    "keldeo": {
        "name": "Keldeo", 
        "sprite": 880, 
        "color": "blue", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 40, 
        "power": 50, 
        "speed": 60, 

        "trait": null, 
        "slot1": ["secret_sword", "hydro_pump"], 
        "slot2": ["helping_hand", "detect"], 
        "slot3": ["bubble_beam", "close_combat"], 
    }, 

    "tornadus": {
        "name": "Tornadus", 
        "sprite": 867, 
        "color": "flying", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 5, 

        "health": 40, 
        "power": 65, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["hurricane", "hyper_beam"], 
        "slot2": ["tailwind", "rain_dance"], 
        "slot3": ["air_slash", "fly"], 
    }, 

    "meloetta": {
        "name": "Meloetta", 
        "sprite": 883, 
        "color": "white", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 50, 
        "power": 65, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["relic_song", "psychic"], 
        "slot2": ["sing", "teeter_dance"], 
        "slot3": ["hyper_voice", "dazzling_gleam"], 
    }, 

    "genesect": {
        "name": "Genesect", 
        "sprite": 886, 
        "color": "bug", 
        "rarity": 4, 

        "ap": 9, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["techno_blast", "hyper_beam"], 
        "slot2": ["drive_switch", "self-destruct"], 
        "slot3": ["energy_ball", "zap_cannon"], 
    }, 

    "shaymin": {
        "name": "Shaymin", 
        "sprite": 685, 
        "color": "green", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 4, 

        "health": 30, 
        "power": 70, 
        "speed": 80, 

        "trait": null, 
        "slot1": ["seed_flare", "energy_ball"], 
        "slot2": ["healing_touch", "growth"], 
        "slot3": ["air_slash", "magical_leaf"], 
    }, 

    "quilladin": {
        "name": "Quilladin", 
        "sprite": 901, 
        "color": "green", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 4, 

        "health": 50, 
        "power": 35, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["needle_arm", "pin_missile"], 
        "slot2": ["spiky_shield", "bulk_up"], 
        "slot3": ["rollout", "seed_bomb"], 

        "evolve": ["chesnaught", 6]
    }, 

    "chesnaught": {
        "name": "Chesnaught", 
        "sprite": 902, 
        "color": "green", 
        "rarity": 3, 

        "ap": 4, 
        "pp": 6, 

        "health": 75, 
        "power": 60, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["needle_arm", "pin_missile"], 
        "slot2": ["spiky_shield", "bulk_up"], 
        "slot3": ["rollout", "wood_hammer"], 
    }, 

    "braixen": {
        "name": "Braixen", 
        "sprite": 904, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 40, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["mystical_fire", "psybeam"], 
        "slot2": ["will-o-wisp", "calm_mind"], 
        "slot3": ["confusion", "ember"], 

        "evolve": ["delphox", 6]
    }, 

    "delphox": {
        "name": "Delphox", 
        "sprite": 905, 
        "color": "red", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["mystical_fire", "psybeam"], 
        "slot2": ["will-o-wisp", "calm_mind"], 
        "slot3": ["psychic", "fire_blast"], 
    }, 

    "frogadier": {
        "name": "Frogadier", 
        "sprite": 907, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["water_pulse", "bounce"], 
        "slot2": ["water_shuriken", "substitute"], 
        "slot3": ["lick", "water_gun"], 

        "evolve": ["greninja", 6]
    }, 

    "greninja": {
        "name": "Greninja", 
        "sprite": 908, 
        "color": "blue", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 5, 

        "health": 35, 
        "power": 40, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["waterfall", "bounce"], 
        "slot2": ["water_shuriken", "substitute"], 
        "slot3": ["night_slash", "toxic"], 
    }, 

    "fletchinder": {
        "name": "Fletchinder", 
        "sprite": 915, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["flame_wheel", "wing_attack"], 
        "slot2": ["flame_body", "none"], 
        "slot3": ["flame_charge", "peck"], 

        "evolve": ["talonflame", 4]
    }, 

    "talonflame": {
        "name": "Talonflame", 
        "sprite": 916, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 30, 
        "power": 55, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["flare_blitz", "brave_bird"], 
        "slot2": ["tailwind", "flame_body"], 
        "slot3": ["flame_wheel", "wing_attack"], 
    }, 

    "pyroar": {
        "name": "Pyroar", 
        "sprite": 940, 
        "color": "red", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 35, 
        "power": 50, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["fire_fang", "bite"], 
        "slot2": ["noble_roar", "conqueror"], 
        "slot3": ["hyper_voice", "overheat"], 
    }, 

    "litleo": {
        "name": "Litleo", 
        "sprite": 939, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 4, 

        "health": 25, 
        "power": 30, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["fire_fang", "hyper_voice"], 
        "slot2": ["roar", "conqueror"], 
        "slot3": ["bite", "ember"], 

        "evolve": ["pyroar", 2]
    }, 

    "floette": {
        "name": "Floette", 
        "sprite": 947, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["fairy_wind", "moonblast"], 
        "slot2": ["synthesis", "aromatherapy"], 
        "slot3": ["magical_leaf", "mega_drain"], 

        "evolve": ["florges", 6]
    }, 

    "florges": {
        "name": "Florges", 
        "sprite": 953, 
        "color": "fairy", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 60, 
        "power": 50, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["moonblast", "fairy_wind"], 
        "slot2": ["synthesis", "aromatherapy"], 
        "slot3": ["magical_leaf", "solar_beam"], 
    }, 

    "skiddo": {
        "name": "Skiddo", 
        "sprite": 958, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 35, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["take_down", "razor_leaf"], 
        "slot2": ["chlorophyll", "none"], 
        "slot3": ["headbutt", "tackle"], 

        "evolve": ["gogoat", 4]
    }, 

    "gogoat": {
        "name": "Gogoat", 
        "sprite": 959, 
        "color": "green", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 3, 

        "health": 60, 
        "power": 50, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["horn_leech", "take_down"], 
        "slot2": ["chlorophyll", "none"], 
        "slot3": ["double-edge", "headbutt"], 
    }, 

    "pancham": {
        "name": "Pancham", 
        "sprite": 960, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 30, 
        "power": 30, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["parting_shot", "comet_punch"], 
        "slot2": ["iron_fist", "beat_up"], 
        "slot3": ["rock_smash", "headbutt"], 

        "evolve": ["pangoro", 5]
    }, 

    "pangoro": {
        "name": "Pangoro", 
        "sprite": 961, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 50, 
        "power": 55, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["comet_punch", "hammer_arm"], 
        "slot2": ["iron_fist", "beat_up"], 
        "slot3": ["parting_shot", "crunch"], 
    }, 

    "espurr": {
        "name": "Espurr", 
        "sprite": 973, 
        "color": "psychic", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 30, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["psybeam", "tackle"], 
        "slot2": ["fake_out", "helping_hand"], 
        "slot3": ["confusion", "tackle"], 

        "evolve": ["meowstic", 4]
    }, 

    "meowstic": {
        "name": "Meowstic", 
        "sprite": 974, 
        "color": "psychic", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 4, 

        "health": 35, 
        "power": 40, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["psybeam", "psychic"], 
        "slot2": ["fake_out", "helping_hand"], 
        "slot3": ["confusion", "tackle"], 
    }, 

    "aromatisse": {
        "name": "Aromatisse", 
        "sprite": 981, 
        "color": "fairy", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 30, 
        "power": 30, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["draining_kiss", "moonblast"], 
        "slot2": ["attract", "helping_hand"], 
        "slot3": ["fairy_wind", "toxic"], 
    }, 

    "inkay": {
        "name": "Inkay", 
        "sprite": 984, 
        "color": "black", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["knock_off", "constrict"], 
        "slot2": ["payback", "hypnosis"], 
        "slot3": ["peck", "tackle"], 

        "evolve": ["malamar", 4]
    }, 

    "malamar": {
        "name": "Malamar", 
        "sprite": 985, 
        "color": "black", 
        "rarity": 2, 

        "ap": 6, 
        "pp": 3, 

        "health": 30, 
        "power": 50, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["psycho_cut", "constrict"], 
        "slot2": ["payback", "hypnosis"], 
        "slot3": ["night_slash", "superpower"], 
    }, 

    "doublade": {
        "name": "Doublade", 
        "sprite": 977, 
        "color": "steel", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 20, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["slash", "fury_cutter"], 
        "slot2": ["swords_dance", "iron_defense"], 
        "slot3": ["night_slash", "iron_head"], 

        "evolve": ["aegislash", 6]
    }, 

    "aegislash": {
        "name": "Aegislash", 
        "sprite": 978, 
        "color": "steel", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 55, 
        "power": 55, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["sacred_sword", "iron_head"], 
        "slot2": ["king's_shield", "swords_dance"], 
        "slot3": ["night_slash", "slash"], 
    }, 

    "barbaracle": {
        "name": "Barbaracle", 
        "sprite": 987, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 50, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["razor_shell", "skull_bash"], 
        "slot2": ["cover", "shell_smash"], 
        "slot3": ["cross_chop", "water_gun"], 
    }, 

    "skrelp": {
        "name": "Skrelp", 
        "sprite": 989, 
        "color": "poison", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 35, 
        "power": 25, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["water_pulse", "smog"], 
        "slot2": ["smokescreen", "endure"], 
        "slot3": ["smog", "sludge_wave"], 

        "evolve": ["dragalge", 7]
    }, 

    "dragalge": {
        "name": "Dragalge", 
        "sprite": 990, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 5, 

        "health": 65, 
        "power": 60, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["outrage", "dragon_pulse"], 
        "slot2": ["smokescreen", "endure"], 
        "slot3": ["poison_tail", "sludge_wave"], 
    }, 

    "tyrunt": {
        "name": "Tyrunt", 
        "sprite": 997, 
        "color": "rock", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 35, 
        "power": 40, 
        "speed": 25, 

        "trait": null, 
        "slot1": ["bite", "dragon_tail"], 
        "slot2": ["ancient_power", "roar"], 
        "slot3": ["crunch", "bulldoze"], 

        "evolve": ["tyrantrum", 7]
    }, 

    "tyrantrum": {
        "name": "Tyrantrum", 
        "sprite": 998, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 3, 

        "health": 50, 
        "power": 70, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["head_smash", "dragon_tail"], 
        "slot2": ["ancient_power", "roar"], 
        "slot3": ["earthquake", "dragon_claw"], 
    }, 

    "amaura": {
        "name": "Amaura", 
        "sprite": 999, 
        "color": "ice", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 15, 

        "trait": null, 
        "slot1": ["frost_breath", "avalanche"], 
        "slot2": ["ancient_power", "none"], 
        "slot3": ["rock_throw", "bulldoze"], 

        "evolve": ["aurorus", 7]
    }, 

    "aurorus": {
        "name": "Aurorus", 
        "sprite": 1000, 
        "color": "ice", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 4, 

        "health": 70, 
        "power": 50, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["avalanche", "frost_breath"], 
        "slot2": ["hail", "ancient_power"], 
        "slot3": ["rock_blast", "hyper_beam"], 
    }, 

    "trevenant": {
        "name": "Trevenant", 
        "sprite": 1012, 
        "color": "green", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 35, 
        "power": 45, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["shadow_claw", "wood_hammer"], 
        "slot2": ["forest_curse", "leech_seed"], 
        "slot3": ["horn_leech", "destiny_bond"], 
    }, 


    "hawlucha": {
        "name": "Hawlucha", 
        "sprite": 1003, 
        "color": "fighting", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 20, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["wing_attack", "high_jump_kick"], 
        "slot2": ["swords_dance", "detect"], 
        "slot3": ["brick_break", "sky_attack"], 
    }, 

    "sliggoo": {
        "name": "Sliggoo", 
        "sprite": 1007, 
        "color": "dragon", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 45, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["dragon_breath", "dragon_pulse"], 
        "slot2": ["acid_armor", "cover"], 
        "slot3": ["water_pulse", "mega_drain"], 

        "evolve": ["goodra", 8]
    }, 

    "goodra": {
        "name": "Goodra", 
        "sprite": 1008, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 4, 

        "health": 65, 
        "power": 60, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["outrage", "muddy_water"], 
        "slot2": ["acid_armor", "rain_dance"], 
        "slot3": ["aqua_tail", "power_whip"], 
    }, 

    "noibat": {
        "name": "Noibat", 
        "sprite": 1017, 
        "color": "flying", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 2, 

        "health": 20, 
        "power": 35, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["leech_life", "wing_attack"], 
        "slot2": ["double_team", "none"], 
        "slot3": ["air_cutter", "super_fang"], 

        "evolve": ["noivern", 7]
    }, 

    "noivern": {
        "name": "Noivern", 
        "sprite": 1018, 
        "color": "dragon", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 4, 

        "health": 40, 
        "power": 60, 
        "speed": 75, 

        "trait": null, 
        "slot1": ["boomburst", "hurricane"], 
        "slot2": ["tailwind", "moonlight"], 
        "slot3": ["dragon_pulse", "air_slash"], 
    }, 

    "diancie": {
        "name": "Diancie", 
        "sprite": 1028, 
        "color": "red", 
        "rarity": 4, 

        "ap": 7, 
        "pp": 6, 

        "health": 75, 
        "power": 60, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["diamond_storm", "power_gem"], 
        "slot2": ["stealth_rock", "moonlight"], 
        "slot3": ["moonblast", "dazzling_gleam"], 
    }, 

    "drifblim": {
        "name": "Drifblim", 
        "sprite": 604, 
        "color": "ghost", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 3, 

        "health": 40, 
        "power": 30, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["ominous_wind", "shadow_ball"], 
        "slot2": ["guts", "baton_pass"], 
        "slot3": ["astonish", "explosion"], 
    }, 

    "arceus": {
        "name": "Arceus", 
        "sprite": 687, 
        "color": "white", 
        "rarity": 5, 

        "ap": 10, 
        "pp": 10, 

        "health": 150, 
        "power": 150, 
        "speed": 150, 

        "trait": null, 
        "slot1": ["judgement", "hyper_voice"], 
        "slot2": ["multitype", "extreme_speed"], 
        "slot3": ["sky_spear", "hyper_beam"], 
    }, 

    "dark_magician_girl": {
        "name": "Dark Magician Girl", 
        "sprite": 1258, 
        "color": "black", 
        "rarity": 2, 

        "ap": 5, 
        "pp": 4, 

        "health": 30, 
        "power": 50, 
        "speed": 55, 

        "trait": null, 
        "slot1": ["dark_burn", "draining_kiss"], 
        "slot2": ["dark_sutra", "nasty_plot"], 
        "slot3": ["dark_magic", "shadow_ball"], 
    }, 

    "dark_magician": {
        "name": "Dark Magician", 
        "sprite": 1257, 
        "color": "black", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 5, 

        "health": 50, 
        "power": 70, 
        "speed": 35, 

        "trait": null, 
        "slot1": ["dark_magic", "moonblast"], 
        "slot2": ["barrier", "calm_mind"], 
        "slot3": ["dark_burn", "mind_shock"], 
    }, 

    "summoned_skull": {
        "name": "Summoned Skull", 
        "sprite": 1256, 
        "color": "yellow", 
        "rarity": 3, 

        "ap": 6, 
        "pp": 2, 

        "health": 40, 
        "power": 70, 
        "speed": 45, 

        "trait": null, 
        "slot1": ["dark_lightning", "thunder"], 
        "slot2": ["makiu_mist", "pressure"], 
        "slot3": ["shadow_claw", "incinerate"], 
    }, 

    "blue_eyes_white_dragon": {
        "name": "Blue-Eyes White Dragon", 
        "sprite": 1253, 
        "color": "white", 
        "rarity": 4, 

        "ap": 8, 
        "pp": 3, 

        "health": 60, 
        "power": 100, 
        "speed": 30, 

        "trait": null, 
        "slot1": ["burst_stream", "dragon_pulse"], 
        "slot2": ["roar", "dragon_dance"], 
        "slot3": ["white_lightning", "dragon_rage"], 
    }, 

    "hitotsu-me-giant": {
        "name": "Hitotsu-Me Giant", 
        "sprite": 1255, 
        "color": "green", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 50, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["sledge_hammer", "hammer_arm"], 
        "slot2": ["anger_point", "triumph"], 
        "slot3": ["headbutt", "giga_impact"], 
    }, 

    "swordstalker": {
        "name": "Swordstalker", 
        "sprite": 1254, 
        "color": "black", 
        "rarity": 2, 

        "ap": 4, 
        "pp": 6, 

        "health": 60, 
        "power": 40, 
        "speed": 70, 

        "trait": null, 
        "slot1": ["dark_slash", "crunch"], 
        "slot2": ["counter", "retaliate"], 
        "slot3": ["cut", "guillotine"], 
    }, 

    "pixie": {
        "name": "Pixie", 
        "sprite": 1250, 
        "color": "green", 
        "rarity": 1, 

        "ap": 2, 
        "pp": 3, 

        "health": 15, 
        "power": 30, 
        "speed": 50, 

        "trait": null, 
        "slot1": ["zan", "zanma"], 
        "slot2": ["dia", "media"], 
        "slot3": ["zio", "megidolaon"], 
    }, 

    "jack_frost": {
        "name": "Jack Frost", 
        "sprite": 1252, 
        "color": "blue", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 2, 

        "health": 40, 
        "power": 30, 
        "speed": 20, 

        "trait": null, 
        "slot1": ["bufula", "bufudyne"], 
        "slot2": ["helping_hand", "wall"], 
        "slot3": ["bufu", "hamaon"], 
    }, 

    "jacko_lantern": {
        "name": "Jack-o'-Lantern", 
        "sprite": 1251, 
        "color": "red", 
        "rarity": 1, 

        "ap": 3, 
        "pp": 3, 

        "health": 25, 
        "power": 40, 
        "speed": 40, 

        "trait": null, 
        "slot1": ["agi", "agidyne"], 
        "slot2": ["concentrate", "will-o-wisp"], 
        "slot3": ["agilao", "mudoon"], 
    }, 

    "MISSINGNO.": {
        "name": "MISSINGNO.", 
        "sprite": 1245, 
        "color": "white", 
        "rarity": 1, 

        "ap": 4, 
        "pp": 0, 

        "health": 178, 
        "power": 136, 
        "speed": 0, 

        "trait": null, 
        "slot1": ["water_gun", "tackle"], 
        "slot2": ["none", "none"], 
        "slot3": ["sky_attack", "water_gun"], 
    }, 
    
    "Santy": {
        "name": "Santy", 
        "sprite": 1245, 
        "color": "white", 
        "rarity": 5, 

        "ap": 10, 
        "pp": 10, 

        "health": 999, 
        "power": 999, 
        "speed": 99, 

        "trait": null, 
        "slot1": ["test", "water_gun"], 
        "slot2": ["none", "none"], 
        "slot3": ["sky_attack", "water_gun"], 
        "learn_slot1": ["tackle", "ice_beam"],
        "learn_slot3": ["tackle", "hyper_beam"]
    }, 

}
