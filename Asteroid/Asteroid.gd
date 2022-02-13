extends KinematicBody2D

var velocity = Vector2(0, -300)
#var velocity = Vector2.ZERO
var small_speed = 3.0
#var initial_speed = 100
var health = 1
var score = 10

onready var Asteroid_small = load("res://Asteroid/Small_Asteroid.tscn")
var small_asteroids = [Vector2(0, -30), Vector2(30, 30), Vector2(-30, 30)]

func _ready():
	velocity.rotated(randi()*2*PI)
	velocity *= (randf()/2 + 1/2)
	#velocity = Vector2(0, initial_speed*randf()).rotated(PI*2*randf())

func _physics_process(delta):
	position += velocity * delta
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)

func damage(d):
	health -= d
	if health <= 0:
		collision_layer = 0
		#Global.update_score(100)
		var Asteroid_Container = get_node_or_null("/root/Game/Asteroid_Container")
		if Asteroid_Container != null:
			for s in small_asteroids:
				var asteroid_small = Asteroid_small.instance()
				var dir = randf()*2*PI
				var i = Vector2(0,randf()*small_speed).rotated(dir)
				Asteroid_Container.call_deferred("add_child", asteroid_small)
				asteroid_small.position = position + s.rotated(dir)
				asteroid_small.velocity = i
		Global.update_score(score)
		queue_free()
