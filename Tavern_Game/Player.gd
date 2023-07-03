extends CharacterBody2D

@export var SPEED = 300.0
var direction = Vector2.ZERO

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)
		animation_tree.set("parameters/walk/blend_position", 1)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
		animation_tree.set("parameters/walk/blend_position", -1)
	
	velocity = direction * SPEED
	
	move_and_slide()
	pick_new_state()
	
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")
