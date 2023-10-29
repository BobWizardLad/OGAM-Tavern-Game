# Resource to store the mututally exclusive properties of food that will
# be at the core of the game
extends Resource
class_name FoodEnums

# Enumeration for mutex flavors present in the game
enum Flavor {
	SWEET,
	SOUR,
	SAVORY,
	SALTY,
	SPICY,
	BLAND
}

# Enumeration for mutex types of ingredients in the game
enum Type {
	BASE,
	MEATS,
	GRANULAR,
	ROOT,
	VEGETABLE
}
