extends Spatial

onready var raycast = get_parent()
onready var raycast_owner = get_parent().get_owner()
onready var wall = preload("res://Scenes/Player/abilities/Wall.tscn")
onready var saver = $"/root/GameSaving"


func _ready():
	set_as_toplevel(true)

func _input(_event):
	pass

func _physics_process(_delta):
	blockRotation()
	checkVisibility()
	if Input.is_action_just_pressed("place") and saver.buildable:
		var w = wall.instance()
		w.global_transform = global_transform
		get_tree().get_root().add_child(w)
		queue_free()
	if Input.is_action_just_pressed("wall"):
		queue_free()

func blockRotation():
	var normalx = raycast.get_collision_normal().x
	var normalz = raycast.get_collision_normal().z
	global_transform.origin = raycast.get_collision_point()
	rotation.x = normalx * 1.57079642311
	rotation.z = normalz * 1.57079642311
	rotation_degrees.y = 90 + raycast_owner.rotation.y
	#Quat(Vector3(1, 0, 0), normalx)
	#Quat(Vector3(0, 0, 1), normalz)
	
func _on_Area_body_entered(_body):
	saver.buildOverlap = false
	
func _on_Area_body_exited(_body):
	saver.buildOverlap = true

func checkVisibility():
	visible = saver.buildable
