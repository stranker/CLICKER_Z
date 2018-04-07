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
var income = 0
var critic = 0
# Rage
enum STATES {IDLE,RAGE}
var state = STATES.IDLE
var clicks = 0

func _ready():
	pass

func _process(delta):
	if survivor_type == TYPE_PLAYER:
		if clicks > 30:
			state = STATES.RAGE
	pass

func create_survivor(nam,lvl):
	survivor_name = nam
	level = lvl
	critic = lvl / 2
	survivor_type = TYPE_NPC
	weapon = weapon_scene.instance()
	weapon = weapon.create_default_weapon(self)
	Global.SURVIVOR_LIST.push_back(self)
	$WeaponPos.add_child(weapon)
	weapon.position = $WeaponPos.position
	$Name.text = survivor_name
	shoot_time = 4 - level*0.1
	$ShootTime.wait_time = shoot_time
	info = "+Critic: "+str(critic)+"% -Rlding time: "+str(shoot_time)+"s +Income: "+"$"+str(income)
	pass

func create_player(nam):
	create_survivor(nam,1)
	Global.player = self
	survivor_type = TYPE_PLAYER
	info = "+Critic: "+str(critic)+"% +Income: "+"$"+str(income)
	pass

func create_random_survivor():
	create_survivor(get_random_name(),get_random_level())
	pass

func get_random_name():
	randomize()
	var name_list = ["Jorge","Pedro","Raul","Marcelo","Alberto","Carlos","Roberto","Ricardo","Agustin","Leandro","Leonardo","John","Michael","George","Daniel","Julian","Francisco","Indiana","Laura","Dana","Paloma","Lis","Lilen","Sofia","Josefina","Cecilia","Patricia"]
	var lastname_list = ["Gonzalez","Martinez","Maldonado","Fernandez","Garcia","Veron","Isveche","Dujovick","Laine","Gorzuk","Guevara","Westwood","Fairchild","Rosenberg","Cabrera","Almiron"]
	var num_name = randi()%name_list.size()
	var num_last = randi()%lastname_list.size()
	return name_list[num_name]+" "+lastname_list[num_last]

func get_random_level():
	randomize()
	var lvl = 1 + randi()%Global.player.get_level()
	return lvl

func get_survivor_name():
	return survivor_name

func get_info():
	return info

func get_level():
	return level

func train():
	level += 1
	critic += 0.5
	income += 1
	if survivor_type == TYPE_PLAYER:
		info = "Critic: "+str(critic)+"% +Income: "+"$"+str(income)
	else:
		if shoot_time > 0.2:
			shoot_time -= 0.1
			$ShootTime.wait_time = shoot_time
		info = "+Critic: "+str(critic)+"% -Rlding time: "+str(shoot_time)+"s +Income: "+"$"+str(income)
	pass

func get_critic():
	return critic

func get_state():
	return state

func is_on_rage():
	return state == STATES.RAGE

func set_weapon(weap):
	weapon = weap
	Global.armory.remove_weapon(weapon)
	$WeaponPos.add_child(weapon)
	weapon.global_position = $WeaponPos.global_position
	pass

func remove_weapon():
	var w = get_weapon()
	$WeaponPos.remove_child(w)
	Global.armory.add_weapon(w)
	w.set_w_owner(null)
	pass

func change_weapon(weap):
	if weap != weapon:
		if weap.get_w_owner() != null: #El arma tiene duenio
			weap.get_w_owner().remove_weapon() #Le saco el arma
		if get_weapon() != null: #Si tengo arma
			remove_weapon()
		weap.set_w_owner(self) #Me aduenio del arma a cambiar
		set_weapon(weap)
	pass

func get_player_type():
	return TYPE_PLAYER


func get_survivor_type():
	return survivor_type

func get_income():
	return income

func get_weapon():
	if !$WeaponPos.get_children().empty():
		return $WeaponPos.get_child(0)

func _on_ShootTime_timeout():
	if survivor_type != TYPE_PLAYER:
		if get_weapon()!= null and !Global.ZOMBI_LIST.empty():
			randomize()
			var zn = int(rand_range(Global.ZOMBI_LIST.size()/2,Global.ZOMBI_LIST.size()))
			get_weapon().shoot(Global.ZOMBI_LIST[zn])
	pass

func attack():
	if Global.ZOMBI_LIST.size()>0:
		$RageTime.start()
		clicks += 1
		get_weapon().shoot(Global.ZOMBI_LIST[0])
	pass

func _on_RageTime_timeout():
	clicks = 0
	pass # replace with function body
