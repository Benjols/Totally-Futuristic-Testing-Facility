extends Spatial

onready var bigWall = $animthing/bigWall
onready var wall = $animthing/wall
onready var saver = $"/root/GameSaving"

func _ready():
	pass

func _process(delta):
	if saver.buildState == 0:
		setbuilder(false, false)
	elif saver.buildState == 1:
		setbuilder(true, false)
	elif saver.buildState == 2:
		setbuilder(false, true)

func setbuilder(Vwall, VbigWall):
	wall.visible = Vwall
	bigWall.visible = VbigWall
