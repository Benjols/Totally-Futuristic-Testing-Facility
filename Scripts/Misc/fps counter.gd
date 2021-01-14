extends Node2D

onready var label = $"Fps Label"


func _on_Timer_timeout():
	label.text = str(Engine.get_frames_per_second())
