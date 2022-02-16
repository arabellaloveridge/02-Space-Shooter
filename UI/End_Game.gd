extends Control


func _ready():
	Global.add_score()
	$Label.text = "Thanks for playing! Your score was: " + str(Global.score)
	$Scores.text = "High Scores: \n"
	var count = 0
	for score in Global.scores:
		if count < 5:
			$Scores.text = $Scores.text + str(score["score"]) + "\n"
			count += 1

func _on_Play_Again_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
