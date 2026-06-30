extends Node

# Enemy pools por piso (0-4) para el modo roguelite.
# Piso 0 = primera fila del mapa (nodos de entrada).

const POOLS = {
    0: {
        "pool": [
            "caterpie", "weedle", "pidgey", "rattata", "spearow",
            "ekans", "sandshrew", "clefairy", "vulpix", "jigglypuff",
            "zubat", "oddish", "paras", "venonat", "diglett",
            "meowth", "psyduck", "mankey", "growlithe", "poliwag",
            "abra", "machop", "bellsprout", "geodude",
        ],
        "level": 1,
        "team_size": 2,
        "shiny_chance": 0.03125,
    },
    1: {
        "pool": [
            "caterpie", "weedle", "pidgey", "rattata", "spearow", "ekans", "sandshrew",
            "butterfree", "beedrill", "pidgeotto", "raticate", "fearow",
            "arbok", "raichu", "sandslash", "nidorina", "nidorino",
            "golbat", "gloom", "parasect", "venomoth", "dugtrio",
            "persian", "golduck", "primeape", "poliwhirl",
            "kadabra", "machoke", "weepinbell", "tentacruel",
        ],
        "level": 2,
        "team_size": 2,
        "shiny_chance": 0.03125,
    },
    2: {
        "pool": [
            "bulbasaur", "charmander", "squirtle",
            "ivysaur", "charmeleon", "wartortle",
            "butterfree", "beedrill", "pidgeotto", "raticate",
            "arbok", "raichu", "sandslash", "nidorina", "nidorino",
            "golbat", "gloom", "parasect", "venomoth", "dugtrio",
            "persian", "golduck", "primeape", "poliwhirl",
            "kadabra", "machoke", "weepinbell", "tentacruel", "graveler",
        ],
        "level": 3,
        "team_size": 3,
        "shiny_chance": 0.04,
    },
    3: {
        "pool": [
            "venusaur", "charizard", "blastoise", "pidgeot",
            "nidoqueen", "nidoking", "clefable", "ninetales",
            "vileplume", "arcanine", "poliwrath", "alakazam",
            "machamp", "victreebel", "golem", "cloyster",
            "gengar", "chansey", "kangaskhan", "starmie",
        ],
        "level": 4,
        "team_size": 3,
        "shiny_chance": 0.05,
    },
    4: {
        "pool": [
            "venusaur", "charizard", "blastoise",
            "gengar", "alakazam", "machamp", "golem",
            "arcanine", "starmie", "chansey", "kangaskhan",
            "cloyster", "ninetales", "nidoking", "nidoqueen",
        ],
        "level": 5,
        "team_size": 3,
        "shiny_chance": 0.08,
    },
}

# Genera el equipo enemigo para un nodo dado.
# node_type: "battle" | "elite" | "boss"
# floor: 0-4 (current_row del mapa)
func generate_enemy_team(floor: int, node_type: String) -> Array:
    var config: Dictionary = POOLS.get(clampi(floor, 0, 4), POOLS[0]).duplicate(true)

    if node_type == "elite":
        config["level"]        = mini(config["level"] + 1, 5)
        config["shiny_chance"] = minf(config["shiny_chance"] + 0.02, 0.15)
        config["team_size"]    = mini(config["team_size"] + 1, 3)

    if node_type == "boss":
        config = POOLS[4].duplicate(true)
        config["shiny_chance"] = 0.10

    var pool: Array = config["pool"].duplicate()
    pool.shuffle()

    var team: Array = []
    for i in mini(config["team_size"], pool.size()):
        var species: String  = pool[i]
        var is_shiny: bool   = randf() < config["shiny_chance"]
        team.append(globals.generate_pokemon(species, config["level"], {"is_shiny": is_shiny}))

    return team
