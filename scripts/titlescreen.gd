extends Control

@onready var play_instructions_credits = $PlayInstructionsCredits
@onready var how_to_play_title = $HowToPlayTitle
@onready var instructions = $Instructions
@onready var credits_title = $CreditsTitle
@onready var credits_to = $CreditsTo

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/map.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_how_to_play_pressed():
	play_instructions_credits.visible = true
	how_to_play_title.visible = true
	instructions.visible = true
	credits_title.visible = false
	credits_to.visible = false


func _on_credits_pressed():
	play_instructions_credits.visible = true
	credits_title.visible = true
	credits_to.visible = true
	how_to_play_title.visible = false
	instructions.visible = false
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			how_to_play_title.visible = false
			instructions.visible = false
			play_instructions_credits.visible = false
			credits_title.visible = false
			credits_to.visible = false
			
