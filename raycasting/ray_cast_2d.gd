extends RayCast2D


@export var ore: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	target_position = to_local(ore.position)
	
	if is_colliding():
	
		print("Colliding!!", position)
