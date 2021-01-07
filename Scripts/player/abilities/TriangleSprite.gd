extends Spatial

onready var raycast = get_parent()
onready var raycast_owner = get_parent().get_owner()
onready var biggerWall = preload("res://Scenes/Player/abilities/BiggerWall.tscn")
onready var saver = $"/root/GameSaving"

func _ready():
	set_as_toplevel(true)

func _input(_event):
	if Input.is_action_just_pressed("place"):
		var BW = biggerWall.instance()
		BW.global_transform = global_transform
		get_tree().get_root().add_child(BW)
		queue_free()
	if Input.is_action_just_pressed("biggerWall") or Input.is_action_just_pressed("wall_ability") or Input.is_action_just_pressed("wall"):
		queue_free()

func _process(_delta):
	global_transform.origin = raycast.get_collision_point()
	rotation = raycast_owner.rotation

