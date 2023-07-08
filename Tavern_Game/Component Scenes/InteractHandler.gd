# A class stub for tools that interact with a grid world via a "tap"
# or "interact" input. The functions are blank for now, but objects 
# can extend from this class and overwrite the default behaviors of 
# tap and interact to define their own behaviors
extends Node2D

var display_rect: bool = true
var rect_coords: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = Vector2.ZERO

# Called every frame to draw graphics onscreen
func _draw():
	if display_rect:
		draw_rect(Rect2(rect_coords.x, rect_coords.y, 32, 32), Color.TURQUOISE, false)
	
# Set the display coords externally so that we can draw
# from a global reference point (this class)
func set_disp_coords(pos: Vector2) -> void:
	rect_coords = pos

# On tap is l-click behavior, generalized for tools
func on_tap() -> void:
	pass
	
# On interact is r-click behavior, generalized for tools
func on_interact() -> void:
	pass
