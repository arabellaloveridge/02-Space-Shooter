extends Area2D

onready var Explosion = load("res://Effects/Powerup_Explosion.tscn")
var Effects = null
var health = 1

func _ready():
	pass


func _on_Powerup_body_entered(body):
	if body.name == "Player":
		Global.update_lives(+1)
		damage(1)
			
func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			explosion.global_position = global_position
			Effects.add_child(explosion)
		queue_free()
