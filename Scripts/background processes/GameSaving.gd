extends Node

const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR + "save_game.dat"

var counter = 0
var ms = 0
var s = 0
var m = 0
var failures = 0
var vsync = true

var settings = {
	vsync = true,
	}

var buildState = 0
var blockRotation
