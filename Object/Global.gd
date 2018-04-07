extends Node

# Antiguas variables
var player_pos = Vector2()
var zombie_killed = 0
const MAX_COUNT_ZOMBIES = 500
var ZOMBI_LIST = []
var GOLD = 0
var EXP = 0
var GOLD_POS = Vector2()
var curr_weapon = null
#Achieves
var gold_obtained = 0

# Variables de Deposit
var curr_food = 0
var curr_water = 0
var MAX_FOOD = 9999
var MAX_WATER = 9999
var food_pos = Vector2()
var water_pos = Vector2()

# Variables de Houses
var curr_cap_survivor = 1
var MAX_SURVIVOR = 0

# Survivors
var SURVIVOR_LIST = []
var player
var player_income = 0

# Weapons
var WEAPON_LIST = []
var armory = null

# Search Master
var search_master = null

func _ready():
	pass

func add_supplies(food,water):
	curr_food += food
	curr_water += water
	limit_supplies()
	pass

func limit_supplies():
	if curr_food > MAX_FOOD:
		curr_food = MAX_FOOD
	if curr_water > MAX_WATER:
		curr_water = MAX_WATER
	pass

func remove_resources(food,water,gold):
	curr_food -= food
	curr_water -= water
	GOLD -= gold
	limit_supplies()
	pass