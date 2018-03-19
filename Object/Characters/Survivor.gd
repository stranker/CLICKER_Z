extends Node

var survivor_name = ""
var info = ""
var level = 0
var weapon_scene = preload("res://Object/Weapon.tscn")
var weapon
const TYPE_PLAYER = 0
const TYPE_NPC = 1
var survivor_type

func _ready():
	pass

func create_survivor(nam,inf,lvl):
	survivor_name = nam
	info = inf
	level = lvl
	survivor_type = TYPE_NPC
	weapon = weapon_scene.instance()
	weapon = weapon.create_default_weapon(self)
	Global.SURVIVOR_LIST.push_back(self)
	add_child(weapon)
	pass

func create_player(nam):
	create_survivor(nam,"Player character",1)
	survivor_type = TYPE_PLAYER
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
	weapon = weap
	pass

func change_weapon(weap):
	if weap != weapon:
		if weap.get_w_owner() != null:
			weap.get_w_owner().set_weapon(null)
		if weapon != null:
			weapon.set_w_owner(null)
		weap.set_w_owner(self)
		set_weapon(weap)
	pass

func get_player_type():
	return TYPE_PLAYER


func get_survivor_type():
	return survivor_type

func get_weapon():
	return weapon
