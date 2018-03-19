extends Node

# Antiguas variables
var player_pos = Vector2()
var zombie_killed = 0
const MAX_COUNT_ZOMBIES = 200
var ZOMBI_LIST = []
var GOLD = 99999
var EXP = 0
var GOLD_POS = Vector2()
var curr_weapon = null

# Variables de Deposit
var curr_food = 100
var curr_water = 100
var MAX_FOOD = 100
var MAX_WATER = 100

# Variables de Houses
var curr_survivor = 0
var MAX_SURVIVOR = 1

# Survivors
var SURVIVOR_LIST = []

# Weapons
var WEAPON_LIST = []

func _ready():
	pass

func search_supplies(food,water):
	curr_food += food
	curr_water += water
	if curr_food > MAX_FOOD:
		curr_food = MAX_FOOD
	if curr_water > MAX_WATER:
		curr_water = MAX_WATER
	pass