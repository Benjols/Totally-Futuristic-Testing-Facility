extends Node

var vsync = true
var fs = true
var borderless = true
var quality = "high"

func _process(_delta):
	### VSYNC ###
	if vsync == true:
		OS.vsync_enabled = true
	elif vsync == false:
		OS.vsync_enabled = false
	
	### FULLSCREEN ###
	if fs == true:
		OS.window_fullscreen = true
	elif fs == false:
		OS.window_fullscreen = false
	
	### BORDERLESS ###
	if borderless == true:
		OS.window_borderless = true
	elif borderless == false:
		OS.window_borderless = false
	
	### QUALITY ###
	if quality == "high":
		ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", 16)
		ProjectSettings.set_setting("rendering/quality/filters/msaa", 8)
		ProjectSettings.set_setting("rendering/quality/shadows/filter_mode", 2)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", 2)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", true)
		ProjectSettings.set_setting("rendering/quality/voxel_cone_tracing/high_quality", true)
	elif quality == "med":
		ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", 8)
		ProjectSettings.set_setting("rendering/quality/filters/msaa", 4)
		ProjectSettings.set_setting("rendering/quality/shadows/filter_mode", 2)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", 2)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", false)
		ProjectSettings.set_setting("rendering/quality/voxel_cone_tracing/high_quality", false)
	elif quality == "low":
		ProjectSettings.set_setting("rendering/quality/filters/anisotropic_filter_level", 4)
		ProjectSettings.set_setting("rendering/quality/filters/msaa", 2)
		ProjectSettings.set_setting("rendering/quality/shadows/filter_mode", 1)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/quality", 1)
		ProjectSettings.set_setting("rendering/quality/subsurface_scattering/follow_surface", false)
		ProjectSettings.set_setting("rendering/quality/voxel_cone_tracing/high_quality", false)
