extends Node3D

var xr_interface: XRInterface
var active_collider = null
var isExtended = false

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
		
func _on_openxr_pose_recentered() -> void:
	emit_signal("pose_recentered")
	
func _on_pose_recentered() -> void:
	print("Pose recentered")
