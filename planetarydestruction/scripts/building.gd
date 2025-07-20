extends Node2D

@export var base_health : int
@export var type : int
var max_health
var current_health
var taking_damage = false

func _ready() -> void:
	max_health = base_health + (round(PlayerStats.game_timer / 10) * type)
	current_health = max_health

func _process(delta: float) -> void:
	if taking_damage:
		current_health -= PlayerStats.damage * delta
		$ProgressBar.value = (current_health / max_health) * 100

func _on_area_2d_area_entered(area: Area2D) -> void:
	taking_damage = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	taking_damage = false
