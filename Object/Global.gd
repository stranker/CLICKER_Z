extends Node

# Zombies
const MAX_COUNT_ZOMBIES = 500
var ZOMBI_LIST = []

# Gold y Diamonds
var diamonds = 0
var diamond_pos = Vector2()
var GOLD_POS = Vector2()
var GOLD = 0

#Achieves
var gold_obtained = 0
var zombie_killed = 0
var EXP = 0

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
var player_pos = Vector2()

# Weapons
var WEAPON_LIST = []
var armory = null

# Search Master
var search_master = null

# Wall
var wallPosition = Vector2()

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

func number_converter(number):
	var converted = ""
	if number >= 1000000:
		converted = str(number/1000000)+"."+str((number%1000000)/10000)+"M"
	elif number >= 1000:
		converted = str(number/1000)+"."+str((number%1000)/10)+"k"
	else:
		converted = str(number)
	return converted