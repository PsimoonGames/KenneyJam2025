extends Node2D

var speed = 200
var scroll = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
		scroll = false
		if position.x < 50:
			position.x = 50
	
	if Input.is_action_pressed("right") and !scroll:
		position.x += speed * delta
		if position.x > 910:
			position.x = 910
			scroll = true
