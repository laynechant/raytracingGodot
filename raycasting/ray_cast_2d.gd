extends RayCast2D
@export var ore: Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	# get the starting pos of the raycast
	# get the target position 
	# measure that distance to decide 
	
	var starting_location = position

	var ore_shape = ore.get_node("CollisionShape2D")
	var half_size = ore_shape.shape.size / 2
	
	var dir_to_player = (global_position - ore.global_position).normalized()
	
	
	target_position = to_local(ore.global_position + dir_to_player * half_size)

	
	if is_colliding():
		if get_collider() == ore:
			print("Colliding!!", position)
