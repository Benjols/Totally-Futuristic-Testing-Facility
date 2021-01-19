extends StaticBody

onready var saver = $"/root/GameSaving"

func _ready():
	pass


func _on_Area_body_entered(body):
	saver.resetPosition = true
