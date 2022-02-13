extends Control

func _ready():
	pass

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://UI/Selector.tscn")
