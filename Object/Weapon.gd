extends Node

var cost = 0
var damage = 0
var level = 0
var shop_texture = "test"
var weapon_name = "test"
var bullet = preload("res://Object/Bullet.tscn")
var buyed = false
var shop_info = "test"
var weapon_owner = null

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

func create_weapon(wname,lvl,cst,dmg,stext,own):
	level = lvl
	weapon_name = wname
	cost = cst
	damage = dmg * level
	shop_texture = stext
	Global.WEAPON_LIST.push_back(self)
	weapon_owner = own
	shop_info = "Damage: "+str(damage)
	return self

func create_default_weapon(own):
	create_weapon("Pistol",1,100,1,"res://Sprite/Pistol.png",own)
	return self

func create_random_weapon():
	create_weapon("Randma",20,9999,99,"res://Sprite/Pistol.png",null)
	return self

func set_buy(con):
	buyed = con

func get_buy():
	return buyed

func get_shop_info():
	return shop_info

func set_shop_info(info):
	shop_info = info

func set_level(val):
	level = val

func upgrade():
	level += 1
	damage += damage
	shop_info = "Damage: "+str(damage)
	pass

func get_level():
	return level

func set_w_owner(own):
	weapon_owner = own
	pass

func get_w_owner():
	return weapon_owner

func update():
	pass

func shoot(zombie):
	if Global.ZOMBI_LIST.size() > 0:
		if zombie.is_inside_tree():
			var b = bullet.instance()
			b.set_direction(zombie.global_position)
			b.global_position = get_w_owner().global_position
			b.set_damage(get_dmg())
			get_tree().root.call_deferred("add_child",b)
	pass