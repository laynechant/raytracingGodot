extends Area2D

@export var player : Area2D
@export var ore : Node2D
@export var ore_collidier : CollisionShape2D


@onready var player_collidier: CollisionShape2D = $CollisionShape2D

var speed = 400

var result
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var  velocity = Vector2.ZERO
	
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
