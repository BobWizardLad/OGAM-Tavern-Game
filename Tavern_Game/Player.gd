extends CharacterBody2D
var grid: Resource = load("res://Grid.tres")

@export var SPEED = 200.0
var direction = Vector2.ZERO

signal interaction

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var interaction_handler = %InteractHandler

func _ready():
	connect("interaction", interaction_handler.set_disp_coords)

func _physics_process(_delta):
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
		
func _draw():
		var tile = grid.get_map_to_grid(Vector2(global_position.x - 32, global_position.y - 32)) + direction
		var tile_pixels = grid.get_grid_snap(tile)
		emit_signal("interaction", tile_pixels)

