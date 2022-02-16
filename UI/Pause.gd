extends Control

func _ready():
	hide()
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		if not visible:
			get_tree().paused = true
			show()
		else:
			get_tree().paused = false
			hide()

func _on_Restart_pressed():
	get_tree().paused = false 
	Global.reset()
	get_tree().change_scene("res://UI/Selector.tscn")

func _on_Quit_pressed():
	get_tree().quit()
