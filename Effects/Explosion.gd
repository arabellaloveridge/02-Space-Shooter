extends Particles2D

func _ready():
	start()

func start():
	$SFX.play()
	emitting = true 
