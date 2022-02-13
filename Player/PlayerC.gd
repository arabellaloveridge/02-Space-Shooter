extends KinematicBody2D

var velocity = Vector2.ZERO

var rot_speed = 5.0
var speed = 5.0
var max_speed = 400.0
var health = 10

onready var Bullet = load("res://tester/Bullet.tscn")
onready var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null

var nose = Vector2(0, -60)

func _ready():
	position = Vector2(961, 540)
	
func _physics_process(_delta):
	velocity += get_input()*speed 
	#position += velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)
	
	if Input.is_action_just_pressed("shoot"):
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var bullet = Bullet.instance()
			bullet.global_position = global_position + nose.rotated(rotation)
			bullet.rotation = rotation
			Effects.add_child(bullet)
			$SFX.play()
#func shoot():
	
func get_input():
	var dir = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("up"):
		velocity = velocity + Vector2(0, -speed).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees -= rot_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rot_speed
	return dir.rotated(rotation)
	
func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			explosion.global_position = global_position
			Effects.add_child(explosion)
		Global.update_lives(-1)
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name != "Player":
		damage(100)
