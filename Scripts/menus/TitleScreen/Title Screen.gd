extends Spatial

var state = 1

onready var saver = get_node("/root/GameSaving")
onready var confirmLeave = $"Camera/Main/ConfirmLeave"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var temp_arr = get_tree().get_nodes_in_group("built")
	for x in temp_arr.size():
		temp_arr[x].queue_free()
	saver.failures = 0
	saver.counter = 0
	saver.ms = 0
	saver.s = 0
	saver.m = 0

func _on_Play_button_up():
	get_tree().change_scene("res://Scenes/Levels/testLevel.tscn")

func _on_Graphics_Settings_button_up():
	state = 2

func _on_Controls_button_up():
	state = 0

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		if state == 0:
			state = 1
		elif state == 2:
			state = 1
		elif state == 1:
			confirmLeave.popup_centered()

func _on_ConfirmLeave_confirmed():
	get_tree().quit()
