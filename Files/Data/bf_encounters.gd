extends Node
var sample = [null, 
            null, 
            null, 
            null, 
            null, 
            null
        ]

var lv1 = 1
var lv2 = 3
var lv3 = 6
var lv4 = 8

var dict = {
    0: [
        [null, 
            ["metapod", lv1 + 1, {}], 
            null, 
            ["pidgeotto", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["vespiqueen", lv1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["wailord", lv1, {"bonus_power": -12}], 
            null, 
            null, 
            ["skitty", lv1 + 1, {}], 
            null
        ], 

        [null, 
            ["riolu", lv1 + 1, {}], 
            null, 
            ["croagunk", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["pikachu", lv1 + 1, {}], 
            null, 
            ["eevee", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["eevee", lv1, {}], 
            null, 
            ["zorua", lv1 + 1, {}], 
            null, 
            null
        ], 

        [null, 
            ["kakuna", lv1, {}], 
            null, 
            ["spearow", lv1, {"bonus_ap": -1}], 
            null, 
            ["spearow", lv1, {"bonus_ap": -1}]
        ], 

        [["nidorina", lv1 + 1, {}], 
            null, 
            ["sandshrew", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["nidorino", lv1 + 1, {}], 
            null, 
            null, 
            ["vulpix", lv1, {}], 
            null
        ], 

        [["zubat", lv1, {}], 
            ["zubat", lv1, {}], 
            ["zubat", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["growlithe", lv1 + 1, {}], 
            ["floatzel", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [["grimer", lv1, {}], 
            ["machoke", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["krabby", lv1, {}], 
            ["haunter", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["staryu", lv1, {}], 
            ["cubone", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["noctowl", lv1 + 1, {}], 
            ["furret", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["flaafy", lv1 + 1, {}], 
            null, 
            null, 
            ["xatu", lv1, {}], 
            null
        ], 

        [null, 
            ["marill", lv1 + 1, {}], 
            null, 
            ["aipom", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["pidgeotto", lv1 + 1, {}], 
            null, 
            ["pikachu", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["gligar", lv1 + 1, {}], 
            null, 
            ["misdreavus", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["quagsire", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            ["murkrow", lv1, {}]
        ], 

        [null, 
            ["slugma", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            ["sneasel", lv1, {}]
        ], 

        [null, 
            ["piloswine", lv1 + 1, {}], 
            null, 
            null, 
            ["phanpy", lv1, {}], 
            null
        ], 

        [null, 
            ["porygon", lv1 + 1, {"bonus_ap": -2}], 
            null, 
            ["tyrogue", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["mightyena", 3, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["zigzagoon", lv1, {}], 
            ["zigzagoon", lv1, {}], 
            ["zigzagoon", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [["nuzleaf", lv1 + 1, {}], 
            ["kirlia", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["machoke", lv1, {}], 
            ["vigoroth", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["makuhita", lv1 + 1, {}], 
            ["poliwhirl", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["sableye", lv1, {}], 
            null, 
            ["delcatty", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["tentacool", lv1 + 1, {}], 
            null, 
            ["roselia", lv1, {"slotlv1": 1, "slotlv1+1": 1}], 
            null, 
            null
        ], 

        [null, 
            ["spinda", lv1 + 1, {}], 
            null, 
            ["krabby", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["kecleon", lv1 + 1, {"bonus_health": -10, "bonus_pp": -1}], 
            null, 
            null, 
            ["ponyta", lv1, {}], 
            null
        ], 

        [["growlithe", lv1, {"bonus_pp": -1}], 
            ["luxio", lv1, {"bonus_pp": -1}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["riolu", lv1 + 1, {}], 
            null, 
            null, 
            ["clefairy", lv1, {}], 
            null
        ], 

        [["electabuzz", lv1 + 1, {}], 
            null, 
            ["magmar", lv1 + 1, {}], 
            null, 
            null, 
            null
        ], 

        [["pansage", lv1, {"bonus_ap": -1}], 
            ["pansear", lv1, {"bonus_ap": -1}], 
            ["panpour", lv1, {"bonus_ap": -1}], 
            null, 
            null, 
            null
        ], 

        [["ponyta", lv1 + 1, {}], 
            null, 
            ["blitzle", lv1 + 1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["krokorok", lv1 + 1, {}], 
            null, 
            ["krabby", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["emolga", lv1, {}], 
            null, 
            null, 
            ["zorua", lv1 + 1, {}], 
            null
        ], 

        [["eelektrik", lv1 + 1, {}], 
            null, 
            ["rufflet", lv1, {}], 
            null, 
            null, 
            null
        ], 

        [["lombre", lv1, {}], 
            ["skiddo", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["buneary", lv1, {}], 
            ["pancham", lv1 + 1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["hawlucha", lv1 + 1, {}], 
            null, 
            ["noibat", lv1, {"bonus_ap": -1}], 
            null, 
            null
        ], 

        [null, 
            ["hawlucha", lv1 + 1, {}], 
            null, 
            ["noibat", lv1, {}], 
            null, 
            null
        ], 

        [["tyrunt", lv1, {}], 
            ["amaura", lv1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["trevenant", lv1, {}], 
            ["sliggoo", lv1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["vullaby", lv1, {}], 
            null, 
            null, 
            ["skrelp", lv1, {}], 
            null
        ], 

        [null, 
            ["minccino", lv1, {}], 
            null, 
            ["lampent", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["minccino", lv1, {}], 
            null, 
            ["lampent", lv1, {}], 
            null, 
            null
        ], 

        [null, 
            ["boldore", lv1, {}], 
            null, 
            null, 
            null, 
            ["blitzle", lv1, {}]
        ], 

        [null, 
            ["herdier", lv1, {}], 
            null, 
            null, 
            null, 
            ["rotom", lv1, {}]
        ], 

        [null, 
            null, 
            ["nidorina", lv1, {}], 
            null, 
            ["noibat", lv1, {}], 
            null
        ], 

        [["jigglypuff", lv1, {}], 
            ["mienfoo", lv1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [["amoonguss", lv1, {}], 
            ["kadabra", lv1, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["tangela", lv1, {}], 
            null, 
            null, 
            ["floatzel", lv1, {}], 
            null
        ], 

        [null, 
            ["bronzong", lv1, {}], 
            null, 
            null, 
            ["pinsir", lv1, {}], 
            null
        ], 
    ], 

    1: [
        [null, 
            ["ivysaur", lv2 + 1, {}], 
            null, 
            ["fearow", lv2, {}], 
            ["primeape", lv2, {}], 
            null
        ], 

        [["vaporeon", lv2, {}], 
            ["flareon", lv2, {}], 
            ["jolteon", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["sylveon", lv2, {}], 
            ["umbreon", lv2, {}], 
            null, 
            null, 
            ["espeon", lv2, {}], 
            null
        ], 

        [null, 
            ["charmeleon", lv2 + 1, {}], 
            ["rhyhorn", lv2, {}], 
            ["victreebel", lv2 - 2, {}], 
            null, 
            null
        ], 

        [["kadabra", lv2, {}], 
            ["wartortle", lv2 + 1, {}], 
            null, 
            null, 
            null, 
            ["farfetch'd", lv2 - 1, {}], 
        ], 

        [null, 
            ["nidorina", lv2 + 1, {}], 
            null, 
            null, 
            ["nidorino", lv2 + 1, {}], 
            null
        ], 

        [["arbok", lv2 + 1, {}], 
            ["raticate", lv2 + 1, {}], 
            null, 
            ["bellossom", lv2, {}], 
            null, 
            null
        ], 

        [["golduck", lv2, {}], 
            ["wigglytuff", lv2, {}], 
            null, 
            null, 
            ["golbat", lv2 - 1, {}], 
            null
        ], 

        [["kadabra", lv2, {}], 
            ["machoke", lv2, {}], 
            null, 
            null, 
            null, 
            ["haunter", lv2, {}]
        ], 

        [["graveler", lv2, {}], 
            null, 
            ["pidgeotto", lv2, {}], 
            null, 
            ["butterfree", lv2, {}], 
            null
        ], 

        [["tentacool", lv2 - 1, {}], 
            ["arcanine", lv2, {}], 
            null, 
            null, 
            ["dodrio", lv2, {}], 
            null
        ], 

        [["magneton", lv2, {}], 
            ["rapidash", lv2 + 1, {}], 
            ["poliwrath", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["dewgong", lv2, {}], 
            ["hypno", lv2 + 1, {}], 
            null, 
            ["seadra", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["seaking", lv2, {}], 
            null, 
            ["ninetales", lv2, {}], 
            ["jynx", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["pinsir", lv2, {}], 
            ["magmar", lv2 + 1, {}], 
            ["ditto", lv2, {}], 
            null, 
            null
        ], 

        [null, 
            ["tauros", lv2, {}], 
            ["mr. mime", lv2 - 1, {}], 
            null, 
            ["porygon", lv2, {}], 
            null
        ], 

        [["lickitung", lv2 + 1, {}], 
            null, 
            null, 
            ["heracross", lv2, {}], 
            ["marowak", lv2, {}], 
            null
        ], 

        [null, 
            ["hitmonchan", lv2, {"bonus_ap": -1}], 
            ["staryu", lv2 - 1, {}], 
            null, 
            ["persian", lv2 + 1, {}], 
            null
        ], 

        [["weezing", lv2 + 1, {}], 
            ["arbok", lv2 + 1, {}], 
            null, 
            null, 
            ["meowth", lv2 + 2, {"bonus_ap": 3}], 
            null
        ], 

        [null, 
            ["bayleef", lv2 + 1, {}], 
            ["delibird", lv2, {}], 
            null, 
            ["flareon", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["vaporeon", lv2 - 1, {}], 
            ["flaafy", lv2, {}], 
            null, 
            ["quilava", lv2 + 1, {}], 
            null
        ], 

        [["jolteon", lv2 - 1, {}], 
            ["croconaw", lv2 + 1, {}], 
            ["girafarig", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["heracross", lv2 - 1, {}], 
            ["granbull", lv2, {"slot3": 2}], 
            null, 
            ["stantler", lv2, {}], 
            null, 
            null
        ], 

        [null, 
            ["tauros", lv2 + 2, {}], 
            ["miltank", lv2 + 2, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["shuckle", lv2 + 2, {}], 
            null, 
            ["sneasel", lv2 - 1, {}], 
            null, 
            ["sneasel", lv2 - 1, {}]
        ], 

        [null, 
            ["ursaring", lv2 + 1, {}], 
            ["magcargo", lv2, {}], 
            ["noctowl", lv2, {}], 
            null, 
            null
        ], 

        [null, 
            ["lanturn", lv2, {}], 
            ["ariados", lv2, {}], 
            null, 
            ["togepi", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["azumarill", lv2, {}], 
            null, 
            ["xatu", lv2 + 1, {}], 
            ["bellossom", lv2, {}], 
            null
        ], 

        [null, 
            ["wobbuffet", lv2, {}], 
            null, 
            ["octillery", lv2 + 1, {}], 
            null, 
            ["gligar", lv2 + 1, {}]
        ], 

        [null, 
            ["donphan", lv1, {"bonus_ap": -2}], 
            null, 
            ["skarmory", lv1, {}], 
            ["sunflora", lv2, {}], 
            null
        ], 

        [["hitmontop", lv2, {}], 
            ["umbreon", lv2, {}], 
            null, 
            null, 
            null, 
            ["furret", lv2 - 1, {}]
        ], 

        [null, 
            ["forretress", lv2, {}], 
            ["pupitar", lv2 - 1, {}], 
            null, 
            ["espeon", lv2, {}], 
            null
        ], 

        [null, 
            ["porygon 2", lv2, {}], 
            null, 
            ["sudowoodo", lv2 - 1, {}], 
            ["houndoom", lv2, {}], 
            null
        ], 

        [null, 
            ["skarmory", lv2, {}], 
            null, 
            ["shiftry", lv2, {}], 
            ["swablu", lv2, {}], 
            null
        ], 

        [["ivysaur", lv2, {}], 
            ["charmeleon", lv2, {}], 
            ["wartortle", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["bayleef", lv2, {}], 
            ["quilava", lv2, {}], 
            ["croconaw", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["grovyle", lv2, {}], 
            ["combusken", lv2, {}], 
            ["marshtomp", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["grotle", lv2, {}], 
            ["monferno", lv2, {}], 
            ["prinplup", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["servine", lv2, {}], 
            ["pignite", lv2, {}], 
            ["dewott", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["quilladin", lv2, {}], 
            ["braixen", lv2, {}], 
            ["frogadier", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["voltorb", lv2 + 1, {"bonus_power": 10}], 
            ["voltorb", lv2 + 1, {"bonus_power": 10}], 
            ["voltorb", lv2 + 1, {"bonus_power": 10}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["pelipper", lv2, {}], 
            ["bronzong", lv2 - 1, {}], 
            ["ninetales", lv2, {}], 
            null, 
            null
        ], 

        [["wailord", lv2 + 2, {}], 
            ["torkoal", lv2 + 2, {}], 
            null, 
            null, 
            null, 
            null
        ], 

        [null, 
            ["boldore", lv2 - 1, {}], 
            null, 
            ["sharpedo", lv2, {}], 
            ["breloom", lv2, {}], 
            null
        ], 

        [["simisage", lv2, {}], 
            ["simisear", lv2, {}], 
            ["simipour", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["garbodor", lv2, {}], 
            ["excadrill", lv2, {}], 
            ["gothorita", lv2, {}], 
            null, 
            null
        ], 

        [["gothitelle", lv2, {}], 
            ["amoonguss", lv2 - 1, {}], 
            ["reuniclus", lv2, {}], 
            null, 
            null, 
            null
        ], 

        [["ferrothorn", lv2, {}], 
            null, 
            ["forretress", lv2, {}], 
            null, 
            ["lopunny", lv2, {}], 
            null
        ], 

        [null, 
            ["lucario", lv2 - 1, {}], 
            null, 
            ["liepard", lv2 - 1, {}], 
            ["meowth", lv2 + 1, {}], 
            null
        ], 

        [["gastrodon1", lv2 - 1, {"bonus_hp": -25}], 
            null, 
            ["gastrodon2", lv2 - 1, {"bonus_hp": -25}], 
            null, 
            ["abomasnow", lv2 + 2, {}], 
            null
        ], 

        [["zangoose", lv2, {}], 
            null, 
            ["seviper", lv2, {}], 
            null, 
            ["cacturne", lv2, {}], 
            null
        ], 

        [["lunatone", lv2 + 2, {}], 
            null, 
            ["solrock", lv2 + 2, {}], 
            null, 
            null, 
            null
        ], 

        [["flygon", lv2 + 2, {}], 
            null, 
            ["altaria", lv2 + 2, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["beedrill", lv2, {}], 
            null, 
            ["butterfree", lv2, {}], 
            null, 
            ["beautifly", lv2, {}]
        ], 

        [null, 
            ["rampardos", lv2 + 1, {}], 
            null, 
            null, 
            ["chansey", lv2, {}], 
            null
        ], 

        [null, 
            ["throh", lv2 + 2, {}], 
            null, 
            null, 
            ["sawk", lv2 + 2, {}], 
            null
        ], 

        [["scyther", lv2, {}], 
            null, 
            ["granbull", lv2 + 1, {}], 
            null, 
            ["nosepass", lv2, {}], 
            null
        ], 

        [null, 
            ["mawile", lv2, {}], 
            ["druddigon", lv2, {}], 
            ["meowstic", lv2, {}], 
            null, 
            null
        ], 

        [["camerupt", lv2, {"bonus_ap": -2}], 
            ["lairon", lv2, {}], 
            null, 
            null, 
            ["mismagius", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["lucario", lv2, {}], 
            null, 
            null, 
            null, 
            ["toxicroak", lv2, {}]
        ], 

        [null, 
            ["darmanitan", lv2, {}], 
            ["golurk", lv2, {}], 
            ["floette", lv2 + 1, {}], 
            null, 
            null
        ], 

        [["magmar", lv2 + 1, {"bonus_power": 15}], 
            null, 
            ["electabuzz", lv2 + 1, {"bonus_ap": 1, "slot3": 1}], 
            null, 
            ["jynx", lv2 + 1, {"bonus_ap": 1}], 
            null
        ], 

        [["heat_rotom", lv2 - 1, {}], 
            ["wash_rotom", lv2 - 1, {}], 
            ["mow_rotom", lv2 - 1, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["drifblim", lv2, {}], 
            ["ariados", lv2 - 1, {}], 
            null, 
            ["luxio", lv2 + 1, {}], 
            null
        ], 

        [null, 
            ["lanturn", lv2 - 1, {}], 
            ["sudowoodo", lv2, {}], 
            ["staravia", lv2 + 1, {}], 
            null, 
            null
        ], 

        [null, 
            ["azumarill", lv2 - 1, {}], 
            ["metang", lv2, {}], 
            ["misdreavus", lv2 + 1, {}], 
            null, 
            null
        ], 

        [["forretress", lv2 - 1, {}], 
            null, 
            ["relicanth", lv2, {}], 
            null, 
            ["flygon", lv2 - 1, {}], 
            null
        ], 

        [null, 
            ["torkoal", lv2 - 1, {}], 
            ["flaafy", lv2 - 1, {}], 
            null, 
            ["girafarig", lv2, {}], 
            null
        ], 
    ], 

    2: [
        [["venusaur", lv3, {}], 
            ["charizard", lv3, {}], 
            ["blastoise", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["meganium", lv3, {}], 
            ["typhlosion", lv3, {}], 
            ["feraligator", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["sceptile", lv3, {}], 
            ["blaziken", lv3, {}], 
            ["swampert", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["torterra", lv3, {}], 
            ["infernape", lv3, {}], 
            ["empoleon", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["serperior", lv3, {}], 
            ["emboar", lv3, {}], 
            ["samurott", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["chesnaught", lv3, {}], 
            ["delphox", lv3, {}], 
            ["greninja", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["clefable", lv3, {}], 
            ["pidgeot", lv3, {}], 
            null, 
            ["raichu", lv3, {}], 
            null, 
            null
        ], 

        [["raticate", lv3 + 2, {}], 
            ["raticate", lv3 + 2, {}], 
            ["raticate", lv3 + 2, {}], 
            null, 
            null, 
            null
        ], 

        [["arcanine", lv3 + 1, {}], 
            ["vileplume", lv3, {}], 
            ["poliwrath", lv3 + 1, {}], 
            null, 
            null, 
            null
        ], 

        [["gogoat", lv3 + 1, {}], 
            ["honchkrow", lv3, {}], 
            null, 
            ["audino", lv3 - 1, {}], 
            null, 
            null
        ], 

        [["alakazam", lv3 - 2, {}], 
            ["machamp", lv3 - 2, {}], 
            ["golem", lv3 - 2, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["tentacruel", lv3 - 1, {}], 
            ["rhydon", lv3, {}], 
            ["gengar", lv3, {}], 
            null, 
            null
        ], 

        [["exeggutor", lv3, {}], 
            ["kingler", lv3, {}], 
            null, 
            null, 
            ["ampharos", lv3, {}], 
            null
        ], 

        [null, 
            ["hitmonchan", lv3 + 1, {}], 
            ["hitmontop", lv3 + 1, {}], 
            ["hitmonlee", lv3 + 1, {}], 
            null, 
            null
        ], 

        [null, 
            ["scizor", lv3, {}], 
            ["kabutops", lv3, {}], 
            ["houndoom", lv3, {}], 
            null, 
            null
        ], 

        [["donphan", lv3, {}], 
            ["steelix", lv3, {}], 
            ["ludicolo", lv3, {}], 
            null, 
            null, 
            null
        ], 

        [["shiftry", lv3, {}], 
            ["slaking", lv3, {}], 
            null, 
            null, 
            ["gardevoir", lv3, {}], 
            null
        ], 

        [["exploud", lv3, {}], 
            ["hariyama", lv3, {}], 
            null, 
            null, 
            ["rampardos", lv3, {}], 
            null
        ], 

        [null, 
            ["shedinja", lv3 + 1, {}], 
            null, 
            ["manectric", lv3 + 1, {}], 
            null, 
            ["sharpedo", lv3 + 1, {}]
        ], 

        [null, 
            ["aggron", lv3, {}], 
            ["crawdaunt", lv3, {}], 
            null, 
            ["staraptor", lv3, {}], 
            null
        ], 

        [["armaldo", lv3, {}], 
            ["spiritomb", lv3, {}], 
            null, 
            null, 
            ["pachirisu", lv3 + 2, {}], 
            null
        ], 

        [["gliscor", lv3, {}], 
            ["milotic", lv3, {}], 
            null, 
            ["luxray", lv3, {}], 
            null, 
            null
        ], 

        [["weavile", lv3, {}], 
            ["gallade", lv3, {}], 
            null, 
            null, 
            ["absol", lv3, {}], 
            null
        ], 

        [["dusknoir", lv3, {}], 
            ["walrein", lv3, {}], 
            null, 
            null, 
            ["porygon-z", lv3, {}], 
            null
        ], 

        [["electivire", lv3 - 1, {}], 
            ["tangrowth", lv3 - 1, {}], 
            ["magmortar", lv3 - 1, {}], 
            null, 
            null, 
            null
        ], 

        [["zebstrika", lv3 + 1, {}], 
            ["stoutland", lv3 + 1, {}], 
            null, 
            ["liepard", lv3 + 2, {}], 
            null, 
            null
        ], 

        [["wailmer", lv3, {}], 
            ["gigalith", lv3, {}], 
            null, 
            null, 
            ["absol", lv3, {}], 
            null
        ], 

        [["excadrill", lv3, {}], 
            ["seismitoad", lv3, {}], 
            null, 
            ["audino", lv3, {}], 
            null, 
            null
        ], 

        [null, 
            ["nidoqueen", lv3, {}], 
            null, 
            ["chansey", lv3 - 2, {}], 
            ["nidoking", lv3, {}], 
            null
        ], 

        [null, 
            ["wobbuffet", lv3 + 1, {}], 
            null, 
            ["galvantula", lv3, {}], 
            ["shuckle", lv3 + 2, {"slot2": 1, "slot1": 1, "slot3": 2, "bonus_ap": 2}], 
            null
        ], 

        [["scolipede", lv3, {}], 
            null, 
            ["clefable", lv3, {}], 
            null, 
            ["nidoking", lv3, {}], 
            null
        ], 

        [null, 
            ["arcanine", lv3 + 1, {}], 
            null, 
            null, 
            ["houndoom", lv3 + 1, {}], 
            ["manectric", lv3 + 1, {}]
        ], 

        [null, 
            ["pangoro", lv3, {}], 
            ["zoroark", lv3, {}], 
            null, 
            ["talonflame", lv3, {}], 
            null
        ], 

        [null, 
            ["gallade", lv3 + 4, {"bonus_ap": 2}], 
            null, 
            null, 
            ["gardevoir", lv3 + 4, {"bonus_ap": 2}], 
            null
        ], 

        [null, 
            ["krookodile", lv3, {}], 
            null, 
            ["raichu", lv3, {}], 
            ["lilligant", lv3, {}], 
            null
        ], 

        [["darmanitan", lv3, {"bonus_hp": 15}], 
            ["cofagrigus", lv3, {}], 
            null, 
            null, 
            ["cinccino", lv3 + 1, {}], 
            null
        ], 

        [null, 
            ["carracosta", lv3, {}], 
            null, 
            ["hitmonlee", lv3 - 1, {}], 
            ["mienshao", lv3 + 1, {}], 
            null
        ], 

        [null, 
            ["cloyster", lv3, {"slot2": 1}], 
            null, 
            ["roserade", lv3, {}], 
            ["bronzong", lv3, {"bonus_pp": 2}], 
            null
        ], 

        [["jellicent_m", lv3, {}], 
            ["magnezone", lv3, {}], 
            null, 
            ["aerodactyl", lv3, {}], 
            null, 
            null
        ], 

        [["mamoswine", lv3, {}], 
            ["whimsicott", lv3, {"slot2": 1}], 
            null, 
            null, 
            null, 
            ["darmanitan", lv3, {}]
        ], 

        [null, 
            ["cofagrigus", lv3, {}], 
            null, 
            ["escavalier", lv3, {}], 
            ["pyroar", lv3 + 1, {}], 
            null
        ], 

        [null, 
            ["florges", lv3, {}], 
            null, 
            ["malamar", lv3, {}], 
            ["lopunny", lv3, {}], 
            null
        ], 

        [null, 
            ["aegislash", lv3, {}], 
            null, 
            ["gogoat", lv3 + 1, {}], 
            null, 
            ["meowstic", lv3, {}]
        ], 

        [null, 
            ["slowbro", lv3 + 1, {}], 
            null, 
            ["solrock", lv3, {}], 
            ["ninetales", lv3 + 2, {}], 
            null
        ], 

        [null, 
            ["lunatone", lv3, {}], 
            ["umbreon", lv3, {}], 
            null, 
            ["chandelure", lv3, {}], 
            null
        ], 

        [["sylveon", lv3, {}], 
            ["bisharp", lv3, {}], 
            null, 
            null, 
            ["chandelure", lv3, {}], 
            null
        ], 

        [["malamar", lv3, {}], 
            ["serperior", lv3, {}], 
            null, 
            null, 
            null, 
            ["spinda", lv3 + 3, {"bonus_ap": 2, "bonus_pp": 2, "bonus_health": 20}]
        ], 
    ], 

    3: [
        [["clefable", lv4, {}], 
            ["moltres", lv4 + 1, {}], 
            null, 
            null, 
            ["blastoise", lv4, {}], 
            null
        ], 

        [null, 
            ["zapdos", lv4 + 1, {}], 
            ["charizard", lv4, {"slot1": 1}], 
            ["gengar", lv4, {}], 
            null, 
            null
        ], 

        [["venusaur", lv4, {}], 
            ["articuno", lv4 + 1, {}], 
            ["machamp", lv4, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["suicune", lv4 + 1, {}], 
            ["meganium", lv4, {}], 
            null, 
            ["ampharos", lv4, {}], 
            null
        ], 

        [["feraligator", lv4, {}], 
            ["entei", lv4 + 1, {}], 
            ["steelix", lv4, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["raikou", lv4 + 1, {"slot1": 1}], 
            null, 
            ["slowking", lv4, {"slot2": 1}], 
            ["wobbuffet", lv4, {}], 
            null
        ], 

        [["sceptile", lv4, {}], 
            ["regirock", lv4 + 1, {}], 
            ["milotic", lv4, {}], 
            null, 
            null, 
            null
        ], 

        [["blaziken", lv4, {}], 
            ["regice", lv4 + 1, {}], 
            ["armaldo", lv4, {}], 
            null, 
            null, 
            null
        ], 

        [null, 
            ["registeel", lv4 + 1, {}], 
            ["swampert", lv4, {}], 
            null, 
            ["absol", lv4, {}], 
            null
        ], 

        [["nidoking", lv4, {}], 
            ["dragonite", lv4 + 1, {}], 
            null, 
            ["raichu", lv4, {}], 
            null, 
            null
        ], 

        [["scizor", lv4, {}], 
            ["tyranitar", lv4 + 1, {}], 
            null, 
            null, 
            ["kingdra", lv4, {}], 
            null
        ], 

        [["walrein", lv4, {}], 
            ["salamence", lv4 + 1, {}], 
            ["aggron", lv4, {}], 
            null, 
            null, 
            null
        ], 

        [["slaking", lv4, {}], 
            ["metagross", lv4 + 1, {}], 
            null, 
            ["gardevoir", lv4, {}], 
            null, 
            null
        ], 

        [null, 
            ["garchomp", lv4 + 1, {}], 
            ["magnezone", lv4, {}], 
            null, 
            ["dusknoir", lv4, {}], 
            null
        ], 
    ], 

}
