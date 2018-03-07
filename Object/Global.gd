extends Node

var player_pos = Vector2()
var zombie_count = 0
var zombie_killed = 0
const MAX_COUNT_ZOMBIES = 200
var ZOMBI_LIST = []
var DAMAGE = 0
var GOLD = 0
var EXP = 0

func _ready():
	DAMAGE = 1
	pass