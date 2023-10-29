extends VBoxContainer

@export var state: Resource = load("res://GameState.tres")

@onready var money: Label = $Currency/Value
@onready var popularity: Label = $Popularity/Value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money.text = String.num(state.get_currency())
	popularity.text = String.num(state.get_popularity_rank())
