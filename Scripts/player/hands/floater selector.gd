extends Spatial

onready var wall = $animthing/wall
onready var saver = $"/root/GameSaving"

func _ready():
	pass

func _process(_delta):
	if saver.buildState == 0:
		setbuilder(false)
	elif saver.buildState == 1:
		setbuilder(true)

func setbuilder(Vwall):
	wall.visible = Vwall
