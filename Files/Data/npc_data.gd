extends Node




var dialogue = {}


var progression = {
    "Oak": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1751, 687), "down"], 
                    ]
    }, 

    "Clark": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-169, 827), "right"], 
                    ]
    }, 

    "Marisa": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(886, 306), "left"], 
                    ]
    }, 

    "Gerson": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1455, -27), "right"], 
                    ]
    }, 

    "Cesar": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(929, -177), "right"], 
                    ]
    }, 

    "Red": {
        "dialogue": "-1", 
        "battle": [0, 1, 3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(15, 765), "up"], 
                    ]
    }, 

    "Blue": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(82, 790), "left"], 
                    [Vector2(723, 1077), "up"], 
                    [Vector2(440, 386), "right"], 
                    ]
    }, 

    "Leaf": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-190, 963), "right"], 
                    [Vector2(833, 1207), "up"], 
                    [Vector2(1355, 968), "right"], 
                    ]
    }, 

    "Gold": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(729, 489), "up"], 
                    [Vector2(575, 1299), "right"]
                    ]
    }, 

    "Kris": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(298, 978), "left"], 
                    [Vector2(660, 1352), "down"]
                    ]
    }, 

    "Silver": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1043, 963), "left"], 
                    [Vector2(925, 1162), "down"], 
                    [Vector2(209, 730), "down"], 
                    ]
    }, 

    "May": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1838, 774), "up"], 
                    [Vector2(496, 1126), "down"], 
                    [Vector2(209, 730), "down"], 
                    ]
    }, 

    "Brendan": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(196, 1308), "right"], 
                    [Vector2(497, 1396), "up"], 
                    [Vector2(209, 730), "down"], 
                    ]
    }, 

    "Wally": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1592, 444), "up"], 
                    [Vector2(1066, 547), "right"], 
                    [Vector2(209, 730), "down"], 
                    ]
    }, 

    "Lucas": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1407, 847), "down"], 
                    [Vector2(828, 1387), "up"], 
                    ]
    }, 

    "Dawn": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(537, 357), "left"], 
                    [Vector2(868, 1159), "left"], 
                    ]
    }, 

    "Barry": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(470, 830), "right"], 
                    [Vector2(390, 1207), "down"], 
                    ]
    }, 

    "Brock": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1158, 432), "down"], 
                    [Vector2(544, 1127), "down"], 
                    [Vector2(1895, 884), "left"], 
                    ]
    }, 

    "Misty": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(839, 501), "down"], 
                    [Vector2(548, 1216), "up"], 
                    [Vector2(1064, 264), "right"], 
                    ]
    }, 

    "Surge": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-42, 933), "left"], 
                    [Vector2(546, 1318), "down"], 
                    [Vector2(199, 1447), "right"], 
                    ]
    }, 

    "Erika": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1459, 879), "down"], 
                    [Vector2(595, 1363), "left"], 
                    [Vector2(588, 298), "right"], 
                    ]
    }, 

    "Koga": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-183, 932), "right"], 
                    [Vector2(738, 1169), "right"], 
                    [Vector2(9999, 9999), "down"]
                    ]
    }, 

    "Sabrina": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1103, 1413), "down"], 
                    [Vector2(447, 1161), "right"], 
                    [Vector2(400, 803), "left"], 
                    ]
    }, 

    "Blaine": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-40, 726), "right"], 
                    [Vector2(800, 1313), "down"], 
                    [Vector2(732, 723), "down"], 
                    ]
    }, 

    "RocketF": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "left"], 
                    [Vector2(9999, 9999), "left"]
                    ]
    }, 

    "RocketM": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "left"], 
                    [Vector2(9999, 9999), "left"]
                    ]
    }, 

    "Giovanni": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(777, -332), "left"], 
                    [Vector2(926, 1294), "left"], 
                    [Vector2(3985, -1600), "up"], 
                    ]
    }, 

    "Koichi": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(679, 488), "up"], 
                    [Vector2(1076, 399), "right"]
                    ]
    }, 

    "Falkner": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1339, 731), "left"], 
                    [Vector2(1407, 447), "down"], 
                    [Vector2(1301, 485), "right"], 
                    ]
    }, 

    "Bugsy": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(292, 1070), "down"], 
                    [Vector2(1607, 548), "left"], 
                    [Vector2(1499, 920), "left"], 
                    ]
    }, 

    "Whitney": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(778, 347), "right"], 
                    [Vector2(674, 1232), "down"]
                    ]
    }, 

    "Morty": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(212, 1257), "right"], 
                    [Vector2(928, 1058), "down"]
                    ]
    }, 

    "Chuck": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(691, 837), "up"], 
                    [Vector2(653, 1104), "down"]
                    ]
    }, 

    "Jasmine": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1475, 772), "up"], 
                    [Vector2(441, 1324), "right"]
                    ]
    }, 

    "Clair": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(70, 973), "right"], 
                    [Vector2(581, 1062), "down"], 
                    [Vector2(1783, 821), "down"], 
                    ]
    }, 

    "Janine": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1059, 70), "down"], 
                    [Vector2(689, 1462), "up"], 
                    [Vector2(9999, 9999), "right"]
                    ]
    }, 

    "Karen": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(880, 501), "down"]
                    ]
    }, 

    "Bruno": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(734, 1354), "right"]
                    ]
    }, 

    "Agatha": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(1639, 732), "right"]
                    ]
    }, 

    "Lorelei": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(-121, 1023), "down"]
                    ]
    }, 

    "Lance": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Steven": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Cynthia": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Palmer": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Alder": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Roxanne": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(695, 345), "up"], 
                    [Vector2(1362, 596), "left"]
                    ]
    }, 

    "Brawly": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1172, 825), "left"], 
                    [Vector2(311, 1366), "down"]
                    ]
    }, 

    "Wattson": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(532, 502), "left"], 
                    [Vector2(881, 1362), "left"]
                    ]
    }, 

    "Flannery": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(951, -47), "up"], 
                    [Vector2(720, 1281), "left"], 
                    [Vector2(-93, 776), "up"]
                    ]
    }, 

    "Norman": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(414, 350), "right"], 
                    [Vector2(810, 1067), "down"]
                    ]
    }, 

    "Winona": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1783, 970), "down"], 
                    [Vector2(884, 832), "left"]
                    ]
    }, 

    "Wallace": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(788, 544), "right"], 
                    [Vector2(551, 1403), "up"]
                    ]
    }, 

    "Sidney": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(407, 1411), "right"]
                    ]
    }, 

    "Phoebe": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(1160, -34), "down"]
                    ]
    }, 

    "Drake": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(868, 1111), "down"]
                    ]
    }, 

    "Roark": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(64, 871), "right"], 
                    [Vector2(442, 1064), "down"]
                    ]
    }, 

    "Gardenia": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1013, 721), "down"], 
                    [Vector2(775, 1200), "right"]
                    ]
    }, 

    "Fantina": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(487, 444), "down"], 
                    [Vector2(781, 1302), "down"]
                    ]
    }, 

    "Candice": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(446, 496), "right"], 
                    [Vector2(494, 1304), "left"]
                    ]
    }, 

    "Volkner": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1305, 388), "down"], 
                    [Vector2(481, 1453), "right"]
                    ]
    }, 

    "Flint": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(516, 830), "left"], 
                    [Vector2(587, 1158), "left"]
                    ]
    }, 

    "Cyrus": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(198, 1351), "right"], 
                    [Vector2(833, 1453), "left"]
                    ]
    }, 

    "Elesa": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1167, 396), "left"], 
                    [Vector2(825, 1123), "down"]
                    ]
    }, 

    "Skyla": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1832, 918), "right"], 
                    [Vector2(779, 1388), "up"]
                    ]
    }, 

    "Burgh": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(637, 335), "right"], 
                    [Vector2(456, 719), "down"]
                    ]
    }, 

    "Clay": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1546, 684), "right"], 
                    [Vector2(828, 829), "right"]
                    ]
    }, 

    "Lenora": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(582, 715), "down"], 
                    [Vector2(1166, 592), "left"]
                    ]
    }, 

    "Iris": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-36, 970), "left"], 
                    [Vector2(705, 1392), "down"]
                    ]
    }, 

    "Roxie": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-123, 887), "down"], 
                    [Vector2(391, 1303), "right"]
                    ]
    }, 

    "Hilbert": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1784, 1015), "up"], 
                    [Vector2(874, 1243), "down"]
                    ]
    }, 

    "Hilda": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(61, 1018), "down"], 
                    [Vector2(495, 1198), "up"]
                    ]
    }, 

    "N": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(67, 726), "down"], 
                    [Vector2(401, 758), "right"]
                    ]
    }, 

    "Calem": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(960, 830), "right"], 
                    [Vector2(438, 1201), "up"]
                    ]
    }, 

    "Serena": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(304, 913), "down"], 
                    [Vector2(929, 1266), "left"]
                    ]
    }, 

    "Tierno": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1785, 776), "down"], 
                    [Vector2(1549, 494), "left"]
                    ]
    }, 

    "Diantha": {
        "dialogue": "-1", 
        "battle": [3], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Maxie": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(743, 546), "down"], 
                    [Vector2(642, 1307), "down"]
                    ]
    }, 

    "Archie": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-179, 1020), "right"], 
                    [Vector2(1455, 386), "down"]
                    ]
    }, 

    "Ghetsis": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1548, 727), "up"], 
                    [Vector2(590, 1458), "left"]
                    ]
    }, 

    "Lysandre": {
        "dialogue": "-1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(694, 630), "left"], 
                    [Vector2(649, 1317), "down"]
                    ]
    }, 

    "Wes": {
        "dialogue": "1", 
        "battle": [2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(724, -91), "down"], 
                    [Vector2(1172, 131), "up"]
                    ]
    }, 

    "Bill": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(-87, 884), "down"], 
                    [Vector2(1067, 688), "down"]
                    ]
    }, 

    "Jack": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1601, 590), "down"], 
                    [Vector2(773, 1456), "right"]
                    ]
    }, 

    "Joey": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(100, 1018), "up"], 
                    [Vector2(1496, 492), "down"]
                    ]
    }, 

    "Megan": {
        "dialogue": "-1", 
        "battle": [0, 1, 2], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(442, 506), "right"], 
                    [Vector2(1262, 595), "right"]
                    ]
    }, 

    "Weevil": {
        "dialogue": "-1", 
        "battle": [0, 1], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(203, 882), "left"], 
                    [Vector2(528, 723), "down"]
                    ]
    }, 

    "Rex": {
        "dialogue": "-1", 
        "battle": [0, 1], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(1158, 152), "down"], 
                    [Vector2(441, 723), "down"]
                    ]
    }, 

    "Cress": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    ]
    }, 

    "Cilan": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    [Vector2(1348, 439), "down"], 
                    ]
    }, 

    "Chili": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, 9999), "down"], 
                    ]
    }, 

    "Mewtwo": {
        "dialogue": "-1", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(4063, 526), "down"], 
                    ]
    }, 

    "Old Blue": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(5728, -1913), "down"], 
                    ]
    }, 

    "Old Man": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(8890, -1754), "left"], 
                    ]
    }, 

    "Old Lady": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(8793, -1801), "left"], 
                    ]
    }, 

    "Yugi": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, -9999), "down"], 
                    [Vector2(9999, -9999), "down"], 
                    ]
    }, 

    "Kaiba": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(9999, -9999), "down"], 
                    [Vector2(674, 1053), "down"]
                    ]
    }, 

    "Demi-Fiend": {
        "dialogue": "0", 
        "battle": [], 
        "battle_results": {"win": 0, "lose": 0}, 
        "positions": [
                    [Vector2(3958, 804), "up"], 
                    [Vector2(3958, 804), "up"]
                    ]
    }, 
}

var teams = {
    "Red": {
        0: [null, null, null, null, null, null]
    }, 

    "Blue": {
        0: [null, null, null, null, null, null]
    }, 

    "Brock": {
        0: [null, null, null, null, null, null]
    }, 

    "Leaf": {
        0: [null, null, null, null, null, null]
    }, 

    "Gold": {
        0: [null, null, null, null, null, null]
    }, 

    "Kris": {
        0: [null, null, null, null, null, null]
    }, 

    "Silver": {
        0: [null, null, null, null, null, null]
    }, 

    "May": {
        0: [null, null, null, null, null, null]
    }, 

    "Brendan": {
        0: [null, null, null, null, null, null]
    }, 

    "Wally": {
        0: [null, null, null, null, null, null]
    }, 

    "Lucas": {
        0: [null, null, null, null, null, null]
    }, 

    "Dawn": {
        0: [null, null, null, null, null, null]
    }, 

    "Barry": {
        0: [null, null, null, null, null, null]
    }, 

    "Misty": {
        0: [null, null, null, null, null, null]
    }, 

    "Erika": {
        0: [null, null, null, null, null, null], 
    }, 

    "Surge": {
        0: [null, null, null, null, null, null], 
    }, 

    "Koga": {
        0: [null, null, null, null, null, null], 
    }, 

    "Sabrina": {
        0: [null, null, null, null, null, null], 
    }, 

    "Blaine": {
        0: [null, null, null, null, null, null], 
    }, 

    "Giovanni": {
        0: [null, null, null, null, null, null], 
    }, 

    "RocketF": {
        0: [null, null, null, null, null, null], 
    }, 

    "Koichi": {
        0: [null, null, null, null, null, null], 
    }, 

    "Falkner": {
        0: [null, null, null, null, null, null], 
    }, 

    "Bugsy": {
        0: [null, null, null, null, null, null], 
    }, 

    "Whitney": {
        0: [null, null, null, null, null, null], 
    }, 

    "Morty": {
        0: [null, null, null, null, null, null], 
    }, 

    "Chuck": {
        0: [null, null, null, null, null, null], 
    }, 

    "Jasmine": {
        0: [null, null, null, null, null, null], 
    }, 

    "Clair": {
        0: [null, null, null, null, null, null], 
    }, 

    "Janine": {
        0: [null, null, null, null, null, null], 
    }, 

    "Karen": {
        0: [null, null, null, null, null, null], 
    }, 

    "Bruno": {
        0: [null, null, null, null, null, null], 
    }, 

    "Agatha": {
        0: [null, null, null, null, null, null], 
    }, 

    "Lorelei": {
        0: [null, null, null, null, null, null], 
    }, 

    "Lance": {
        0: [null, null, null, null, null, null], 
    }, 

    "Roxanne": {
        0: [null, null, null, null, null, null], 
    }, 

    "Brawly": {
        0: [null, null, null, null, null, null], 
    }, 

    "Wattson": {
        0: [null, null, null, null, null, null], 
    }, 

    "Flannery": {
        0: [null, null, null, null, null, null], 
    }, 

    "Norman": {
        0: [null, null, null, null, null, null], 
    }, 

    "Winona": {
        0: [null, null, null, null, null, null], 
    }, 

    "Wallace": {
        0: [null, null, null, null, null, null], 
    }, 

    "Sidney": {
        0: [null, null, null, null, null, null], 
    }, 

    "Phoebe": {
        0: [null, null, null, null, null, null], 
    }, 

    "Drake": {
        0: [null, null, null, null, null, null], 
    }, 

    "Steven": {
        0: [null, null, null, null, null, null], 
    }, 

    "Roark": {
        0: [null, null, null, null, null, null], 
    }, 

    "Gardenia": {
        0: [null, null, null, null, null, null], 
    }, 

    "Candice": {
        0: [null, null, null, null, null, null], 
    }, 

    "Volkner": {
        0: [null, null, null, null, null, null], 
    }, 

    "Fantina": {
        0: [null, null, null, null, null, null], 
    }, 

    "Flint": {
        0: [null, null, null, null, null, null], 
    }, 

    "Cyrus": {
        0: [null, null, null, null, null, null], 
    }, 

    "Cynthia": {
        0: [null, null, null, null, null, null], 
    }, 

    "Palmer": {
        0: [null, null, null, null, null, null], 
    }, 

    "Elesa": {
        0: [null, null, null, null, null, null], 
    }, 

    "Skyla": {
        0: [null, null, null, null, null, null], 
    }, 

    "Burgh": {
        0: [null, null, null, null, null, null], 
    }, 

    "Clay": {
        0: [null, null, null, null, null, null], 
    }, 

    "Lenora": {
        0: [null, null, null, null, null, null], 
    }, 

    "Iris": {
        0: [null, null, null, null, null, null], 
    }, 

    "Roxie": {
        0: [null, null, null, null, null, null], 
    }, 

    "Alder": {
        0: [null, null, null, null, null, null], 
    }, 

    "Cilan": {
        0: [null, null, null, null, null, null], 
    }, 

    "Hilbert": {
        0: [null, null, null, null, null, null], 
    }, 

    "Hilda": {
        0: [null, null, null, null, null, null], 
    }, 

    "N": {
        0: [null, null, null, null, null, null], 
    }, 

    "Calem": {
        0: [null, null, null, null, null, null], 
    }, 

    "Serena": {
        0: [null, null, null, null, null, null], 
    }, 

    "Tierno": {
        0: [null, null, null, null, null, null], 
    }, 

    "Diantha": {
        0: [null, null, null, null, null, null], 
    }, 

    "Maxie": {
        0: [null, null, null, null, null, null], 
    }, 

    "Archie": {
        0: [null, null, null, null, null, null], 
    }, 

    "Ghetsis": {
        0: [null, null, null, null, null, null], 
    }, 

    "Lysandre": {
        0: [null, null, null, null, null, null], 
    }, 

    "Wes": {
        0: [null, null, null, null, null, null], 
    }, 

    "Bill": {
        0: [null, null, null, null, null, null], 
    }, 

    "Jack": {
        0: [null, null, null, null, null, null], 
    }, 

    "Joey": {
        0: [null, null, null, null, null, null], 
    }, 

    "Megan": {
        0: [null, null, null, null, null, null], 
    }, 

    "Weevil": {
        0: [null, null, null, null, null, null], 
    }, 

    "Rex": {
        0: [null, null, null, null, null, null], 
    }, 

    "Oak": {
        0: [null, null, null, null, null, null], 
    }, 

    "BrockMisty": {
        0: [null, null, null, null, null, null]
    }, 

    "SurgeErika": {
        0: [null, null, null, null, null, null]
    }, 

    "BlueSilver": {
        0: [null, null, null, null, null, null]
    }, 

    "FlanneryCandice": {
        0: [null, null, null, null, null, null]
    }, 

    "ClairIris": {
        0: [null, null, null, null, null, null]
    }, 

    "BurghElesa": {
        0: [null, null, null, null, null, null]
    }, 

    "BlaineWattson": {
        0: [null, null, null, null, null, null]
    }, 

    "WallyN": {
        0: [null, null, null, null, null, null]
    }, 

    "RoxanneBrawly": {
        0: [null, null, null, null, null, null]
    }, 

    "OldBlue": {
        0: [null, null, null, null, null, null]
    }, 

    "Yugi": {
        0: [null, null, null, null, null, null]
    }, 

    "Kaiba": {
        0: [null, null, null, null, null, null]
    }, 

    "Demi-Fiend": {
        0: [null, null, null, null, null, null]
    }, 

    "Mewtwo": {
        0: [null, null, null, null, null, null], 
    }, 
}


