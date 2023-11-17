extends Node2D
class_name GuestHandler

# Configurable immutable spawn and destination zones by canvas coordinates
@export var GUEST_SPAWN_RANGEX: Array = [0, 100]
@export var GUEST_SPAWN_RANGEY: Array = [0, 100]

@export var GUEST_DEST_RANGEX: Array = [0, 100]
@export var GUEST_DEST_RANGEY: Array = [0, 100]

@export var GUEST_SPEED: int = 100

# Store guest prefabs to generate
@onready var guest_npc: PackedScene = preload("res://Component Scenes/guest_balloon.tscn")
@onready var spawn_timer: Timer = $Timer

# Instantiate guests on timer
func _ready():
	spawn_timer.start()

# Give guests a destination / move order and send them out
func on_spawn_timeout() -> void:
	var new_guest = guest_npc.instantiate()
	new_guest.set_position(generate_random_pos(GUEST_SPAWN_RANGEX, GUEST_SPAWN_RANGEY)) 
	new_guest.set_destination(generate_random_pos(GUEST_DEST_RANGEX, GUEST_DEST_RANGEY))
	new_guest.set_speed(GUEST_SPEED)
	
	add_child(new_guest)

# Take in a range of X and Y Values, and serve a random position in the 2D space.
func generate_random_pos(dest_range_x: Array, dest_range_y: Array) -> Vector2:
	var pos = Vector2()
	pos.x = randi_range(dest_range_x[0], dest_range_x[1])
	pos.y = randi_range(dest_range_y[0], dest_range_y[1])
	
	return pos
