# Superclass of quality nodes that will represent properties such as salty, leafy, beefy, etc.
# This object will ultimately be called when cooking occours to gather all flavors into a 
# food object
extends Node2D
@onready var FoodEnums = load("res://Resources/food_enums.tres")

@export var type: FoodEnums.Type
@export var flavor: FoodEnums.Flavor

func get_type():
	return self.type
func get_flavor():
	return self.flavor
