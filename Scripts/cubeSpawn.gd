extends WorldEnvironment

var cube = preload("res://scene_instances/redcube.tscn")
var blue_cube = preload("res://scene_instances/bluecube.tscn")  # Preload blue cube scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	
	timer.timeout.connect(_on_Timer_timeout)

func _process(delta: float) -> void:
	pass
	# Move all cubes towards the user
	#for child in get_children():
		#if child.is_in_group("cubes"):  # Make sure only cubes move
			#child.position.z += 5 * delta  # Adjust speed as needed

func _on_Timer_timeout() -> void:
	# Create and configure the original cube
	var cube_instance_center = cube.instantiate()
	cube_instance_center.set_script(load("res://Scripts/movement.gd"))
	cube_instance_center.get_child(0).set_collision_layer_value(10, true)
	#cube_instance_center.add_to_group("cubes")  # Add to group for movement
	add_child(cube_instance_center)

	# Create and configure the blue cube
	var blue_cube_instance = blue_cube.instantiate()
	blue_cube_instance.set_script(load("res://Scripts/movement.gd"))
	blue_cube_instance.get_child(0).set_collision_layer_value(9, true)
	#blue_cube_instance.add_to_group("cubes")  # Add to group for movement
	add_child(blue_cube_instance)
