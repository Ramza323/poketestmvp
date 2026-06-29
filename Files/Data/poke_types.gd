extends Node

var weak = 1.4
var resist = 0.6
var immune = 0.0

var affinity = {

    "red": { # fire
        "red": resist, "blue": weak, "green": resist, "yellow": 1, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": weak, "ground": weak, "bug": resist, "dragon": 1,
        "ice": resist, "fighting": 1, "poison": 1, "flying": 1, "steel": resist, "fairy": 1
    },

    "blue": { # water
        "red": resist, "blue": resist, "green": weak, "yellow": weak, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": resist, "ground": 1, "bug": 1, "dragon": 1,
        "ice": resist, "fighting": 1, "poison": 1, "flying": 1, "steel": resist, "fairy": 1
    },

    "green": { # grass
        "red": weak, "blue": resist, "green": resist, "yellow": resist, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": resist, "ground": resist, "bug": weak, "dragon": 1,
        "ice": weak, "fighting": 1, "poison": weak, "flying": weak, "steel": 1, "fairy": 1
    },

    "yellow": { # electric
        "red": 1, "blue": resist, "green": resist, "yellow": resist, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": 1, "ground": weak, "bug": 1, "dragon": 1,
        "ice": 1, "fighting": 1, "poison": 1, "flying": resist, "steel": resist, "fairy": 1
    },

    "white": { # normal
        "red": 1, "blue": 1, "green": 1, "yellow": 1, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": immune, "rock": 1, "ground": 1, "bug": 1, "dragon": 1,
        "ice": 1, "fighting": weak, "poison": 1, "flying": 1, "steel": 1, "fairy": 1
    },

    "black": { # dark
        "red": 1, "blue": 1, "green": 1, "yellow": 1, "white": 1, "black": resist, "none": 1,
        "psychic": immune, "ghost": resist, "rock": 1, "ground": 1, "bug": weak, "dragon": 1,
        "ice": 1, "fighting": weak, "poison": 1, "flying": 1, "steel": 1, "fairy": weak
    },

    "psychic": {
        "red": 1, "blue": 1, "green": 1, "yellow": 1, "white": 1, "black": weak, "none": 1,
        "psychic": resist, "ghost": weak, "rock": 1, "ground": 1, "bug": weak, "dragon": 1,
        "ice": 1, "fighting": resist, "poison": resist, "flying": 1, "steel": resist, "fairy": 1
    },

    "ghost": {
        "red": 1, "blue": 1, "green": 1, "yellow": 1, "white": immune, "black": weak, "none": 1,
        "psychic": weak, "ghost": weak, "rock": 1, "ground": 1, "bug": resist, "dragon": 1,
        "ice": 1, "fighting": immune, "poison": resist, "flying": 1, "steel": 1, "fairy": 1
    },

    "rock": {
        "red": resist, "blue": weak, "green": weak, "yellow": 1, "white": resist, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": 1, "ground": weak, "bug": resist, "dragon": 1,
        "ice": resist, "fighting": weak, "poison": resist, "flying": resist, "steel": weak, "fairy": 1
    },

    "ground": {
        "red": 1, "blue": weak, "green": weak, "yellow": immune, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": resist, "ground": 1, "bug": 1, "dragon": 1,
        "ice": weak, "fighting": 1, "poison": resist, "flying": 1, "steel": 1, "fairy": 1
    },

    "bug": {
        "red": weak, "blue": 1, "green": resist, "yellow": 1, "white": 1, "black": resist, "none": 1,
        "psychic": 1, "ghost": 1, "rock": weak, "ground": resist, "bug": 1, "dragon": 1,
        "ice": 1, "fighting": resist, "poison": 1, "flying": weak, "steel": 1, "fairy": 1
    },

    "dragon": {
        "red": resist, "blue": resist, "green": resist, "yellow": resist, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": 1, "ground": 1, "bug": 1, "dragon": weak,
        "ice": weak, "fighting": 1, "poison": 1, "flying": 1, "steel": 1, "fairy": weak
    },

    "ice": {
        "red": weak, "blue": 1, "green": resist, "yellow": 1, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": weak, "ground": resist, "bug": 1, "dragon": 1,
        "ice": resist, "fighting": weak, "poison": 1, "flying": 1, "steel": weak, "fairy": 1
    },

    "fighting": {
        "red": 1, "blue": 1, "green": 1, "yellow": 1, "white": resist, "black": resist, "none": 1,
        "psychic": weak, "ghost": 1, "rock": resist, "ground": 1, "bug": resist, "dragon": 1,
        "ice": resist, "fighting": 1, "poison": 1, "flying": weak, "steel": resist, "fairy": weak
    },

    "poison": {
        "red": 1, "blue": 1, "green": resist, "yellow": 1, "white": 1, "black": 1, "none": 1,
        "psychic": weak, "ghost": 1, "rock": weak, "ground": weak, "bug": resist, "dragon": 1,
        "ice": 1, "fighting": resist, "poison": resist, "flying": 1, "steel": 1, "fairy": resist
    },

    "flying": {
        "red": 1, "blue": 1, "green": resist, "yellow": weak, "white": 1, "black": 1, "none": 1,
        "psychic": 1, "ghost": 1, "rock": weak, "ground": immune, "bug": resist, "dragon": 1,
        "ice": weak, "fighting": resist, "poison": 1, "flying": 1, "steel": 1, "fairy": 1
    },

    "steel": {
        "red": weak, "blue": 1, "green": resist, "yellow": 1, "white": resist, "black": 1, "none": 1,
        "psychic": resist, "ghost": 1, "rock": resist, "ground": weak, "bug": resist, "dragon": resist,
        "ice": resist, "fighting": weak, "poison": immune, "flying": resist, "steel": resist, "fairy": resist
    },

    "fairy": {
        "red": resist, "blue": 1, "green": 1, "yellow": 1, "white": 1, "black": resist, "none": 1,
        "psychic": 1, "ghost": 1, "rock": 1, "ground": 1, "bug": 1, "dragon": immune,
        "ice": 1, "fighting": resist, "poison": weak, "flying": 1, "steel": weak, "fairy": 1
    },
}

