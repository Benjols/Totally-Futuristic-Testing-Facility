extends Spatial

onready var anim = $AnimationPlayer

func _ready():
	pass


func _on_Area_body_entered(body):
	if !anim.is_playing():
		anim.play("trap activated")
