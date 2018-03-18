extends Node


var survivor_name = ""
var info = ""
var level = 0
var weapon_scene = preload("res://Object/Weapon.tscn")
var weapon

func _ready():
	pass

func create_survivor(nam,inf,lvl):
	survivor_name = nam
	info = inf
	level = lvl
	create_weapon()
	pass

func get_survivor_name():
	return survivor_name

func get_info():
	return info

func get_level():
	return level

func train():
	level += 1

func set_weapon(weap):
	weapon.set_w_owner(null)
	weapon = weap
	weapon.set_w_owner(self)
	pass

func get_weapon():
	return weapon

func create_weapon():
	weapon = weapon_scene.instance()
	weapon.create_default_weapon(self)
	pass