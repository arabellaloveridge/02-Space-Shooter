extends Node2D


func _ready():
	Global.update_lives(0)
	Global.update_score(0)


#func _on_Reset_pressed():
	#Global.reset()
	#var _scene = get_tree().change_scene("res://Game.tscn")


#unc _on_Quit_pressed():
	#get_tree().quit
