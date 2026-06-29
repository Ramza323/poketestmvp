extends Node


var pools = {
    "Brock": {
        "starters": [
            ["onix", 2], 
            ["geodude", 1]
        ], 

        "cost": 3, 
        "badge": 1, 
        "color": Color("#ffb45e"), 

        "pool": [
            "rhyhorn", 
            "vulpix", 
            "omanite", 
            "kabuto", 

            "aerodactyl", 


            "croagunk", 
            "sudowoodo", 

            "golbat", 
        ]
    }, 

    "Misty": {
        "starters": [
            ["staryu", 2], 
            ["golduck", 1]
        ], 

        "cost": 3, 
        "badge": 2, 
        "color": Color("37a4edff"), 

        "pool": [
            "quagsire", 
            "lapras", 



            "togetic", 
            "seaking", 
            "slowbro", 
            "magikarp", 

            "suicune", 
            "politoed", 
            "chinchou", 
            "scyther", 
        ]
    }, 

    "Surge": {
        "starters": [
            ["pikachu", 2], 
            ["voltorb", 1]
        ], 

        "cost": 3, 
        "badge": 3, 
        "color": Color("e6e483ff"), 

        "pool": [
            "electrode", 
            "magnemite", 
            "electabuzz", 
            "magneton", 




            "fearow", 



            "victreebel", 
            "zapdos", 
            "poliwhirl", 
            "cubone", 


        ]
    }, 

    "Erika": {
        "starters": [
            ["gloom", 2], 
            ["tangela", 2]
        ], 

        "cost": 3, 
        "badge": 4, 
        "color": Color("6dd676ff"), 

        "pool": [
            "victreebel", 
            "bellossom", 


            "lilligant", 
            "clefairy", 
            "dewgong", 
            "cubone", 

            "hitmonchan", 
            "roselia", 
            "sunflora", 

            "chansey", 
        ]
    }, 

    "Koga": {
        "starters": [
            ["venomoth", 2], 
            ["grimer", 1]
        ], 

        "cost": 3, 
        "badge": 5, 
        "color": Color("9784b3ff"), 

        "pool": [
            "weezing", 
            "forretress", 
            "golbat", 

            "swalot", 
            "tentacool", 
            "sandslash", 
            "hypno", 
            "magmar", 
            "magneton", 
            "cloyster", 


            "pidgeotto", 
            "ditto", 

        ]
    }, 

    "Sabrina": {
        "starters": [
            ["kadabra", 2], 
            ["hypno", 1]
        ], 

        "cost": 3, 
        "badge": 6, 
        "color": Color("ff9effff"), 

        "pool": [
            "mr. mime", 
            "butterfree", 
            "espeon", 


            "gallade", 

            "slowbro", 
            "exeggutor", 
            "hitmonlee", 

            "golduck", 
            "xatu", 
            "meowstic", 
            "reuniclus"
        ]
    }, 

    "Blaine": {
        "starters": [
            ["ponyta", 2], 
            ["growlithe", 1]
        ], 

        "cost": 3, 
        "badge": 7, 
        "color": Color("ff7073ff"), 

        "pool": [
            "ninetales", 
            "magmar", 


            "kangaskhan", 
            "octillery", 

            "primeape", 
            "tauros", 
            "dodrio", 
            "darmanitan", 
            "ditto", 
            "weezing", 


            "moltres", 
        ]
    }, 

    "Giovanni": {
        "starters": [
            ["nidorino", 2], 
            ["meowth", 1]
        ], 

        "cost": 5, 
        "badge": 8, 
        "color": Color("8c6e57ff"), 

        "pool": [
            "rhydon", 
            "nidorina", 
            "kangaskhan", 
            "onix", 
            "murkrow", 
            "sandslash", 
            "cubone", 
            "krokorok", 

            "tauros", 
            "machoke", 
            "pinsir", 
            "arbok", 

        ]
    }, 

    "Lorelei": {
        "starters": [
            ["lapras", 1], 
            ["dewgong", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("5cffffff"), 

        "pool": [
            "jynx", 
            "cloyster", 
            "slowpoke", 

            "articuno", 
            "jigglypuff", 

            "glaceon", 
            "delibird", 
            "froslass", 
            "ninetales", 
            "mr. mime", 
            "electabuzz"

        ]
    }, 

    "Bruno": {
        "starters": [
            ["machoke", 2], 
            ["onix", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("8a6c4eff"), 

        "pool": [
            "hitmonchan", 
            "hitmonlee", 
            "hitmontop", 
            "poliwhirl", 
            "graveler", 

            "grimer", 

            "granbull", 
            "primeape", 
            "ursaring", 
            "throh", 

        ]
    }, 

    "Agatha": {
        "starters": [
            ["haunter", 2], 
            ["arbok", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("9f76adff"), 

        "pool": [
            "golbat", 
            "haunter", 
            "misdreavus", 
            "weezing", 
            "marowak", 
            "jynx", 

            "dusclops", 
            "yamask", 

            "fearow", 
            "scyther", 
            "electrode"
        ]
    }, 

    "Lance": {
        "starters": [
            ["dratini", 2], 
            ["dratini", 1], 
        ], 

        "cost": 9, 
        "badge": 0, 
        "color": Color("2a83d1ff"), 

        "pool": [
            "magikarp", 
            "aerodactyl", 
            "charmeleon", 
            "kangaskhan", 


            "dodrio", 
            "arcanine", 
            "exeggutor", 
            "tangela", 
            "pinsir", 

            "onix", 

            "farfetch'd"
        ]
    }, 



    "Falkner": {
        "starters": [
            ["pidgeotto", 2], 
            ["noctowl", 1]
        ], 

        "cost": 2, 
        "badge": 9, 
        "color": Color("9efdffff"), 

        "pool": [
            "xatu", 
            "spearow", 


            "pelipper", 
            "murkrow", 
            "fletchinder", 

            "farfetch'd", 
            "delibird", 
            "gligar", 
            "skarmory", 

            "noibat", 





        ]
    }, 

    "Bugsy": {
        "starters": [
            ["scyther", 1], 
            ["metapod", 1]
        ], 

        "cost": 2, 
        "badge": 10, 
        "color": Color("5dc974ff"), 

        "pool": [
            "pinsir", 
            "heracross", 
            "kakuna", 
            "ninjask", 

            "vespiqueen", 
            "shuckle", 


            "ledyba", 
            "silcoon", 

            "masquerain", 
            "leavanny", 
            "whirlipede", 



        ]
    }, 

    "Whitney": {
        "starters": [
            ["miltank", 2], 
            ["clefairy", 1]
        ], 

        "cost": 3, 
        "badge": 11, 
        "color": Color("fbc9ffff"), 

        "pool": [
            "lickitung", 
            "girafarig", 
            "bidoof", 
            "delcatty", 
            "tauros", 


            "buneary", 
            "minccino", 

            "jigglypuff", 
            "golduck", 
            "phanpy", 
            "nidorina", 
            "smeargle", 
            "magmar", 



        ]
    }, 

    "Morty": {
        "starters": [
            ["misdreavus", 2], 
            ["haunter", 1], 
        ], 

        "cost": 3, 
        "badge": 12, 
        "color": Color("8a72ccff"), 

        "pool": [


            "sableye", 
            "drifblim", 
            "banette", 
            "kecleon", 
            "froslass", 
            "lampent", 

            "ariados", 
            "marowak", 
            "noctowl", 
            "granbull", 


            "jellicent_m", 
            "trevenant"
        ]
    }, 

    "Chuck": {
        "starters": [
            ["primeape", 2], 
            ["poliwhirl", 1], 
        ], 

        "cost": 3, 
        "badge": 14, 
        "color": Color("c7a569ff"), 

        "pool": [
            "machoke", 
            "breloom", 


            "hitmontop", 
            "medicham", 
            "throh", 
            "sawk", 
            "granbull", 
            "sandslash", 
            "graveler", 
            "teddiursa", 

            "phanpy", 
            "snorlax", 
        ]
    }, 

    "Janine": {
        "starters": [
            ["ariados", 1], 
            ["golbat", 2]
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("c996d4ff"), 

        "pool": [
            "weezing", 
            "grimer", 


            "tentacool", 
            "arbok", 

            "gligar", 
            "stantler", 
            "forretress", 


            "croagunk", 

            "kakuna", 
            "whirlipede", 
            "amoonguss"
        ]
    }, 

    "Jasmine": {
        "starters": [
            ["steelix", 4], 
        ], 

        "cost": 5, 
        "badge": 13, 
        "color": Color("f9ffbaff"), 

        "pool": [
            "magnemite", 
            "flaafy", 
            "skarmory", 
            "bronzong", 
            "forretress", 
            "mawile", 
            "excadrill", 
            "ferrothorn", 
            "scizor", 
            "stantler", 

            "slowking", 
            "registeel", 

            "escavalier", 



        ]
    }, 

    "Clair": {
        "starters": [
            ["seadra", 2], 
            ["dratini", 1]
        ], 

        "cost": 5, 
        "badge": 16, 
        "color": Color("7dbdf5ff"), 

        "pool": [
            "magikarp", 
            "swablu", 
            "druddigon", 
            "flaafy", 
            "nidorina", 
            "dragonair", 

            "politoed", 

            "dunsparce", 
            "skarmory", 
            "phanpy", 
        ]
    }, 

    "Karen": {
        "starters": [
            ["houndour", 2], 
            ["murkrow", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("819aa6ff"), 

        "pool": [
            "umbreon", 
            "gloom", 
            "absol", 
            "quagsire", 
            "magmar", 
            "sneasel", 
            "victreebel", 

            "dunsparce", 
            "rapidash", 
            "noctowl", 
            "girafarig", 
            "ursaring", 

            "liepard", 


        ]
    }, 

    "Koichi": {
        "starters": [
            ["hitmonchan", 1], 
            ["hitmonlee", 1], 
        ], 

        "cost": 5, 
        "badge": 0, 
        "color": Color("c2bbacff"), 

        "pool": [
            "hitmontop", 
            "machoke", 
            "poliwhirl", 
            "granbull", 
            "farfetch'd", 



            "ursaring", 
            "medicham", 
            "hawlucha", 
            "heracross", 
            "breloom", 
        ]
    }, 

    "Bill": {
        "starters": [
            ["eevee", 2], 
            ["clefairy", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("ce97d1ff"), 

        "pool": [
            "nidorino", 
            "vaporeon", 
            "flareon", 
            "jolteon", 
            "umbreon", 
            "espeon", 
            "glaceon", 
            "leafeon", 
            "sylveon", 
            "porygon", 
        ]
    }, 

    "*2": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 


    "Roxanne": {
        "starters": [
            ["nosepass", 2], 
            ["anorith", 1]
        ], 

        "cost": 3, 
        "badge": 17, 
        "color": Color("db5c9aff"), 

        "pool": [

            "cradily", 
            "relicanth", 
            "graveler", 
            "nuzleaf", 
            "loudred", 
            "mawile", 

            "cacturne", 
            "solrock", 


            "kabuto", 
            "regirock", 
            "delcatty"
        ]
    }, 

    "Brawly": {
        "starters": [
            ["makuhita", 2], 
            ["medicham", 1]
        ], 

        "cost": 2, 
        "badge": 18, 
        "color": Color("f58d51ff"), 

        "pool": [
            "machoke", 
            "tropius", 
            "sableye", 
            "croagunk", 
            "breloom", 

            "mienshao", 
            "heracross", 
            "zigzagoon", 
            "hawlucha", 
            "grumpig", 
            "glalie", 
            "corphish", 
            "primeape"
        ]
    }, 

    "Wattson": {
        "starters": [
            ["plusle", 1], 
            ["electrike", 1]
        ], 

        "cost": 3, 
        "badge": 19, 
        "color": Color("c7bc58ff"), 

        "pool": [
            "magnemite", 
            "voltorb", 
            "flaafy", 


            "nuzleaf", 
            "swalot", 
            "wailmer", 
            "linoone", 
            "lombre", 
            "grumpig", 

            "tropius", 



            "raikou", 
        ]
    }, 

    "Flannery": {
        "starters": [
            ["torkoal", 1], 
            ["numel", 2], 
        ], 

        "cost": 3, 
        "badge": 20, 
        "color": Color("ff5c5cff"), 

        "pool": [
            "magcargo", 
            "rapidash", 
            "flareon", 
            "houndour", 


            "vulpix", 
            "nuzleaf", 
            "swellow", 
            "vigoroth", 
            "mawile", 
            "zangoose", 

            "entei", 
        ]
    }, 

    "Norman": {
        "starters": [
            ["vigoroth", 2], 
            ["loudred", 1], 
        ], 

        "cost": 2, 
        "badge": 21, 
        "color": Color("cfbda5ff"), 

        "pool": [
            "spinda", 
            "kecleon", 
            "zangoose", 

            "zigzagoon", 
            "bouffalant", 
            "chansey", 
            "sawsbuck", 
            "herdier", 
            "beautifly", 
            "flygon", 
            "mightyena", 
            "snorlax", 


        ]
    }, 

    "Winona": {
        "starters": [
            ["swablu", 2], 
            ["taillow", 2], 
        ], 

        "cost": 2, 
        "badge": 22, 
        "color": Color("bdfff5ff"), 

        "pool": [
            "pelipper", 
            "tropius", 
            "noctowl", 
            "pidgeotto", 

            "masquerain", 
            "beautifly", 

            "skarmory", 
            "ledyba", 
            "scizor", 

            "staravia", 
            "archeops", 
            "swanna", 


            "noibat"
        ]
    }, 

    "Wallace": {
        "starters": [
            ["sealeo", 4], 
            ["feebas", 4], 
        ], 

        "cost": 5, 
        "badge": 24, 
        "color": Color("73ffd7ff"), 

        "pool": [
            "luvdisc", 
            "seaking", 
            "wailmer", 
            "lombre", 


            "carvanha", 
            "kirlia", 

            "swablu", 
            "seviper", 
            "absol", 
            "floatzel", 
            "vaporeon", 
            "regice", 
        ]
    }, 

    "Sidney": {
        "starters": [
            ["absol", 1], 
            ["mightyena", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("c9adadff"), 

        "pool": [
            "nuzleaf", 
            "carvanha", 
            "cacturne", 
            "seviper", 

            "crawdaunt", 
            "zangoose", 
            "linoone", 

            "camerupt", 
            "armaldo", 
            "tropius", 
            "liepard", 

            "gothorita"
        ]
    }, 

    "Phoebe": {
        "starters": [
            ["banette", 2], 
            ["dusclops", 2], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("bbaaf2ff"), 

        "pool": [
            "sableye", 

            "lampent", 

            "froslass", 
            "yamask", 


            "jellicent_f", 
            "golurk", 
            "ninetales", 
            "marowak", 
            "noctowl", 
            "shedinja", 
            "spinda", 
            "trevenant"
        ]
    }, 

    "Drake": {
        "starters": [
            ["shelgon", 2], 
            ["flygon", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("bd5b83ff"), 

        "pool": [
            "altaria", 

            "fraxure", 

            "sliggoo", 
            "seadra", 
            "flaafy", 
            "tyrunt", 
            "gabite", 
            "sharpedo", 
            "camerupt", 

            "piloswine", 
            "whirlipede", 
        ]
    }, 

    "Steven": {
        "starters": [
            ["metang", 1], 
            ["lairon", 2]
        ], 

        "cost": 9, 
        "badge": 0, 
        "color": Color("c7ededff"), 

        "pool": [
            "skarmory", 
            "armaldo", 
            "cradily", 
            "excadrill", 
            "archeops", 
            "aerodactyl", 
            "omastar", 
            "sableye", 
            "mawile", 
            "registeel", 
            "kirlia", 

            "relicanth", 


        ]
    }, 

    "*4": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 



    "Roark": {
        "starters": [
            ["shieldon", 1], 
            ["cranidos", 2]
        ], 

        "cost": 2, 
        "badge": 25, 
        "color": Color("a65d4eff"), 

        "pool": [
            "archeops", 
            "relicanth", 
            "bronzong", 
            "graveler", 
            "onix", 
            "gastrodon1", 
            "leavanny", 
            "carracosta", 
            "eelektrik", 
            "golurk", 
            "barbaracle", 
            "jigglypuff", 
            "regirock"
        ]
    }, 

    "Gardenia": {
        "starters": [
            ["roselia", 2], 
            ["leafeon", 1], 
        ], 

        "cost": 3, 
        "badge": 26, 
        "color": Color("7fcf7eff"), 

        "pool": [
            "tropius", 
            "skiddo", 
            "tangela", 
            "mow_rotom", 
            "bellossom", 
            "breloom", 
            "sunflora", 
            "feebas", 
            "grotle", 
            "floatzel", 
            "buneary", 
            "froslass", 
            "sudowoodo"
        ]
    }, 

    "Fantina": {
        "starters": [
            ["drifblim", 2], 
            ["misdreavus", 1], 
        ], 

        "cost": 3, 
        "badge": 29, 
        "color": Color("c36eccff"), 

        "pool": [
            "banette", 
            "dusclops", 
            "spiritomb", 
            "rotom", 
            "jellicent_f", 
            "froslass", 
            "lampent", 
            "trevenant", 
            "nuzleaf", 
            "tangela", 
            "sylveon", 
            "amaura", 
            "litleo", 
            "cinccino", 
            "maractus"

        ]
    }, 

    "Candice": {
        "starters": [
            ["snover", 2], 
            ["piloswine", 2], 
        ], 

        "cost": 2, 
        "badge": 31, 
        "color": Color("9edbffff"), 

        "pool": [
            "glaceon", 
            "sneasel", 
            "medicham", 
            "froslass", 
            "glalie", 
            "cloyster", 
            "froslass", 
            "gallade", 
            "pachirisu", 
            "togetic", 
            "whimsicott", 
            "meowstic", 
            "regice"

        ]
    }, 

    "Volkner": {
        "starters": [
            ["luxio", 1], 
            ["electabuzz", 2], 
        ], 

        "cost": 3, 
        "badge": 32, 
        "color": Color("ffff8aff"), 

        "pool": [
            "jolteon", 
            "raichu", 
            "lanturn", 
            "rotom", 
            "octillery", 
            "eelektrik", 
            "aipom", 
            "meowth", 
            "misdreavus", 
            "flygon", 
            "raikou", 
            "panpour", 
            "heracross", 
            "skarmory"
        ]
    }, 

    "Flint": {
        "starters": [
            ["houndour", 1], 
            ["magmar", 2], 
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("e07a72ff"), 

        "pool": [
            "flareon", 
            "rapidash", 
            "buneary", 
            "monferno", 
            "arcanine", 
            "steelix", 
            "drifblim", 
            "darmanitan", 
            "rotom", 
            "pansage", 
            "rufflet", 
            "pancham", 
            "barbaracle", 
            "granbull", 
            "entei", 
        ]
    }, 

    "Cynthia": {
        "starters": [
            ["riolu", 2], 
            ["gabite", 1], 
        ], 

        "cost": 16, 
        "badge": 0, 
        "color": Color("9e9e60ff"), 

        "pool": [
            "spiritomb", 
            "togetic", 
            "feebas", 
            "gastrodon2", 
            "roselia", 
            "eelektrik", 
            "rufflet", 
            "glaceon", 
            "porygon-z", 
            "altaria", 
            "gallade", 
            "umbreon", 
            "seviper", 



        ]
    }, 

    "*33": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "*5": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "*6": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "*7": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 


    "*8": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "Cilan": {
        "starters": [
            ["pansage", 1], 
            ["pansear", 1], 
            ["panpour", 1], 
        ], 

        "cost": 3, 
        "badge": 33, 
        "color": Color("8fffa0ff"), 

        "pool": [
            "herdier", 
            "liepard", 
            "blitzle", 
            "palpitoad", 
            "leavanny", 
            "maractus", 
            "archeops", 
            "zorua", 
            "minccino", 
            "aipom", 
            "primeape", 
            "vigoroth", 

        ]
    }, 

    "Lenora": {
        "starters": [
            ["herdier", 2], 
            ["audino", 1], 
        ], 

        "cost": 3, 
        "badge": 34, 
        "color": Color("c9be9dff"), 

        "pool": [
            "lickitung", 
            "cinccino", 
            "eevee", 
            "growlithe", 
            "mightyena", 
            "delcatty", 
            "electrike", 
            "skuntank", 
            "bouffalant", 
            "durant", 
            "litleo", 
            "trubbish", 
        ]
    }, 

    "Burgh": {
        "starters": [
            ["leavanny", 2], 
            ["crustle", 1], 
        ], 

        "cost": 2, 
        "badge": 35, 
        "color": Color("749e55ff"), 

        "pool": [
            "lilligant", 
            "minccino", 
            "escavalier", 
            "mienshao", 
            "ninetales", 
            "seadra", 
            "altaria", 
            "buneary", 
            "sylveon", 
            "butterfree", 
            "beautifly", 
            "smeargle", 
        ]
    }, 

    "Elesa": {
        "starters": [
            ["emolga", 2], 
            ["blitzle", 1], 
        ], 

        "cost": 5, 
        "badge": 36, 
        "color": Color("ffff63ff"), 

        "pool": [
            "galvantula", 
            "eelektrik", 
            "liepard", 
            "munna", 
            "jolteon", 
            "raikou", 
            "luxio", 
            "flaafy", 
            "lilligant", 
            "gothorita", 
            "milotic", 
            "roselia", 
        ]
    }, 

    "Clay": {
        "starters": [
            ["krokorok", 2], 
            ["palpitoad", 1], 
        ], 

        "cost": 2, 
        "badge": 37, 
        "color": Color("c2905fff"), 

        "pool": [
            "excadrill", 
            "gabite", 
            "throh", 
            "darmanitan", 
            "ferrothorn", 
            "golurk", 
            "vullaby", 
            "skiddo", 
            "bouffalant", 
            "maractus", 
            "hippopotas", 
            "gastrodon1", 
            "miltank"
        ]
    }, 

    "Skyla": {
        "starters": [
            ["swanna", 2], 
            ["rufflet", 1], 
        ], 

        "cost": 3, 
        "badge": 38, 
        "color": Color("9de8ebff"), 

        "pool": [
            "vullaby", 
            "archeops", 
            "pidgeotto", 
            "altaria", 
            "staravia", 
            "fletchinder", 

            "shelgon", 

            "scyther", 
            "skarmory", 
        ]
    }, 

    "Iris": {
        "starters": [
            ["fraxure", 2], 
            ["druddigon", 1], 
        ], 

        "cost": 5, 
        "badge": 40, 
        "color": Color("cea8ffff"), 

        "pool": [
            "zweilous", 
            "lairon", 
            "lapras", 
            "shelgon", 
            "archeops", 
            "dragonair", 
            "flygon", 
            "seadra", 
            "armaldo", 
            "carracosta", 
        ]
    }, 

    "Roxie": {
        "starters": [
            ["trubbish", 2], 
            ["whirlipede", 1], 
        ], 

        "cost": 3, 
        "badge": 41, 
        "color": Color("d975c5ff"), 

        "pool": [
            "croagunk", 
            "amoonguss", 
            "koffing", 
            "grimer", 
            "porygon", 
            "gligar", 
            "octillery", 
            "houndour", 
            "loudred", 
            "seviper", 
            "skrelp", 
        ]
    }, 

    "Alder": {
        "starters": [
            ["larvesta", 2], 
            ["krokorok", 1], 
        ], 

        "cost": 9, 
        "badge": 0, 
        "color": Color("eb607eff"), 

        "pool": [
            "lampent", 
            "accelgor", 
            "escavalier", 
            "bouffalant", 
            "druddigon", 
            "rufflet", 
            "reuniclus", 
            "excadrill", 
            "sawsbuck", 
        ]
    }, 

    "*9": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "*10": {
        "starters": [
        ], 

        "cost": 3, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "Diantha": {
        "starters": [
            ["kirlia", 2], 
            ["sliggoo", 1], 
        ], 

        "cost": 9, 
        "badge": 0, 
        "color": Color("ffe6feff"), 

        "pool": [
            "tyrunt", 
            "hawlucha", 
            "amaura", 
            "floette", 
            "skiddo", 
            "diancie", 
            "absol", 
            "jigglypuff", 
            "jynx", 
            "lanturn", 
            "delcatty", 
            "lilligant"
        ]
    }, 

    "Red": {
        "starters": [
            ["PIKACHU", 1], 
            ["charmeleon", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("d16060ff"), 

        "pool": [
            "snorlax", 
            "metapod", 
            "pidgeotto", 
            "vaporeon", 
            "haunter", 
            "tauros", 
            "omastar", 
            "hitmonchan", 
            "primeape", 
        ]
    }, 

    "Leaf": {
        "starters": [
            ["ivysaur", 1], 
            ["clefairy", 2], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("81ebe5ff"), 

        "pool": [
            "sandslash", 
            "ditto", 
            "flareon", 
            "graveler", 
            "vulpix", 
            "porygon", 
            "hitmonlee", 
            "fearow", 
            "kabuto"
        ]
    }, 

    "Blue": {
        "starters": [
            ["wartortle", 1], 
            ["umbreon", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("85a5ffff"), 

        "pool": [
            "machoke", 
            "nidorina", 
            "growlithe", 
            "kadabra", 
            "scyther", 
            "kingler", 
            "dodrio", 
            "poliwhirl", 
            "magmar", 
        ]
    }, 

    "Gold": {
        "starters": [
            ["quilava", 2], 
            ["phanpy", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("a3a350ff"), 

        "pool": [
            "noctowl", 
            "tauros", 
            "porygon", 
            "tangela", 
            "pinsir", 
            "magcargo", 
            "aipom", 
            "politoed", 
            "*gyarados", 
        ]
    }, 

    "Kris": {
        "starters": [
            ["bayleef", 2], 
            ["marill", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("73fffdff"), 

        "pool": [
            "sunflora", 
            "teddiursa", 
            "misdreavus", 
            "jigglypuff", 
            "jynx", 
            "growlithe", 
            "cubone", 
            "xatu", 
            "larvitar", 
            "wobbuffet"
        ]
    }, 

    "Silver": {
        "starters": [
            ["croconaw", 2], 
            ["sneasel", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("cc505cff"), 

        "pool": [
            "golbat", 
            "haunter", 
            "magnemite", 
            "nidorino", 
            "seadra", 
            "murkrow", 
            "teddiursa", 
            "granbull", 
            "rhydon", 
        ]
    }, 

    "Brendan": {
        "starters": [
            ["grovyle", 2], 
            ["lombre", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("63ab6bff"), 

        "pool": [
            "kecleon", 
            "wailmer", 
            "nuzleaf", 
            "mightyena", 
            "delcatty", 
            "beautifly", 
            "vigoroth", 
            "medicham", 
            "flygon", 
        ]
    }, 

    "May": {
        "starters": [
            ["combusken", 2], 
            ["taillow", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("db6f5aff"), 

        "pool": [
            "tropius", 
            "feebas", 
            "mawile", 
            "swablu", 
            "shroomish", 
            "lairon", 
            "relicanth", 
            "electrike", 
            "masquerain", 
        ]
    }, 

    "Wally": {
        "starters": [
            ["marshtomp", 2], 
            ["kirlia", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("9bdb86ff"), 

        "pool": [
            "roselia", 
            "sableye", 
            "fletchinder", 
            "gallade", 
            "cacturne", 
            "magnemite", 
            "zigzagoon", 
            "pelipper", 
            "spinda", 
        ]
    }, 

    "Lucas": {
        "starters": [
            ["grotle", 2], 
            ["gastrodon1", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("6cb8ebff"), 

        "pool": [
            "staravia", 
            "porygon-z", 
            "bidoof", 
            "kadabra", 
            "magmar", 
            "shieldon", 
            "piloswine", 
            "rotom", 
            "drifblim", 
        ]
    }, 

    "Dawn": {
        "starters": [
            ["prinplup", 2], 
            ["glaceon", 1]
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("f6a1ffff"), 

        "pool": [
            "buneary", 
            "pachirisu", 
            "floatzel", 
            "ponyta", 
            "froslass", 
            "grimer", 
            "gallade", 
            "electabuzz", 
            "kadabra", 
        ]
    }, 

    "Barry": {
        "starters": [
            ["monferno", 2], 
            ["croagunk", 1], 

        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("e8bc7bff"), 

        "pool": [
            "bidoof", 
            "heracross", 
            "staravia", 
            "roselia", 
            "luxio", 
            "gastrodon2", 
            "hitmonlee", 
            "cranidos", 
            "rotom", 
        ]
    }, 

    "Hilbert": {
        "starters": [
            ["dewott", 2], 
            ["pansear", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("3e75c7ff"), 

        "pool": [
            "munna", 
            "herdier", 
            "galvantula", 
            "vullaby", 
            "throh", 
            "swanna", 
            "darmanitan", 
            "lilligant", 
            "boldore"
        ]
    }, 

    "Hilda": {
        "starters": [
            ["pignite", 2], 
            ["pansage", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("804e76ff"), 

        "pool": [
            "carracosta", 
            "sawk", 
            "rufflet", 
            "whimsicott", 
            "sawsbuck", 
            "reuniclus", 
            "boldore", 
            "excadrill", 
            "palpitoad", 
        ]
    }, 

    "N": {
        "starters": [
            ["zorua", 1], 
            ["servine", 1], 
            ["panpour", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("acffabff"), 

        "pool": [
            "audino", 
            "liepard", 
            "garbodor", 
            "whirlipede", 
            "darmanitan", 
            "crustle", 
            "gothorita", 
            "ferrothorn", 
            "mienshao", 
        ]
    }, 

    "Calem": {
        "starters": [
            ["quilladin", 2], 
            ["fletchinder", 1]
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("5d69a8ff"), 

        "pool": [
            "kangaskhan", 
            "riolu", 
            "skiddo", 
            "tyrunt", 
            "hawlucha", 
            "haunter", 
            "snover", 
            "heracross", 
            "beedrill", 
            "electrike"
        ]
    }, 

    "Serena": {
        "starters": [
            ["braixen", 2], 
            ["sylveon", 1]
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("e68e9dff"), 

        "pool": [
            "pinsir", 
            "pancham", 
            "kirlia", 
            "doublade", 
            "skrelp", 
            "amaura", 
            "flaafy", 
            "scyther", 
            "absol", 
        ]
    }, 

    "Tierno": {
        "starters": [
            ["frogadier", 2], 
            ["corphish", 1]
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("e3c77bff"), 

        "pool": [
            "inkay", 
            "noibat", 
            "trevenant", 
            "banette", 
            "aerodactyl", 
            "kadabra", 
            "mawile", 
            "onix", 
            "pidgeotto", 
        ]
    }, 

    "Wes": {
        "starters": [
            ["espeon", 1], 
            ["umbreon", 1]
        ], 

        "cost": 20, 
        "badge": 0, 
        "color": Color("cc6256ff"), 

        "pool": [
            "plusle", 
            "granbull", 
            "magcargo", 
            "skarmory", 
            "houndoom", 
            "ledyba", 
            "quagsire", 
            "shuckle", 
            "hitmontop", 
        ]
    }, 

    "*15": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "*20": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

    "Yugi": {
        "starters": [
            ["dark_magician", 1], 


        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("ff82a1ff"), 

        "pool": [
            "dark_magician_girl", 
            "summoned_skull", 
            "luvdisc", 
            "luvdisc", 
            "luvdisc", 
            "luvdisc", 
        ]
    }, 

    "Kaiba": {
        "starters": [
            ["blue_eyes_white_dragon", 1], 


        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("a6fffbff"), 

        "pool": [
            "swordstalker", 
            "hitotsu-me-giant", 
            "luvdisc", 
            "luvdisc", 
            "luvdisc", 
            "luvdisc", 
        ]
    }, 

    "Demi-Fiend": {
        "starters": [
            ["pixie", 1], 
            ["jack_frost", 1], 
            ["jacko_lantern", 1], 
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("ebed61ff"), 

        "pool": [
            "nidorino", 
            "nidorino", 
            "nidorino", 
            "nidorino", 
            "nidorino", 
            "nidorino", 
        ]
    }, 

    "Oak": {
        "starters": [
            ["ivysaur", 1], 
            ["charmeleon", 1], 
            ["wartortle", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("fde0ffff"), 

        "pool": [
            "tauros", 
            "exeggutor", 
            "magikarp", 
            "growlithe", 
            "nidorino", 
            "pikachu", 
            "eevee", 
            "articuno", 
            "moltres", 
            "zapdos", 
        ]
    }, 

    "Elm": {
        "starters": [
            ["bayleef", 1], 
            ["quilava", 1], 
            ["croconaw", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("5bc994ff"), 

        "pool": [
            "togetic", 
            "marill", 
            "sudowoodo", 
            "slowking", 
            "dunsparce", 
            "porygon 2", 
            "hitmontop", 
            "suicune", 
            "raikou", 
            "entei"
        ]
    }, 

    "Birch": {
        "starters": [
            ["grovyle", 1], 
            ["combusken", 1], 
            ["marshtomp", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("567bc7ff"), 

        "pool": [
            "lombre", 
            "tropius", 
            "relicanth", 
            "shedinja", 
            "sableye", 
            "mawile", 
            "spinda", 
            "regirock", 
            "regice", 
            "registeel", 
        ]
    }, 

    "Rowan": {
        "starters": [
            ["grotle", 1], 
            ["monferno", 1], 
            ["prinplup", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("d6edffff"), 

        "pool": [
            "pachirisu", 
            "bronzong", 
            "hippopotas", 
            "rotom", 
            "magmar", 
            "electabuzz", 
            "tangela", 
            "dusclops", 
            "piloswine"
        ]
    }, 

    "Juniper": {
        "starters": [
            ["servine", 1], 
            ["pignite", 1], 
            ["dewott", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("ffd79cff"), 

        "pool": [
            "audino", 
            "maractus", 
            "whimsicott", 
            "darmanitan", 
            "carracosta", 
            "trubbish", 
            "gothorita", 
            "golurk", 
            "beartic", 




        ]
    }, 

    "Sycamore": {
        "starters": [
            ["quilladin", 1], 
            ["braixen", 1], 
            ["frogadier", 1], 
        ], 

        "cost": 12, 
        "badge": 0, 
        "color": Color("776ec4ff"), 

        "pool": [
            "litleo", 
            "floette", 
            "skiddo", 
            "pancham", 
            "espurr", 
            "inkay", 
            "barbaracle", 
            "noibat", 




        ]
    }, 

    "*29": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 

























    "Maxie": {
        "starters": [
            ["numel", 2], 
            ["koffing", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("c75050ff"), 

        "pool": [
            "houndour", 
            "mightyena", 
            "zangoose", 
            "lairon", 
            "rhyhorn", 
            "mawile", 
            "nuzleaf", 
            "solrock", 
            "swellow", 
            "dusclops", 

        ]
    }, 

    "Archie": {
        "starters": [
            ["carvanha", 2], 
            ["grimer", 1]
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("5d7dd4ff"), 

        "pool": [
            "tentacool", 
            "mightyena", 
            "cacturne", 
            "crawdaunt", 
            "electrike", 
            "sealeo", 
            "seviper", 
            "lunatone", 
            "loudred", 

        ]
    }, 

    "Cyrus": {
        "starters": [
            ["murkrow", 2], 
            ["sneasel", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("45afbfff"), 

        "pool": [
            "golbat", 
            "houndour", 
            "magikarp", 
            "magneton", 
            "nosepass", 
            "skuntank", 
            "bronzong", 
            "gliscor", 
            "froslass", 


        ]
    }, 



    "Ghetsis": {
        "starters": [
            ["zweilous", 2], 
            ["yamask", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("ced993ff"), 

        "pool": [
            "palpitoad", 
            "bouffalant", 
            "pawniard", 
            "eelektrik", 
            "croagunk", 
            "amoonguss", 
            "beartic", 
            "trubbish", 
            "durant", 
            "lampent", 


        ]
    }, 

    "Lysandre": {
        "starters": [
            ["litleo", 2], 
            ["mienfoo", 1], 
        ], 

        "cost": 6, 
        "badge": 0, 
        "color": Color("ff8161ff"), 

        "pool": [
            "noibat", 

            "magikarp", 
            "inkay", 
            "vulpix", 
            "dewgong", 
            "milotic", 
            "buneary", 
            "froslass", 
            "liepard", 


        ]
    }, 

    "Mewtwo": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
            "mewtwo", 
            "mewtwo", 
            "mewtwo", 
            "mewtwo", 
            "mewtwo", 
            "mewtwo", 
        ]
    }, 

    "*35": {
        "starters": [
        ], 

        "cost": 8, 
        "badge": 0, 
        "color": Color("#ffffff"), 

        "pool": [
        ]
    }, 
}
