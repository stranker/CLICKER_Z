extends Node

# Antiguas variables
var player_pos = Vector2()
var zombie_killed = 0
const MAX_COUNT_ZOMBIES = 200
var ZOMBI_LIST = []
var GOLD = 0
var EXP = 0
var GOLD_POS = Vector2()
var WEAPON_LIST = []
var curr_weapon = null

# Variables de alimento
var curr_food = 0
var curr_water = 0
var MAX_FOOD = 0
var MAX_WATER = 0

func _ready():
	pass