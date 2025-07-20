extends Node2D

var health_cost = 6
var dmg_cost = 10
var fr_cost = 8


func _process(delta: float) -> void:
	$Health2.text = "Health: " + str(PlayerStats.health) + "/" + str(PlayerStats.max_health)
	$Power.text = "Power: " + str(PlayerStats.power)
	$Score.text = "Score: " + str(PlayerStats.score)

func update_power(value):
	PlayerStats.power += value
	$Power.text = "Power: " + str(PlayerStats.power)

func update_score(value):
	PlayerStats.score += value
	$Score.text = "Score: " + str(PlayerStats.score)

func update_health(value):
	PlayerStats.health += value
	$Health2.text = "Health: " + str(PlayerStats.health) + "/" + str(PlayerStats.max_health)

#upgrade health
func _on_health_pressed() -> void:
	if PlayerStats.power >= health_cost:
		AudioController.play("res://audio/sfx/buttonsound.mp3")
		PlayerStats.power -= health_cost
		PlayerStats.hp_level += 1
		PlayerStats.max_health = PlayerStats.max_health + 10
		health_cost = round(health_cost * 1.2)
		$Health/Price.text = "Upgrade: " + str(health_cost)
		$Health/Level.text = "Lv. " + str(PlayerStats.hp_level)
		$Power.text = "Power: " + str(PlayerStats.power)
		$Health2.text = "Health: " + str(PlayerStats.health) + "/" + str(PlayerStats.max_health)

#upgrade damage
func _on_damage_pressed() -> void:
	if PlayerStats.power >= dmg_cost:
		AudioController.play("res://audio/sfx/buttonsound.mp3")
		PlayerStats.power -= dmg_cost
		PlayerStats.dmg_level += 1
		PlayerStats.damage = round(PlayerStats.damage * 1.2)
		dmg_cost = round(dmg_cost * 1.4)
		$Damage/Price.text = "Upgrade: " + str(dmg_cost)
		$Damage/Level.text = "Lv. " + str(PlayerStats.dmg_level)
		$Power.text = "Power: " + str(PlayerStats.power)

#upgrade fire rate
func _on_fire_rate_pressed() -> void:
	if PlayerStats.power >= fr_cost:
		AudioController.play("res://audio/sfx/buttonsound.mp3")
		PlayerStats.power -= fr_cost
		PlayerStats.fr_level += 1
		PlayerStats.fireRate = PlayerStats.fireRate * 0.98
		fr_cost = round(fr_cost * 1.3)
		$"Fire Rate"/Price.text = "Upgrade: " + str(fr_cost)
		$"Fire Rate"/Level.text = "Lv. " + str(PlayerStats.fr_level)
		$Power.text = "Power: " + str(PlayerStats.power)
