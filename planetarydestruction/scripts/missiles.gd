extends Node2D

@export var enemy : bool
var direction
var speed = 300

func setDirection(target):
	direction = (target - position).normalized()
	look_at(target)

func _process(delta: float) -> void:
	position += direction * (300 * delta)
	
	if position.x < -10 or position.x > 1930 or position.y < -10 or position.y > 1090:
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and enemy:
		PlayerStats.take_damage(10)
		AudioController.play("res://audio/sfx/explosion.mp3")
		queue_free()
	
	if area.is_in_group("missile"):
		if enemy:
			PlayerStats.score += 5
			PlayerStats.power += 1
			AudioController.play("res://audio/sfx/explosion.mp3")
		area.get_parent().queue_free()
		queue_free()
