extends Resource

@export var currency = 0
@export var popularity_rank = 0

func get_currency() -> int:
	return currency
func set_currency(value) -> void:
	currency = value
func add_currency(value) -> void:
	currency += value

func get_popularity_rank() -> int:
	return popularity_rank
func set_popularity_rank(value) -> void:
	popularity_rank = value
func add_popularity_rank(value) -> void:
	popularity_rank += value
