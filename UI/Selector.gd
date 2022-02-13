extends Control


func _ready():
	pass


func _on_PlayerA_pressed():
	Global.Player = load("res://Player/PlayerA.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")

func _on_PlayerB_pressed():
	Global.Player = load("res://Player/PlayerB.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")

func _on_PlayerC_pressed():
	Global.Player = load("res://Player/PlayerC.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")



