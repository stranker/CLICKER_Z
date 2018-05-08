extends RigidBody2D

# Enemy variables
var life = 0
var walkingSpeed = 0
var direction = Vector2()
var gold = 0
var killer = null

#Drop
var coin = preload("res://Object/CoinCandy.tscn")
var supply = preload("res://Object/Supply.tscn")
var drop_prob = 0

#STATES
enum STATES {WALK,ATTACK,WAIT}
var curr_state = STATES.WALK

func _ready():
	add_to_group("enemy")
	pass

func set_life(val):
	life = val

func get_life():
	return life

func set_gold(val):
	gold = val

func get_gold():
	return gold

func set_killer(val):
	killer = val

func get_killer():
	return killer

func set_drop_prob(val):
	drop_prob = val

func get_drop_prob():
	return drop_prob

func set_direction(val):
	direction = val

func get_direction():
	return direction

func set_walking_speed(val):
	walkingSpeed = val

func get_walking_speed():
	return walkingSpeed

func set_initial_speed():
	randomize()
	walkingSpeed = int(rand_range(walkingSpeed,walkingSpeed*1.5))
	pass

func get_curr_state():
	return curr_state

func get_state_walk():
	return STATES.WALK

func get_state_wait():
	return STATES.WAIT

func get_state_attack():
	return STATES.ATTACK

func set_curr_state(val):
	curr_state = val

func get_damage(dmg,killer):
	pass

func drop_coin():
	var c = coin.instance()
	get_node("/root/MainScene/Candy").call_deferred("add_child",c)
	c.global_position = global_position
	c.cant = gold + killer.get_income()
	pass

func drop_supply():
	var nr = int(rand_range(0,100))
	if nr > drop_prob:
		randomize()
		var s = supply.instance()
		if nr % 2 == 0:
			s.create_food(int(rand_range(1,3)),global_position)
		else:
			s.create_water(int(rand_range(1,3)),global_position)
		get_node("/root/MainScene/Candy").call_deferred("add_child",s)
		if s.is_inside_tree():
			s.start_tween()
	pass

func alive():
	return life>0