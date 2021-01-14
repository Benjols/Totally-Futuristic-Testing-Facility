extends Control

var colourEnabled = Color(0 , 48, 100)
var colourDisabled = Color(100, 100, 100)

onready var qtSettings = $"/root/GraphicsSetings"
onready var GQuality = $GQuality
onready var Bvsync = $VSync
onready var BFullscrenn = $FS
onready var BBorderless = $BorderLess


func _ready():
	pass

func _process(_delta):
	### VSYNC ###
	if qtSettings.vsync == true:
		Bvsync.add_color_override("font_color", colourEnabled)
		Bvsync.add_color_override("font_color_hover", colourEnabled)
	elif qtSettings.vsync == false:
		Bvsync.add_color_override("font_color", colourDisabled)
		Bvsync.add_color_override("font_color_hover", colourDisabled)
	
	### FULLSCREEN ###
	if qtSettings.fs == true:
		BFullscrenn.add_color_override("font_color", colourEnabled)
		BFullscrenn.add_color_override("font_color_hover", colourEnabled)
	elif qtSettings.fs == false:
		BFullscrenn.add_color_override("font_color", colourDisabled)
		BFullscrenn.add_color_override("font_color_hover", colourDisabled)
	
	### BORDERLESS ###
	if qtSettings.borderless == true:
		BBorderless.add_color_override("font_color", colourEnabled)
		BBorderless.add_color_override("font_color_hover", colourEnabled)
	elif qtSettings.borderless == false:
		BBorderless.add_color_override("font_color", colourDisabled)
		BBorderless.add_color_override("font_color_hover", colourDisabled)
	
	
	### QUALITY ###
	if qtSettings.quality == "high":
		GQuality.text = "Graphics Quality: High"
	elif qtSettings.quality == "med":
		GQuality.text = "Graphics Quality: Medium"
	elif qtSettings.quality == "low":
		GQuality.text = "Graphics Quality: Low" 

func _on_GQuality_button_up():
	if qtSettings.quality == "high":
		qtSettings.quality = "low"
		print("Settings low")
	elif qtSettings.quality == "low":
		qtSettings.quality = "med"
		print("Settings med")
	elif qtSettings.quality == "med":
		qtSettings.quality = "high"
		print("Settings high")


func _on_VSync_button_up():
	if qtSettings.vsync == true:
		qtSettings.vsync = false
		print("Disabled VSync")
	elif qtSettings.vsync == false:
		qtSettings.vsync = true
		print("Enabled VSync")

func _on_FS_button_up():
	if qtSettings.fs == true:
		qtSettings.fs = false
		print("Disabled FullScreen")
	elif qtSettings.fs == false:
		qtSettings.fs = true
		print("Enabled FullScreen")

func _on_BorderLess_button_up():
	if qtSettings.borderless == true:
		qtSettings.borderless = false
		print("Disabled Borderless")
	elif qtSettings.borderless == false:
		qtSettings.borderless = true
		print("Disabled Borderless")
