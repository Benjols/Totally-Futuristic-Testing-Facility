extends RayCast

onready var saver = $"/root/GameSaving"
onready var wallSprite = preload("res://Scenes/Player/abilities/WallSprite.tscn")

func _ready():
	pass

func _physics_process(delta):
	if saver.buildState == 0:
		if Input.is_action_just_pressed("wall"):
			saver.buildState = 1
	elif saver.buildState == 1:
		if !get_child(0):
			var ws = wallSprite.instance()
			add_child(ws)
		if Input.is_action_just_pressed("wall"):
			get_child(0).queue_free()
			saver.buildState = 0
		if Input.is_action_just_pressed("place") and saver.buildable:
			place()
	if is_colliding():
		colliding()
	else:
		saver.buildableSurface = false

func place():
	get_child(0).queue_free()
	saver.buildState = 0
	saver.counter += 1

func _process(delta):
	if is_colliding():
		colliding()
	else:
		saver.buildableSurface = false

func colliding():
	if get_collider().is_in_group("Buildable Surface"):
		saver.buildableSurface = true
