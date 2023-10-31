extends PanelContainer

const Slot = preload("res://Inventory/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

func _ready() -> void:
	var inv_data = preload("res://Inventory/test_inv.tres")
	populate_item_grid(inv_data.slot_datas)
	
func set_inventory_data(inventory_data: InventoryData) -> void:
	populate_item_grid(inventory_data.slot_datas)
	
func populate_item_grid(slot_datas: Array[SlotData]) -> void:
	for child in item_grid.get_children():
		child.queue_free()
	
	for slot_data in slot_datas:
		var slot = Slot.instantiate()
		item_grid.add_child(slot) 
		
		if slot_data:
			slot.set_slot_data(slot_data)