extends Node2D


func _physics_process(_delta):
	if get_child_count() == 0 and Global.Player != null:
		var player = Global.Player.instance()
		player.position = Vector2(512,300)
		add_child(player)
