# Represents a fruit, vegetable, meat product, etc. that the player will harvest
# and cook with.
extends Sprite2D

# Ingredients have a list of qualities drawn from their child node "qualities"
var qualities
@export var rating: int
@export var size: int

# Collect all child nodes of the ingredient when the object is initialized
# Ingredient objects should only have qualities as children
func _ready():
	qualities = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_child(2).text = String(get_child(1).name + " " + get_child(0).name)
