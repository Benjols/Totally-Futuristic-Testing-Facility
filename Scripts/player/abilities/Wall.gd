extends StaticBody

onready var dust = $dustParticles

func _ready():
	dust.emitting = true
