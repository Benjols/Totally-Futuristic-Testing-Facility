extends Spatial

onready var timer = $Timer
onready var wall = preload("res://Scenes/Player/abilities/Wall.tscn")
onready var spawnArea = $spawnArea
onready var loading = $Control/ProgressBar

func _ready():
	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Levels/testLevel.tscn")


func _on_spawner_timeout():
	var w = wall.instance()
	w.global_transform = spawnArea.global_transform
	add_child(w)
	loading.value = loading.value + 20
