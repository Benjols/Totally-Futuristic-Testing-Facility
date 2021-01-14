extends Spatial

onready var raycast = get_parent()
onready var raycast_owner = get_parent().get_owner()
onready var wall = preload("res://Scenes/Player/abilities/Wall.tscn")


func _ready():
	set_as_toplevel(true)

func _input(_event):
	if Input.is_action_just_pressed("place"):
		var w = wall.instance()
		w.global_transform = global_transform
		get_tree().get_root().add_child(w)
		queue_free()
	if Input.is_action_just_pressed("biggerWall") or Input.is_action_just_pressed("wall_ability") or Input.is_action_just_pressed("wall"):
		queue_free()

func _process(delta):
	global_transform.origin = raycast.get_collision_point()
	var originalRot = Quat(transform.basis.get_rotation_quat())
	var angledRot = Quat(raycast.get_collision_normal())
	var c = originalRot.slerp(angledRot, 1)
	transform.basis = Basis(c)
