extends Control

func _ready() -> void:
	$Score.text = "Score: " + str(PlayerStats.score)

func _on_button_pressed() -> void:
	AudioController.play("res://audio/sfx/buttonsound.mp3")
	PlayerStats.reset_stats()
	get_tree().change_scene_to_file("res://Scenes/GameManager.tscn")
