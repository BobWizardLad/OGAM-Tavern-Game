extends CharacterBody2D
# Grid no longer used in this build

@export var SPEED = 50.0
@export var SPRINT_CONST = 1.75

@export var inventory_data: InventoryData

var real_speed = SPEED
var direction = Vector2.ZERO

signal toggle_inventory()

var can_pickup: bool = false
var pickup_target: Area2D
var dropped

@onready var pickup_area: Area2D = $PickupArea
var held_item: Area2D = null

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("player_inventory"):
		toggle_inventory.emit()

func _physics_process(_delta):
	# Move down into the player nav code
	player_navigate(_delta)
	
	# Picking up item logic
	if Input.is_action_pressed("pickup_item") and can_pickup and held_item == null:
		add_child(pickup_target.duplicate(true))
		held_item = get_child(-1)
		held_item.set_position(Vector2(0, -15))
		pickup_target.queue_free()
		pickup_target = null
		can_pickup = false
		
	# Dropping item logic
	if Input.is_action_pressed("drop_item") and held_item != null:
		dropped = held_item.duplicate(true)
		dropped.set_position(Vector2(float(int(position.x) - int(position.x) % 16) + 8, (int(position.y) - int(position.y) % 16) + 8))
		get_parent().add_child(dropped)
		held_item.queue_free()
		held_item = null
	
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")
		
func player_navigate(delta):
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
		# Turn Right
		animation_tree.set("parameters/walk/blend_position", 1)
		pickup_area.set_position(Vector2(10, 0))
	if Input.is_action_pressed("player_left"):
		direction += Vector2.LEFT
		# Turn Left
		animation_tree.set("parameters/walk/blend_position", -1)
		pickup_area.set_position(Vector2(0, 0))
	
	# Final movement calculation
	velocity = direction * real_speed
	
	move_and_slide()
	pick_new_state()
	
	# Zero our values for the next go-around.
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	real_speed = SPEED


func _on_pickup_area_enter(area):
	can_pickup = true
	pickup_target = area

func _on_pickup_area_exit(area):
	can_pickup = false
	pickup_target = null
