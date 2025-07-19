extends Node2D

@export var enemy : bool
var direction
var speed = 300

func setDirection(target):
	direction = (target - position).normalized()
	look_at(target)

func _process(delta: float) -> void:
	position += direction * (300 * delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and enemy:
		PlayerStats.health -= 10
		queue_free()
