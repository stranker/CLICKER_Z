extends Node

var texture = null
var achieve_name = ""
var amount_to_achieve = 0
var complete = false
var info = ""
var id = -1
var reward = {}

func set_texture(text):
	texture = text

func set_achieve_name(nam):
	achieve_name = nam

func set_amount(cant):
	amount_to_achieve = cant

func get_texture():
	return texture

func get_achieve_name():
	return achieve_name

func get_amount():
	return amount_to_achieve

func get_info():
	return info

func set_info(inf):
	info = inf
	pass

func get_id():
	return id

func get_reward():
	return reward

func create_achieve(_id,nam,inf,cant,text,rew,compl):
	id = int(_id)
	achieve_name = nam
	info = inf
	amount_to_achieve = int(cant)
	texture = text
	reward = rew
	complete = bool(compl)
	pass

func set_complete(val):
	complete = val

func get_completed():
	return complete