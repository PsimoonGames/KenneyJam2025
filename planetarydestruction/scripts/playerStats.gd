extends Node

var health = 100
var max_health = 100
var score = 0
var power = 0
var damage = 10
var fireRate = 2
var dmg_level = 1
var hp_level = 1
var fr_level = 1
var game_timer = 0

var health_timer = 0
var individual_health_timer = 2

#resets stats to default value for game reset
func reset_stats():
	health = 100
	max_health = 100
	score = 0
	power = 0
	damage = 10
	fireRate = 2
	dmg_level = 1
	hp_level = 1
	fr_level = 1
	game_timer = 0

#for taking damage
func take_damage(value):
	health -= value
	health_timer = 0

func _process(delta: float) -> void:
	if health < max_health:
		health_timer += delta
		if health_timer > 5:
			individual_health_timer += delta
			if individual_health_timer > 2:
				health += 1
				individual_health_timer = 0
