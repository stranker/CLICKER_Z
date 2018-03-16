extends Node

var survivor_name = ""
var info = ""
var level = 0

func _ready():
	pass

func create_survivor(nam,inf,lvl):
	survivor_name = nam
	info = inf
	level = lvl
	pass

func get_survivor_name():
	return survivor_name

func get_info():
	return info

func get_level():
	return level

func train():
	level += 1