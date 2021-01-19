extends RigidBody

var jump = 10

var mouseSensivity = 0.1

onready var head = $Head

onready var saver = $"/root/GameSaving"

var gravity_vec = Vector3()
var direction
var movement = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouseSensivity))
		head.rotate_x(deg2rad(-event.relative.y * mouseSensivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-87), deg2rad(80))

func _physics_process(delta):
	direction = Vector3()
	
	if Input.is_action_just_pressed("jump") and saver.jumpState:
		apply_impulse(Vector3(0,0,0), Vector3(0, 5,0))
	if Input.is_action_pressed("move_foward"):
		pass
