extends CharacterBody2D

@export var SPEED = 300.0
var direction = Vector2.ZERO

# Handle player movement and physics process
func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_pressed("player_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("player_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("player_right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("player_left"):
		direction += Vector2(-1, 0)
	
	velocity = direction * SPEED

	move_and_slide()
	
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
