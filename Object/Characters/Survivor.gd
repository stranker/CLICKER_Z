extends Node2D

var survivor_name = ""
var info = ""
var level = 0
var weapon_scene = preload("res://Object/Weapon.tscn")
var weapon
const TYPE_PLAYER = 0
const TYPE_NPC = 1
var survivor_type
var shoot_time = 4

func _ready():
	if survivor_type != TYPE_PLAYER:
		$ShootTime.wait_time = shoot_time
		$ShootTime.start()
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
	weapon.position = $WeaponPos.position
	pass

func create_player(nam):
	create_survivor(nam,"Player character",1)
	Global.player = self
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
	weapon.global_position = $WeaponPos.global_position
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

func _on_ShootTime_timeout():
	if survivor_type != TYPE_PLAYER:
		if get_weapon()!= null:
			randomize()
			var zn = int(rand_range(Global.ZOMBI_LIST.size()/2,Global.ZOMBI_LIST.size()))
			get_weapon().shoot(Global.ZOMBI_LIST[zn])
	pass # replace with function body
