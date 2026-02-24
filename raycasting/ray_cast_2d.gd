extends RayCast2D
@export var ore: Area2D

var ore_destroyed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	
	# get the starting pos of the raycast
	# get the target position 
	# measure that distance to decide 
	
	if not ore_destroyed:
		var ore_shape = ore.get_node("CollisionShape2D")
		var reach = 50
		
		var dir_to_ore = (ore.global_position - global_position).normalized()
		
		target_position = to_local(ore.global_position + dir_to_ore * reach)
		
		var raycast_distance = global_position.distance_to(ore.global_position)
		var mine_range = 200
		
		if is_colliding() and get_collider() == ore:
			if raycast_distance < mine_range:
				
				if Input.is_action_pressed("mining"):
					ore_destroyed = ore.destroy_ore()
				
