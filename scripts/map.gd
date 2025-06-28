extends Node3D

const PickUp = preload("res://item/pick_up/pick_up.tscn")

@onready var player = $player
@onready var inventory_interface = $UI/InventoryInterface
@onready var select = $UI/select
@onready var player_inventory = $UI/InventoryInterface/PlayerInventory

func _ready() -> void:
	inventory_interface.set_player_inventory_data(player.inventory_data)


func _on_inventory_interface_drop_slot_data(slot_data):
	var pick_up = PickUp.instantiate()
	pick_up.slot_data = slot_data
	pick_up.position = player.get_drop_position()
	add_child(pick_up)
	
func _physics_process(delta):
	get_tree().call_group("enemy", "update_target_position", player.global_transform.origin)
	#print(player.global_transform.origin)
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_1:
			select.position = Vector2(43, 44)
			#print(player.inventory_data.slot_datas[0].item_data.name)
		if event.keycode == KEY_2:
			select.position = Vector2(111, 44)
			#print(player.inventory_data.slot_datas[1].item_data.name)
		if event.keycode == KEY_3:
			select.position = Vector2(179, 44)
			#print(player.inventory_data.slot_datas[2].item_data.name)
		if event.keycode == KEY_4:
			select.position = Vector2(247, 44)
			#print(player.inventory_data.slot_datas[3].item_data.name)
		if event.keycode == KEY_5:
			select.position = Vector2(315, 44)
			#print(player.inventory_data.slot_datas[4].item_data.name)
		if event.keycode == KEY_6:
			select.position = Vector2(383, 44)
			#print(player.inventory_data.slot_datas[5].item_data.name)
		if event.keycode == KEY_7:
			select.position = Vector2(451, 44)
			#print(player.inventory_data.slot_datas[6].item_data.name)


			
