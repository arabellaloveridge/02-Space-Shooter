extends Node2D

onready var Powerup = load("res://Effects/Powerup.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var powerup = Powerup.instance()
		powerup.position = Vector2(rand_range(0, Global.VP.x), rand_range(0, Global.VP.y))
		add_child(powerup)
