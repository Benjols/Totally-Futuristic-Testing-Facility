extends StaticBody

onready var saver = $"/root/GameSaving"
onready var particles = $BOING
onready var hopper = $hopsensor

func _process(delta):
	if hopper.is_colliding():
		particles.emitting = true
	elif particles.emitting == false:
		particles.one_shot = true
		particles.one_shot = false


