extends CharacterBody2D

@export var SPEED = 300.0
var direction = Vector2.ZERO

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
	
	velocity = direction * SPEED

	move_and_slide()
	
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
