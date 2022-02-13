extends Node

var VP = Vector2.ZERO

var score = 0
var lives = 5

var Player = null

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	#VP = get_viewport().size
	VP = Vector2(1922, 1080)
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()

func _resize():
	pass

func reset():
	score = 0
	lives = 5
	
func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/ColorRect/Score")
	if Score != null:
		Score.text = "Score: " + str(score)
		
func update_lives(l):
	lives += l
	var Lives = get_node_or_null("/root/Game/UI/HUD/ColorRect/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)
	if lives <= 0:
		end_game()
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
		
func end_game():
	var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
		
