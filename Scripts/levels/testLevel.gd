extends Spatial

onready var saver =$"/root/GameSaving"

func _ready():
	saver.positionRequest = true
