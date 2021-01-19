extends Spatial


onready var saver = $"/root/GameSaving"
onready var ff = $FrontFoot
onready var lf = $LeftFoot
onready var rf = $RightFoot
onready var bf = $BackFoot

func _ready():
	pass

func _physics_process(delta):
	if ff.is_colliding() or lf.is_colliding() or rf.is_colliding() or bf.is_colliding():
		saver.jumpState = true
	elif !ff.is_colliding() and !lf.is_colliding() and !rf.is_colliding() and !bf.is_colliding():
		saver.jumpState = false