var colors = {
    "red": ["#961a1b", "#e62829", "#ef7374", "#b37f7f"], 
    "blue": ["#1b539b", "#2980ef", "#74acf5", "#4a6c96"], 
    "green": ["#29691b", "#3fa129", "#82c274", "#64825d"], 
    "yellow": ["#a37d00", "#fac000", "#fcd659", "#b4ab89"], 
    "white": ["#676967", "#9fa19f", "#c1c2c1", "#909090"], 
    "black": ["#442c3b", "#614c59", "#9c8194", "#4b3a42"], 
    "none": ["#ffffff", "#ffffff", "#000000", "#ffffff"], 
    "psychic": ["#8e2a8b", "#d64bd6", "#f29cf2", "#a86aa8"],
    "ghost": ["#2d1b4d", "#5a3d8a", "#9b7bd1", "#4b3f66"],
    "rock": ["#5b4a2f", "#8a6d3b", "#c2a36b", "#7a6a4f"],
    "ground": ["#6b4f2a", "#a67c52", "#d2a679", "#8c7355"],
    "bug": ["#4b6b1b", "#7fa129", "#b8d674", "#7b8f5d"],
    "dragon": ["#1f3b8f", "#3f6fe0", "#7fa6ff", "#4c5f99"],
    "ice": ["#3b8f8f", "#6fe0e0", "#aef7f7", "#6a9c9c"],
    "fighting": ["#7a1f1f", "#c0392b", "#e67e73", "#a65c5c"],
    "poison": ["#5e2a6b", "#8e44ad", "#c39bd3", "#7d5a8c"],
    "flying": ["#5a6bbf", "#839fff", "#b3c7ff", "#7a86a6"],
    "steel": ["#5f6a72", "#95a5a6", "#c7d3d4", "#7f8c8d"],
    "fairy": ["#c94f7c", "#ff85b3", "#ffb3d1", "#b57a94"],

    "ap": "#d81818", 
    "pp": "#1858b8", 
}
