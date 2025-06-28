extends CanvasLayer

@onready var player = $"../player"
@onready var task1 = $Control/task1
@onready var task2 = $Control/task2
@onready var task3 = $Control/task3
@onready var task4 = $Control/task4
@onready var task5 = $Control/task5

var task1_completed = false
var task2_completed = false
var task3_completed = false
var task4_completed = false
var task5_completed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_has("Dynamite"):
		get_tree().quit()
	if abs(player.position.x + 0.165585) < 2 and abs(player.position.y - 1) < 2 and abs(player.position.z + 151.6381) < 2 and task1_completed == false:
		task1_completed = true
		task1.visible = false
	if abs(player.position.x - 97.038) < 2 and abs(player.position.y - 1) < 2 and abs(player.position.z - 22.047) < 2 and task1_completed == true and task2_completed == false:
		task2_completed = true
		task2.visible = false
	if player_has("Silver") and abs(player.position.x - 14.021) < 4 and abs(player.position.y - 1) < 2 and abs(player.position.z - 83.518)	 < 2 and task1_completed == true and task2_completed == true and task3_completed == false:
		task3_completed = true
		task3.visible = false
		clear_item("Silver")
		give_explosive()
	
func player_has(item: String) -> bool:
	for i in range(0, 6):
		if player.inventory_data.slot_datas[i] != null:
			if str(player.inventory_data.slot_datas[i].item_data.name) == item:
				return true
	return false

func clear_item(item: String):
	for i in range(0, 6):
		if player.inventory_data.slot_datas[i] == null:
			continue
		elif str(player.inventory_data.slot_datas[i].item_data.name) == item:
			player.inventory_data.slot_datas[i] = null
			player.inventory_data.inventory_updated.emit(player.inventory_data)

func give_explosive():
	var slot_data = SlotData.new()
	slot_data.item_data = ItemData.new()
	slot_data.item_data = preload("res://item/items/explosive.tres")
	for i in range(0, 6):
		if player.inventory_data.slot_datas[i] == null:
			player.inventory_data.slot_datas[0] = slot_data
		else:
			continue
	player.inventory_data.inventory_updated.emit(player.inventory_data)
	
