extends CanvasLayer

@onready var player = $"../player"
@onready var task1 = $Control/task1
@onready var task2 = $Control/task2
@onready var task3 = $Control/task3
@onready var task4 = $Control/task4
@onready var task5 = $Control/task5
@onready var arrow = $"../arrow"
@onready var timer = $"../Timer"
@onready var timer_2 = $"../Timer2"
@onready var timer_label = $Control/TimerLabel
@onready var timer_label_2 = $Control/TimerLabel2

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
	timer_label.text = str(int(ceil(timer.time_left)))
	timer_label_2.text = str(int(ceil(timer_2.time_left)))
	if player_has("Dynamite"):
		get_tree().change_scene_to_file("res://scenes/gameover_exploded.tscn")
	if abs(player.position.x + 0.165585) < 2 and abs(player.position.y - 1) < 2 and abs(player.position.z + 151.6381) < 2 and task1_completed == false:
		task1_completed = true
		task1.visible = false
	if abs(player.position.x - 97.038) < 2 and abs(player.position.y - 1) < 2 and abs(player.position.z - 22.047) < 2 and task1_completed == true and task2_completed == false:
		task2_completed = true
		task2.visible = false
	if player_has("Silver") and abs(player.position.x - 14.021) < 4 and abs(player.position.y - 1) < 2 and abs(player.position.z - 83.518) < 2 and task1_completed == true and task2_completed == true and task3_completed == false:
		task3_completed = true
		task3.visible = false
		clear_item("Silver")
		give_explosive()
		arrow.visible = true
		timer.start()
		timer_label.visible = true
	if player_has("Explosive") and abs(player.position.x - 18) < 2.5 and abs(player.position.y - 1) < 2 and abs(player.position.z - 96) < 2.5 and task1_completed == true and task2_completed == true and task3_completed == true and task4_completed == false:
		timer.paused = true
		clear_item("Explosive")
		arrow.visible = false
		task4.visible = false
		timer_label.visible = false
		timer_2.start()
		timer_label_2.visible = true
	
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


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/gameover_exploded.tscn")


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://scenes/you_won.tscn")
