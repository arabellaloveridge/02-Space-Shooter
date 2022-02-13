extends Node2D

onready var Asteroid = load("res://Asteroid/Asteroid.tscn")
#var positions = [Vector2(100,100), Vector2(800,800), Vector2(100,500), Vector2(800,500), Vector2(1000,1000), Vector2(1000,500), Vector2(1500,500)]

func _physics_process(_delta):
	if get_child_count() < 3:
		var asteroid = Asteroid.instance()
		#asteroid.position = positions[randi() % positions.size()]
		asteroid.position = Vector2(rand_range(0, Global.VP.x), rand_range(0, Global.VP.y))
		add_child(asteroid)
