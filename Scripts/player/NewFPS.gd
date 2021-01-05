extends KinematicBody

var speed = 10
var h_acceleration = 8
var air_acceletaion = 1
var normal_acceleration = 10
var gravity = 18
var jump = 5
var player_state = GROUND_STATE.GROUNDED

var mouse_sensitivity = 0.1

var paused = 0

const SWAY = 40

enum GROUND_STATE {
	GROUNDED,
	MIDAIR,
	TOUCHDOWN
}

var direction = Vector3()
var h_velocity = Vector3()
var movement = Vector3()
var gravity_vec = Vector3()

onready var head = $Head
onready var ground_check = $GroundCheck
onready var pointer = $Head/Camera/pointer
onready var pauseMenu = $Head/Camera/Control/pauseMenu
onready var extraLevel = $Head/Camera/ExtraLevelCheck
onready var speedrun = $Head/Camera/Control/RichTextLabel
onready var hand = $Head/hand
onready var handloc = $Head/handLoc
onready var saver = $"/root/GameSaving"

func _ready():
	#Keeps mouse inside game window, so u have full range of motion when testing out game controller
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	hand.set_as_toplevel(true)

### CHARACTER ROTATION ###
func _input(event):
	#if the mouse is moving around
	if event is InputEventMouseMotion:
		#this allows horizontal rotation
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		#this allows vertical rotation
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		#this sets the maximum that a character can rotate vertically
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))

### CHARACTER MOVEMENT ###
func _physics_process(delta):
	direction = Vector3()
	
	if Input.is_action_pressed("jump") and (is_on_floor() or ground_check.is_colliding()):
		gravity_vec = Vector3.UP * jump
	#if you click move_foward
		#direction points straight and subtracts
	if Input.is_action_pressed("move_foward"):
		direction -= transform.basis.z
	#if you click move_backward
		#direction points straight and adds
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	#if you click move_left
		#direction points sideways and subtracts
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	#if you click move_right
		#direction points sideways and adds
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	#prevents character from moving faster while moving diagonally
	direction = direction.normalized()
	h_velocity = h_velocity.linear_interpolate(direction * speed, h_acceleration * delta)
	movement.z = h_velocity.z + gravity_vec.z
	movement.x = h_velocity.x + gravity_vec.x
	movement.y = gravity_vec.y
	
# warning-ignore:return_value_discarded
	move_and_slide(movement, Vector3.UP)
	
	match player_state:
		#If the player is on the ground, gravity will be shutoff
		GROUND_STATE.GROUNDED:
			gravity_vec = -get_floor_normal() * gravity
			h_acceleration = normal_acceleration
			#if he is not on the ground, his state will change to MIDAIR
			if not is_on_floor():
				player_state = GROUND_STATE.MIDAIR
		#If the player is in the air, gravity will be applied
		GROUND_STATE.MIDAIR:
			#if the player touches the floor, he will go in the TOUCHDOWN state
			gravity_vec += Vector3.DOWN * gravity * delta
			h_acceleration = air_acceletaion
			
			if is_on_floor():
				player_state = GROUND_STATE.TOUCHDOWN
		#this will check how much gravity is needed to apply fall damage
		GROUND_STATE.TOUCHDOWN:
			player_state = GROUND_STATE.GROUNDED
	
	move_and_slide_with_snap(gravity_vec,Vector3.DOWN, Vector3.UP)
	
	if Input.is_action_just_pressed("hand"):
		if pointer.is_colliding():
			if pointer.get_collider().is_in_group("escape"):
				var temp_arr = get_tree().get_nodes_in_group("built")
				for x in temp_arr.size():
					temp_arr[x].queue_free()
				get_tree().change_scene("res://Scenes/menus/YouEscapedIThink.tscn")
	if extraLevel.is_colliding():
		if extraLevel.get_collider().is_in_group("ExtraLevel"):
			var temp_arr = get_tree().get_nodes_in_group("built")
			for x in temp_arr.size():
				temp_arr[x].queue_free()
			get_tree().change_scene("res://Scenes/Levels/Extra scene.tscn")

func _process(delta):
	hand.global_transform.origin = handloc.global_transform.origin
	hand.rotation.y = lerp_angle(hand.rotation.y, rotation.y, SWAY * delta)
	hand.rotation.x = lerp_angle(hand.rotation.x, head.rotation.x, SWAY * delta)
	
	if Input.is_action_just_pressed("escape"):
		if paused == 0:
			paused = 1
		elif paused == 1:
			paused = 0
			
	if paused == 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		speed = 10
		h_acceleration = 6
		air_acceletaion = 1
		normal_acceleration = 6
		jump = 5
		mouse_sensitivity = 0.1
		pauseMenu.visible = false
	elif paused == 1:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		speed = 0
		h_acceleration = 0
		air_acceletaion = 0
		normal_acceleration = 0
		jump = 0
		mouse_sensitivity = 0
		pauseMenu.visible = true
		direction = 0
	if saver.ms > 9:
		saver.s += 1
		saver.ms = 0
	if saver.s > 59:
		saver.m += 1
		saver.s = 0
		
	speedrun.set_text(str(saver.m)+":"+str(saver.s)+":"+str(saver.ms))

func _on_Pause_button_up():
	paused = 0

func _on_MainMenu_button_up():
	get_tree().change_scene("res://Scenes/menus/Title Screen.tscn")

func _on_Timer_timeout():
	saver.ms += 1
