extends Area2D

@export var player : Area2D
@export var ore : Node2D
@export var ore_collidier : CollisionShape2D


@onready var player_collidier: CollisionShape2D = $CollisionShape2D
@onready var raycast: RayCast2D = $RayCast2D
var speed = 400
var raycast_line

var player_collision_edge
var ore_collision_edge
var result
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.
	
	
	
func _physics_process(delta: float):
		var space_state = get_world_2d().direct_space_state
		# use the global space coords
		
		# right now im using the center of the cubes
		# but I want to cast a ray from the edge of them
		
		# get its pos and width
		# find the difference between the two 
		
	
		# i want to go to the left so i should make everything negative
		# figure out a way to keep track of the direction the player
		# is facing
		# need to 
		
		var player_shape = player_collidier.shape
		var ore_shape = ore_collidier.shape
		
		var player_box_global = player_collidier.to_global(Vector2( player_shape.get_rect().end.x ,player_shape.get_rect().get_center().y))
		var ore_box_global = ore_collidier.to_global(Vector2(ore_shape.get_rect().end.x , ore_shape.get_rect().get_center().y))
		var raycast_length = Vector2(2,0)
		
		# find the edges of their colliders
		player_collision_edge = player_box_global
		ore_collision_edge = ore_box_global
		
		
		var query = PhysicsRayQueryParameters2D.create(player_collision_edge,  raycast_length)
		query.collide_with_areas = true
		query.exclude = [self]
		result = space_state.intersect_ray(query)
	
	
		# if the raycast hits something
		#if query.get_collider() == ore_collidier:
			#print("Hit at point: ", result.position)
			
			
	
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var  velocity = Vector2.ZERO
	#_physics_process(delta)
	
	print("Player Location: ", player.global_position)
	print("Ore Location: ", ore.global_position)
	
	if Input.is_action_pressed("move_up"):
			velocity.y -= 1
	if Input.is_action_pressed("move_down"):
			velocity.y += 1
	if Input.is_action_pressed("move_right"):
			velocity.x += 1
	if Input.is_action_pressed("move_left"):
			velocity.x -= 1
			
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
	pass
