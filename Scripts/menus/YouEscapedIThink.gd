extends Spatial

onready var stuff = $Camera/Control
onready var stats = $Camera/Control/stats/Stats
onready var saver = $"/root/GameSaving"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var stopwatch = "Time spent in-game: " + str(saver.m) + ":" + str(saver.s) + ":" + str(saver.ms) + "\n"
	var totalplaced = "Total Blocks placed: " + str(saver.counter) + "\n"
	var amountfell = "You fell a total of: " + str(saver.failures) + " times\n"
	var love = "How much I love you: 99999999999999999999999999999999999999999999999999999999999999999999999999999999999"
	stats.dialog_text = (stopwatch + totalplaced + amountfell +love)

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Scenes/menus/Title Screen.tscn")


func _on_Timer_timeout():
	stuff.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_stats_button_up():
	stats.popup_centered_minsize()


func _on_thankyous_button_up():
	$Camera/Control/thankyous/thanks.popup_centered_minsize()
