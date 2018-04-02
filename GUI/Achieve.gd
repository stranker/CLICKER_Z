extends Node

var texture = null
var achieve_name = ""
var amount_to_achieve = 0

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

func create_achieve(nam,cant,text):
	achieve_name = nam
	amount_to_achieve = cant
	texture = text
	pass