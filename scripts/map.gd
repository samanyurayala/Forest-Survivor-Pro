extends Node3D

const PickUp = preload("res://item/pick_up/pick_up.tscn")

@onready var player = $player
@onready var inventory_interface = $UI/InventoryInterface


func _ready() -> void:
	inventory_interface.set_player_inventory_data(player.inventory_data)


func _on_inventory_interface_drop_slot_data(slot_data):
	var pick_up = PickUp.instantiate()
	pick_up.slot_data = slot_data
	pick_up.position = player.get_drop_position()
	add_child(pick_up)
