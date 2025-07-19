extends Node2D

func update_power(value):
	PlayerStats.update_power(value)
	$Power.text = "Power: " + str(PlayerStats.power)

func update_score(value):
	PlayerStats.update_score(value)
	$Score.text = "Score: " + str(PlayerStats.score)

func update_health(value):
	PlayerStats.update_health(value)
	$Health2.text = "Health: " + str(PlayerStats.health) + "/" + str(PlayerStats.max_health)
