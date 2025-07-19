extends Node2D

var speed = 200
var background
var foreground
var moving = false

@export var player: Node2D

func _ready() -> void:
	background = $Background
	foreground = $Foreground

func _process(delta: float) -> void:	
	if Input.is_action_pressed("right") and player.scroll:
		for i in background.get_children():
			i.position.x -= 70 * delta
		for i in foreground.get_children():
			i.position.x -= 200 * delta
		moving = true
	
	if moving:
		var furthest
		var reset
		for i in foreground.get_children():
			if !furthest:
				furthest = i
			if i.position.x > furthest.position.x:
				furthest = i
			if i.position.x < -1920:
				reset = i
		if reset:
			reset.position.x = furthest.position.x + 1920
		
		furthest = null
		reset = null
		for i in background.get_children():
			if !furthest:
				furthest = i
			if i.position.x > furthest.position.x:
				furthest = i
			if i.position.x < -1259:
				reset = i
		if reset:
			reset.position.x = furthest.position.x + 1259
