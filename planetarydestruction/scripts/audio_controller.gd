extends Node2D

var sfx

func _ready() -> void:
	sfx = $"Sound Effects"

func play(file):
	for i in sfx.get_children():
		if !i.playing:
			i.stream = load(file)
			i.play()
			break
