extends Node


func _on_play_pressed() -> void:
	AudioController.play("res://audio/sfx/buttonsound.mp3")
	get_tree().change_scene_to_file("res://Scenes/GameManager.tscn")
