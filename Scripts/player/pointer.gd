extends RayCast

onready var wallSprite = preload("res://Scenes/Player/abilities/WallSprite.tscn")
onready var biggerWallSprite = preload("res://Scenes/Player/abilities/BiggerWallSprite.tscn")
onready var saver = $"/root/GameSaving"

func _ready():
	pass

func place():
	get_child(0).queue_free()
	saver.buildState = 0
	saver.counter += 1

func _process(_delta):
	if saver.buildState == 0:
		if Input.is_action_just_pressed("wall"):
			saver.buildState = 1
		if Input.is_action_just_pressed("biggerWall"):
			saver.buildState = 2
	elif saver.buildState == 1:
		if !get_child(0):
			var ws = wallSprite.instance()
			add_child(ws)
		if Input.is_action_just_pressed("wall"):
			get_child(0).queue_free()
			saver.buildState = 0
		if Input.is_action_just_pressed("biggerWall"):
			get_child(0).queue_free()
			saver.buildState = 2
		if Input.is_action_just_pressed("place"):
			place()
	elif  saver.buildState == 2:
		if !get_child(0):
			var ts = biggerWallSprite.instance()
			add_child(ts)
		if Input.is_action_just_pressed("wall"):
			get_child(0).queue_free()
			saver.buildState = 1
		if Input.is_action_just_pressed("biggerWall"):
			get_child(0).queue_free()
			saver.buildState = 0
		if Input.is_action_just_pressed("place"):
			place()
