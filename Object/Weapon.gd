extends Node

var cost = 0
var damage = 0
var level = 0
var shop_texture = "test"
var weapon_name = "test"
var bullet = preload("res://Object/Bullet.tscn")
var buyed = false
var shop_info = "test"
var w_pos = Vector2(0,0)

func _ready():
	pass

func get_cost():
	return cost
	
func get_dmg():
	return damage
	
func set_cost(val):
	cost = val
	
func set_dmg(val):
	damage = val

func set_shop_texture(tex):
	shop_texture = str(tex)

func get_shop_texture():
	return shop_texture

func set_weapon_name(nam):
	weapon_name = str(nam)

func get_weapon_name():
	return weapon_name

func create_weapon(wname,cst,dmg,stext,inf):
	weapon_name = wname
	cost = cst
	damage = dmg
	shop_texture = stext
	shop_info = inf
	level = 1
	Global.WEAPON_LIST.push_back(self)
	pass

func create_default_weapon():
	weapon_name = "Pistol"
	cost = 0
	damage = 1
	shop_texture = "res://Sprite/Pistol.png"
	shop_info = "Arma por defecto"
	level = 1
	Global.WEAPON_LIST.push_back(self)
	pass

func set_buy(con):
	buyed = con

func get_buy():
	return buyed

func get_shop_info():
	return shop_info

func set_shop_info(info):
	shop_info = info

func set_position(pos):
	w_pos = pos
	pass

func get_position():
	return w_pos

func set_level(val):
	level = val

func get_level():
	return level

func shoot(zombie):
	if Global.ZOMBI_LIST.size() > 0:
		var b = bullet.instance()
		if zombie.is_inside_tree():
			b.set_direction(zombie.global_position)
			b.global_position = w_pos
			b.set_damage(get_dmg())
			get_tree().root.call_deferred("add_child",b)
	pass