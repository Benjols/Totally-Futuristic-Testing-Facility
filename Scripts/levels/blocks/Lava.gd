extends StaticBody

onready var saver = $"/root/GameSaving"

func _on_Area_body_entered(_body):
	saver.resetPosition = true
