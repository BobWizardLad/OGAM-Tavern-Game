# Represents a fruit, vegetable, meat product, etc. that the player will harvest
# and cook with.
extends Area2D

# exported sprite option at the ingredient level
@export var sprite_src: Texture2D

# Ingredients have a list of qualities drawn from their child node "qualities"
var children
var qualities
var sprite
var label
@export var rating: int
@export var size: int

func _ready():
	# Collect all child nodes of the ingredient when the object is initialized
	# Children are organized here
	children = get_children()
	qualities = [children[2], children[3]]
	sprite = children[1]
	label = children[4]
	
	# Assign a sprite from the editor
	sprite.set_texture(sprite_src)
	
	# Snap object to grid on startup
	set_position(Vector2(int(position.x) - int(position.x) % 16 + 8, (int(position.y) - int(position.y) % 16) + 8))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = String(qualities[0].name + " " + qualities[1].name)