func _ready() -> void :
    globals.npc = self
    setup_npc_teams()

    await wait(0.001)
    dialogue = {
    "Oak": {
        "0": ["Everybody else is already playing.", 
            "Are you confused? Just go ahead and play a few games.", 
            "No need to think too hard about all of this.", 
            [call_deferred, ["update_dialogue_progression", "Oak", "0a"]], 
            ], 

        "0a": ["Go play.", 
            ], 

        "end": [
            "Everybody else already left.", 
            "See you next week."
        ], 
    }, 

    "Clark": {
        "0": ["Got a selection of good things on sale, stranger.", 
            [call_deferred, ["show_card_shop"]], 
        ], 

        "Demi-Fiend": ["We don't serve your kind here."], 

        "Mewtwo": ["What is thy biding, my master..."]
    }, 

    "Marisa": {
        "0": ["Looking to protect yourself? Or deal some damage?", 
            [call_deferred, ["show_item_shop"]], 
        ], 

        "Blue": ["Huh? A coffee for Blue?", 
                "I hope he didn't set you up for this...", 
                "Well, here you go, but do stand up for yourself, okay?", 
                [call_deferred, ["update_dialogue_progression", "Marisa", "0"]], 
                [call_deferred, ["update_dialogue_progression", "Blue", "2b"]], 

        ], 

        "Mewtwo": ["What is thy biding, my master..."]
    }, 

    "Gerson": {
        "0": ["Uh... This area is off-limits.", 
                [call_deferred, ["reset_npc_facing", "Gerson"]]
        ], 

        "giovanni": ["Geez... I don't get paid enough for this.", [call_deferred, ["reset_npc_facing", "Gerson"]]], 

        "end": ["I gotta get the hell outta here.", 
            [call_deferred, ["reset_npc_facing", "Gerson"]]
        ]
    }, 

    "Cesar": {
        "0": ["This is the electrical room.", "Go play somewhere else.", 
                [call_deferred, ["reset_npc_facing", "Cesar"]]
        ], 
    }, 

    "Red": {
        "0": ["...", 
        [call_deferred, ["reset_npc_facing", "Red"]]
        ], 

        "1": [
            "... ?", 
            [
                ["Wanna play?", 
                    [
                    "!", 
                    [call_deferred, ["start_battle", "Red"]], 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Red"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "...", 
            [call_deferred, ["update_dialogue_progression", "Red", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "...", 
        ], 

        "1_win": [
            "...", 
            [call_deferred, ["update_dialogue_progression", "Red", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "...", 
        ], 

        "booster": ["... ...", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Blue": {
        "0": ["Eh, seems like the competition is weak today.", 
            [call_deferred, ["reset_npc_facing", "Blue"]]], 

        "BlueGBC": [[call_deferred, ["play_cutscene", "blue_gbc_event"]]], 

        "BlueGBC_end": ["Huh. I guess it's broken.", [call_deferred, ["reset_npc_facing", "Blue"]]], 


        "2": ["Hey newbie, get my coffee at the counter for me, will ya?", 
            "Don't worry, it's already on my tab.", 
            [call_deferred, ["update_dialogue_progression", "Blue", "2a"]], 
            [call_deferred, ["update_dialogue_progression", "Marisa", "Blue"]], 
            [call_deferred, ["reset_npc_facing", "Blue"]]

        ], 

        "2a": ["What's the holdup? I'm waiting!", 
            "Geez, I was going to make it worth your while...", 
            [call_deferred, ["reset_npc_facing", "Blue"]]
        ], 

        "2b": ["Geez, you sure did take your time...", 
            "Here's your tip, go play with the other newbies at the lobby, you hear?", 
            [call_deferred, ["update_dialogue_progression", "Blue", "2c"]], 
            [call_deferred, ["reset_npc_facing", "Blue"]], 
            [call_deferred, ["get_card", "pikachu", 1]], 
        ], 

        "2c": ["Gramps was supposed to give this card to my loser neighbor,", 
            "But he didn't show up...", 
            [call_deferred, ["reset_npc_facing", "Blue"]]
        ], 

        "BlueSilver": [
            [call_deferred, ["play_cutscene", "blue_silver_event"]]
        ], 

        "BlueSilver_lost": ["Also, can you believe he said I'm washed?", 
                            "I built the peak, you guys are just climbing it.", 
                            [call_deferred, ["reset_npc_facing", "Blue"]]
        ], 

        "BlueSilver_won": ["Man, nothing like a good fight to wake me up.", 
                            [call_deferred, ["reset_npc_facing", "Blue"]]
        ], 

        "1": [
            "You wanna play? Gotta warn you though, I'm pretty good.", 
            [
                ["Sure", 
                    [
                    "Alright, I'll take you on!", 
                    [call_deferred, ["start_battle", "Blue"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck? I'm kind of a genius when it comes to Pokémon.", 
                    "If you're that worried, you should challenge someone else.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Smell ya later."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Guess I picked the wrong Pokémon...", 
            [call_deferred, ["update_dialogue_progression", "Blue", "1_lost"]], 
        ], 

        "1_lost": [
            "That loosened me up! I'm ready to take the prize...", 
        ], 

        "1_win": [
            "Am I great or what?", 
            [call_deferred, ["update_dialogue_progression", "Blue", "1_won"]], 
        ], 

        "1_won": [
            "Well, look at all your wimpy Pokémon!", 
            "Try getting some stronger ones, geez.", 
        ], 

        "booster": ["Fine, fine! Here, take this and go bite it!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Leaf": {
        "0": ["Some people here are such tryhards.", 
            "Geez, so annoying...", 
            [call_deferred, ["reset_npc_facing", "Leaf"]]], 

        "2": ["Hey, are you just starting out?", 
            "I'm a card collector... I'll give you something to get you started!", 
            "What's your favorite color?", 
            [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
            [
                ["Green", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "nidorina", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 

                ["Red", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "magmar", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 

                ["Blue", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "golduck", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 

                ["Yellow", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "electabuzz", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 

                ["White", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "farfetch'd", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 

                ["Black", 
                    [
                    "Right... I know just the right thing for you!", 
                    [call_deferred, ["get_card", "hypno", 2]], 
                    [call_deferred, ["update_dialogue_progression", "Leaf", "0a"]], 
                    [call_deferred, ["reset_npc_facing", "Leaf"]]
                    ], 
                ], 
            ], 
        ], 

        "0a": [
            "Have fun! We should play a match sometime.", 
            [call_deferred, ["reset_npc_facing", "Leaf"]]
            ], 

        "1": [
            "I'm testing some cards, would you mind playing a game with me?", 
            [
                ["Sure", 
                    [
                    "Thanks, let's have some fun!", 
                    [call_deferred, ["start_battle", "Leaf"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Well, I love collecting cards, so my deck is all over the place...", 
                    "My favorite card is green though, so watch out!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Oh, see you soon."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Ow, that almost worked...", 
            [call_deferred, ["update_dialogue_progression", "Leaf", "1_lost"]], 
        ], 

        "1_lost": [
            "Thanks for the game! I'll adjust my deck before we play again...", 
        ], 

        "1_win": [
            "Oh yeah! Can't believe that worked!!", 
            [call_deferred, ["update_dialogue_progression", "Leaf", "1_won"]], 
        ], 

        "1_won": [
            "Thank you for the game, let me know if you need some pointers!", 
        ], 

        "booster": ["Your collection is pretty cool...", "Here's a little something to make it better!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Gold": {
        "0": [
            "Here's a tip for you.", 
            "If a Pokémon tries to use a move without having enough AP...", 
            "They'll use STRUGGLE instead.", 
            "Set up your Pokémon so they can use all their AP WITHOUT Struggling.", 
            "Because Struggle sucks.", 
            [call_deferred, ["reset_npc_facing", "Gold"]]
            ], 

        "1": [
            "Hey, let's have a match, will ya?", 
            [
                ["Sure", 
                    [
                    "Alright, let's go!", 
                    [call_deferred, ["start_battle", "Gold"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hm... It's not on purpose, but my strongest cards are RED.", 
                    "I stick to the ones I like best!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Wow, I got owned...", 
            [call_deferred, ["update_dialogue_progression", "Gold", "1_lost"]], 
        ], 

        "1_lost": [
            "I'll get you next time...", 
        ], 

        "1_win": [
            "Heh! pretty good, right?", 
            [call_deferred, ["update_dialogue_progression", "Gold", "1_won"]], 
        ], 

        "1_won": [
            "I'm only getting stronger from here!", 
        ], 

        "booster": ["I know I'm a lot to deal with, so here's a token of my appreciation.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Kris": {
        "0": [
            "Heh, the atmosphere is so tense today...", 
            "I love this feeling!", 
            [call_deferred, ["reset_npc_facing", "Kris"]]
            ], 

        "1": [
            "Looking for a battle? I’ve been itching to test my deck...", 
            [
                ["Sure", 
                    [
                    "Don't back down now!", 
                    [call_deferred, ["start_battle", "Kris"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck? Strong, balanced, and full of heart!", 
                    "Oh, were you expecting a tip?"
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "That was a real adventure...", 
            [call_deferred, ["update_dialogue_progression", "Kris", "1_lost"]], 
        ], 

        "1_lost": [
            "Now that I know your strategy, you won't stand a chance.", 
        ], 

        "1_win": [
            "That was fun! You’ve got spirit.", 
            [call_deferred, ["update_dialogue_progression", "Kris", "1_won"]], 
        ], 

        "1_won": [
            "Don’t let one loss get you down.", 
            "Every journey has bumps along the way!", 
        ], 

        "booster": ["Here, take this.", "Maybe it’ll be your next favorite card!.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Silver": {
        "0": [
            "...", 
            "What are you staring at?", 
            [call_deferred, ["reset_npc_facing", "Silver"]]
            ], 

        "BlueSilver": [
            [call_deferred, ["play_cutscene", "blue_silver_event"]]
        ], 

        "BlueSilver_won": ["At least you’ve got some backbone.", 
                            "Most people quit halfway through when fighting me.", 
                            [call_deferred, ["reset_npc_facing", "Silver"]]
        ], 

        "2": [
            "Not so fast!", 
            "Looking for stronger cards, are you?", 
            "Well, I better get you while you're still weak!", 
            [call_deferred, ["start_battle", "Silver"]], 
            ], 

        "1": [
            "You playing?", 
            [
                ["Sure", 
                    [
                    "Heh, let's see what you got!", 
                    [call_deferred, ["start_battle", "Silver"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Stop wasting time.", 
                    "If you're not playing, then GTFO.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "... Why... ", 
            [call_deferred, ["update_dialogue_progression", "Silver", "1_lost"]], 
        ], 

        "1_lost": [
            "You only won because my cards are weak...", 
        ], 

        "1_win": [
            "Heh. From now on, learn to stay out of my way.", 
            [call_deferred, ["update_dialogue_progression", "Silver", "1_won"]], 
        ], 

        "1_won": [
            "That was a waste of time.", 
        ], 

        "booster": ["Dammit, take this and go away.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "May": {
        "0": [
            "Someone asked me if the row you put Pokémon in matters.", 
            "They just let anybody in here nowadays, huh?", 
            "Units in the back row are safe from most attacks, but are 30% slower.", 
            [call_deferred, ["reset_npc_facing", "May"]]
            ], 

        "1": [
            "Wanna play a round? It’ll be fun!", 
            [
                ["Sure", 
                    [
                    "Heh, let's see what you got!", 
                    [call_deferred, ["start_battle", "May"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I got some pretty strong cards...", 
                    "My friends say I play recklessly, but that's just how I roll.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You’re stronger than I thought!", 
            [call_deferred, ["update_dialogue_progression", "May", "1_lost"]], 
        ], 

        "1_lost": [
            "Losing’s not so bad if it means learning something new.", 
        ], 

        "1_win": [
            "That was awesome! You almost had me...", 
            [call_deferred, ["update_dialogue_progression", "May", "1_won"]], 
        ], 

        "1_won": [
            "Don’t sweat it, I can tell you're just getting started.", 
        ], 

        "booster": ["Here’s a pack for you! Maybe you’ll pull something cool.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Brendan": {
        "0": [
            "Huh, you wanna play?", 
            "Not now... I'm watching the other players first.", 
            "Strategy is everything!", 
            [call_deferred, ["reset_npc_facing", "Brendan"]]
            ], 

        "1": [
            "Let's duel! I wanna see how my strategy holds up.", 
            [
                ["Sure", 
                    [
                    "Let's play fair!", 
                    [call_deferred, ["start_battle", "Brendan"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "People say my cards are wacky...", 
                    "Don't let your guard down, though.", 
                    "You might fall right into my trap!"
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You read the field better than I did... Nice job.", 
            [call_deferred, ["update_dialogue_progression", "Brendan", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ll review my deck and come back sharper.", 
        ], 

        "1_win": [
            "My planning paid off. That was a good game.", 
            [call_deferred, ["update_dialogue_progression", "Brendan", "1_won"]], 
        ], 

        "1_won": [
            "You just earned a valuable experience.", 
        ], 

        "booster": ["Take this booster pack. Having options is the key to winning.", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Wally": {
        "0": [

            "I feel out of place...", 
            [call_deferred, ["reset_npc_facing", "Wally"]]
            ], 

        "WallyN": [[call_deferred, ["play_cutscene", "wally_n_event"]]], 

        "WallyN_end": ["Someday I want to stand beside you both.", "... Without shaking so much.", [call_deferred, ["reset_npc_facing", "Wally"]]], 

        "1": [
            "Um... would you play a match with me?", "I’m new to this game...", 
            [
                ["Sure", 
                    [
                    "O-okay! Please go easy on me!", 
                    [call_deferred, ["start_battle", "Wally"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "What? Uh... I'm not sure how to respond...", 
                    "I just use the cards I like the best...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Okay, another time."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "I lost... But I’m not giving up!", 
            [call_deferred, ["update_dialogue_progression", "Wally", "1_lost"]], 
        ], 

        "1_lost": [
            "Thanks for playing with me, I'll get stronger for sure!", 
        ], 

        "1_win": [
            "I... I actually won!", 
            "Thank you for the match!", 
            [call_deferred, ["update_dialogue_progression", "Wally", "1_won"]], 
        ], 

        "1_won": [
            "I believe you can improve, just like I did!", 
        ], 

        "booster": ["Please, take this. I hope it helps you.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Lucas": {
        "0": [
            "Honestly, pressing CANCEL to make your Pokémon WAIT is so clutch.", 
            "You should use WAIT to control your team's tempo.", 
            "People are sleeping on WAIT.", 


            [call_deferred, ["reset_npc_facing", "Lucas"]]
            ], 

        "1": [
            "Want to test your skills? My deck is pretty sharp...", 
            [
                ["Sure", 
                    [
                    "You're on!", 
                    [call_deferred, ["start_battle", "Lucas"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I like to use lots of different colors.", 
                    "Heh, fighting me is like going on an adventure!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You’ve got some real talent... I’ll need to train harder.", 
            [call_deferred, ["update_dialogue_progression", "Lucas", "1_lost"]], 
        ], 

        "1_lost": [
            "Next time, I’ll be ready.", 
        ], 

        "1_win": [
            "That was a good match. Thanks for giving it your all.", 
            [call_deferred, ["update_dialogue_progression", "Lucas", "1_won"]], 
        ], 

        "1_won": [
            "Don't give up, you’ll only get stronger from here.", 
        ], 

        "booster": ["Here, take this pack. Maybe you’ll find a card that inspires you.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Dawn": {
        "0": [
            "I wonder what kind of deck would get the champion off-guard...", 
            [call_deferred, ["reset_npc_facing", "Dawn"]]
            ], 

        "1": [
            "Wanna play a game? I’ve got a strategy I want to test...", 
            [
                ["Sure", 
                    [
                    "Alright, let's go!", 
                    [call_deferred, ["start_battle", "Dawn"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hehe, are you nervous?", 
                    "My deck shines under any spotlight!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You read me like an open book...", 
            [call_deferred, ["update_dialogue_progression", "Dawn", "1_lost"]], 
        ], 

        "1_lost": [
            "I guess my strategy still needs some polishing...", 
        ], 

        "1_win": [
            "See? Practice really does pay off!", 
            [call_deferred, ["update_dialogue_progression", "Dawn", "1_won"]], 
        ], 

        "1_won": [
            "Don’t feel down, it’s all part of the show!", 
        ], 

        "booster": ["Take this! Having a good collection is key.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Barry": {
        "0": [
            "Heh, I just snagged the strongest card they had at the shop.", 
            "I can't wait for my next match!", 
            [call_deferred, ["reset_npc_facing", "Barry"]]
            ], 

        "1": [
            "Let’s battle already! I don’t have all day!", 
            [
                ["Sure", 
                    [
                    "C’mon!", 
                    [call_deferred, ["start_battle", "Barry"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Fast attackers, that’s my style!", 
                    "Quick wins, no stalling!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "What?! No way!", 
            "I can’t lose like this...", 
            [call_deferred, ["update_dialogue_progression", "Barry", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ll crush you next time!", 
        ], 

        "1_win": [
            "Ha! That’s what you get!", 
            [call_deferred, ["update_dialogue_progression", "Barry", "1_won"]], 
        ], 

        "1_won": [
            "Don’t mope! Just get good and keep up with me!", 
        ], 

        "booster": ["Here, take this and hurry up!", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Brock": {
        "0": ["Today is my day, for sure...", 
        [call_deferred, ["reset_npc_facing", "Brock"]], ], 

        "2": ["Hmm... I'm in quite a pickle!", 
            "My friend only uses blue cards, but all my favorites are red...", 
            "What should I do? Hmm...", 
            [
                ["Try blue cards", 
                    [
                    "Hmm... they're pretty strong, huh...", 
                    "Nah, blue cards are for tryhards.", 
                    [call_deferred, ["update_dialogue_progression", "Brock", "0a"]], 
                    ]

                ], 

                ["Try green cards", 
                    [
                    "Hey, you're pretty smart.", 
                    "Green cards are lame as heck though.", 
                    [call_deferred, ["update_dialogue_progression", "Brock", "0a"]], 
                    ]
                ], 

                ["Keep using red cards", 
                    [
                    "Didn't you hear me saying that I keep losing?", 
                    "Unless... Maybe I should keep using my favorite cards regardless?", 
                    "You know what... you're right.", 
                    "Even though I'll keep losing to Misty,", 
                    "there'll always be newbs like you for me to beat.", 
                    "Here's something for helping me. Try it against blue cards.", 
                    [call_deferred, ["update_dialogue_progression", "Brock", "0b"]], 
                    [call_deferred, ["get_card", "rhyhorn", 1]], 
                    ]
                ], 
            ], 
            [call_deferred, ["reset_npc_facing", "Brock"]]
        ], 

        "misty": [[call_deferred, ["play_cutscene", "misty_event"]]], 

        "misty_lost": ["I'll just go play with Erika instead.", [call_deferred, ["reset_npc_facing", "Brock"]]], 

        "misty_won": [
                "Maybe using more than one color at a time could be good.", 
                "But sometimes the squeeze is the juice, y'know?", 
                [call_deferred, ["reset_npc_facing", "Brock"]]
                ], 

        "0a": [
            "Hm... What should I do..."
        ], 

        "0b": [
            "We should play a match sometime, huh?"
        ], 

        "1": [
            "Hey, are you new? I'm up for a match if you wanna.", 
            [
                ["Sure", 
                    [
                    "My cards are rock-hard! Prepare yourself!", 
                    [call_deferred, ["start_battle", "Brock"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Basically, if your cards have more health, they die slower.", 
                    "So I'm using cards with lots of health.", 
                    "Pretty smart, huh? Well, I guess they're all red..."
                    ], 
                ], 

                ["Leave", 
                    [
                    "See ya."
                    ]
                ], 

            ], 
        ], 

        "1_lose": [
            "Ow ow ow ow ow.. You overcame my rock-hard defense.", 

            [call_deferred, ["update_dialogue_progression", "Brock", "1_lost"]], 
        ], 

        "1_lost": [
            "This time, I'm really gonna do it."



        ], 

        "1_win": [
            "Ha! I'm even more rock-hard than before!", 
            [call_deferred, ["update_dialogue_progression", "Brock", "1_won"]], 
        ], 

        "1_won": [
            "You're light-years away from beating me!"



        ], 

        "booster": ["Hm... You played well, but you're still a bit soft.", "This might help. Pay me back later!", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Misty": {
        "0": [
            "Oh, huh...", 
            "I'm taking a break right now. We'll play later.", 
            [call_deferred, ["reset_npc_facing", "Misty"]]
        ], 

        "2": [[call_deferred, ["play_cutscene", "misty_event"]]], 

        "misty_won": ["I don't know what Brock was thinking with that card he played.", 
                    "Geez... I barely managed to pull through.", 
                    [call_deferred, ["reset_npc_facing", "Misty"]]
                    ], 


        "1": [
            "Hi. Did you want something or..?", 
            [
                ["Wanna play?", 
                    [
                    "Sure, I could go for a quick round.", 
                    "You'd better not take me too lightly!", 
                    [call_deferred, ["start_battle", "Misty"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "You're pretty bold to ask an opponent about their strategy so casually.", 
                    "I like to go all out with powerful blue cards.", 
                    "Do you think you can handle it?"
                    ], 
                ], 

                ["Leave", 
                    [
                    "Okay."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Looks like this is it...", 
            [call_deferred, ["update_dialogue_progression", "Misty", "1_lost"]], 
        ], 

        "1_lost": [
            "I admit you played well.", 
            "Let's see if you can keep it up", 
        ], 

        "1_win": [
            "Hey, were you even paying attention?", 
            [call_deferred, ["update_dialogue_progression", "Misty", "1_won"]], 
        ], 

        "1_won": [
            "You wanna go again?", 
            "Try practicing some more first.", 
        ], 

        "booster": ["I bought this and realize I didn't need it, so you can have it.", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Surge": {
        "0": [
            "Beat it.", 
            [call_deferred, ["reset_npc_facing", "Surge"]]
            ], 

        "2": [[call_deferred, ["play_cutscene", "surge_event"]]], 

        "1": [
            "Huh? Are you talking to me?", 
            [
                ["Wanna play?", 
                    [
                    "Well, you sure ain't smart.", 
                    "Too late to back out now!", 
                    [call_deferred, ["start_battle", "Surge"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Oh wow, Hahaha!!!", 
                    "Listen, kid. If you ain't here to play, beat it.", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You must think you're the real deal, huh...", 
            [call_deferred, ["update_dialogue_progression", "Surge", "1_lost"]], 
        ], 

        "1_lost": [
            "You got lucky your corny strats worked.", 
            "You won't get away with it next time.", 
        ], 

        "1_win": [
            "Thanks for the points, scrub.", 
            [call_deferred, ["update_dialogue_progression", "Surge", "1_won"]], 
        ], 

        "1_won": [
            "Still hanging around?", 
            "You're not getting any freebies from me.", 
        ], 

        "booster": ["Look, just take this and pretend this match never happened, got it?", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Erika": {
        "0": [
            "Zzzzz..."
            ], 

        "2": ["Oh, hello. It's nice meeting you here.", 
            "I'm looking for a {0}. Would a {1} be enough for it?", 
            [call_deferred, ["show_trade_status"]], 
            [
                ["Let's trade!", 
                    [
                        [call_deferred, ["trade_pokemon"]]
                    ], 

                ], 

                ["Not interested.", 
                    [
                        "Oh, that's alright.", 
                        [call_deferred, ["reset_npc_facing", "Erika"]], 
                    ]
                ]
            ], 
        ], 

        "trade0": ["Thank you, I will cherish the card you've given me."], 
        "trade1": ["There seems to be a mistake..."], 

        "surge": [[call_deferred, ["play_cutscene", "surge_event"]]], 

        "surge_won": ["Do try to mind your manners.", [call_deferred, ["reset_npc_facing", "Erika"]]], 
        "surge_lost": ["I wonder how far you can go."], 


        "1": [
            "Hello. Lovely day for playing card games, isn't it?", 
            [
                ["Wanna play?", 
                    [
                    "Oh. I'm sorry, I didn't realize you wanted to play.", 
                    "I will give it my all!", 
                    [call_deferred, ["start_battle", "Erika"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I'm a green card specialist.", 
                    "Making a green team is like arranging flowers...", 
                    "... Oh, I'm sorry. Where were we?"
                    ], 
                ], 

                ["Leave", 
                    [
                    "Let's talk again soon."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Oh, I played foolishly.", 

            [call_deferred, ["update_dialogue_progression", "Erika", "1_lost"]], 
        ], 

        "1_lost": [
            "This is a cozy hotel, isn't it?", 
            "... I keep dozing off...", 
        ], 

        "1_win": [
            "Thank you for your demonstration.", 
            "This has become a battle I won't forget.", 
            [call_deferred, ["update_dialogue_progression", "Erika", "1_won"]], 
        ], 

        "1_won": [
            "This is a cozy hotel, isn't it?", 
            "... I keep dozing off...", 
        ], 

        "booster": ["Here, a small gift for you. Let's play again sometime.", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Koga": {
        "0": ["Hm... Yes... An unavoidable combo...", 
            [call_deferred, ["reset_npc_facing", "Koga"]]
        ], 

        "2": [""], 
        "2a": ["That item will make your Pokémon faster! Use it carefully!"], 

        "1": [
            "Well! A challenger approaches!", 
            "Do we have a match?", 
            [
                ["Sure", 
                    [
                    "Very well, I shall show you true terror!", 
                    [call_deferred, ["start_battle", "Koga"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Ha! What is the fun in revealing my tricks right before the show?", 
                    "You shall know them soon enough...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Farewell."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Humph! You have proven your worth!", 
            [call_deferred, ["update_dialogue_progression", "Koga", "1_lost"]], 
        ], 

        "1_lost": [
            "I subjected you to everything I could muster, and still failed.", 
            "I, too, must pursue further discipline.", 
        ], 

        "1_win": [
            "My sinister techniques have no equal!.", 
            [call_deferred, ["update_dialogue_progression", "Koga", "1_won"]], 
        ], 

        "1_won": [
            "Pokémon is not merely about brute force", 
            "You must hone your skills!", 
        ], 

        "booster": ["I will help you reach even further! Take this!", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Sabrina": {
        "0": ["I knew you'd come here.", 
            "This place... Something is off.", 
            [call_deferred, ["reset_npc_facing", "Sabrina"]]
        ], 

        "2": [[call_deferred, ["play_cutscene", "sabrina_event"]]], 

        "1": [
            "Hm. So it's you.", 
            "Shall we?", 
            [
                ["Uh... Sure?", 
                    [
                    "I've been waiting for this!", 
                    [call_deferred, ["start_battle", "Sabrina"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Do you need me to tell you? Your future is dark...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "We'll talk again."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "... I had a feeling this might happen.", 
            [call_deferred, ["update_dialogue_progression", "Sabrina", "1_lost"]], 
        ], 

        "1_lost": [
            "Your next move... I wonder what it'll be.", 
        ], 

        "1_win": [
            "So predictable...", 
            [call_deferred, ["update_dialogue_progression", "Sabrina", "1_won"]], 
        ], 

        "1_won": [
            "You bore me. Go away.", 
        ], 

        "booster": ["The card you want... It's this one, isn't it?", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Blaine": {
        "0": ["BURN deals damage percentual to the Pokémon's total HP.", 
            "In other words, 10 BURN will deal 10% of the Pokémon's maximum HP.", 
            "Heh! That's a good way to deal with those pesky tanks!", 
            [call_deferred, ["reset_npc_facing", "Blaine"]]
        ], 

        "BlaineWattson": [[call_deferred, ["play_cutscene", "blaine_wattson_event"]]], 

        "BlaineWattson_end": ["That was just like old times.", [call_deferred, ["reset_npc_facing", "Blaine"]]], 

        "2": [
            "Got a question for ya!", 
            "Which color beats RED?", 
            [
                ["GREEN", 
                    [
                    "Geez, you don't even know that...", 
                    [call_deferred, ["update_dialogue_progression", "Blaine", "2b"]], 
                    [call_deferred, ["reset_npc_facing", "Blaine"]], 
                    ], 
                ], 

                ["BLUE", 
                    [
                    "That's right!", 
                    "Now get ready for the real one...", 
                    "Which color beats BLACK?", 
                        [
                            ["WHITE", 
                                [
                                "Oh yeah! I can tell you're serious about Pokémon!", 
                                "Here ya go, a little something from me to help you out!", 
                                [call_deferred, ["get_item", "atk_up"]], 
                                [call_deferred, ["update_dialogue_progression", "Blaine", "2a"]], 
                                [call_deferred, ["reset_npc_facing", "Blaine"]], 
                                ], 
                            ], 

                            ["YELLOW", 
                                [
                                "Eh, wrong answer, but I guess that was pretty hard.", 
                                [call_deferred, ["update_dialogue_progression", "Blaine", "2b"]], 
                                [call_deferred, ["reset_npc_facing", "Blaine"]], 
                                ], 
                            ], 

                            ["BLACK", 
                                [
                                "Eh, wrong answer, but I guess that was pretty hard.", 
                                [call_deferred, ["update_dialogue_progression", "Blaine", "2b"]], 
                                [call_deferred, ["reset_npc_facing", "Blaine"]], 
                                ], 
                            ], 
                        ], 
                    ], 
                ], 

                ["YELLOW", 
                    [
                    "Geez, you don't even know that...", 
                    [call_deferred, ["update_dialogue_progression", "Blaine", "2b"]], 
                    [call_deferred, ["reset_npc_facing", "Blaine"]], 
                    ], 
                ], 

            ], 
        ], 

        "2a": ["The item I gave you will make your Pokémon stronger.", 
                "Don't forget to use it!", 
                [call_deferred, ["reset_npc_facing", "Blaine"]], 
        ], 

        "2b": ["You're still learning the basics, huh?", 
                "That's alright, don't get discouraged by your little blunder!", 
                [call_deferred, ["reset_npc_facing", "Blaine"]], 
        ], 

        "1": [
            "Hah! Newcomer, how about a quick match?", 
            [
                ["Sure", 
                    [
                    "Oh, yeah! Let's go!", 
                    [call_deferred, ["start_battle", "Blaine"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I'm all about red cards! You better have a burn heal!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "See ya."
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "That was awesome. I went all out.", 
            [call_deferred, ["update_dialogue_progression", "Blaine", "1_lost"]], 
        ], 

        "1_lost": [
            "You're on fire, kid! Keep going strong!", 
        ], 

        "1_win": [
            "Oh, come on! Put your back into it!", 
            [call_deferred, ["update_dialogue_progression", "Blaine", "1_won"]], 
        ], 

        "1_won": [
            "You lack energy! Where is your passion?", 
        ], 

        "booster": ["Here ya go, kid. You deserve it!", [call_deferred, ["get_booster", "red"]]]
    }, 

    "RocketF": {
        "0": ["Uh... Hi?"]
    }, 

    "RocketM": {
        "0": ["You better be careful."], 

        "event": ["Sit tight, we'll let you go soon enough."], 

        "letter": [
            "Do you have it?", 
                [
                    ["Yes", 
                        [[call_deferred, ["play_cutscene", "giovanni_event2"]]], 
                    ], 

                    ["Not yet", 
                        [
                            "Better get going, then."
                        ]

                    ]
                ]
            ], 

        "letter_open": ["I got my eye on you..."], 
    }, 

    "Giovanni": {
        "0": ["What's your deal, huh?", 
            "You better keep to yourself...", 
            [call_deferred, ["reset_npc_facing", "Giovanni"]]
        ], 

        "2": ["Hi."], 

        "1": [
            "Are you a new player? You probably shouldn't hang around here.", 
            [
                ["Wanna play?", 
                    [
                    "Heh, you're pretty brave. Let's see if you can handle this!", 
                    [call_deferred, ["start_battle", "Giovanni"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Listen kid, I'm after the most powerful cards there are.", 
                    "Doesn't matter to me if you know what's coming,", 
                    "There ain't nothing you can do about it! Hahahaha!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "You got guts, I admit.", 
            [call_deferred, ["update_dialogue_progression", "Giovanni", "1_lost"]], 
        ], 

        "1_lost": [
            "I see that you built your team with utmost care.", 
            "I hope that we play again.", 
        ], 

        "1_win": [
            "Ha! That was a truly intense fight!", 
            [call_deferred, ["update_dialogue_progression", "Giovanni", "1_won"]], 
        ], 

        "1_won": [
            "Mark my words.", 
            "Being unable to measure your own strength shows that you're still a child.", 
        ], 

        "booster": ["Here's a little something for you. Now you owe me...", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Koichi": {
        "0": ["Munch munch...", 
            "Recovering my strength... Fight later... Munch munch...", 
            [call_deferred, ["reset_npc_facing", "Koichi"]]
        ], 

        "1": [
            "Hmpft. You wish to challenge me?", 
            [
                ["Sure", 
                    [
                    "Then expect no mercy!", 
                    [call_deferred, ["start_battle", "Koichi"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I'm a master of YELLOW cards.", 
                    "Even though these ones might look weak,", 
                    "They will unleash their potential once properly trained."
                    ], 
                ], 

                ["Leave", 
                    [
                    "Train well."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Well fought. That was a clean match.", 
            [call_deferred, ["update_dialogue_progression", "Koichi", "1_lost"]], 
        ], 

        "1_lost": [
            "These cards hold great power within.", 
            "If we meet again, you might see for youself."
        ], 

        "1_win": [
            "Well fought. That was a clean match.", 
            [call_deferred, ["update_dialogue_progression", "Koichi", "1_won"]], 
        ], 

        "1_won": [
            "These cards hold great power within.", 
            "If we meet again you might see for youself."
        ], 

        "booster": ["To find greater strength... Here, take this.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Falkner": {
        "0": ["... Yeah, they got that card I wanted...", 
            "C'mon dad, please...", 
        ], 

        "2": [[call_deferred, ["play_cutscene", "falkner_event"]]], 

        "falkner_lost": ["It's over for me."], 
        "falkner_won": ["Now, as I was saying about my bird cards..."], 

        "1": [
            "Hey, let's have a battle!", 
            [
                ["Sure", 
                    [
                    "I'll show you the power of my bird cards!", 
                    [call_deferred, ["start_battle", "Falkner"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I'm a bird card collector! They're my favorite.", 
                    "It's a shame most of mine are white...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Not in the mood? That's lame."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Ack!! I even used my dad's card....", 
            [call_deferred, ["update_dialogue_progression", "Falkner", "1_lost"]], 
        ], 

        "1_lost": [
            "Well, a defeat is a defeat.", 

        ], 

        "1_win": [
            "My deck is pretty \"fly\", huh?", 
            [call_deferred, ["update_dialogue_progression", "Falkner", "1_won"]], 
        ], 

        "1_won": [
            "Sorry about my joke earlier.", 
            "People here sometimes say things like that..."
        ], 

        "booster": ["W-white cards are awesome, right?", "Here, have one on me...", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Bugsy": {
        "0": ["It's weird, but...", "There are no bugs in this hotel.", 
            [call_deferred, ["reset_npc_facing", "Bugsy"]]
        ], 

        "2": ["I need a {0} for my research... Would you accept a {1} for it?", 
            [call_deferred, ["show_trade_status"]], 
            [
                ["Let's trade!", 
                    [
                        [call_deferred, ["trade_pokemon"]]
                    ], 

                ], 

                ["Not interested.", 
                    [
                        "Really? My offer was generous...", 
                        [call_deferred, ["reset_npc_facing", "Bugsy"]], 
                    ]
                ]
            ], 

        ], 

        "trade0": ["Thank you, I can learn a lot from this!"], 
        "trade1": ["What? You don't have the card I need..."], 

        "1": [
            "Hi! Wanna have a quick match?", 
            [
                ["Sure", 
                    [
                    "Okay, let's go!", 
                    [call_deferred, ["start_battle", "Bugsy"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Well, I'm studying bug cards at the moment...", 
                    "As far as strategy goes, it's a shame most of them are green.", 
                    "I wonder if I can find an exception...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Okay, take care."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Whoa, you're pretty good...", 
            [call_deferred, ["update_dialogue_progression", "Bugsy", "1_lost"]], 
        ], 

        "1_lost": [
            "I'm a beginner, please take it easy next time...", 
        ], 

        "1_win": [
            "Wow, I won!!!", 
            [call_deferred, ["update_dialogue_progression", "Bugsy", "1_won"]], 
        ], 

        "1_won": [
            "I theorycrafted my team for so long, I'm glad it paid off!", 
        ], 

        "booster": ["Since you're so good and all, you might use this better than me...", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Whitney": {
        "0": ["Munch munch munch...", 

        ], 

        "1": [
            "Are you a newcomer too? We should definitely play!", 
            [
                ["Sure", 
                    [
                    "Hehe! I wonder if you can handle me...", 
                    [call_deferred, ["start_battle", "Whitney"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Everybody seems to be into this game, so I'm checking it out.", 
                    "I got some pretty strong white cards, they are super cute!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "So no game? You're no fun."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "N-noo!! Wahaaaaa!!!", 
            [call_deferred, ["update_dialogue_progression", "Whitney", "1_lost"]], 
        ], 

        "1_lost": [
            "You're mean...", 
        ], 

        "1_win": [
            "Hehe! You're all talk!", 
            [call_deferred, ["update_dialogue_progression", "Whitney", "1_won"]], 
        ], 

        "1_won": [
            "Get smoked!", 
        ], 

        "booster": ["Take this and go away! Wahaaaaa!!!", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Morty": {
        "0": ["The legendary cards...", 
            "These fools are clueless about them.", 
            [call_deferred, ["reset_npc_facing", "Bugsy"]]
        ], 

        "smt": [[call_deferred, ["play_cutscene", "smt"]]], 

        "smt_end": ["What have I done...", [call_deferred, ["reset_npc_facing", "Morty"]]], 

        "1": [
            "Oh, dear... Another dogged contender.", 
            [
                ["Wanna play?", 
                    [
                    "Draw, if you would...", 
                    [call_deferred, ["start_battle", "Morty"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My cards? They're but means to an end.", 
                    "The legendary cards... I'll be the one to wield them.", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Mark my words... You remain among the accursed.", 
            [call_deferred, ["update_dialogue_progression", "Morty", "1_lost"]], 
        ], 

        "1_lost": [
            "...", 
        ], 

        "1_win": [

            "Now do you believe in the unseen?", 
            [call_deferred, ["update_dialogue_progression", "Morty", "1_won"]], 
        ], 

        "1_won": [
            "You may rest here too, if you'd like...", 
        ], 

        "booster": ["... Now go away.", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Chuck": {
        "0": ["This cafeteria is pretty good, but...", 
            "I just wish they had some liquor!", 
            [call_deferred, ["reset_npc_facing", "Chuck"]]
        ], 

        "1": [
            "HEY KID! Come here, let's fight!", 
            [
                ["Sure", 
                    [
                    "Come on, we shall do battle!", 
                    [call_deferred, ["start_battle", "Chuck"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I train only the most vicious cards!", 
                    "Everyday we train under the... Uh, their colors?", 
                    "Uh... Mostly blue and yellow."
                    ], 
                ], 

                ["Leave", 
                    [
                    "Bah!"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Huh... How about that...", 
            "Hah! You're strong!", 
            [call_deferred, ["update_dialogue_progression", "Chuck", "1_lost"]], 
        ], 

        "1_lost": [
            "You're a good sport, kid!", 
        ], 

        "1_win": [
            "That was a good workout!", 
            [call_deferred, ["update_dialogue_progression", "Chuck", "1_won"]], 
        ], 

        "1_won": [
            "You're a good sport, kid!", 
        ], 

        "booster": ["Here, kid! A little something for ya.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Jasmine": {
        "0": ["O-oh! Please, go ahead.", 
        [call_deferred, ["reset_npc_facing", "Jasmine"]]

        ], 

        "1": [
            "...Er... W-would you like to have a battle?", 
            [
                ["Sure", 
                    [
                    "O-okay!", 
                    "...Um... May I begin?", 
                    [call_deferred, ["start_battle", "Jasmine"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Oh! I like yellow cards.", 
                    "I got lucky and pulled a few strong ones...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Oh, I wasn’t strong enough...", 
            [call_deferred, ["update_dialogue_progression", "Jasmine", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ll keep my heart steady and not give up!", 
        ], 

        "1_win": [
            "Wow, I got lucky!", 
            [call_deferred, ["update_dialogue_progression", "Jasmine", "1_won"]], 
        ], 

        "1_won": [
            "Please don’t be discouraged... You did well.", 
        ], 

        "booster": ["H-here, I want you to have this...", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Clair": {
        "0": ["What?! Not now.", 
        [call_deferred, ["reset_npc_facing", "Clair"]]
        ], 

        "ClairIris": [[call_deferred, ["play_cutscene", "clair_iris_event"]]], 

        "ClairIris_lost": ["My feet hurts today, that must be why I lost...", [call_deferred, ["reset_npc_facing", "Clair"]]], 
        "ClairIris_won": ["You have served your purpose, now begone.", [call_deferred, ["reset_npc_facing", "Clair"]]], 

        "2": ["Common trainer...", 
            "I shall grace you with a {1}, should you give me your {0}.", 
            [call_deferred, ["show_trade_status"]], 
            [
                ["Let's trade!", 
                    [
                        [call_deferred, ["trade_pokemon"]]
                    ], 

                ], 

                ["Not interested.", 
                    [
                        "What!? How dare you deny me!", 
                        [call_deferred, ["reset_npc_facing", "Clair"]], 
                    ]
                ]
            ], 

        ], 

        "trade0": ["You've served your purpose. You may leave."], 
        "trade1": ["Such insolence... I should strike you down where you stand."], 

        "1": [
            "Excuse me?", 
            [
                ["Wanna play?", 
                    [
                    "You dare to challenge me? I will use my full power!", 
                    [call_deferred, ["start_battle", "Clair"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Why are you acting like you don't know me?", 
                    "I am Clair. The world's best dragon master!", 
                    "Bring your strongest green cards, they won't help you a bit.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "That's an intelligent decision."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "What..? I never expected anyone to beat me...", 
            [call_deferred, ["update_dialogue_progression", "Clair", "1_lost"]], 
        ], 

        "1_lost": [
            "G-get lost!", 
        ], 

        "1_win": [
            "You disappoint me.", 
            [call_deferred, ["update_dialogue_progression", "Clair", "1_won"]], 
        ], 

        "1_won": [
            "It's futile to challenge me at your skill level.", 
        ], 

        "booster": ["Maybe... Maybe you're the one who should have this...", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Janine": {
        "0": ["Shh! I'm gathering some intel.", 
        [call_deferred, ["reset_npc_facing", "Janine"]]
        ], 

        "2": ["Eek!", 
        "H-how did you find me?", 
        "L-look, I was just playing around, okay? Let's not do anything rash...", 
        [call_deferred, ["reset_npc_facing", "Janine"]]
        ], 

        "1": [
            "Fufufufu...", 
            [
                ["Wanna play?", 
                    [
                    "I'll avenge our clan! ... Just kidding!", 
                    [call_deferred, ["start_battle", "Janine"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I am a master of poison techniques!", 
                    "Burns deal damage according to the target maximum health.", 
                    "The more HP they have, the more damage they suffer!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Aw, you got me excited..."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "So strong! You got a great technique.", 
            [call_deferred, ["update_dialogue_progression", "Janine", "1_lost"]], 
        ], 

        "1_lost": [
            "I'm still training, soon I'll be stronger than you!", 
        ], 

        "1_win": [
            "Heh, you're pretty good.", 
            [call_deferred, ["update_dialogue_progression", "Janine", "1_won"]], 
        ], 

        "1_won": [
            "The world needs only one poison ninja!", 
            "... I'm only joking!"
        ], 

        "booster": ["I wonder how you'd use this... I'll be watching!", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Karen": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Karen"]]
        ], 

        "1": [
            "Never seen you here before. Are you lost, little lamb?", 
            [
                ["Wanna play?", 
                    [
                    "Well, aren't you daring? Just try to entertain me!", 
                    [call_deferred, ["start_battle", "Karen"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Fufufu... Are you nervous?", 
                    "My black cards are quite overpowering.", 
                    "Should you be my next prey?", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Well, aren't you good. I like your style.", 
            [call_deferred, ["update_dialogue_progression", "Karen", "1_lost"]], 
        ], 

        "1_lost": [
            "Skilled players should use the cards they like best.", 
            "I'm glad you understand that.", 
        ], 

        "1_win": [
            "Well, that was somewhat entertaining.", 
            [call_deferred, ["update_dialogue_progression", "Karen", "1_won"]], 
        ], 

        "1_won": [
            "Try again when you're a bit older, okay?", 
        ], 

        "booster": ["Here's a gift, dear. Make sure to use it wisely.", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Bruno": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Bruno"]]
        ], 

        "1": [
            "Are you a player? You've done well to last until this point.", 
            [
                ["Wanna play?", 
                    [
                    "Very well. I will stand up to your challenge!", 
                    [call_deferred, ["start_battle", "Bruno"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My yellow cards were trained to the extreme.", 
                    "They will grind you down with their superior power.", 
                    "Hoo hah!", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "H-How could I lose?", 
            [call_deferred, ["update_dialogue_progression", "Bruno", "1_lost"]], 
        ], 

        "1_lost": [
            "Having lost, I have no right to say anything.", 
            "Go face your next challenge.", 
        ], 

        "1_win": [
            "Your range is one fist short.", 
            [call_deferred, ["update_dialogue_progression", "Bruno", "1_won"]], 
        ], 

        "1_won": [
            "Now do you understand? You're ten years too early!", 
        ], 

        "booster": ["Here, to commemorate your victory.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Agatha": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Agatha"]]
        ], 

        "1": [
            "Can you believe this old duff was once tough and handsome?", 
            [
                ["Wanna play?", 
                    [
                    "I'll show you how a real player fights!", 
                    [call_deferred, ["start_battle", "Agatha"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hohoho, my cards are the most terrifying of them all...", 
                    "You'll be seeing my green and black Pokémon in your nightmares!", 
                    "Bahaha!"
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Oh ho! You're something special, child!", 
            [call_deferred, ["update_dialogue_progression", "Agatha", "1_lost"]], 
        ], 

        "1_lost": [
            "Well, what are you waiting for? Run along now, child!", 
        ], 

        "1_win": [
            "That's how a proper battle's done!", 
            [call_deferred, ["update_dialogue_progression", "Agatha", "1_won"]], 
        ], 

        "1_won": [
            "Now, now, dear, go play with the other kids.", 
        ], 

        "booster": ["There's nothing like a thrilling battle... Here's something for you trouble!", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Lorelei": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Lorelei"]]
        ], 

        "1": [
            "Hm? I'm surprised a newcomer came this far.", 
            [
                ["Wanna play?", 
                    [
                    "Sure, I'll take you for a joyride!", 
                    [call_deferred, ["start_battle", "Lorelei"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "No one can best me when it comes to blue cards.", 
                    "No matter where you put them, your cards will be at my mercy.", 
                    "Would you like a taste?"
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "You're better than I thought!", 
            [call_deferred, ["update_dialogue_progression", "Lorelei", "1_lost"]], 
        ], 

        "1_lost": [
            "You only got a taste... I Wonder how you'd do against Lance.", 
        ], 

        "1_win": [
            "Done already? I was just warming up...", 
            [call_deferred, ["update_dialogue_progression", "Lorelei", "1_won"]], 
        ], 

        "1_won": [
            "That was disappointing, but that's what I get for playing with kids...", 
        ], 

        "booster": ["Do you realize what you're up against? You might need this.", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Lance": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Lance"]]
        ], 

        "1": [
            "Ah! I heard about you. I'm the champion, Lance!", 
            [
                ["Let's end it!", 
                    [
                    "Are you ready to lose? Your run ends with me!", 

                    [call_deferred, ["start_battle", "Lance"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My cards are virtually indestructible.", 
                    "There's no being clever with them, you're just done.", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "N-no...", 
            [call_deferred, ["update_dialogue_progression", "Lance", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "It's over...", 
        ], 

        "1_win": [
            "This shit ain't NOTHING to me, man.", 
            [call_deferred, ["update_dialogue_progression", "Lance", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "I got no sympathy. I LIVE for this shit.", 
        ], 

        "booster": ["Welp, here you go I guess.", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Roxanne": {
        "0": ["\"How to Pick Up Fair Maidens\"? Unacceptable.", 

        ], 

        "RoxanneBrawly": [[call_deferred, ["play_cutscene", "roxanne_brawly_event"]]], 

        "RoxanneBrawly_end": ["Dealing with Brawly can be really frustrating, but...", "Humpf. Never mind.", [call_deferred, ["reset_npc_facing", "Roxanne"]]], 

        "1": [
            "A new face? Would you kindly demonstrate how you battle?", 
            [
                ["Sure", 
                    [
                    "I've been preparing for this moment!", 
                    [call_deferred, ["start_battle", "Roxanne"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I've studied all about this game...", 
                    "Do you know about RED and GREEN synergies?", 
                    "What am I saying... of course you don't.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Okay... bye-bye."
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "It seems that I still have much more to learn...", 
            [call_deferred, ["update_dialogue_progression", "Roxanne", "1_lost"]], 
        ], 

        "1_lost": [
            "Since you're so good and all, you should challenge Brawly.", 
            "Heh, I'd like to see that..."
        ], 

        "1_win": [
            "A by-the-book victory...", 
            [call_deferred, ["update_dialogue_progression", "Roxanne", "1_won"]], 
        ], 

        "1_won": [
            "I play straight fundamentals!", 
        ], 

        "booster": ["Here, make sure it read it properly.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Brawly": {
        "0": ["Dude, the chicks here are totally hot!", 
            [call_deferred, ["reset_npc_facing", "Brawly"]]

        ], 

        "RoxanneBrawly": [[call_deferred, ["play_cutscene", "roxanne_brawly_event"]]], 

        "RoxanneBrawly_end": ["Heh, that was just like us in middle school.", "Remember, Roxy?", [call_deferred, ["reset_npc_facing", "Brawly"]]], 


        "1": [
            "Yo bud, you aren't like those sweats in there, right? Let's play!", 
            [
                ["Sure", 
                    [
                    "Heh, get ready for a churning!", 
                    [call_deferred, ["start_battle", "Brawly"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hey man, don't worry about it!", 
                    "No need to take it so seriously, chill out!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Dude? C'mon!"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Whoa, wow! Okay, calm down!", 
            [call_deferred, ["update_dialogue_progression", "Brawly", "1_lost"]], 
        ], 

        "1_lost": [
            "Geez, you didn't have to dab on me like that...", 
        ], 

        "1_win": [
            "Yeah, I'm a big deal!", 
            [call_deferred, ["update_dialogue_progression", "Brawly", "1_won"]], 
        ], 

        "1_won": [
            "This tournament is for pros only!", 
            "At least that's what Roxy's always saying...", 
        ], 

        "booster": ["Here, here, take it easy!", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Wattson": {
        "0": [
            "Kids these days don't even adapt their deck to their opponent's!", 
            "Can you imagine trying to brute-force your way through the tournament?", 
            "Wahahaha!", 
            [call_deferred, ["reset_npc_facing", "Wattson"]]

        ], 

        "BlaineWattson": [[call_deferred, ["play_cutscene", "blaine_wattson_event"]]], 

        "BlaineWattson_end": ["Treasure the friends you have, kiddo, they'll last a lifetime!", [call_deferred, ["reset_npc_facing", "Wattson"]]], 

        "1": [
            "Hey, kid! Step up for a few rounds, will ya?", 
            [
                ["Sure", 
                    [
                    "I like your enthusiasm, let's get amped up!", 
                    [call_deferred, ["start_battle", "Wattson"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Kid, YELLOW cards are the greatest!", 
                    "This old dog has plenty of tricks left on him...", 
                    "Wahahahaha!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Hah! That was quite a thrill!", 
            [call_deferred, ["update_dialogue_progression", "Wattson", "1_lost"]], 
        ], 

        "1_lost": [
            "I'll recharge my batteries at the cafeteria!", 
        ], 

        "1_win": [
            "Wahahaha! Shocking, isn’t it?", 
            [call_deferred, ["update_dialogue_progression", "Wattson", "1_won"]], 
        ], 

        "1_won": [
            "You have a lot of zip!", 
            "... That's a good thing! Wahahahaha!", 
        ], 

        "booster": ["Hahahah! Thanks for the match, here's something for you!", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Flannery": {
        "0": ["C'mon Flannery, you can do it..."], 

        "2": ["H-hey, do you have a {0}? I'll give you a {1} for it.", 
            [call_deferred, ["show_trade_status"]], 
            [
                ["Let's trade!", 
                    [
                        [call_deferred, ["trade_pokemon"]]
                    ], 

                ], 

                ["Not interested.", 
                    [
                        "Oh, that sucks...", 
                        [call_deferred, ["reset_npc_facing", "Flannery"]], 
                    ]
                ]
            ], 

        ], 

        "trade0": ["Thanks! But don't expect kindness from me on the battlefield!"], 
        "trade1": ["Are you trying to scam me? Get lost!"], 

        "FlanneryCandice": [[call_deferred, ["play_cutscene", "flannery_candice_event"]]], 

        "FlanneryCandice_end": ["Can you believe she said that...?", [call_deferred, ["reset_npc_facing", "Flannery"]]], 


        "1": [
            "Puny player! Let's fight!", 
            [
                ["Sure", 
                    [
                    "I’ll show you my burning spirit!", 
                    [call_deferred, ["start_battle", "Flannery"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I got the most powerful RED cards there are!", 
                    "No matter how many guys you have, they'll all burn out!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "Hey, I'm talking to you!"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Dammit... I guess I was trying too hard.", 
            [call_deferred, ["update_dialogue_progression", "Flannery", "1_lost"]], 
        ], 

        "1_lost": [
            "Sigh... I need a bath...", 
        ], 

        "1_win": [
            "Whew! On the verge of eruption!", 
            [call_deferred, ["update_dialogue_progression", "Flannery", "1_won"]], 
        ], 

        "1_won": [
            "Don't worry, you did great!", 
            "I-I mean, it's no shame losing to me!"
        ], 

        "booster": ["Here, I'm sorry for being cringe earlier.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Norman": {
        "0": ["My favorite drink? Water, no ice.", 
            "And let me have a side of stale bread.", 
            [call_deferred, ["reset_npc_facing", "Norman"]]
        ], 

        "1": [
            "Your deck... It's all over the place, what a mess.", 
            [
                ["Wanna play?", 
                    [
                    "What, a noob like you challenging me? Give it your best shot, at least!", 
                    [call_deferred, ["start_battle", "Norman"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My cards? White.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "... I... I can't...", 
            [call_deferred, ["update_dialogue_progression", "Norman", "1_lost"]], 
        ], 

        "1_lost": [
            "Not bad... It was a good battle.", 
        ], 

        "1_win": [
            "Now go home and clean your room!", 
            [call_deferred, ["update_dialogue_progression", "Norman", "1_won"]], 
        ], 

        "1_won": [
            "This tournament is taking forever.", 
            "At this pace, I'll miss tonight's episode of The Simpsons!"
        ], 

        "booster": ["This might help balance out your deck.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Winona": {
        "0": ["The air here... is too stagnant.", 
        [call_deferred, ["reset_npc_facing", "Winona"]]
        ], 

        "1": [
            "A new player? Are you interested in a duel?", 
            [
                ["Sure", 
                    [
                    "Let's fight with grace!", 
                    [call_deferred, ["start_battle", "Winona"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I use mostly WHITE and BLUE cards.", 
                    "I lean on their high speed to swiftly end the fight.", 
                    "Do you think you can stop me?", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Very well, I recognize your talent.", 
            [call_deferred, ["update_dialogue_progression", "Winona", "1_lost"]], 
        ], 

        "1_lost": [
            "I know you'll keep aiming higher and higher!", 
        ], 

        "1_win": [
            "That was a fine battle, don't be discouraged.", 
            [call_deferred, ["update_dialogue_progression", "Winona", "1_won"]], 
        ], 

        "1_won": [
            "I know you'll keep aiming higher and higher!", 
        ], 

        "booster": ["I hope this helps you fly even farther beyond!", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Wallace": {
        "0": [
            "Pressing INFO over a Pokémon to quickly adjust their moveset...", 
            "Oh yes, simply delightful.", 
            "Hohohohoho...!", 
            [call_deferred, ["reset_npc_facing", "Wallace"]]
        ], 

        "1": [
            "Oh? Could it be you want to challenge me?", 
            [
                ["Sure", 
                    [
                    "Ohohoho... Then I shall present you with my best performance!", 
                    [call_deferred, ["start_battle", "Wallace"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My cards... Are only the most exquisite BLUE cards there are.", 
                    "Are you intrigued? It will be my pleasure to showcase them...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "No? Then how about a kiss?"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Bravo...", 
            [call_deferred, ["update_dialogue_progression", "Wallace", "1_lost"]], 
        ], 

        "1_lost": [
            "Never forget the battle we shared...", 
        ], 

        "1_win": [
            "That was a masterful performance!", 
            [call_deferred, ["update_dialogue_progression", "Wallace", "1_won"]], 
        ], 

        "1_won": [
            "Never forget the battle we shared...", 
        ], 

        "booster": ["Here, something for your next performance...", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Sidney": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Well, well... Are you feeling lucky?", 
            [
                ["Wanna play?", 
                    [
                    "Heh, I like that look you're giving me.", 
                    "Alright, let's battle!", 
                    [call_deferred, ["start_battle", "Sidney"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Heh, I go all-out on offense with BLACK cards.", 
                    "I got some pretty strong ones, you might not be able to take me...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Guess that's it.", 
            [call_deferred, ["update_dialogue_progression", "Sidney", "1_lost"]], 
        ], 

        "1_lost": [
            "Eh, it was fun.", 
        ], 

        "1_win": [
            "Heheheh. No hard feelings, alright?", 
            [call_deferred, ["update_dialogue_progression", "Sidney", "1_won"]], 
        ], 

        "1_won": [
            "Eh, it was fun.", 
        ], 

        "booster": ["Well, I might as well give you this.", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Phoebe": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Oh? ... What are you doing in a place like this?", 
            [
                ["Wanna play?", 
                    [
                    "Ahahaha! You're brave!", 
                    "Just try and see if you can damage on my Pokémon!", 
                    [call_deferred, ["start_battle", "Phoebe"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My BLACK cards focus on defensive techniques.", 
                    "You might not even be able to touch them...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Oh, darn!", 
            [call_deferred, ["update_dialogue_progression", "Phoebe", "1_lost"]], 
        ], 

        "1_lost": [
            "What a shame... Well, the world keeps spinning.", 
        ], 

        "1_win": [
            "Mhm, you did well.", 
            [call_deferred, ["update_dialogue_progression", "Phoebe", "1_won"]], 
        ], 

        "1_won": [
            "Seems like you're attached to your cards...", 
            "That is the best way to play."
        ], 

        "booster": ["Take good care of this for me, okay?", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Drake": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Humpf! Came this far, have you?", 
            "Do you think you have what it takes to be the champion?", 
            [
                ["Wanna play?", 
                    [
                    "Very well... Let's see if you can prevail over me!", 
                    [call_deferred, ["start_battle", "Drake"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I train the cards with the highest stats, no matter the color.", 
                    "Although I'm packing a real WHITE menace...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Superb, it should be said.", 
            [call_deferred, ["update_dialogue_progression", "Drake", "1_lost"]], 
        ], 

        "1_lost": [
            "You do seem to know what is needed.", 
            "Yes, what a player needs is a virtuous heart!"
        ], 

        "1_win": [
            "Pay attention! You hesitated too much!", 
            [call_deferred, ["update_dialogue_progression", "Drake", "1_won"]], 
        ], 

        "1_won": [
            "You're still too soft for the big leagues.", 
        ], 

        "booster": ["You have proven your worth. I'm sure you'll use this well.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Steven": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Hi! My name is Steven. Have we met?", 
            [
                ["Let's finish this!", 
                    [
                    "Very well, bring it!", 

                    [call_deferred, ["start_battle", "Steven"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "When it comes down to it, I'm still the strongest player here.", 
                    "My cards are all YELLOW. Go ahead and try to counter me.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "... Kudos to you, you're a true Pokémon Master!", 
            [call_deferred, ["update_dialogue_progression", "Steven", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "May our paths cross again someday.", 
        ], 

        "1_win": [
            "Whew, that was too tense.", 
            [call_deferred, ["update_dialogue_progression", "Steven", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "I must go. May our journeys cross again.", 
        ], 

        "booster": ["I got something for you.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Roark": {
        "0": ["Ugh, these new cards are so lame.", 
            [call_deferred, ["reset_npc_facing", "Roark"]]
        ], 

        "1": [
            "Hi. You're new, aren't you?", 
            "As a tough player myself, I need to see your potential in battle!", 
            [
                ["Wanna play?", 
                    [
                    "Stand back and watch this!", 
                    [call_deferred, ["start_battle", "Roark"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I proudly use RED cards!", 
                    "I have ones that excel in offense and defense.", 
                    "You can't get around them!"
                    ], 
                ], 

                ["Leave", 
                    [
                        "Oh, so no game?"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "W-what? That can't be! My buffed-up Pokémon!", 
            [call_deferred, ["update_dialogue_progression", "Roark", "1_lost"]], 
        ], 

        "1_lost": [
            "That was embarrassing...", 
        ], 

        "1_win": [
            "Hey, was that your first time?", 
            [call_deferred, ["update_dialogue_progression", "Roark", "1_won"]], 
        ], 

        "1_won": [
            "Heh, weak players need to be smashed so they get out of the way!", 
        ], 

        "booster": ["Well, I lost, so... You can have this.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Gardenia": {
        "0": ["Are you going to the Game Room?", 
            "I'll buy some items at the cafeteria first.", 
            [call_deferred, ["reset_npc_facing", "Gardenia"]]
        ], 

        "1": [
            "Let's cut to the good stuff! Wanna battle?", 
            [
                ["Sure", 
                    [
                    "This will be fun!", 
                    [call_deferred, ["start_battle", "Gardenia"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I'm a GREEN card master!", 
                    "I'll prove GREEN cards aren't just pretty to look at!", 
                    ], 
                ], 

                ["Leave", 
                    [
                        "Huh, you aren't playing?"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Wow, that was pretty good!", 
            [call_deferred, ["update_dialogue_progression", "Gardenia", "1_lost"]], 
        ], 

        "1_lost": [
            "You got me this time, but I'll have my payback!", 
        ], 

        "1_win": [
            "Heh, I got you!", 
            [call_deferred, ["update_dialogue_progression", "Gardenia", "1_won"]], 
        ], 

        "1_won": [
            "I won this time.", 
            "Hopefully this motivates you to get even stronger!", 
        ], 

        "booster": ["Here you go, a gift from me!", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Fantina": {
        "0": ["Hm... What an intriguing flavor!", 
            [call_deferred, ["reset_npc_facing", "Fantina"]]
        ], 

        "1": [
            "Ohohoho!! I came to this country so I could play more card games!", 
            [
                ["Wanna play?", 
                    [
                    "Tehehe... let's enjoy ourselves!", 
                    [call_deferred, ["start_battle", "Fantina"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Ohohoho... Are you anxious?", 
                    "I shan't reveal my techniques just yet...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "You are so fantastically strong!", 
            [call_deferred, ["update_dialogue_progression", "Fantina", "1_lost"]], 
        ], 

        "1_lost": [
            "I'm glad we got to play! C'est fantastique!", 
        ], 

        "1_win": [
            "You are strong. But it's me who won.", 
            [call_deferred, ["update_dialogue_progression", "Fantina", "1_won"]], 
        ], 

        "1_won": [
            "You shall challenge me again, yes?", 
        ], 

        "booster": ["You deserve this, non?", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Candice": {
        "0": ["Uh...", "Sorry, I'm focused on something else right now.", 
            [call_deferred, ["reset_npc_facing", "Candice"]]
        ], 

        "FlanneryCandice": [[call_deferred, ["play_cutscene", "flannery_candice_event"]]], 

        "FlanneryCandice_end": ["Now give us some room, will ya!?", [call_deferred, ["reset_npc_facing", "Candice"]]], 

        "1": [
            "Let's cut to the good stuff! Wanna battle?", 
            [
                ["Sure", 
                    [
                    "Alright, I was waiting for someone tough!", 
                    [call_deferred, ["start_battle", "Candice"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I focus on BLUE offense.", 
                    "But my cards might not be what you expect...", 
                    ], 
                ], 

                ["Leave", 
                    [
                        "Huh, you aren't playing?"
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Oof, I got bowled over...", 
            [call_deferred, ["update_dialogue_progression", "Candice", "1_lost"]], 
        ], 

        "1_lost": [
            "You've earned my respect!", 
        ], 

        "1_win": [
            "Seems like you got bowled over!", 
            [call_deferred, ["update_dialogue_progression", "Candice", "1_won"]], 
        ], 

        "1_won": [
            "I sensed your will to win, but I don't lose!", 
        ], 

        "booster": ["Here, use this to get even stronger!", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Volkner": {
        "0": ["Geez, it sure is boring around here.", 
        [call_deferred, ["reset_npc_facing", "Volkner"]]
        ], 

        "1": [
            "... What is it?", 
            [
                ["Wanna play?", 
                    [
                    "Well... I guess.", "Hopefully you're less boring than the other players here.", 
                    [call_deferred, ["start_battle", "Volkner"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I like YELLOW cards.", 
                    "Don't worry, though. You're probably not ready to battle me.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "You've got me beat... I'm shocked!", 
            [call_deferred, ["update_dialogue_progression", "Volkner", "1_lost"]], 
        ], 

        "1_lost": [
            "...Hehehe. Hahahah!", "...That was the most fun I've had in a battle since...", "I don't even know when!", 
        ], 

        "1_win": [
            "Aww, come on now. Don't disappoint me...", 
            [call_deferred, ["update_dialogue_progression", "Volkner", "1_won"]], 
        ], 

        "1_won": [
            "Well, that was almost good.", 
        ], 

        "booster": ["Thanks for the awesome battle.", "Have a booster on me.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Flint": {
        "0": ["The card shop changes the cards on sale frequently.", 
            "You can see what they have on the TV over there.", 
            [call_deferred, ["reset_npc_facing", "Flint"]]
        ], 

        "1": [
            "Yo! Exciting tournament today, isn't it?", 
            [
                ["Wanna play?", 
                    [
                    "You bet, I'm about to go full throttle!", 
                    [call_deferred, ["start_battle", "Flint"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "You're facing a RED card user with me.", 
                    "Let me see how hot your spirit burns!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "I don't believe it! I lost!", 
            [call_deferred, ["update_dialogue_progression", "Flint", "1_lost"]], 
        ], 

        "1_lost": [
            "I'm blown away, you're hot stuff!", 
        ], 

        "1_win": [
            "Burnt right down to cinders!", 
            [call_deferred, ["update_dialogue_progression", "Flint", "1_won"]], 
        ], 

        "1_won": [
            "Hm... I think you need a bit more passion.", 
        ], 

        "booster": ["Have this on me, amigo.", "Let your passion for battle burn!", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Cyrus": {
        "0": ["I remain here only to observe these midwits more closely.", 
            [call_deferred, ["reset_npc_facing", "Cyrus"]]
        ], 

        "1": [
            "Your presence disrupts the equilibrium of this hall.", 
            "A battle will allow me to restore it.", 
            [
                ["Wanna play?", 
                    [
                    "Prepare yourself.", 
                    [call_deferred, ["start_battle", "Cyrus"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I do not wish to converse.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Do not misinterpret this outcome as ‘victory.’", 
            "I merely allowed you to play your part.", 
            [call_deferred, ["update_dialogue_progression", "Cyrus", "1_lost"]], 
        ], 

        "1_lost": [
            "... A result I must record carefully.", 
        ], 

        "1_win": [
            "Your uncertainty was evident in every move.", 
            [call_deferred, ["update_dialogue_progression", "Cyrus", "1_won"]], 
        ], 

        "1_won": [
            "You may challenge me again when you have refined your purpose.", 
            "Until then, do not waste my time.", 
        ], 

        "booster": ["Consider this compensation for participating in my analysis.", "Do not assume it is a gesture of sentiment.", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Cynthia": {
        "0": ["Hi.", 
        ], 

        "1": [
            "I'm Cythia. A player, just like you.", 
            "Let's get on with why you're here, then?", 
            [
                ["Let's finish this!", 
                    [
                    "Very well, I accept your challenge!", 

                    [call_deferred, ["start_battle", "Cynthia"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Well... I guess you're about to find out.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "That was excellent. Truly, an outstanding battle.", 
            [call_deferred, ["update_dialogue_progression", "Cynthia", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "My heart is pounding so hard because I had such a heated battle with you.", "You are a really great player!", 
        ], 

        "1_win": [
            "No matter how fun the battle is, it will always end sometime...", 
            [call_deferred, ["update_dialogue_progression", "Cynthia", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "The road before you is still long, but never give up!", 
        ], 

        "booster": ["I got something for you.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Palmer": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Come on, show me the strength you’ve been building.", 
            [
                ["Let's finish this!", 
                    [
                    "You're on!", 

                    [call_deferred, ["start_battle", "Palmer"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I choose powerful, reliable cards.", 
                    "I use several different colors, there's no way around me."
                    ], 
                ], 

                ["Leave", 
                    [
                        [call_deferred, ["reset_npc_facing", "Palmer"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Impressive... you’ve surpassed my expectations.", 
            [call_deferred, ["update_dialogue_progression", "Palmer", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "You’ve got potential. Keep honing it.", 
        ], 

        "1_win": [
            "That was a good effort. Experience like this is priceless.", 
            [call_deferred, ["update_dialogue_progression", "Palmer", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "Don’t take it too hard.", 
            "Strength comes from persistence."
        ], 

        "booster": ["Here, take this pack. Consider it a reward for your effort.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Elesa": {
        "0": ["People often underestimate the SPEED stat.", 
                "However, striking first is a huge advantage.", 
                "Never forget that.", 
                [call_deferred, ["reset_npc_facing", "Elesa"]]
        ], 

        "BurghElesa": [[call_deferred, ["play_cutscene", "burgh_elesa_event"]]], 
        "BurghElesa_end": ["Sigh...", "Sorry for getting you involved.", [call_deferred, ["reset_npc_facing", "Elesa"]]], 

        "1": [
            "Oh? Are you looking for your next duel?", 
            [
                ["Wanna play?", 
                    [
                    "Let's see if you can shine under the spotlight!", 
                    [call_deferred, ["start_battle", "Elesa"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My cards are YELLOW.", 
                    "Fast and stylish, I guarantee a perfect performance...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Elesa"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Looks like you outshined me...", 
            [call_deferred, ["update_dialogue_progression", "Elesa", "1_lost"]], 
        ], 

        "1_lost": [
            "Guess I stumbled... My deck still needs some refinement.", 
        ], 

        "1_win": [
            "I hope that was as electrifying for you as it was for me...", 
            [call_deferred, ["update_dialogue_progression", "Elesa", "1_won"]], 
        ], 

        "1_won": [
            "Even though you're a bit dim, you shouldn't lose your spark.", 
        ], 

        "booster": ["Here. A chance to shine even brighter...", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Skyla": {
        "0": ["A rarer card is usually also more powerful.", 
            "It's a good idea to build your team around a super rare card, if you find one.", 
            [call_deferred, ["reset_npc_facing", "Skyla"]]
        ], 

        "1": [
            "Wow, the game room is packed today!", 
            [
                ["Wanna play?", 
                    [
                    "You bet! Let's take off!", 
                    [call_deferred, ["start_battle", "Skyla"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck is really diverse...", 
                    "Don't expect me to be an easy prey!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Skyla"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Guess my plan had a few holes...", 
            [call_deferred, ["update_dialogue_progression", "Skyla", "1_lost"]], 
        ], 

        "1_lost": [
            "You really caught me off guard!", 
        ], 

        "1_win": [
            "And... Smooth landing!", 
            [call_deferred, ["update_dialogue_progression", "Skyla", "1_won"]], 
        ], 

        "1_won": [
            "Don’t worry, you'll improve before you know it!", 
        ], 

        "booster": ["Here’s a booster on me! Thank you for the cool match.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Burgh": {
        "0": ["The six colors...", 
                "Each tells a different story.", 
                [call_deferred, ["reset_npc_facing", "Burgh"]]
        ], 

        "BurghElesa": [[call_deferred, ["play_cutscene", "burgh_elesa_event"]]], 

        "BurghElesa_end": ["The games of cat and mouse we play...", [call_deferred, ["reset_npc_facing", "Burgh"]]], 

        "1": [
            "A match...!", 
            [
                ["Wanna play?", 
                    [
                    "Let’s create something beautiful together!", 
                    [call_deferred, ["start_battle", "Burgh"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I appreciate all colors, but GREEN is the most beautiful.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Burgh"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Oh! What a stunning composition!", 
            [call_deferred, ["update_dialogue_progression", "Burgh", "1_lost"]], 
        ], 

        "1_lost": [
            "Your play style... It’s inspiring!", 

        ], 

        "1_win": [
            "Another masterpiece! You played your part beautifully.", 
            [call_deferred, ["update_dialogue_progression", "Burgh", "1_won"]], 
        ], 

        "1_won": [
            "Don’t be disheartened! Even failure can be art!", 
        ], 

        "booster": ["Here, take this booster! Perhaps a muse awaits inside.", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Clay": {
        "0": ["You can buy cards at the shop and items at the cafeteria.", 
            "Check them out before it's too late.", 
                [call_deferred, ["reset_npc_facing", "Clay"]]
        ], 

        "1": [
            "Well now, how ‘bout a duel?", 
            [
                ["Sure", 
                    [
                    "Let’s see what you’re made of!", 
                    [call_deferred, ["start_battle", "Clay"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I stick to RED cards.", 
                    "Solid and dependable, just how I like it."
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Clay"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Hmph. Guess I found out.", 
            [call_deferred, ["update_dialogue_progression", "Clay", "1_lost"]], 
        ], 

        "1_lost": [
            "Can’t complain.", 
        ], 

        "1_win": [
            "Heh! That’s how I do my business.", 
            [call_deferred, ["update_dialogue_progression", "Clay", "1_won"]], 
        ], 

        "1_won": [
            "Ain’t no shame in gettin’ knocked down once or twice.", 
        ], 

        "booster": ["Take this booster. Consider it an investment.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Lenora": {
        "0": ["They sell stat-boosting items at the cafeteria.", 
                "Those items become more effective the less rare a card is.", 
                "If you use them wisely, a common Pokémon might become your ace!", 
                [call_deferred, ["reset_npc_facing", "Lenora"]]
        ], 

        "1": [
            "Oh? Would you like to challenge me?", 
            [
                ["Sure", 
                    [
                    "Okay sweetie, do your best!", 
                    [call_deferred, ["start_battle", "Lenora"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I use mostly WHITE cards.", 
                    "They're simple at first glance, but also full of depth."
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Lenora"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Well done! You have strong fundamentals.", 
            [call_deferred, ["update_dialogue_progression", "Lenora", "1_lost"]], 
        ], 

        "1_lost": [
            "There’s always more to learn.", 
        ], 

        "1_win": [
            "Knowledge always pays off!", 
            [call_deferred, ["update_dialogue_progression", "Lenora", "1_won"]], 
        ], 

        "1_won": [
            "You did really well!", 
        ], 

        "booster": ["Here, I hope to see you around again!", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Iris": {
        "0": ["I'm bored, someone please duel me already!", 
                [call_deferred, ["reset_npc_facing", "Iris"]]
        ], 

        "ClairIris": [[call_deferred, ["play_cutscene", "clair_iris_event"]]], 
        "ClairIris_won": ["Please help...", [call_deferred, ["reset_npc_facing", "Iris"]]], 
        "ClairIris_lost": ["I don't care about roleplaying, I play for the love of the game.", [call_deferred, ["reset_npc_facing", "Iris"]]], 

        "1": [
            "Hey, let’s battle! I promise I’ll take it easy!", 
            [
                ["Sure", 
                    [
                    "All right!", 
                    [call_deferred, ["start_battle", "Iris"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "M-My deck...?", 
                    "Swear you won't back out, but I do have some rare cards..."
                    ], 
                ], 

                ["Leave", 
                    [
                    "Oh...", 
                    [call_deferred, ["reset_npc_facing", "Iris"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "No way! You’re super strong!", 
            [call_deferred, ["update_dialogue_progression", "Iris", "1_lost"]], 
        ], 

        "1_lost": [
            "That was fun! I’ll totally win next time though!", 
        ], 

        "1_win": [
            "See? I'm the best!", 
            [call_deferred, ["update_dialogue_progression", "Iris", "1_won"]], 
        ], 

        "1_won": [
            "You’ll get stronger if you keep practicing!", 
        ], 

        "booster": ["Here! Pull a rare card and catch up!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Roxie": {
        "0": ["I lost all my money gambling on booster packs...", 
                [call_deferred, ["reset_npc_facing", "Roxie"]]
        ], 

        "1": [
            "Yo, let’s battle!", 
            [
                ["Sure", 
                    [
                    "Let's rock!", 
                    [call_deferred, ["start_battle", "Roxie"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck’s GREEN.", 
                    "I'll cook you with my BURNS!"
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Roxie"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Damn, I was off-pitch...", 
            [call_deferred, ["update_dialogue_progression", "Roxie", "1_lost"]], 
        ], 

        "1_lost": [
            "I’m not mad!", 
        ], 

        "1_win": [
            "Yeah, loud and clear!", 
            [call_deferred, ["update_dialogue_progression", "Roxie", "1_won"]], 
        ], 

        "1_won": [
            "That was wicked!", 
        ], 

        "booster": ["Here, dude.", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Hilbert": {
        "0": ["Things are a bit too intense.", 
                "I'm catching my breath for a bit.", 
                [call_deferred, ["reset_npc_facing", "Hilbert"]]
        ], 

        "1": [
            "Wanna play? I’ve been looking for a worthy challenge.", 
            [
                ["Sure", 
                    [
                    "Alright, let's go!", 
                    [call_deferred, ["start_battle", "Hilbert"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck’s balanced.", 
                    "No gimmicks, just strong cards and smart strategy!"
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Hilbert"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Heh... you really earned this one.", 
            [call_deferred, ["update_dialogue_progression", "Hilbert", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ll rethink my strategy.", 
            "I don’t like losing the same way twice.", 
        ], 

        "1_win": [
            "Good match. See ya.", 
            [call_deferred, ["reset_npc_facing", "Hilbert"]], 
            [call_deferred, ["update_dialogue_progression", "Hilbert", "1_won"]], 
        ], 

        "1_won": [
            "Don’t worry about it.", 
        ], 

        "booster": ["Here. A booster pack.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Hilda": {
        "0": ["I've heard a rumor about Cynthia...", 
                "I wonder if anyone here is strong enough to beat her.", 
                [call_deferred, ["reset_npc_facing", "Hilda"]]
        ], 

        "1": [
            "Hey there! Up for a game?", 
            [
                ["Sure", 
                    [
                    "Let’s make it a good one!", 
                    [call_deferred, ["start_battle", "Hilda"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I like to go all-out on offense!", 
                    "My cards hit hard and never back down!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Hilda"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Whoa, I never saw it coming!", 
            [call_deferred, ["update_dialogue_progression", "Hilda", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ve got some tweaking to do...", 
            "Rematch someday?", 
        ], 

        "1_win": [
            "Yeah! A hard-fought victory!", 
            [call_deferred, ["update_dialogue_progression", "Hilda", "1_won"]], 
        ], 

        "1_won": [
            "Don’t look so down!", 
            "We'll play again when you're ready.", 
        ], 

        "booster": ["Have this pack on me!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "N": {
        "0": ["Even here, I can feel the hearts of the players...", 
                [call_deferred, ["reset_npc_facing", "N"]]
        ], 

        "WallyN": [[call_deferred, ["play_cutscene", "wally_n_event"]]], 

        "WallyN_end": ["That spark between fear and hope...", "It's the most beautiful thing, isn't it?", [call_deferred, ["reset_npc_facing", "N"]]], 

        "1": [
            "Would you play with me?", 
            "I want to understand how you connect with your cards.", 
            [
                ["Sure", 
                    [
                    "Give it your all!", 
                    [call_deferred, ["start_battle", "N"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck... it's not really about strength.", 
                    "Our power comes from harmony and trust.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "N"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "So... your heart and your cards are truly in sync.", 
            [call_deferred, ["update_dialogue_progression", "N", "1_lost"]], 
        ], 

        "1_lost": [
            "I’m grateful.", 
        ], 

        "1_win": [
            "Winning doesn’t matter to me... only understanding.", 
            [call_deferred, ["update_dialogue_progression", "N", "1_won"]], 
        ], 

        "1_won": [
            "Even defeat can be beautiful, if your intentions were pure.", 
        ], 

        "booster": ["Here, there is meaning in you having this.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Alder": {
        "0": ["Hi.", 
        ], 

        "1": [
            "Ah...!", 
            "You’ve got that look in your eyes!", 
            [
                ["Let's finish this!", 
                    [
                    "I'm grateful... Let me test your spirit!", 
                    [call_deferred, ["start_battle", "Alder"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck embodies life’s fire...", 
                    "Give me your best shot!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Hahaha! That's what I was hoping to see!", 
            [call_deferred, ["update_dialogue_progression", "Alder", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "You’ve already proven your heart.", 
        ], 

        "1_win": [
            "You fought bravely!", 
            "Remember, true growth comes from the journey, not the result", 
            [call_deferred, ["update_dialogue_progression", "Alder", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "Keep that fire burning!", 
        ], 

        "booster": ["Take this!", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Calem": {
        "0": ["You know those stat-boosting items, like ATK UP and stuff?", 
                "They work way better on low rarity cards...", 
                "Seriously, using them on common cards is like giving them steroids.", 
                [call_deferred, ["reset_npc_facing", "Calem"]]
        ], 


        "1": [
            "Wanna get a quick match in?", 
            "I want to see where I stand in the power rankings.", 
            [
                ["Sure", 
                    [
                    "Come on!", 
                    [call_deferred, ["start_battle", "Calem"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hm... I don't know what to tell you.", 
                    "I guess I'd rather give you a demonstration.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Calem"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Looks like I'm in the lower tiers...", 
            [call_deferred, ["update_dialogue_progression", "Calem", "1_lost"]], 
        ], 

        "1_lost": [
            "If you want a rematch, I’ll be around.", 
        ], 

        "1_win": [
            "Heh! You really kept me on my toes.", 
            [call_deferred, ["update_dialogue_progression", "Calem", "1_won"]], 
        ], 

        "1_won": [
            "If you want a rematch, I’ll be around.", 
        ], 

        "booster": ["Here, thought you might like this.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Serena": {
        "0": ["Damn... Looks like I'm late.", 
                [call_deferred, ["reset_npc_facing", "Serena"]]
        ], 


        "1": [
            "Wanna play? I need to level up my Pokémon.", 

            [
                ["Sure", 
                    [
                    "GLHF!", 
                    [call_deferred, ["start_battle", "Serena"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "What, don't you have Team Preview on?", 

                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Serena"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "That's GG...", 
            [call_deferred, ["update_dialogue_progression", "Serena", "1_lost"]], 
        ], 

        "1_lost": [
            "Just wait for my next power spike.", 
        ], 

        "1_win": [
            "Heh, you were just enough EXP!", 
            [call_deferred, ["update_dialogue_progression", "Serena", "1_won"]], 
        ], 

        "1_won": [
            "Sorry, I play to win.", 
        ], 

        "booster": ["Here's a gift!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Tierno": {
        "0": ["One, two... step!", "Gotta keep body and mind in sync, y’know?", 
                [call_deferred, ["reset_npc_facing", "Tierno"]]
        ], 

        "1": [
            "Yo, battle time? I wanna try a combo I came up with!", 
            [
                ["Sure", 
                    [
                    "Let's break it down!", 
                    [call_deferred, ["start_battle", "Tierno"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My team's all about BLUE offense!", 
                    "You can't keep up with me!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Tierno"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Aw man... I slipped.", 
            [call_deferred, ["update_dialogue_progression", "Tierno", "1_lost"]], 
        ], 

        "1_lost": [
            "Don’t worry about me since I deserve all of this.", 
        ], 

        "1_win": [
            "YEAH, that was sick!", 
            [call_deferred, ["update_dialogue_progression", "Tierno", "1_won"]], 
        ], 

        "1_won": [
            "Wanna jam with me later?", 
            "Huh? Where you're going?"
        ], 

        "booster": ["Here dude! Think of it like...", "Uh... actually, just take it.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Jack": {
        "0": ["Family, friends... I left it all behind the moment I put on this costume.", 
                "The only thing left for me is this, the battlefield.", 
                [call_deferred, ["reset_npc_facing", "Jack"]]
        ], 

        "1": [
            "You... I can tell from your stance. You're serious about card games.", 
            [
                ["Wanna play?", 
                    [
                    "This'll be messy...", 
                    [call_deferred, ["start_battle", "Jack"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "My deck? It’s built from the ashes of my past...", 
                    "And from whatever booster packs I could scavenge.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Jack"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "This is the path I chose... no regrets.", 
            [call_deferred, ["update_dialogue_progression", "Jack", "1_lost"]], 
        ], 

        "1_lost": [
            "My ears are always ringing.", 
        ], 

        "1_win": [
            "... You're still just a child.", 
            [call_deferred, ["update_dialogue_progression", "Jack", "1_won"]], 
        ], 

        "1_won": [
            "I've done things I'm not proud of.", 
        ], 

        "booster": ["Use this wisely. The battlefield doesn’t forgive carelessness.", [call_deferred, ["get_booster", "yellow"]]]
    }, 

    "Diantha": {
        "0": ["Hi.", 
        [call_deferred, ["reset_npc_facing", "Diantha"]]
        ], 

        "1": [
            "Ah, challenger...", 
            "I sensed your step long before you arrived.", 
            [
                ["Let's end it!", 
                    [
                    "Let's share this moment on the grand stage!", 
                    [call_deferred, ["start_battle", "Diantha"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I've collected the most gracefully powerful cards, of all colors.", 
                    "This performance demands nothing less.", 
                    ], 
                ], 

                ["Leave", 
                    [

                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "A breathtaking display... You really stole the spotlight.", 
            [call_deferred, ["update_dialogue_progression", "Diantha", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "No need to apologize.", 
        ], 

        "1_win": [
            "When you’re ready to step back into the lights, I’ll be waiting.", 
            [call_deferred, ["update_dialogue_progression", "Diantha", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "When you’re ready to step back into the lights, I’ll be waiting.", 
        ], 

        "booster": ["Here, a little gift for a promising star.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Maxie": {
        "0": ["Hm... You would be wise to join my Team.", 
                [call_deferred, ["reset_npc_facing", "Maxie"]]
        ], 

        "1": [
            "You there. Let's duel post-haste.", 
            [
                ["Sure", 
                    [
                    "Behold, my cards...", 
                    [call_deferred, ["start_battle", "Maxie"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Did I give you permission to speak?", 
                    "Restrain your tongue.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Maxie"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Your tactics were... unexpected.", 
            [call_deferred, ["update_dialogue_progression", "Maxie", "1_lost"]], 
        ], 

        "1_lost": [
            "That grunt must be behind this...", 
        ], 

        "1_win": [
            "Predictable. Yet still useful for my goals.", 
            [call_deferred, ["update_dialogue_progression", "Maxie", "1_won"]], 
        ], 

        "1_won": [
            "You're dismissed.", 
            [call_deferred, ["reset_npc_facing", "Maxie"]]

        ], 

        "booster": ["Your deck is indecent.", "Use this to make it less shameful", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Archie": {
        "0": ["Yo, new guy! Join my Team, or else...", 
                [call_deferred, ["reset_npc_facing", "Archie"]]
        ], 

        "1": [
            "Don't you look lively? How ‘bout a friendly duel?", 
            [
                ["Sure", 
                    [
                    "All aboard!", 
                    [call_deferred, ["start_battle", "Archie"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I use BLUE cards that hit strong and live free.", 
                    "That's my style.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Archie"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Gah! You got me good!", 
            [call_deferred, ["update_dialogue_progression", "Archie", "1_lost"]], 
        ], 

        "1_lost": [
            "Next time, I’m bringin’ the big waves.", 
        ], 

        "1_win": [
            "Ha! Better luck next round, mate.", 
            [call_deferred, ["update_dialogue_progression", "Archie", "1_won"]], 
        ], 

        "1_won": [
            "Come back when you’re ready to splash big.", 
            [call_deferred, ["reset_npc_facing", "Archie"]]

        ], 

        "booster": ["Some loot for ya. Don’t say I never gave you nothin’!", [call_deferred, ["get_booster", "blue"]]]
    }, 

    "Ghetsis": {
        "0": ["Pathetic...", 
                [call_deferred, ["reset_npc_facing", "Ghetsis"]]
        ], 

        "1": [
            "You... yes, you.", 
            "Indulge me in a battle. I wish to see the extent of your... usefulness.", 
            [
                ["Sure", 
                    [
                    "Heheh...!", 
                    [call_deferred, ["start_battle", "Ghetsis"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I deal absolute control and domination with my BLACK cards.", 
                    "Only the most ruthless Pokémon deserve a place in it.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Ghetsis"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Impossible... unacceptable...", 
            [call_deferred, ["update_dialogue_progression", "Ghetsis", "1_lost"]], 
        ], 

        "1_lost": [
            "No... I will not tolerate this outcome...", 
        ], 

        "1_win": [
            "All falls neatly into place when guided by my hand!", 
            [call_deferred, ["update_dialogue_progression", "Ghetsis", "1_won"]], 
        ], 

        "1_won": [
            "To me, this was Tuesday.", 
            [call_deferred, ["reset_npc_facing", "Ghetsis"]]

        ], 

        "booster": ["Take this, pawn.", "Some resources so you remain functional.", [call_deferred, ["get_booster", "black"]]]
    }, 

    "Lysandre": {
        "0": ["This place is filled with potential... and with waste.", 
                [call_deferred, ["reset_npc_facing", "Lysandre"]]
        ], 

        "1": [
            "Would you honor me with a duel?", 
            "I see the spark of potential in you.", 
            [
                ["Sure", 
                    [
                    "En garde!", 
                    [call_deferred, ["start_battle", "Lysandre"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I seek the balance between beauty and power.", 
                    "There are no shortcuts against me, I'm afraid.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Lysandre"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "So... your brilliance shines even brighter than I expected.", 
            [call_deferred, ["update_dialogue_progression", "Lysandre", "1_lost"]], 
        ], 

        "1_lost": [
            "Even in defeat, I admire the beauty of your skill.", 
        ], 

        "1_win": [
            "A shame. I had hoped for more.", 
            [call_deferred, ["update_dialogue_progression", "Lysandre", "1_won"]], 
        ], 

        "1_won": [
            "However... do not despair.", 
            "In this world, there is a place even for you.", 
            [call_deferred, ["reset_npc_facing", "Lysandre"]]

        ], 

        "booster": ["Take this. Beauty grows when it is nurtured.", [call_deferred, ["get_booster", "red"]]]
    }, 

    "Wes": {
        "0": ["I'm not doing anything suspicious... Really!", 
            [call_deferred, ["reset_npc_facing", "Wes"]]
        ], 

        "1": [
            "... You up for a match? Don’t expect me to go easy.", 
            [
                ["Sure", 
                    [
                    "Heh, you're in over your head!", 
                    [call_deferred, ["start_battle", "Wes"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Don't expect you opponent to spoonfeed you...", 
                    ], 

                ["Leave", 
                    [
                    ]
                ], 

                ], 
            ], 
        ], 

        "1_lose": [
            "... Guess you’ve got the edge today.", 
            [call_deferred, ["update_dialogue_progression", "Wes", "1_lost"]], 
        ], 

        "1_lost": [
            "I’ve lost before.", 
            "It only makes me sharper for next time."
        ], 

        "1_win": [
            "Heh, did you get overwhelmed?", 
            [call_deferred, ["update_dialogue_progression", "Wes", "1_won"]], 
        ], 

        "1_won": [
            "Don't start. I played by the rules!", 
        ], 

        "booster": ["Here, just don't ask me how I got it...", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Bill": {
        "0": ["If you buy a card before it evolves, you'll save a lot of money.", 
            "However, you'd also be spending your money on a weak card...", 
            "If you do that, make sure you can afford to be weaker for a bit.", 
            [call_deferred, ["reset_npc_facing", "Bill"]]
        ], 

        "1": [
            "Are you looking for an opponent?", 
            [
                ["Sure", 
                    [
                    "Let's see what you got!", 
                    [call_deferred, ["start_battle", "Bill"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "I've got quite a few rare cards.", 
                    "I'm more of a collector than a duelist, but don't expect me to go down easy!", 
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Bill"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "Whoa-ho! I couldn't predict this outcome!", 
            [call_deferred, ["update_dialogue_progression", "Bill", "1_lost"]], 
        ], 

        "1_lost": [
            "That battle was worth a hundred test runs!", 
        ], 

        "1_win": [
            "Heh, just like the simulations!", 
            [call_deferred, ["update_dialogue_progression", "Bill", "1_won"]], 
        ], 

        "1_won": [
            "Don't look so down...", "I can hook you up with a cruise ticket if you wanna.", 
        ], 

        "booster": ["Here, some payment for the fresh battle data.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Joey": {
        "0": ["Dammit, they had a Charizard for sale earlier.", 
            "It sold out before I could save up for it...", 
            [call_deferred, ["reset_npc_facing", "Joey"]]
        ], 

        "falkner_lost": ["Can't believe that guy finally left.", "What a douche...", [call_deferred, ["reset_npc_facing", "Joey"]]], 
        "falkner_won": ["This guy is so annoying.", [call_deferred, ["reset_npc_facing", "Joey"]]], 

        "1": [
            "Hey, you look weak, let's have a battle!", 
            [
                ["Sure", 
                    [
                    "I was wating for this, let's go!", 
                    [call_deferred, ["tutorial_battle"]], 
                    [call_deferred, ["start_battle", "Joey"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "W-well, for now I'm using the only cards I could afford...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    "C'mon dude, let's play!!"
                    ]
                ]
            ], 
        ], 

        "bug": [[call_deferred, ["play_cutscene", "joey_event"]]], 

        "bug_lost": ["Sorry for cheating..."], 

        "bug_won": ["Yeah, I'd say this is is a pretty strong Rattata."], 

        "1_lose": [
            "Doggone it!", 
            [call_deferred, ["update_dialogue_progression", "Joey", "1_lost"]], 
        ], 

        "1_lost": [
            "Do I need stronger Pokémon in order to win...?", 
            "No! I'm sticking with this one no matter what!"
        ], 

        "1_win": [
            "Oh yeah, I'm goated!!", 
            [call_deferred, ["update_dialogue_progression", "Joey", "1_won"]], 
        ], 

        "1_won": [
            "Next time think twice before challenging me.", 
        ], 

        "booster": ["Dammit, I was going to resell this later...", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Megan": {
        "0": ["I'm having a banana cappuccino.", 
            [call_deferred, ["reset_npc_facing", "Megan"]]
        ], 

        "falkner_lost": ["Uh... Will he be alright?", [call_deferred, ["reset_npc_facing", "Megan"]]], 
        "falkner_won": ["Pleeeease someone get this guy to shut up!!", [call_deferred, ["reset_npc_facing", "Megan"]]], 

        "1": [
            "Hey, are you a newbie too?", 

            [
                ["Wanna play?", 
                    [
                        "Okay, but take it easy please!", 
                        [call_deferred, ["tutorial_battle"]], 
                        [call_deferred, ["start_battle", "Megan"]], 
                    ]

                ], 

                ["About your deck", 
                    [
                        "Well, I'm still learning how to play.", 
                        "I just got some cards I thought were cute..."
                    ], 

                ], 

                ["Leave", 
                    [
                        "See you around."
                    ]

                ], 
            ]
        ], 

        "1_lose": [
            "Ow...", 
            [call_deferred, ["update_dialogue_progression", "Megan", "1_lost"]], 
        ], 

        "1_lost": [
            "Good luck out there.", 
            "The other guys here are a lot better than me..."
        ], 

        "1_win": [
            "Wow, I did it!!", 
            "Thanks for the game, lets play again soon!", 
            [call_deferred, ["update_dialogue_progression", "Megan", "1_won"]], 
        ], 

        "1_won": [
            "If you're having a hard time, try hitting up the card shop.", 
            "Your deck might need an upgrade!"
        ], 

        "booster": ["Here, I hope we can improve together!", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Weevil": {
        "0": ["What!?", 
            [call_deferred, ["reset_npc_facing", "Weevil"]]
        ], 

        "falkner_lost": ["Don't rock the boat, baby.", [call_deferred, ["reset_npc_facing", "Weevil"]]], 
        "falkner_won": ["I gotta get out of here.", [call_deferred, ["reset_npc_facing", "Weevil"]]], 

        "1": [
            "Hehehe. Bugs are cool. Heheh.", 
            [
                ["Wanna play?", 
                    [
                    "You like. Fell into my trap or something. Heheh!", 
                    [call_deferred, ["start_battle", "Weevil"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Heh. What? Are we playing or what? Heheh.", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "Dammit, this game sucks. Heh.", 
            [call_deferred, ["update_dialogue_progression", "Weevil", "1_lost"]], 
        ], 

        "1_lost": [
            "Are you like. Lost or something. Heheh."
        ], 

        "1_win": [
            "Fire!! Fire!! Heheh. Buttmunch.", 
            "Heheheheheh. That was cool.", 
            [call_deferred, ["update_dialogue_progression", "Weevil", "1_won"]], 
        ], 

        "1_won": [
            "Are you like. Lost or something. Heheh."
        ], 

        "booster": ["Here, screw this. Heheheh.", [call_deferred, ["get_booster", "green"]]]
    }, 

    "Rex": {
        "0": ["Hi.", 
            [call_deferred, ["reset_npc_facing", "Rex"]]
        ], 

        "1": [
            "So like... You wanna play? Or something..?", 
            [
                ["Sure", 
                    [
                    "Come... to Raptor.", 
                    [call_deferred, ["start_battle", "Rex"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Huhuh, you said \"deck\"...", 
                    ], 
                ], 

                ["Leave", 
                    [
                    ]
                ], 
            ], 
        ], 

        "1_lose": [
            "This sucks! I'm gonna go like, get some nachos.", 
            [call_deferred, ["update_dialogue_progression", "Rex", "1_lost"]], 
        ], 

        "1_lost": [
            "Dammit, now I'm never gonna score..."
        ], 

        "1_win": [
            "What are you, stoned? Huhuh...", 
            [call_deferred, ["update_dialogue_progression", "Rex", "1_won"]], 
        ], 

        "1_won": [
            "Were you paying attention, dumbass? Huhuh"
        ], 

        "booster": ["I don't wanna play anymore, so just throw this away for me.", [call_deferred, ["get_booster", "random"]]]
    }, 

    "Cilan": {
        "0": ["Hi."], 

        "2": [[call_deferred, ["play_cutscene", "cilan_event"]]], 

        "1_lose": ["We'll come up with a stronger mix!", 
                [call_deferred, ["reset_npc_facing", "Cilan"]]], 

        "1_win": ["Defeat has an unforgettable flavor, doesn't it?", 
                [call_deferred, ["reset_npc_facing", "Cilan"]]]
    }, 

    "Cress": {
        "0": ["Oh?", 
            [call_deferred, ["reset_npc_facing", "Cress"]]], 

        "lost": ["Seems like we still lack some harmony.", 
                [call_deferred, ["reset_npc_facing", "Cress"]]], 

        "won": ["That was very... satisfying.", 
                [call_deferred, ["reset_npc_facing", "Cress"]]]
    }, 

    "Chili": {
        "0": ["Looking for a fight?", 
            [call_deferred, ["reset_npc_facing", "Chili"]]], 

        "lost": ["Just wait and see, I'll spice things up next time!", 
                [call_deferred, ["reset_npc_facing", "Chili"]]], 

        "won": ["Back to the lab with you!", 
                [call_deferred, ["reset_npc_facing", "Chili"]]]
    }, 

    "Old Blue": {
        "0": ["Hi."], 
    }, 

    "Old Man": {
        "0": [[call_deferred, ["play_cutscene", "old_man_event"]]], 
    }, 

    "Old Lady": {
        "0": [[call_deferred, ["play_cutscene", "old_lady_event"]]], 
    }, 

    "Yugi": {
        "0": ["Hi.", 
                [call_deferred, ["reset_npc_facing", "Yugi"]]
        ], 

        "1": [
            "O-oh, hi! Sorry if I’m in the way...", 
            "I just arrived from abroad to learn about this country's card games.", 
            "So how about it, wanna play a game?", 
            [call_deferred, ["toggle_yugi"]], 
            [
                ["Sure", 
                    [
                    "It's time to duel!", 
                    [call_deferred, ["start_battle", "Yugi"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "Hm... I suppose I use mostly spellcasters and fiends.", 
                    "Huh? You have no idea what I'm talking about?", 
                    [call_deferred, ["reset_npc_facing", "Yugi"]]
                    ], 
                ], 

                ["Leave", 
                    [
                    [call_deferred, ["reset_npc_facing", "Yugi"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "You got me! That was intense...", 
            "I can tell you play with your heart!", 
            [call_deferred, ["update_dialogue_progression", "Yugi", "1_lost"]], 
            [call_deferred, ["reset_npc_facing", "Yugi"]]
        ], 

        "1_lost": [
            "The cards here are so different from the ones back home!", 
            "But am I glad Kaiba doesn't know about Rayquaza yet....", 
            [call_deferred, ["reset_npc_facing", "Yugi"]]
        ], 

        "1_win": [
            "Oh yeah! I think I'm getting the hang of this.", 
            "If you don’t mind... maybe we can play again later?", 
            [call_deferred, ["update_dialogue_progression", "Yugi", "1_won"]], 
            [call_deferred, ["reset_npc_facing", "Yugi"]]
        ], 

        "1_won": [
            "The cards here are so different from the ones back home!", 
            "But am I glad Kaiba doesn't know about Rayquaza yet....", 
            [call_deferred, ["reset_npc_facing", "Yugi"]]
        ], 

        "booster": ["Oh, before I forget!", "Here, I don't how to use these cards yet...", [call_deferred, ["reset_npc_facing", "Yugi"]], [call_deferred, ["get_booster", "black"]]]
    }, 

    "Kaiba": {
        "0": ["These savages don't even duel using Duel Disks.", 
        ], 

        "1": [
            "Fancy meeting you here.", 
            "I bet you though you'd seen the last of me.", 
            [
                ["Let's finish this!", 
                    [
                    "I crush dreams for a living, you're done for!", 
                    [call_deferred, ["start_battle", "Kaiba"]], 
                    ], 
                ], 

                ["About your deck", 
                    [
                    "looking for advice? I got some for you.", 
                    "Try not to blink. I play at a level you can’t comprehend."
                    ], 
                ], 

                ["Leave", 
                    [
                        [call_deferred, ["reset_npc_facing", "Kaiba"]]
                    ]
                ], 


            ], 
        ], 

        "1_lose": [
            "...Impossible. Beaten by you?", 
            "Hmpf. Enjoy your little victory while it lasts.", 
            [call_deferred, ["toggle_kaiba"]], 
            [call_deferred, ["update_dialogue_progression", "Kaiba", "1_lost"]], 
            [call_deferred, ["play_cutscene", "champion_beaten"]], 
        ], 

        "1_lost": [
            "Remember this: there’s only one position worth aiming for.", 
            "Number one.", 
            "If you’re not fighting for the top... then get out of my way."
        ], 

        "1_win": [
            "As expected from a third grade duelist with a fourth grade deck.", 
            "Come back when you’re worth the effort.", 
            [call_deferred, ["update_dialogue_progression", "Kaiba", "1_won"]], 
            [call_deferred, ["play_cutscene", "champion_won"]], 
        ], 

        "1_won": [
            "Remember this: there’s only one position worth aiming for.", 
            "Number one.", 
            "If you’re not fighting for the top... then get out of my way."
        ], 

        "booster": ["I don't need this crap anymore, so you might as well take it.", [call_deferred, ["get_booster", "white"]]]
    }, 

    "Demi-Fiend": {
        "0": ["Hi.", 
            [call_deferred, ["reset_npc_facing", "Demi-Fiend"]]], 

    }, 

    "Mewtwo": {
        "0": ["Hi.", 
            [call_deferred, ["reset_npc_facing", "Mewtwo"]]
        ], 

        "1_lose": ["Hi.", 
            [call_deferred, ["reset_npc_facing", "Mewtwo"]]
        ], 

        "1_win": ["Hi.", 
            [call_deferred, ["reset_npc_facing", "Mewtwo"]]
        ], 
    }
    }



var battle_scene_load = preload("res://Files/Scenes/Battle/BattleScene.tscn")
func start_battle(enemy):
    globals.ui.state = globals.ui.locked
    globals.player_data.battles_fought += 1
    globals.player.state = globals.player.locked

    globals.player_data.enemy_party = teams[enemy][globals.hotel.game_level]
    var battle_scene = battle_scene_load.instantiate()
    get_node("../Battle").add_child(battle_scene)

    play_battle_bgm()

    await wait(0.4)
    globals.player.state = globals.player.locked

func play_battle_bgm():
    if globals.gbc: return
    var battle_player = globals.hotel.get_node("BattlePlayer")
    var bgm_player = globals.hotel.get_node("BGMPlayer")


    if globals.versus_mewtwo:
        battle_player.stream = load("res://Files/BGMs/USUM Mewtwo Battle Music (HQ).mp3")
        battle_player.stream.loop_offset = 0

    elif globals.enemy.npc_name == "Demi-Fiend":
        battle_player.stream = load("res://Files/BGMs/SMT Forced Battle.mp3")

    else:
        if globals.hotel.game_level == 0:
            battle_player.stream = load("res://Files/BGMs/HGSS Wild Battle (Johto).mp3")
            battle_player.stream.loop_offset = 15.7

        elif globals.hotel.game_level == 1:
            battle_player.stream = load("res://Files/BGMs/HGSS Trainer Battle (Johto).mp3")
            battle_player.stream.loop_offset = 23.4

        elif globals.hotel.game_level == 2:
            battle_player.stream = load("res://Files/BGMs/HGSS Gym Leader Battle (Johto).mp3")
            battle_player.stream.loop_offset = 16.7

        elif globals.hotel.game_level == 3:
            battle_player.stream = load("res://Files/BGMs/HGSS Rival Battle.mp3")
            battle_player.stream.loop_offset = 13.3

    battle_player.volume_linear = 0.177 * globals.options["bgm_volume"]
    battle_player.play()
    bgm_player.volume_db = linear_to_db(0)

func show_card_shop():
    globals.ui.show_card_shop()

func show_item_shop():
    globals.ui.show_item_shop()

func show_starters():
    globals.ui.show_starters()

func get_item(item_name):
    if globals.player_data.item_bag.has(item_name):
            globals.player_data.item_bag[item_name] += 1
    else:
        globals.player_data.item_bag[item_name] = 1

    var text = "[color=a5a5a5]You got [color=ffffff]{0}[/color].".format([item.dict[item_name]["name"]])
    globals.ui.show_notification(text)




func get_bp(amount):
    globals.player_bp += amount

    var text = "[color=a5a5a5]You got [color=7ac6ff]{0} BP[/color].".format([amount])
    globals.ui.show_notification(text)




func balloon(npc_name, sprite):
    var npc_node = get_npc_node(npc_name)
    var frame_array = [0, 0]

    if sprite == "!":
        frame_array = [1, 2]

    elif sprite == "?":
        frame_array = [3, 4]

    elif sprite == "angry":
        frame_array = [5, 6]

    elif sprite == "smile":
        frame_array = [7, 8]

    elif sprite == "happy":
        frame_array = [9, 10]

    elif sprite == "sad":
        frame_array = [11, 12]

    elif sprite == "grumpy":
        frame_array = [13, 14]

    elif sprite == "...":
        frame_array = [15, 16]

    elif sprite == "music":
        frame_array = [17, 18]

    elif sprite == "heart":
        frame_array = [19, 20]

    await wait(0.2)
    npc_node.balloon_player.play("popup")
    for i in range(2):
        npc_node.balloon.frame = frame_array[0]
        await wait(0.15)
        npc_node.balloon.frame = frame_array[1]
        await wait(0.15)
    npc_node.balloon.frame = frame_array[0]

func get_card(species, level, booster = false):
    if globals.player_data.player_box.size() > 9: return
    globals.player_data.get_card(species, level, booster)

func get_booster(color):
    if globals.player_data.player_box.size() > 9: return

    var color_index
    var colors = ["red", "blue", "green", "yellow", "white", "black"]

    if color in colors:
        color_index = colors.find(color)
    else:
        color_index = randi_range(0, 5)
        color = colors[color_index]

    var bought_card = globals.hotel.booster_pull(color_index)

    globals.hotel.get_node("CanvasLayer/GetCard/Booster/Color").texture = load("res://Files/Sprites/ColorIcons/{0}.png".format([color]))
    globals.hotel.get_node("CanvasLayer/GetCard/Booster/ColorBorder").modulate = Color(poke_types.colors[color][2])
    globals.hotel.get_node("CanvasLayer/GetCard/Booster/BG").color = Color(poke_types.colors[color][0])
    globals.hotel.get_node("CanvasLayer/GetCard/Booster/Border").color = Color(poke_types.colors[color][2])
    get_card(bought_card, 1, true)

func reset_npc_facing(npc_name):
    var npc_node = null
    for i in globals.hotel.get_node("Actors").get_children():
        if not "npc_name" in i: continue
        if i.npc_name == npc_name:
            npc_node = i
            break
    if npc_node == null: return

    npc_node.face_facing_direction()

func update_dialogue_progression(npc_name, value):
    progression[npc_name]["dialogue"] = value

func get_money():
    var text = "You got [color=eeca52]$%s[/color]." % globals.player_data.prize_money
    globals.ui.show_notification(text)

    globals.player_data.money += globals.player_data.prize_money
    globals.player_data.prize_money = 0

func player_lose_hp():
    globals.player_data.player_hp -= 20
    if globals.hotel.game_level > 2: globals.player_data.player_hp -= 100
    if globals.player_data.player_hp < 0: globals.player_data.player_hp = 0
    globals.ui.hud.get_node("Player/Shadow").visible = false

    flash_player_healthbar()
    await wait(0.05)
    var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
    tween.tween_property(globals.ui.hud.get_node("Player/Bar"), "scale", Vector2(globals.player_data.player_hp / 100, 1), 0.1)


    await wait(0.1)
    globals.ui.hud.get_node("Player/Shadow").visible = true

func flash_player_healthbar():
    for i in range(5):
        globals.ui.hud.get_node("Player/Bar").color = Color("#e60000")
        await wait(0.03)
        globals.ui.hud.get_node("Player/Bar").color = Color("#ffffff")
        await wait(0.03)
    if globals.player_data.player_hp > 50:
        globals.ui.hud.get_node("Player/Bar").color = Color("#18c320")
    elif globals.player_data.player_hp < 25:
        globals.ui.hud.get_node("Player/Bar").color = Color("#e64039")
    else:
        globals.ui.hud.get_node("Player/Bar").color = Color("#cd9d20")

func trade_pokemon():
    var prev_npc_dialogue = progression[globals.enemy.npc_name]["dialogue"]

    var trade_success = false
    for i in globals.player_data.player_box:
        if i["species"] == wanted_mon["species"]:
            trade_success = true
            wanted_mon = i
            break

    if trade_success:
        var new_mon
        if globals.enemy.npc_name == "Flannery": new_mon = flanerry_mon
        elif globals.enemy.npc_name == "Bugsy": new_mon = bugsy_mon
        elif globals.enemy.npc_name == "Clair": new_mon = clair_mon
        elif globals.enemy.npc_name == "Erika": new_mon = erika_mon

        update_dialogue_progression(globals.enemy.npc_name, "trade0")
        globals.remove_pokemon(wanted_mon)
        get_card(new_mon, 0)
    else:

        update_dialogue_progression(globals.enemy.npc_name, "trade1")
        while globals.player.state == globals.player.locked:
            await wait(0.01)
        globals.enemy.dialogue_state = globals.enemy.off
        globals.enemy.interact()

        await wait(0.1)
        while globals.player.state == globals.player.locked:
            await wait(0.01)

        update_dialogue_progression(globals.enemy.npc_name, prev_npc_dialogue)

func show_trade_status():
    var pokemon

    if globals.enemy.npc_name == "Flannery":
        pokemon = flanerry_mon
        wanted_mon = flannery_wants

    elif globals.enemy.npc_name == "Bugsy":
        pokemon = bugsy_mon
        wanted_mon = bugsy_wants

    elif globals.enemy.npc_name == "Erika":
        pokemon = erika_mon
        wanted_mon = erika_wants

    elif globals.enemy.npc_name == "Clair":
        pokemon = clair_mon
        wanted_mon = clair_wants

    globals.ui.update_status(pokemon)
    var tween = get_tree().create_tween()
    tween.tween_property(globals.ui.status_menu, "position", Vector2(280, 0), 0.3)

    while true:
        await wait(0.01)
        if Input.is_action_just_pressed("Accept") or Input.is_action_just_pressed("Cancel"): break

    tween = get_tree().create_tween()
    tween.tween_property(globals.ui.status_menu, "position", Vector2(596, 0), 0.3)



var wanted_mon = {}
var trade_mons = {
        "Flannery": [globals.generate_pokemon("numel", 4), 
                globals.generate_pokemon("camerupt", 5), 
                globals.generate_pokemon("torkoal", 7), ], 

        "Bugsy": [globals.generate_pokemon("beedrill", 2), 
                globals.generate_pokemon("butterfree", 5), 
                globals.generate_pokemon("heracross", 7), ], 

        "Erika": [globals.generate_pokemon("tangela", 4), 
                globals.generate_pokemon("bellossom", 5), 
                globals.generate_pokemon("vileplume", 7), ], 

        "Clair": [globals.generate_pokemon("dratini", 2), 
                globals.generate_pokemon("dragonair", 4), 
                globals.generate_pokemon("dragonair", 6), ], 
    }
var flanerry_mon = trade_mons["Flannery"][0]
var bugsy_mon = trade_mons["Bugsy"][0]
var erika_mon = trade_mons["Erika"][0]
var clair_mon = trade_mons["Clair"][0]

var flannery_wants
var bugsy_wants
var erika_wants
var clair_wants


func setup_trades():
    await wait(0.1)
    if globals.player.player_name == "Mewtwo": return

    var trade_rng = randi_range(1, 100)
    if globals.hotel.game_level == 1:
        flanerry_mon = trade_mons["Flannery"][1]
    elif globals.hotel.game_level > 1:
        flanerry_mon = trade_mons["Flannery"][2]
    if trade_rng <= 70:
        wanted_mon = globals.player_data.player_box[randi_range(0, globals.player_data.player_box.size() - 1)]
    else:
        wanted_mon = globals.hotel.card_shop_stock[randi_range(0, globals.hotel.card_shop_stock.size() - 1)]
    flannery_wants = wanted_mon
    dialogue["Flannery"]["2"][0] = "H-hey, do you have a {0}? I'll give you a {1} for it."
    dialogue["Flannery"]["2"][0] = dialogue["Flannery"]["2"][0].format([wanted_mon["dex"]["name"], 
                                                                        flanerry_mon["dex"]["name"]])


    trade_rng = randi_range(1, 100)
    if globals.hotel.game_level == 1:
        bugsy_mon = trade_mons["Bugsy"][1]
    elif globals.hotel.game_level > 1:
        bugsy_mon = trade_mons["Bugsy"][2]
    if trade_rng <= 70:
        wanted_mon = globals.player_data.player_box[randi_range(0, globals.player_data.player_box.size() - 1)]
    else:
        wanted_mon = globals.hotel.card_shop_stock[randi_range(0, globals.hotel.card_shop_stock.size() - 1)]
    bugsy_wants = wanted_mon
    dialogue["Bugsy"]["2"][0] = "I need a {0} for my research... Would you accept a {1} for it?"
    dialogue["Bugsy"]["2"][0] = dialogue["Bugsy"]["2"][0].format([wanted_mon["dex"]["name"], 
                                                                        bugsy_mon["dex"]["name"]])


    trade_rng = randi_range(1, 100)
    if globals.hotel.game_level == 1:
        erika_mon = trade_mons["Erika"][1]
    elif globals.hotel.game_level > 1:
        erika_mon = trade_mons["Erika"][2]
    if trade_rng <= 70:
        wanted_mon = globals.player_data.player_box[randi_range(0, globals.player_data.player_box.size() - 1)]
    else:
        wanted_mon = globals.hotel.card_shop_stock[randi_range(0, globals.hotel.card_shop_stock.size() - 1)]
    erika_wants = wanted_mon
    dialogue["Erika"]["2"][1] = "I'm looking for a {0}. Would a {1} be enough for it?"
    dialogue["Erika"]["2"][1] = dialogue["Erika"]["2"][1].format([wanted_mon["dex"]["name"], 
                                                                        erika_mon["dex"]["name"]])


    trade_rng = randi_range(1, 100)
    if globals.hotel.game_level == 1:
        clair_mon = trade_mons["Clair"][1]
    elif globals.hotel.game_level > 1:
        clair_mon = trade_mons["Clair"][2]
    if trade_rng <= 70:
        wanted_mon = globals.player_data.player_box[randi_range(0, globals.player_data.player_box.size() - 1)]
    else:
        wanted_mon = globals.hotel.card_shop_stock[randi_range(0, globals.hotel.card_shop_stock.size() - 1)]
    clair_wants = wanted_mon
    dialogue["Clair"]["2"][1] = "I shall grace you with a {1}, should you give me your {0}."
    dialogue["Clair"]["2"][1] = dialogue["Clair"]["2"][1].format([wanted_mon["dex"]["name"], 
                                                                        clair_mon["dex"]["name"]])

func setup_npc_teams():

    teams["Red"][0] = [null, 
                        globals.generate_pokemon("metapod", 2), 
                        null, 
                        globals.generate_pokemon("charmander", 1), 
                        globals.generate_pokemon("pikachu", 1, {"slot2": 2, "bonus_ap": -1}), 
                        null]

    teams["Red"][1] = [globals.generate_pokemon("butterfree", 3), 
                        globals.generate_pokemon("charmeleon", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("pikachu", 4), 
                        null]

    teams["Red"][3] = [globals.generate_pokemon("snorlax", 5), 
                        globals.generate_pokemon("charizard", 7, {"slot1": 1, "slot3": 2, "bonus_speed": -20, "bonus_health": 10}), 
                        null, 
                        null, 
                        globals.generate_pokemon("PIKACHU", 9), 
                        null]


    teams["Blue"][0] = [null, 
                        globals.generate_pokemon("eevee", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("wartortle", 2), 
                        null]

    teams["Blue"][1] = [globals.generate_pokemon("nidorina", 3), 
                        globals.generate_pokemon("umbreon", 3, {"bonus_health": -15}), 
                        null, 
                        null, 
                        globals.generate_pokemon("wartortle", 4), 
                        null]

    teams["Blue"][2] = [globals.generate_pokemon("nidoqueen", 6), 
                        globals.generate_pokemon("blastoise", 7), 
                        globals.generate_pokemon("umbreon", 6), 
                        null, 
                        null, 
                        null]


    teams["Leaf"][0] = [globals.generate_pokemon("clefairy", 2), 
                        globals.generate_pokemon("ivysaur", 2), 
                        globals.generate_pokemon("sandshrew", 1), 
                        null, 
                        null, 
                        null]

    teams["Leaf"][1] = [globals.generate_pokemon("clefable", 3, {"bonus_ap": -2, "bonus_health": -10}), 
                        globals.generate_pokemon("ivysaur", 4), 
                        globals.generate_pokemon("sandslash", 3), 
                        null, 
                        null, 
                        null]

    teams["Leaf"][2] = [globals.generate_pokemon("clefable", 6, ), 
                        globals.generate_pokemon("venusaur", 7), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("ditto", 7)]


    teams["Gold"][0] = [globals.generate_pokemon("phanpy", 3), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("quilava", 3), 
                        null]

    teams["Gold"][1] = [globals.generate_pokemon("donphan", 4), 
                        null, 
                        globals.generate_pokemon("noctowl", 4), 
                        null, 
                        globals.generate_pokemon("quilava", 5, {"bonus_ap": 1}), 
                        null]

    teams["Gold"][2] = [globals.generate_pokemon("typhlosion", 7, ), 
                        globals.generate_pokemon("*gyarados", 6, {"slot2": 1}), 
                        globals.generate_pokemon("donphan", 6), 
                        null, 
                        null, 
                        null]


    teams["Kris"][0] = [null, 
                        globals.generate_pokemon("bayleef", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("marill", 3), 
                        null]

    teams["Kris"][1] = [null, 
                        globals.generate_pokemon("azumarill", 4), 
                        globals.generate_pokemon("bayleef", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("sunflora", 4)]

    teams["Kris"][2] = [globals.generate_pokemon("azumarill", 6, ), 
                        globals.generate_pokemon("meganium", 7, {"slot1": 1, "slot3": 1, "bonus_ap": 1}), 
                        globals.generate_pokemon("ursaring", 6), 
                        null, 
                        null, 
                        null]


    teams["Silver"][0] = [null, 
                        globals.generate_pokemon("croconaw", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("sneasel", 3, {"bonus_ap": -1, "slot3": 1}), 
                        null]

    teams["Silver"][1] = [globals.generate_pokemon("golbat", 4, {"bonus_ap": 1, "slot2": 1}), 
                        globals.generate_pokemon("croconaw", 5, {"bonus_ap": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("sneasel", 4), 
                        null]

    teams["Silver"][2] = [globals.generate_pokemon("crobat", 6), 
                        globals.generate_pokemon("feraligator", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("weavile", 6), 
                        null]


    teams["May"][0] = [null, 
                    globals.generate_pokemon("combusken", 2), 
                    globals.generate_pokemon("shroomish", 1), 
                    null, 
                    globals.generate_pokemon("taillow", 1), 
                    null]

    teams["May"][1] = [globals.generate_pokemon("swellow", 5), 
                    globals.generate_pokemon("combusken", 4), 
                    null, 
                    null, 
                    null, 
                    globals.generate_pokemon("shroomish", 4)]

    teams["May"][2] = [globals.generate_pokemon("swellow", 6), 
                    globals.generate_pokemon("blaziken", 7), 
                    null, 
                    globals.generate_pokemon("breloom", 6), 
                    null, 
                    null]


    teams["Brendan"][0] = [globals.generate_pokemon("lombre", 3), 
                        globals.generate_pokemon("grovyle", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Brendan"][1] = [globals.generate_pokemon("kecleon", 4, {"bonus_pp": -1}), 
                        globals.generate_pokemon("ludicolo", 5, {"bonus_health": -10}), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("grovyle", 4)]

    teams["Brendan"][2] = [globals.generate_pokemon("ludicolo", 6), 
                        globals.generate_pokemon("sceptile", 7), 
                        globals.generate_pokemon("kecleon", 6, {"bonus_ap": 2, "bonus_pp": 3}), 
                        null, 
                        null, 
                        null]


    teams["Wally"][0] = [null, 
                        globals.generate_pokemon("marshtomp", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("kirlia", 3), 
                        null]

    teams["Wally"][1] = [null, 
                        globals.generate_pokemon("marshtomp", 4), 
                        null, 
                        globals.generate_pokemon("kirlia", 5), 
                        globals.generate_pokemon("roselia", 4), 
                        null]

    teams["Wally"][2] = [null, 
                        globals.generate_pokemon("swampert", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("gardevoir", 7), 
                        globals.generate_pokemon("roselia", 6)]


    teams["Lucas"][0] = [globals.generate_pokemon("gastrodon1", 3), 
                        globals.generate_pokemon("grotle", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Lucas"][1] = [globals.generate_pokemon("gastrodon1", 5), 
                        globals.generate_pokemon("grotle", 4), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("staravia", 4)]

    teams["Lucas"][2] = [null, 
                        globals.generate_pokemon("torterra", 7), 
                        globals.generate_pokemon("staraptor", 6), 
                        null, 
                        globals.generate_pokemon("porygon-z", 6), 
                        null]


    teams["Dawn"][0] = [null, 
                        globals.generate_pokemon("eevee", 3, {"slot2": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("prinplup", 3), 
                        null]

    teams["Dawn"][1] = [null, 
                        globals.generate_pokemon("glaceon", 4), 
                        null, 
                        globals.generate_pokemon("kirlia", 4), 
                        globals.generate_pokemon("prinplup", 5), 
                        null]

    teams["Dawn"][2] = [globals.generate_pokemon("gallade", 6), 
                        globals.generate_pokemon("glaceon", 6, {"bonus_health": 15, "bonus_ap": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("empoleon", 7), 
                        null]


    teams["Barry"][0] = [globals.generate_pokemon("bidoof", 1), 
                        null, 
                        globals.generate_pokemon("monferno", 1), 
                        null, 
                        null, 
                        globals.generate_pokemon("croagunk", 1, {"slot2": 2, "bonus_power": -10})]

    teams["Barry"][1] = [globals.generate_pokemon("bibarel", 4, {"bonus_pp": -1}), 
                        null, 
                        globals.generate_pokemon("monferno", 5), 
                        null, 
                        globals.generate_pokemon("croagunk", 5), 
                        null]

    teams["Barry"][2] = [globals.generate_pokemon("bibarel", 6, {"slot1": 1, "slot3": 1, "bonus_health": 20, "bonus_power": 15}), 
                        globals.generate_pokemon("infernape", 7), 
                        null, 
                        globals.generate_pokemon("toxicroak", 6), 
                        null, 
                        null]


    teams["Brock"][0] = [globals.generate_pokemon("geodude", 2), 
                        globals.generate_pokemon("onix", 3, {"slot3": 2}), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Brock"][1] = [null, 
                        globals.generate_pokemon("onix", 4), 
                        globals.generate_pokemon("graveler", 3, {"slot2": 1, "slot3": 2}), 
                        null, 
                        globals.generate_pokemon("vulpix", 4), 
                        null]

    teams["Brock"][2] = [globals.generate_pokemon("golem", 6), 
                        globals.generate_pokemon("onix", 7, {"bonus_ap": 1, "bonus_power": 20, "slot1": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("ninetales", 6), 
                        null]


    teams["Misty"][0] = [null, 
                        globals.generate_pokemon("golduck", 1), 
                        null, 
                        globals.generate_pokemon("staryu", 2), 
                        null, 
                        globals.generate_pokemon("goldeen", 2), ]

    teams["Misty"][1] = [null, 
                        globals.generate_pokemon("seaking", 3), 
                        globals.generate_pokemon("golduck", 3), 
                        null, 
                        globals.generate_pokemon("starmie", 4), 
                        null]

    teams["Misty"][2] = [null, 
                        globals.generate_pokemon("gyarados", 6), 
                        globals.generate_pokemon("seaking", 6), 
                        globals.generate_pokemon("starmie", 7), 
                        null, 
                        null]


    teams["Erika"][0] = [globals.generate_pokemon("oddish", 2), 
                        globals.generate_pokemon("tangela", 1), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("bellsprout", 1), ]

    teams["Erika"][1] = [globals.generate_pokemon("tangela", 3), 
                        globals.generate_pokemon("victreebel", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("gloom", 4), 
                        null, ]

    teams["Erika"][2] = [globals.generate_pokemon("tangrowth", 6), 
                        globals.generate_pokemon("vileplume", 7), 
                        null, 
                        globals.generate_pokemon("bellossom", 6), 
                        null, 
                        null, ]


    teams["Surge"][0] = [null, 
                        null, 
                        globals.generate_pokemon("voltorb", 2), 
                        null, 
                        globals.generate_pokemon("pikachu", 4), 
                        null, ]

    teams["Surge"][1] = [globals.generate_pokemon("voltorb", 3), 
                        null, 
                        globals.generate_pokemon("magnemite", 3), 
                        null, 
                        globals.generate_pokemon("pikachu", 5), 
                        null, ]

    teams["Surge"][2] = [globals.generate_pokemon("electrode", 6), 
                        null, 
                        globals.generate_pokemon("magnezone", 6), 
                        null, 
                        globals.generate_pokemon("raichu", 7), 
                        null, ]


    teams["Koga"][0] = [null, 
                        globals.generate_pokemon("grimer", 1), 
                        globals.generate_pokemon("koffing", 1), 
                        null, 
                        globals.generate_pokemon("venomoth", 2), 
                        null, ]

    teams["Koga"][1] = [globals.generate_pokemon("grimer", 3), 
                        globals.generate_pokemon("weezing", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("venomoth", 4), 
                        null, ]

    teams["Koga"][2] = [globals.generate_pokemon("muk", 6), 
                        null, 
                        globals.generate_pokemon("weezing", 6, {"bonus_health": 15, "bonus_power": 20}), 
                        null, 
                        globals.generate_pokemon("venomoth", 8, {"bonus_ap": 2, "bonus_pp": 2}), 
                        null, ]


    teams["Sabrina"][0] = [null, 
                        globals.generate_pokemon("kadabra", 3), 
                        globals.generate_pokemon("slowpoke", 3), 
                        null, 
                        null, 
                        null, ]

    teams["Sabrina"][1] = [null, 
                        globals.generate_pokemon("slowbro", 3, {"bonus_health": -15}), 
                        globals.generate_pokemon("kadabra", 4), 
                        globals.generate_pokemon("espeon", 3, {"slot2": 2}), 
                        null, 
                        null, ]

    teams["Sabrina"][2] = [globals.generate_pokemon("slowbro", 6), 
                        globals.generate_pokemon("alakazam", 7), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("espeon", 6), ]


    teams["Blaine"][0] = [globals.generate_pokemon("magmar", 1), 
                        globals.generate_pokemon("ponyta", 1), 
                        globals.generate_pokemon("growlithe", 1), 
                        null, 
                        null, 
                        null, ]

    teams["Blaine"][1] = [globals.generate_pokemon("magmar", 3), 
                        globals.generate_pokemon("rapidash", 4), 
                        globals.generate_pokemon("growlithe", 5), 
                        null, 
                        null, 
                        null, ]

    teams["Blaine"][2] = [null, 
                        globals.generate_pokemon("rapidash", 7), 
                        globals.generate_pokemon("arcanine", 6), 
                        globals.generate_pokemon("magmortar", 7), 
                        null, 
                        null, ]


    teams["Giovanni"][0] = [globals.generate_pokemon("rhyhorn", 1), 
                        globals.generate_pokemon("nidorino", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("meowth", 3), 
                        null]

    teams["Giovanni"][1] = [globals.generate_pokemon("rhydon", 3, {"bonus_ap": -1, "slot2": 1}), 
                        globals.generate_pokemon("nidorino", 4), 
                        null, 
                        globals.generate_pokemon("persian", 5, {"bonus_health": -15, "bonus_power": -10}), 
                        null, 
                        null]

    teams["Giovanni"][2] = [globals.generate_pokemon("rhydon", 6, {"bonus_health": 10, "bonus_ap": 1}), 
                        globals.generate_pokemon("nidoking", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("persian", 8), 
                        null]


    teams["RocketF"][0] = [globals.generate_pokemon("golbat", 1), 
                        globals.generate_pokemon("raticate", 1), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["RocketF"][1] = [globals.generate_pokemon("weezing", 4), 
                        globals.generate_pokemon("arbok", 4), 
                        null, 
                        globals.generate_pokemon("golbat", 4), 
                        null, 
                        null]

    teams["RocketF"][2] = [globals.generate_pokemon("weezing", 6), 
                        globals.generate_pokemon("arbok", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("golbat", 8), 
                        null]
    teams["RocketF"][3] = [globals.generate_pokemon("weezing", 6), 
                        globals.generate_pokemon("arbok", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("golbat", 8), 
                        null]


    teams["Koichi"][0] = [globals.generate_pokemon("tyrogue", 2, {"bonus_ap": -1}), 
                        globals.generate_pokemon("tyrogue", 2, {"bonus_ap": -1}), 
                        globals.generate_pokemon("tyrogue", 3, {"slot1": 1}), 
                        null, 
                        null, 
                        null]

    teams["Koichi"][1] = [globals.generate_pokemon("hitmonchan", 3), 
                        null, 
                        globals.generate_pokemon("hitmonlee", 3), 
                        null, 
                        globals.generate_pokemon("tyrogue", 4), 
                        null]

    teams["Koichi"][2] = [globals.generate_pokemon("hitmonchan", 6), 
                        globals.generate_pokemon("hitmontop", 6), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("hitmonlee", 6)]


    teams["Falkner"][0] = [null, 
                        globals.generate_pokemon("pidgeotto", 2), 
                        null, 
                        globals.generate_pokemon("pidgey", 1, {"bonus_ap": -1, "slot2": 2}), 
                        null, 
                        globals.generate_pokemon("pidgey", 1, {"bonus_ap": -1, "slot2": 2})]

    teams["Falkner"][1] = [null, 
                        globals.generate_pokemon("pidgeotto", 4), 
                        null, 
                        globals.generate_pokemon("pidgey", 5), 
                        globals.generate_pokemon("noctowl", 4), 
                        null]

    teams["Falkner"][2] = [null, 
                        globals.generate_pokemon("pidgeot", 7), 
                        null, 
                        globals.generate_pokemon("xatu", 6), 
                        globals.generate_pokemon("noctowl", 7, {"bonus_ap": 2, "slot2": 1, "slot3": 1, "bonus_power": 15}), 
                        null]


    teams["Bugsy"][0] = [null, 
                        globals.generate_pokemon("kakuna", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("scyther", 1, {"slot1": 1, "slot2": 2, "slot3": 2, "bonus_ap": -2}), 
                        null]

    teams["Bugsy"][1] = [globals.generate_pokemon("pinsir", 2, {"bonus_power": -25, "bonus_health": -15}), 
                        globals.generate_pokemon("scyther", 3, {"slot1": 1, "slot2": 1, "slot3": 2, "bonus_ap": -2}), 
                        null, 
                        null, 
                        globals.generate_pokemon("metapod", 6), 
                        null]

    teams["Bugsy"][2] = [globals.generate_pokemon("heracross", 7), 
                        globals.generate_pokemon("scizor", 6), 
                        globals.generate_pokemon("pinsir", 6), 
                        null, 
                        null, 
                        null]


    teams["Whitney"][0] = [null, 
                        globals.generate_pokemon("miltank", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("clefairy", 1), 
                        null]

    teams["Whitney"][1] = [globals.generate_pokemon("clefairy", 3), 
                        globals.generate_pokemon("miltank", 4), 
                        globals.generate_pokemon("wigglytuff", 2), 
                        null, 
                        null, 
                        null]

    teams["Whitney"][2] = [null, 
                        globals.generate_pokemon("miltank", 7), 
                        globals.generate_pokemon("tauros", 6), 
                        null, 
                        globals.generate_pokemon("clefable", 6), 
                        null]


    teams["Morty"][0] = [globals.generate_pokemon("misdreavus", 3), 
                        globals.generate_pokemon("haunter", 2), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Morty"][1] = [globals.generate_pokemon("haunter", 3), 
                        null, 
                        globals.generate_pokemon("haunter", 3), 
                        null, 
                        globals.generate_pokemon("misdreavus", 4), 
                        null]

    teams["Morty"][2] = [null, 
                        globals.generate_pokemon("gengar", 6), 
                        globals.generate_pokemon("haunter", 6, {"bonus_health": 15}), 
                        globals.generate_pokemon("mismagius", 7), 
                        null, 
                        null]


    teams["Chuck"][0] = [globals.generate_pokemon("mankey", 4), 
                        globals.generate_pokemon("poliwhirl", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Chuck"][1] = [globals.generate_pokemon("primeape", 5), 
                        globals.generate_pokemon("poliwrath", 5), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Chuck"][2] = [globals.generate_pokemon("primeape", 6), 
                        globals.generate_pokemon("poliwrath", 6), 
                        globals.generate_pokemon("ursaring", 7), 
                        null, 
                        null, 
                        null]


    teams["Jasmine"][0] = [null, 
                        globals.generate_pokemon("steelix", 3, {"bonus_power": -8}), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Jasmine"][1] = [globals.generate_pokemon("magnemite", 1), 
                        globals.generate_pokemon("steelix", 4), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Jasmine"][2] = [globals.generate_pokemon("skarmory", 6), 
                        globals.generate_pokemon("steelix", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("ampharos", 6), 
                        null]


    teams["Janine"][0] = [globals.generate_pokemon("spinarak", 2), 
                        globals.generate_pokemon("koffing", 1), 
                        globals.generate_pokemon("spinarak", 1), 
                        null, 
                        null, 
                        null]

    teams["Janine"][1] = [null, 
                        globals.generate_pokemon("weezing", 3), 
                        null, 
                        globals.generate_pokemon("spinarak", 4), 
                        globals.generate_pokemon("ariados", 4), 
                        null]

    teams["Janine"][2] = [globals.generate_pokemon("crobat", 6), 
                        globals.generate_pokemon("ariados", 7), 
                        null, 
                        globals.generate_pokemon("venomoth", 6), 
                        null, 
                        null]


    teams["Clair"][0] = [globals.generate_pokemon("seadra", 3), 
                        globals.generate_pokemon("dragonair", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Clair"][1] = [globals.generate_pokemon("dragonair", 3), 
                        null, 
                        globals.generate_pokemon("dragonair", 3), 
                        null, 
                        globals.generate_pokemon("seadra", 4), 
                        null]

    teams["Clair"][2] = [globals.generate_pokemon("dragonair", 6), 
                        null, 
                        globals.generate_pokemon("dragonair", 6), 
                        null, 
                        globals.generate_pokemon("kingdra", 7), 
                        null]


    teams["Karen"][2] = [globals.generate_pokemon("weavile", 6), 
                        globals.generate_pokemon("houndoom", 7), 
                        null, 
                        globals.generate_pokemon("umbreon", 6, {"slot2": 1}), 
                        null, 
                        null]


    teams["Bruno"][2] = [globals.generate_pokemon("onix", 6, {"slot2": 1, "bonus_ap": 2}), 
                        globals.generate_pokemon("machamp", 7, {"bonus_ap": 1, "slot1": 1, "slot3": 1, }), 
                        null, 
                        globals.generate_pokemon("poliwrath", 6, {"slot1": 1, "slot2": 1}), 
                        null, 
                        null]


    teams["Agatha"][2] = [null, 
                        globals.generate_pokemon("golbat", 6), 
                        null, 
                        globals.generate_pokemon("arbok", 7, {"bonus_power": 15, "bonus_health": 15}), 
                        globals.generate_pokemon("gengar", 7), 
                        null, ]


    teams["Lorelei"][2] = [globals.generate_pokemon("dewgong", 6, {"bonus_ap": 1, "slot3": 1}), 
                        globals.generate_pokemon("lapras", 7), 
                        null, 
                        globals.generate_pokemon("jynx", 6, {"bonus_ap": 1, }), 
                        null, 
                        null, ]


    teams["Lance"][3] = [globals.generate_pokemon("gyarados", 6, {"slot1": 1, "slot3": 1, "bonus_ap": -1}), 
                        globals.generate_pokemon("dragonite", 9, {}), 
                        null, 
                        globals.generate_pokemon("aerodactyl", 6, {"slot1": 1}), 
                        null, 
                        null, ]


    teams["Roxanne"][0] = [null, 
                        globals.generate_pokemon("nosepass", 2), 
                        globals.generate_pokemon("anorith", 1), 
                        null, 
                        null, 
                        null]

    teams["Roxanne"][1] = [globals.generate_pokemon("anorith", 4, {"bonus_ap": 1}), 
                        globals.generate_pokemon("cradily", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("nosepass", 3), 
                        null]

    teams["Roxanne"][2] = [globals.generate_pokemon("cradily", 6), 
                        globals.generate_pokemon("armaldo", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("nosepass", 9, {"bonus_ap": 2, "bonus_pp": 1, "bonus_health": 15, "bonus_power": 20}), 
                        null]


    teams["Brawly"][0] = [globals.generate_pokemon("makuhita", 2), 
                        globals.generate_pokemon("medicham", 1, {"slot2": 2}), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Brawly"][1] = [globals.generate_pokemon("medicham", 3), 
                        globals.generate_pokemon("hariyama", 3), 
                        globals.generate_pokemon("makuhita", 4), 
                        null, 
                        null, 
                        null]

    teams["Brawly"][2] = [globals.generate_pokemon("medicham", 6, {"bonus_ap": 2, "bonus_power": 20}), 
                        globals.generate_pokemon("hariyama", 7, {"bonus_ap": 1}), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("breloom", 6, {"bonus_ap": 1, "slot1": 1})]


    teams["Wattson"][0] = [globals.generate_pokemon("minun", 2, {"bonus_pp": -1}), 
                        globals.generate_pokemon("electrike", 2), 
                        null, 
                        globals.generate_pokemon("magnemite", 1), 
                        null, 
                        null]

    teams["Wattson"][1] = [globals.generate_pokemon("magneton", 3), 
                        null, 
                        globals.generate_pokemon("minun", 3), 
                        null, 
                        globals.generate_pokemon("manectric", 4), 
                        null]

    teams["Wattson"][2] = [globals.generate_pokemon("magneton", 6), 
                        null, 
                        globals.generate_pokemon("plusle", 6), 
                        null, 
                        globals.generate_pokemon("manectric", 7), 
                        null]


    teams["Flannery"][0] = [null, 
                        globals.generate_pokemon("numel", 3), 
                        globals.generate_pokemon("slugma", 3), 
                        null, 
                        null, 
                        null]

    teams["Flannery"][1] = [null, 
                        globals.generate_pokemon("torkoal", 4, {"slot1": 1, "slot3": 1}), 
                        globals.generate_pokemon("numel", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("magcargo", 2, {"slot2": 1})]

    teams["Flannery"][2] = [null, 
                        globals.generate_pokemon("torkoal", 7, {"slot1": 1, "bonus_power": 15, "bonus_ap": 1}), 
                        globals.generate_pokemon("camerupt", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("magcargo", 6, {"slot2": 1, "bonus_health": 15, "bonus_power": 20})]


    teams["Norman"][0] = [globals.generate_pokemon("vigoroth", 2, ), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("spinda", 1, {"bonus_ap": -2}), 
                        null]

    teams["Norman"][1] = [globals.generate_pokemon("kecleon", 3), 
                        globals.generate_pokemon("vigoroth", 4, {"bonus_power": 10, "bonus_ap": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("spinda", 3), 
                        null]

    teams["Norman"][2] = [globals.generate_pokemon("exploud", 6), 
                        globals.generate_pokemon("slaking", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("spinda", 8, {"bonus_power": 15, "bonus_health": 15, "bonus_ap": 2, "bonus_pp": 2}), 
                        null]


    teams["Winona"][0] = [null, 
                        globals.generate_pokemon("wingull", 1), 
                        null, 
                        globals.generate_pokemon("taillow", 2), 
                        globals.generate_pokemon("swablu", 2), 
                        null]

    teams["Winona"][1] = [globals.generate_pokemon("swellow", 3), 
                        globals.generate_pokemon("pelipper", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("swablu", 4), 
                        null]

    teams["Winona"][2] = [null, 
                        globals.generate_pokemon("altaria", 7), 
                        null, 
                        globals.generate_pokemon("swellow", 6), 
                        globals.generate_pokemon("pelipper", 6, {"bonus_ap": 1, "bonus_power": 15}), 
                        null]


    teams["Wallace"][0] = [globals.generate_pokemon("luvdisc", 1), 
                        globals.generate_pokemon("luvdisc", 2), 
                        globals.generate_pokemon("luvdisc", 1), 
                        null, 
                        null, 
                        null]

    teams["Wallace"][1] = [globals.generate_pokemon("wailmer", 3), 
                        globals.generate_pokemon("ludicolo", 4, {"slot2": 1}), 
                        globals.generate_pokemon("sealeo", 3), 
                        null, 
                        null, 
                        null]

    teams["Wallace"][2] = [globals.generate_pokemon("walrein", 6), 
                        globals.generate_pokemon("wailord", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("milotic", 7), 
                        null]


    teams["Sidney"][2] = [globals.generate_pokemon("shiftry", 6), 
                        globals.generate_pokemon("absol", 7), 
                        globals.generate_pokemon("crawdaunt", 6, {"slot2": 1}), 
                        null, 
                        null, 
                        null]


    teams["Phoebe"][2] = [globals.generate_pokemon("dusclops", 7, {"slot2": 1, "slot3": 1, "bonus_power": 30, "bonus_ap": 2, "bonus_pp": 2}), 
                        globals.generate_pokemon("sableye", 8, {"bonus_health": 30, "bonus_ap": 2, "slot2": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("banette", 7, {"bonus_ap": 1}), 
                        null]


    teams["Drake"][2] = [null, 
                        globals.generate_pokemon("altaria", 6), 
                        null, 
                        globals.generate_pokemon("flygon", 6), 
                        globals.generate_pokemon("salamence", 7, {"slot1": 1}), 
                        null]


    teams["Steven"][3] = [globals.generate_pokemon("aggron", 7), 
                        null, 
                        globals.generate_pokemon("skarmory", 7), 
                        null, 
                        globals.generate_pokemon("metagross", 9, ), 
                        null]


    teams["Roark"][0] = [null, 
                        globals.generate_pokemon("shieldon", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("cranidos", 2), 
                        null]

    teams["Roark"][1] = [globals.generate_pokemon("archeops", 2), 
                        globals.generate_pokemon("shieldon", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("cranidos", 4), 
                        null]

    teams["Roark"][2] = [globals.generate_pokemon("archeops", 6), 
                        globals.generate_pokemon("bastiodon", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("rampardos", 7), 
                        null]


    teams["Gardenia"][0] = [null, 
                        globals.generate_pokemon("tropius", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("roselia", 3), 
                        null]

    teams["Gardenia"][1] = [globals.generate_pokemon("tropius", 3), 
                        globals.generate_pokemon("leafeon", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("roselia", 3), 
                        null]

    teams["Gardenia"][2] = [globals.generate_pokemon("gogoat", 6), 
                        globals.generate_pokemon("leafeon", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("roserade", 7), 
                        null]


    teams["Candice"][0] = [globals.generate_pokemon("piloswine", 3), 
                        globals.generate_pokemon("snover", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Candice"][1] = [globals.generate_pokemon("snover", 3), 
                        globals.generate_pokemon("glaceon", 4), 
                        globals.generate_pokemon("piloswine", 3), 
                        null, 
                        null, 
                        null]

    teams["Candice"][2] = [globals.generate_pokemon("mamoswine", 5), 
                        globals.generate_pokemon("abomasnow", 7), 
                        globals.generate_pokemon("glaceon", 6), 
                        null, 
                        null, 
                        null]


    teams["Volkner"][0] = [globals.generate_pokemon("electabuzz", 3), 
                        globals.generate_pokemon("luxio", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Volkner"][1] = [globals.generate_pokemon("electabuzz", 4), 
                        globals.generate_pokemon("jolteon", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("luxio", 4), 
                        null]

    teams["Volkner"][2] = [globals.generate_pokemon("electivire", 7), 
                        null, 
                        globals.generate_pokemon("jolteon", 5), 
                        null, 
                        globals.generate_pokemon("luxray", 7), 
                        null]


    teams["Fantina"][0] = [null, 
                        globals.generate_pokemon("drifblim", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("rotom", 3), 
                        null]

    teams["Fantina"][1] = [globals.generate_pokemon("drifblim", 4), 
                        globals.generate_pokemon("dusclops", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("fan_rotom", 3), 
                        null]

    teams["Fantina"][2] = [globals.generate_pokemon("jellicent_f", 6), 
                        null, 
                        globals.generate_pokemon("dusknoir", 6), 
                        null, 
                        globals.generate_pokemon("mismagius", 7), 
                        null]


    teams["Flint"][0] = [globals.generate_pokemon("magmar", 3), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("houndour", 3), 
                        null]

    teams["Flint"][1] = [globals.generate_pokemon("magmar", 4), 
                        null, 
                        globals.generate_pokemon("flareon", 4), 
                        null, 
                        globals.generate_pokemon("houndour", 4), 
                        null]

    teams["Flint"][2] = [globals.generate_pokemon("magmortar", 7), 
                        null, 
                        globals.generate_pokemon("flareon", 6), 
                        null, 
                        globals.generate_pokemon("houndoom", 6), 
                        null]


    teams["Cyrus"][0] = [null, 
                        globals.generate_pokemon("golbat", 1, {"slot2": 1}), 
                        null, 
                        globals.generate_pokemon("murkrow", 1), 
                        globals.generate_pokemon("sneasel", 1), 
                        null]

    teams["Cyrus"][1] = [null, 
                        globals.generate_pokemon("golbat", 3, ), 
                        null, 
                        globals.generate_pokemon("murkrow", 4), 
                        globals.generate_pokemon("sneasel", 4), 
                        null]

    teams["Cyrus"][2] = [globals.generate_pokemon("honchkrow", 6), 
                        globals.generate_pokemon("crobat", 6, {"slot2": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("weavile", 7), 
                        null]


    teams["Cynthia"][3] = [null, 
                        globals.generate_pokemon("spiritomb", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("garchomp", 9), 
                        globals.generate_pokemon("lucario", 7)]


    teams["Palmer"][3] = [globals.generate_pokemon("milotic", 7), 
                        globals.generate_pokemon("rhyperior", 9), 
                        globals.generate_pokemon("dragonite", 7, {"slot1": 1, "slot2": 1, "slot3": 1}), 
                        null, 
                        null, 
                        null]


    teams["Alder"][3] = [null, 
                        globals.generate_pokemon("krookodile", 7, {"bonus_health": 20, "bonus_power": -15}), 
                        null, 
                        globals.generate_pokemon("chandelure", 7), 
                        globals.generate_pokemon("volcarona", 9, {"slot3": 1}), 
                        null]


    teams["Burgh"][0] = [null, 
                        globals.generate_pokemon("crustle", 1, {"bonus_health": -25, "bonus_power": -15}), 
                        null, 
                        null, 
                        globals.generate_pokemon("leavanny", 2, {"bonus_health": -15}), 
                        null]

    teams["Burgh"][1] = [null, 
                        globals.generate_pokemon("crustle", 5), 
                        null, 
                        null, 
                        globals.generate_pokemon("leavanny", 5, {"bonus_ap": 1}), 
                        null]

    teams["Burgh"][2] = [globals.generate_pokemon("accelgor", 6, {"slot2": 1}), 
                        globals.generate_pokemon("crustle", 7, {"bonus_health": 20, "bonus_ap": 2}), 
                        globals.generate_pokemon("escavalier", 6), 
                        null, 
                        null, 
                        null]


    teams["Clay"][0] = [globals.generate_pokemon("krokorok", 2), 
                        null, 
                        globals.generate_pokemon("palpitoad", 2), 
                        null, 
                        null, 
                        null]

    teams["Clay"][1] = [globals.generate_pokemon("krokorok", 4), 
                        globals.generate_pokemon("seismitoad", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("drilbur", 4), 
                        null]

    teams["Clay"][2] = [globals.generate_pokemon("krookodile", 7), 
                        null, 
                        globals.generate_pokemon("seismitoad", 6), 
                        null, 
                        globals.generate_pokemon("excadrill", 6), 
                        null]


    teams["Elesa"][0] = [globals.generate_pokemon("emolga", 1, {"bonus_ap": -1}), 
                        null, 
                        globals.generate_pokemon("mareep", 1), 
                        null, 
                        globals.generate_pokemon("blitzle", 1), 
                        null]

    teams["Elesa"][1] = [globals.generate_pokemon("emolga", 4), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("zebstrika", 3), 
                        globals.generate_pokemon("galvantula", 2)]

    teams["Elesa"][2] = [null, 
                        globals.generate_pokemon("eelektross", 6, {"bonus_health": 15}), 
                        null, 
                        globals.generate_pokemon("galvantula", 6), 
                        globals.generate_pokemon("zebstrika", 7, {"bonus_power": 15, "bonus_ap": 1}), 
                        null]


    teams["Skyla"][0] = [null, 
                        globals.generate_pokemon("swanna", 2), 
                        null, 
                        globals.generate_pokemon("rufflet", 1, {"bonus_ap": -1}), 
                        null, 
                        globals.generate_pokemon("vullaby", 1, {"bonus_ap": -1})]

    teams["Skyla"][1] = [null, 
                        globals.generate_pokemon("swanna", 4), 
                        globals.generate_pokemon("mandibuzz", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("rufflet", 3)]

    teams["Skyla"][2] = [globals.generate_pokemon("archeops", 6), 
                        globals.generate_pokemon("mandibuzz", 6), 
                        null, 
                        null, 
                        globals.generate_pokemon("braviary", 7, {"slot3": 1}), 
                        null]


    teams["Lenora"][0] = [globals.generate_pokemon("lickitung", 1), 
                        globals.generate_pokemon("herdier", 2), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Lenora"][1] = [globals.generate_pokemon("herdier", 2), 
                        globals.generate_pokemon("audino", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("stoutland", 4), 
                        null]

    teams["Lenora"][2] = [null, 
                        globals.generate_pokemon("audino", 6), 
                        null, 
                        globals.generate_pokemon("cinccino", 6, {"bonus_ap": 1}), 
                        globals.generate_pokemon("stoutland", 7, {"bonus_power": 15, "bonus_ap": 1}), 
                        null]


    teams["Iris"][0] = [null, 
                        globals.generate_pokemon("druddigon", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("fraxure", 1), 
                        null]

    teams["Iris"][1] = [null, 
                        globals.generate_pokemon("druddigon", 3), 
                        null, 
                        globals.generate_pokemon("fraxure", 3), 
                        null, 
                        globals.generate_pokemon("shelgon", 3)]

    teams["Iris"][2] = [globals.generate_pokemon("haxorus", 7), 
                        null, 
                        globals.generate_pokemon("salamence", 7), 
                        null, 
                        null, 
                        null]


    teams["Roxie"][0] = [null, 
                        globals.generate_pokemon("whirlipede", 2), 
                        null, 
                        null, 
                        globals.generate_pokemon("trubbish", 2), 
                        null]

    teams["Roxie"][1] = [null, 
                        globals.generate_pokemon("garbodor", 5), 
                        null, 
                        null, 
                        globals.generate_pokemon("scolipede", 5, {"slot2": 1, "bonus_ap": 1}), 
                        null]

    teams["Roxie"][2] = [null, 
                        globals.generate_pokemon("garbodor", 6, {"slot1": 1}), 
                        null, 
                        globals.generate_pokemon("amoonguss", 6, {"slot1": 1, "bonus_ap": 3}), 
                        globals.generate_pokemon("scolipede", 7, {"slot2": 1, "bonus_ap": 1}), 
                        null]


    teams["Hilbert"][0] = [globals.generate_pokemon("pansear", 1), 
                        globals.generate_pokemon("dewott", 1), 
                        null, 
                        null, 
                        globals.generate_pokemon("munna", 1), 
                        null]

    teams["Hilbert"][1] = [globals.generate_pokemon("simisear", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("munna", 3), 
                        globals.generate_pokemon("dewott", 4), 
                        null]

    teams["Hilbert"][2] = [null, 
                        globals.generate_pokemon("samurott", 7), 
                        null, 
                        globals.generate_pokemon("musharna", 6), 
                        null, 
                        globals.generate_pokemon("simisear", 6, {"slot2": 1, "bonus_ap": 2})]


    teams["Hilda"][0] = [null, 
                        globals.generate_pokemon("pignite", 1), 
                        globals.generate_pokemon("pansage", 1), 
                        globals.generate_pokemon("rufflet", 1), 
                        null, 
                        null]

    teams["Hilda"][1] = [globals.generate_pokemon("simisage", 4), 
                        globals.generate_pokemon("pignite", 3), 
                        null, 
                        globals.generate_pokemon("rufflet", 3, {"bonus_ap": 1}), 
                        null, 
                        null]

    teams["Hilda"][2] = [null, 
                        globals.generate_pokemon("emboar", 7), 
                        null, 
                        globals.generate_pokemon("braviary", 6), 
                        null, 
                        globals.generate_pokemon("simisage", 6, {"slot2": 1, "bonus_ap": 1})]


    teams["N"][0] = [globals.generate_pokemon("panpour", 1), 
                    globals.generate_pokemon("servine", 1), 
                    null, 
                    globals.generate_pokemon("zorua", 1), 
                    null, 
                    null]

    teams["N"][1] = [null, 
                    globals.generate_pokemon("servine", 3, {"bonus_ap": 1, }), 
                    null, 
                    globals.generate_pokemon("zorua", 3), 
                    null, 
                    globals.generate_pokemon("liepard", 3)]

    teams["N"][2] = [null, 
                    globals.generate_pokemon("serperior", 6, {"bonus_health": 15}), 
                    globals.generate_pokemon("simipour", 6, {"slot2": 1, "bonus_ap": 1, "bonus_health": 20}), 
                    null, 
                    globals.generate_pokemon("zoroark", 7), 
                    null]


    teams["Calem"][0] = [null, 
                        globals.generate_pokemon("quilladin", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("fletchinder", 3), 
                        null]

    teams["Calem"][1] = [globals.generate_pokemon("quilladin", 3, {"bonus_ap": 1}), 
                        globals.generate_pokemon("kangaskhan", 2, {"slot2": 2, "bonus_health": -15}), 
                        null, 
                        null, 
                        globals.generate_pokemon("fletchinder", 3), 
                        null]

    teams["Calem"][2] = [null, 
                        globals.generate_pokemon("chesnaught", 7), 
                        null, 
                        globals.generate_pokemon("kangaskhan", 6, {"slot2": 1}), 
                        globals.generate_pokemon("talonflame", 6, {"slot2": 1, "bonus_ap": 1}), 
                        null]


    teams["Serena"][0] = [null, 
                        globals.generate_pokemon("eevee", 3, {"slot2": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("braixen", 3), 
                        null]

    teams["Serena"][1] = [globals.generate_pokemon("pinsir", 3, {"bonus_power": -15}), 
                        globals.generate_pokemon("sylveon", 3, {"slot1": 1, "slot2": 1, "bonus_ap": -1}), 
                        null, 
                        globals.generate_pokemon("braixen", 3, {"bonus_ap": 1}), 
                        null, 
                        null]

    teams["Serena"][2] = [globals.generate_pokemon("pinsir", 6, ), 
                        globals.generate_pokemon("sylveon", 6, {"slot2": 1}), 
                        null, 
                        null, 
                        globals.generate_pokemon("delphox", 7), 
                        null]


    teams["Tierno"][0] = [globals.generate_pokemon("inkay", 1, {"bonus_ap": -1}), 
                        globals.generate_pokemon("corphish", 1), 
                        null, 
                        null, 
                        globals.generate_pokemon("frogadier", 1), 
                        null]

    teams["Tierno"][1] = [null, 
                        globals.generate_pokemon("crawdaunt", 3), 
                        null, 
                        globals.generate_pokemon("inkay", 3), 
                        globals.generate_pokemon("frogadier", 4, {"bonus_ap": 1}), 
                        null]

    teams["Tierno"][2] = [null, 
                        globals.generate_pokemon("crawdaunt", 6), 
                        null, 
                        globals.generate_pokemon("malamar", 6), 
                        globals.generate_pokemon("greninja", 7), 
                        null]


    teams["Maxie"][0] = [null, 
                        globals.generate_pokemon("mightyena", 1, {"slot2": 1, }), 
                        globals.generate_pokemon("koffing", 1), 
                        null, 
                        globals.generate_pokemon("numel", 2), 
                        null]

    teams["Maxie"][1] = [null, 
                        globals.generate_pokemon("zangoose", 3, ), 
                        globals.generate_pokemon("weezing", 3), 
                        null, 
                        globals.generate_pokemon("camerupt", 4, {"slot1": 1, "slot3": 1, "bonus_ap": -1}), 
                        null]

    teams["Maxie"][2] = [null, 
                        globals.generate_pokemon("zangoose", 6, {"bonus_ap": 1}), 
                        globals.generate_pokemon("weezing", 6), 
                        null, 
                        globals.generate_pokemon("camerupt", 7, {"slot3": 1, "bonus_ap": 1}), 
                        null]


    teams["Archie"][0] = [null, 
                        globals.generate_pokemon("mightyena", 1, {"slot2": 1, }), 
                        globals.generate_pokemon("grimer", 1), 
                        null, 
                        globals.generate_pokemon("carvanha", 2), 
                        null]

    teams["Archie"][1] = [null, 
                        globals.generate_pokemon("seviper", 3, ), 
                        globals.generate_pokemon("muk", 3, {"bonus_ap": -2, "slot3": 1, "bonus_health": -15}), 
                        null, 
                        globals.generate_pokemon("sharpedo", 4, {"bonus_power": -15}), 
                        null]

    teams["Archie"][2] = [null, 
                        globals.generate_pokemon("seviper", 6, {"bonus_ap": 1}), 
                        globals.generate_pokemon("muk", 6), 
                        null, 
                        globals.generate_pokemon("sharpedo", 7, {"bonus_health": 10}), 
                        null]


    teams["Lysandre"][2] = [null, 
                        globals.generate_pokemon("pyroar", 7, {"bonus_health": 30, }), 
                        null, 
                        globals.generate_pokemon("noivern", 5, {"bonus_ap": -1}), 
                        globals.generate_pokemon("mienshao", 6, {"slot2": 1}), 
                        null]


    teams["Ghetsis"][2] = [globals.generate_pokemon("seismitoad", 5), 
                        globals.generate_pokemon("cofagrigus", 4), 
                        null, 
                        null, 
                        globals.generate_pokemon("hydreigon", 7, ), 
                        null]


    teams["Diantha"][3] = [globals.generate_pokemon("aurorus", 6), 
                        globals.generate_pokemon("goodra", 7), 
                        null, 
                        null, 
                        globals.generate_pokemon("gardevoir", 9, {"slot3": 1, "slot2": 1, }), 
                        null]



    teams["Wes"][2] = [null, 
                        globals.generate_pokemon("umbreon", 6), 
                        null, 
                        globals.generate_pokemon("plusle", 6), 
                        globals.generate_pokemon("espeon", 6), 
                        null]


    teams["Jack"][0] = [null, 
                        globals.generate_pokemon("pancham", 1, {"bonus_speed": 10}), 
                        null, 
                        null, 
                        globals.generate_pokemon("barbaracle", 1, {"bonus_ap": -1, "slot3": 1, "slot2": 2}), 
                        null]

    teams["Jack"][1] = [globals.generate_pokemon("pikachu", 3), 
                        globals.generate_pokemon("pancham", 4, {"bonus_speed": 10, "bonus_health": 10, "bonus_power": 10}), 
                        null, 
                        globals.generate_pokemon("barbaracle", 3), 
                        null, 
                        null]

    teams["Jack"][2] = [globals.generate_pokemon("raichu", 6), 
                        globals.generate_pokemon("pangoro", 7, {"bonus_speed": 10}), 
                        null, 
                        globals.generate_pokemon("malamar", 3, {"slot1": 1, "slot2": 1, "slot3": 1, "bonus_health": 10}), 
                        null, 
                        null]


    teams["Joey"][0] = [globals.generate_pokemon("rattata", 3), 
                        null, 
                        globals.generate_pokemon("zigzagoon", 3), 
                        null, 
                        null, 
                        null]

    teams["Joey"][1] = [globals.generate_pokemon("raticate", 3, {"slot2": 2, "slot1": 1}), 
                        null, 
                        globals.generate_pokemon("linoone", 4), 
                        null, 
                        globals.generate_pokemon("rattata", 3), 
                        null]

    teams["Joey"][2] = [null, 
                        globals.generate_pokemon("joey rattata", 9), 
                        null, 
                        null, 
                        null, 
                        null]


    teams["Megan"][0] = [null, 
                        globals.generate_pokemon("jigglypuff", 3), 
                        null, 
                        null, 
                        globals.generate_pokemon("skitty", 3), 
                        null]

    teams["Megan"][1] = [null, 
                        globals.generate_pokemon("wigglytuff", 4, {"bonus_health": -15}), 
                        null, 
                        globals.generate_pokemon("delcatty", 2), 
                        globals.generate_pokemon("lopunny", 3, {"bonus_ap": -2, "slot3": 2}), 
                        null]

    teams["Megan"][2] = [null, 
                        globals.generate_pokemon("lopunny", 6), 
                        globals.generate_pokemon("wigglytuff", 5), 
                        null, 
                        globals.generate_pokemon("pachirisu", 9, {"bonus_ap": 2, "slot2": 1}), 
                        null]


    teams["Weevil"][0] = [globals.generate_pokemon("metapod", 4), 
                        null, 
                        globals.generate_pokemon("kakuna", 4), 
                        null, 
                        globals.generate_pokemon("wurmple", 2), 
                        null]

    teams["Weevil"][1] = [null, 
                        globals.generate_pokemon("beedrill", 3), 
                        null, 
                        globals.generate_pokemon("butterfree", 3), 
                        globals.generate_pokemon("beautifly", 3), 
                        null]


    teams["Bill"][0] = [globals.generate_pokemon("clefairy", 3), 
                        globals.generate_pokemon("eevee", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["Bill"][1] = [globals.generate_pokemon("vaporeon", 3, {"bonus_ap": -2}), 
                        globals.generate_pokemon("jolteon", 3, {"bonus_ap": -2}), 
                        globals.generate_pokemon("flareon", 3, {"bonus_ap": -2, "bonus_pp": -1}), 
                        null, 
                        null, 
                        null]

    teams["Bill"][2] = [globals.generate_pokemon("jolteon", 6, {"bonus_ap": 1}), 
                        globals.generate_pokemon("vaporeon", 7, {"bonus_health": 15}), 
                        null, 
                        globals.generate_pokemon("flareon", 6, {"bonus_ap": 1}), 
                        null, 
                        null]


    teams["Oak"][3] = [globals.generate_pokemon("articuno", 8, {"slot2": 1}), 
                        globals.generate_pokemon("zapdos", 8, {"slot2": 1}), 
                        globals.generate_pokemon("moltres", 8, {"slot2": 1}), 
                        null, 
                        null, 
                        null]


    teams["BrockMisty"][0] = [globals.generate_pokemon("onix", 1, {"slot3": 2}), 
                            globals.generate_pokemon("staryu", 2), 
                            null, 
                            null, 
                            globals.generate_pokemon("togepi", 1), 
                            null]

    teams["BrockMisty"][1] = [null, 
                            globals.generate_pokemon("onix", 3), 
                            globals.generate_pokemon("starmie", 3), 
                            null, 
                            null, 
                            globals.generate_pokemon("togetic", 2)]

    teams["BrockMisty"][2] = [globals.generate_pokemon("golem", 7), 
                            globals.generate_pokemon("starmie", 7), 
                            null, 
                            null, 
                            globals.generate_pokemon("togekiss", 5), 
                            null]


    teams["SurgeErika"][0] = [globals.generate_pokemon("gloom", 1, ), 
                            null, 
                            globals.generate_pokemon("tangela", 1, ), 
                            null, 
                            globals.generate_pokemon("pikachu", 2), 
                            null]

    teams["SurgeErika"][1] = [null, 
                            globals.generate_pokemon("pikachu", 5), 
                            globals.generate_pokemon("electrode", 3), 
                            null, 
                            globals.generate_pokemon("bellossom", 3), 
                            null]

    teams["SurgeErika"][2] = [globals.generate_pokemon("electrode", 5), 
                            globals.generate_pokemon("vileplume", 7), 
                            null, 
                            null, 
                            globals.generate_pokemon("raichu", 7), 
                            null]


    teams["BlueSilver"][0] = [null, 
                            globals.generate_pokemon("croconaw", 3, ), 
                            null, 
                            null, 
                            globals.generate_pokemon("wartortle", 3), 
                            null]

    teams["BlueSilver"][1] = [null, 
                            globals.generate_pokemon("raticate", 3), 
                            null, 
                            null, 
                            globals.generate_pokemon("croconaw", 4, {"bonus_ap": 1}), 
                            globals.generate_pokemon("wartortle", 4, {"bonus_ap": 1})]

    teams["BlueSilver"][2] = [globals.generate_pokemon("blastoise", 7), 
                            globals.generate_pokemon("feraligator", 7), 
                            null, 
                            null, 
                            globals.generate_pokemon("arcanine", 6, {"slot2": 1}), 
                            null]


    teams["FlanneryCandice"][0] = [globals.generate_pokemon("numel", 3, {"bonus_ap": 1}), 
                                    null, 
                                    globals.generate_pokemon("piloswine", 3, {"bonus_ap": 1}), 
                                    null, 
                                    null, 
                                    null]

    teams["FlanneryCandice"][1] = [globals.generate_pokemon("camerupt", 4), 
                                    null, 
                                    globals.generate_pokemon("mamoswine", 4), 
                                    null, 
                                    globals.generate_pokemon("snover", 5), 
                                    null]

    teams["FlanneryCandice"][2] = [globals.generate_pokemon("camerupt", 6, {"bonus_ap": 1}), 
                                    null, 
                                    globals.generate_pokemon("mamoswine", 6, {"bonus_ap": 2}), 
                                    null, 
                                    globals.generate_pokemon("abomasnow", 7), 
                                    null]


    teams["ClairIris"][0] = [globals.generate_pokemon("dragonair", 1, {"bonus_ap": -3, "bonus_health": -15}), 
                            null, 
                            null, 
                            globals.generate_pokemon("seadra", 1), 
                            globals.generate_pokemon("fraxure", 2), 
                            null]

    teams["ClairIris"][1] = [globals.generate_pokemon("dragonair", 4), 
                            null, 
                            globals.generate_pokemon("fraxure", 4, {"bonus_ap": 1}), 
                            null, 
                            globals.generate_pokemon("seadra", 5), 
                            null]

    teams["ClairIris"][2] = [globals.generate_pokemon("altaria", 6), 
                            globals.generate_pokemon("haxorus", 6), 
                            null, 
                            null, 
                            globals.generate_pokemon("kingdra", 7), 
                            null]


    teams["BurghElesa"][0] = [globals.generate_pokemon("leavanny", 3), 
                            globals.generate_pokemon("emolga", 3), 
                            null, 
                            null, 
                            null, 
                            null]

    teams["BurghElesa"][1] = [null, 
                            globals.generate_pokemon("crustle", 4), 
                            null, 
                            globals.generate_pokemon("eelektrik", 4), 
                            globals.generate_pokemon("zebstrika", 5), 
                            null]

    teams["BurghElesa"][2] = [null, 
                            globals.generate_pokemon("crustle", 6, {"bonus_health": 15}), 
                            null, 
                            globals.generate_pokemon("galvantula", 6), 
                            globals.generate_pokemon("zebstrika", 6, {"bonus_power": 15, "bonus_ap": 1}), 
                            null]


    teams["BlaineWattson"][0] = [globals.generate_pokemon("electrike", 1, {"slot1": 1, "bonus_speed": -50, "bonus_health": 5}), 
                                globals.generate_pokemon("magmar", 2, {"slot1": 1, "bonus_speed": -50, "bonus_health": 10}), 
                                null, 
                                null, 
                                globals.generate_pokemon("magnemite", 1, {"bonus_speed": 20}), 
                                null]

    teams["BlaineWattson"][1] = [globals.generate_pokemon("manectric", 5), 
                                globals.generate_pokemon("rapidash", 5), 
                                null, 
                                null, 
                                globals.generate_pokemon("magneton", 3), 
                                null]

    teams["BlaineWattson"][2] = [null, 
                                globals.generate_pokemon("rapidash", 7, {"bonus_ap": 2, "bonus_health": 15}), 
                                null, 
                                globals.generate_pokemon("plusle", 6), 
                                globals.generate_pokemon("manectric", 7, {"bonus_ap": 1, "slot3": 1}), 
                                null]


    teams["Cilan"][0] = [globals.generate_pokemon("pansage", 2, {"slot2": 1, "bonus_ap": -1}), 
                        globals.generate_pokemon("pansear", 2, {"slot2": 1, "bonus_ap": -1}), 
                        globals.generate_pokemon("panpour", 2, {"slot2": 1, "bonus_ap": -1}), 
                        null, 
                        null, 
                        null]

    teams["Cilan"][1] = [globals.generate_pokemon("simisage", 4, {"slot2": 1}), 
                        globals.generate_pokemon("simisear", 4, {"slot2": 1}), 
                        globals.generate_pokemon("simipour", 4, {"slot2": 1}), 
                        null, 
                        null, 
                        null]

    teams["Cilan"][2] = [globals.generate_pokemon("simisage", 7, {"slot2": 1, "bonus_ap": 1, "bonus_hp": 15, "bonus_speed": 15}), 
                        globals.generate_pokemon("simisear", 7, {"slot2": 1, "bonus_ap": 1, "bonus_hp": 15, "bonus_speed": 15}), 
                        globals.generate_pokemon("simipour", 7, {"slot2": 1, "bonus_ap": 1, "bonus_hp": 15, "bonus_speed": 15}), 
                        null, 
                        null, 
                        null]


    teams["OldBlue"][0] = [globals.generate_pokemon("pidgeot", 8, {"bonus_power": 10}), 
                        globals.generate_pokemon("blastoise", 9, {"bonus_ap": 1, "bonus_power": 10}), 
                        globals.generate_pokemon("alakazam", 8), 
                        null, 
                        null, 
                        null]
    teams["OldBlue"][1] = [globals.generate_pokemon("pidgeot", 8, {"bonus_power": 10}), 
                        globals.generate_pokemon("blastoise", 9, {"bonus_ap": 1, "bonus_power": 10}), 
                        globals.generate_pokemon("alakazam", 8), 
                        null, 
                        null, 
                        null]
    teams["OldBlue"][2] = [globals.generate_pokemon("pidgeot", 8, {"bonus_power": 10}), 
                        globals.generate_pokemon("blastoise", 9, {"bonus_ap": 1, "bonus_power": 10}), 
                        globals.generate_pokemon("alakazam", 8), 
                        null, 
                        null, 
                        null]


    teams["Yugi"][1] = [globals.generate_pokemon("summoned_skull", 4, {"bonus_power": -20}), 
                        globals.generate_pokemon("dark_magician", 6, {"bonus_power": -15}), 
                        null, 
                        null, 
                        globals.generate_pokemon("dark_magician_girl", 4), 
                        null]

    teams["Yugi"][2] = [globals.generate_pokemon("summoned_skull", 5, ), 
                        globals.generate_pokemon("dark_magician", 8, ), 
                        null, 
                        null, 
                        globals.generate_pokemon("dark_magician_girl", 6), 
                        null]


    teams["Kaiba"][3] = [globals.generate_pokemon("swordstalker", 6), 
                        null, 
                        globals.generate_pokemon("hitotsu-me-giant", 6, {"bonus_ap": 1}), 
                        null, 
                        globals.generate_pokemon("blue_eyes_white_dragon", 9), 
                        null]


    teams["WallyN"][0] = [globals.generate_pokemon("kirlia", 3), 
                        globals.generate_pokemon("zorua", 3), 
                        null, 
                        null, 
                        null, 
                        null]

    teams["WallyN"][1] = [globals.generate_pokemon("kirlia", 4, {"bonus_health": 15, "slot2": 1}), 
                        globals.generate_pokemon("zorua", 5, {"bonus_ap": 2, "bonus_power": 15}), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("liepard", 3, {"slot2": 1})]

    teams["WallyN"][2] = [globals.generate_pokemon("gardevoir", 6, {"bonus_health": 15, "slot1": 1, "slot2": 1, "slot3": 2}), 
                        globals.generate_pokemon("zoroark", 7, {"bonus_power": 10}), 
                        null, 
                        null, 
                        null, 
                        globals.generate_pokemon("liepard", 6, {"bonus_power": 10, "slot2": 1, "slot3": 2, "bonus_ap": 1, "bonus_speed": 15})]


    teams["RoxanneBrawly"][0] = [null, 
                                globals.generate_pokemon("nosepass", 3), 
                                null, 
                                null, 
                                globals.generate_pokemon("makuhita", 3), 
                                null]

    teams["RoxanneBrawly"][1] = [null, 
                                globals.generate_pokemon("nosepass", 6, {"bonus_ap": 1, "bonus_pp": 1}), 
                                null, 
                                null, 
                                globals.generate_pokemon("hariyama", 6, {"bonus_ap": 1, "slot2": 1}), 
                                null]

    teams["RoxanneBrawly"][2] = [null, 
                                globals.generate_pokemon("nosepass", 7, {"bonus_ap": 3, "bonus_power": 15, "bonus_pp": 1}), 
                                null, 
                                globals.generate_pokemon("armaldo", 6, {"slot2": 1}), 
                                globals.generate_pokemon("hariyama", 6, {"bonus_ap": 1, "slot2": 1}), 
                                null]


    teams["Demi-Fiend"][1] = [null, 
                            globals.generate_pokemon("jack_frost", 4, {"bonus_ap": 1, }), 
                            null, 
                            globals.generate_pokemon("jacko_lantern", 3, {"bonus_ap": 1}), 
                            globals.generate_pokemon("pixie", 5, {"bonus_health": 10}), 
                            null]

    teams["Demi-Fiend"][2] = [null, 
                            globals.generate_pokemon("jack_frost", 6, {"bonus_ap": 1, "bonus_pp": 1, }), 
                            null, 
                            globals.generate_pokemon("jacko_lantern", 5, {"bonus_ap": 2, "slot1": 1, }), 
                            globals.generate_pokemon("pixie", 4, {"bonus_ap": 2, "slot1": 1, "bonus_health": 5}), 
                            null]
    teams["Demi-Fiend"][3] = [null, 
                            globals.generate_pokemon("jack_frost", 7, {"bonus_ap": 1, "bonus_pp": 1, }), 
                            null, 
                            globals.generate_pokemon("jacko_lantern", 6, {"bonus_ap": 2, "slot1": 1, }), 
                            globals.generate_pokemon("pixie", 5, {"bonus_ap": 2, "slot1": 1, "bonus_health": 5}), 
                            null]

    teams["Mewtwo"][3] = [null, 
                        globals.generate_pokemon("mewtwo", 9, {"slot3": 1, "bonus_health": 40, "bonus_ap": 2, "bonus_pp": 4}), 
                        null, 
                        null, 
                        null, 
                        null]

func tutorial_battle():
    pass



func play_cutscene(cutscene):
    if cutscene == "misty_event":
        globals.cutscenes.misty_event()

    elif cutscene == "surge_event":
        globals.cutscenes.surge_event()

    elif cutscene == "sabrina_event":
        globals.cutscenes.sabrina_event()

    elif cutscene == "falkner_event":
        globals.cutscenes.falkner_event()

    elif cutscene == "giovanni_event2":
        globals.cutscenes.giovanni_event2()

    elif cutscene == "joey_event":
        globals.cutscenes.joey_event()

    elif cutscene == "cilan_event":
        globals.cutscenes.cilan_event()

    elif cutscene == "champion_beaten":
        if globals.hotel.game_level == 3:
            globals.cutscenes.champion_beaten()

    elif cutscene == "champion_won":
        if globals.hotel.game_level == 3:
            globals.cutscenes.champion_won()

    elif cutscene == "blue_silver_event":
        globals.cutscenes.blue_silver_event()

    elif cutscene == "flannery_candice_event":
        globals.cutscenes.flannery_candice_event()

    elif cutscene == "clair_iris_event":
        globals.cutscenes.clair_iris_event()

    elif cutscene == "burgh_elesa_event":
        globals.cutscenes.burgh_elesa_event()

    elif cutscene == "blaine_wattson_event":
        globals.cutscenes.blaine_wattson_event()

    elif cutscene == "blue_gbc_event":
        globals.cutscenes.blue_gbc_event()

    elif cutscene == "wally_n_event":
        globals.cutscenes.wally_n_event()

    elif cutscene == "roxanne_brawly_event":
        globals.cutscenes.roxanne_brawly_event()

    elif cutscene == "old_man_event":
        globals.cutscenes.old_man_event()

    elif cutscene == "old_lady_event":
        globals.cutscenes.old_lady_event()

    elif cutscene == "smt":
        globals.cutscenes.smt()

func toggle_yugi():
    globals.event_flags["yugi"] = true

func toggle_kaiba():
    globals.event_flags["kaiba"] = true





func get_npc_node(npc_name):
    var npc_node = null
    for i in globals.hotel.get_node("Actors").get_children():
        if not "npc_name" in i: continue
        if i.npc_name == npc_name:
            npc_node = i
            break
    return npc_node

func wait(time):
    await get_tree().create_timer(time).timeout
