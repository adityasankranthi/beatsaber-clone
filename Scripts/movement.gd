extends CSGBox3D

var r = RandomNumberGenerator.new()
var x = r.randf_range(-0.5, 0.5)
var y = r.randf_range(0.5, 1.5)
var z = r.randf_range(-11, -12.5)

var start_position = Vector3(x, y, z) 
var move_direction = Vector3(0, 0, 1)  
var move_speed = 2.8

func _ready() -> void:
	position = start_position

func _process(delta: float) -> void:
	position += move_direction * move_speed * delta
	
	if position.z > 0:
		queue_free()
