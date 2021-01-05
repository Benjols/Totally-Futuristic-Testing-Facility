extends Spatial

onready var raycast = get_parent()
onready var raycast_owner = get_parent().get_owner()
onready var triangle = preload("res://Scenes/Player/abilities/BiggerWall.tscn")

func _ready():
	set_as_toplevel(true)
	global_transform.origin = raycast.get_collision_point()

func _input(_event):
	if Input.is_action_just_pressed("place"):
		var t = triangle.instance()
		t.global_transform = global_transform
		get_tree().get_root().add_child(t)
		queue_free()
	if Input.is_action_just_pressed("biggerWall") or Input.is_action_just_pressed("wall_ability") or Input.is_action_just_pressed("wall"):
		queue_free()

func _process(_delta):
	global_transform.origin = raycast.get_collision_point()
	rotation = raycast_owner.rotation
