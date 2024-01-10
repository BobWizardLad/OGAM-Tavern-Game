extends Node2D

@export var game_state: Resource = load("res://Scripts/GameState.gd")
@onready var player: CharacterBody2D = $Player
@onready var inventory_interface: Control = $UI/InventoryInterface

var score

func _ready() -> void:
	score = 0
	
	player.toggle_inventory.connect(toggle_inventory_interface)
	inventory_interface.set_player_inventory_data(player.inventory_data)

func toggle_inventory_interface() -> void:
	inventory_interface.visible = not inventory_interface.visible
	
	if inventory_interface.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_scoring_area_entered(area):
	if not area.get_parent().get_class() == "CharacterBody2D":
		score += 1
	if score >= 2:
		$WinLabel.text = "Winner is You!"
