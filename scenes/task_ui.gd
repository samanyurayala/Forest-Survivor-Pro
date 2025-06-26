extends CanvasLayer

@onready var player = $"../player"
@onready var task1 = $task1
@onready var task2 = $task2

var task1_completed = false
var task2_completed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(player.position.x + 0.165585) < 2 and abs(player.position.y - 1) < 2 and abs(player.position.z + 151.6381) < 2 and task1_completed == false:
		task1_completed = true
		task1.visible = false
