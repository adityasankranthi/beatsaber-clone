extends XRController3D

var active_collider = null
var isExtended = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1.0) + start
	
	$"line_renderer".points[0] = start
	$"line_renderer".points[1] = end

	$"RayCast3D".target_position = $"RayCast3D".to_local(end)
	
	if $"RayCast3D".is_colliding():
		var cur_collider = $"RayCast3D".get_collider()
		if active_collider == null or active_collider != cur_collider:
			active_collider = cur_collider
			if cur_collider.name == "CubeArea":
				active_collider.get_parent().queue_free()
				$"audio".play() 
	elif active_collider != null:
		active_collider = null

func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		if isExtended:
			$"line_renderer".visible = false
			$"RayCast3D".enabled = false
			isExtended = false
		else: 
			$"line_renderer".visible = true
			$"RayCast3D".enabled = true
			isExtended = true
	if name == "primary_click":
		XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
	
func destroy_cube(cube):
	cube.queue_free()
