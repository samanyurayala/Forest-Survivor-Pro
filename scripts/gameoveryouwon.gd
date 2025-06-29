extends Control

func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")


func _on_quit_pressed():
	get_tree().quit()
