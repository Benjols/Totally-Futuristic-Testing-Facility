extends Node

var jumpState = false

var counter = 0
var ms = 0
var s = 0
var m = 0
var failures = 0

var buildState = 0
var buildable = false
var buildableSurface = false
var buildOverlap = false

var positionRequest = false
var position
var resetPosition = false

func _physics_process(delta):
	if buildableSurface and buildOverlap:
		buildable = true
	else:
		buildable = false
