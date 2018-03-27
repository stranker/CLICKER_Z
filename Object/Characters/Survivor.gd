extends Node2D

# INFO VARS
var survivor_name = ""
var info = ""
var level = 0
const TYPE_PLAYER = 0
const TYPE_NPC = 1
var survivor_type
# WEAPON
var weapon_scene = preload("res://Object/Weapon.tscn")
var weapon
# SHOOTING TIME SURVIVORS
var shoot_time = 0
# TRAINING VARIABLES
# Player
var player_income = 0
var player_critic = 5
# NPC
var npc_critic = 3

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
	weapon.position = $WeaponPos.position
	$Name.text = survivor_name
	shoot_time = 4
	$ShootTime.wait_time = shoot_time
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
	if survivor_type == TYPE_PLAYER:
		player_income += 1
		Global.player_income = player_income
		player_critic += 1
	else:
		npc_critic += 1
		shoot_time -= 0.1
	pass

func get_critic():
	if survivor_type == TYPE_PLAYER:
		return player_critic
	else:
		return npc_critic
	pass

func set_weapon(weap):
	weapon.get_parent().remove_child(weapon)
	Global.armory.add_weapon(weapon)
	weapon = weap
	Global.armory.remove_weapon(weapon)
	$WeaponPos.add_child(weapon)
	weapon.global_position = $WeaponPos.global_position
	pass

func change_weapon(weap):
	if weap != weapon:
		if weap.get_w_owner() != null: #El arma tiene duenio
			weap.get_w_owner().set_weapon(null) #Le saco el arma
		if weapon != null: #Si tengo arma
			weapon.set_w_owner(null) #Ya no soy el duenio
		weap.set_w_owner(self) #Me aduenio del arma a cambiar
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
		if get_weapon()!= null and !Global.ZOMBI_LIST.empty():
			randomize()
			var zn = int(rand_range(Global.ZOMBI_LIST.size()/2,Global.ZOMBI_LIST.size()))
			get_weapon().shoot(Global.ZOMBI_LIST[zn])
	pass
