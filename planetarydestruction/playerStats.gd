extends Node

var health = 100
var max_health = 100
var score = 0
var power = 0
var damage = 10

func update_power(value):
	power += value

func update_score(value):
	score += value

func update_health(value):
	health += value

func update_damage(value):
	damage += value
