extends CharacterBody2D
# Grid no longer used in this build

@export var SPEED = 50.0
@export var SPRINT_CONST = 1.75

@export var inventory_data: InventoryData

var real_speed = SPEED
var direction = Vector2.ZERO

signal toggle_inventory()

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("player_inventory"):
		toggle_inventory.emit()

func _physics_process(_delta):
	
	# Sprinting for the massive map, multiply the 
	if Input.is_action_pressed("sprint"):
		real_speed = SPEED * SPRINT_CONST
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("player_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("player_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("player_right"):
		direction += Vector2.RIGHT
		animation_tree.set("parameters/walk/blend_position", 1)
	if Input.is_action_pressed("player_left"):
		direction += Vector2.LEFT
		animation_tree.set("parameters/walk/blend_position", -1)
	
	velocity = direction * real_speed
	
	move_and_slide()
	pick_new_state()
	
	# Zero our values for the next go-around.
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	real_speed = SPEED
	
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")

