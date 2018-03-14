extends Node

var cost = 0
var damage = 0
var shop_texture = "test"
var weapon_name = "test"
var bullet = preload("res://Object/Bullet.tscn")
var buyed = false
var shop_info = "test"

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
	pass

func set_buy(con):
	buyed = con

func get_buy():
	return buyed

func get_shop_info():
	return shop_info

func shoot():
	if Global.ZOMBI_LIST.size()>0:
		var zombi = Global.ZOMBI_LIST[0]
		var b = bullet.instance()
		get_tree().root.call_deferred("add_child",b)
		b.set_direction(zombi.global_position)
		b.global_position = Global.player_pos
		b.set_damage(get_dmg())
	pass