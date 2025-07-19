extends Node2D

var buildingList = []
var building = preload("res://Scenes/buildings/Skyscraper.tscn")
var missile = preload("res://Scenes/enemy_missiles.tscn")
var missile_timer_max = 5
var missile_timer = 0
@export var player: Node2D
@export var hud: Node2D

func _ready() -> void:
	for i in range(5):
		new_building()

func _process(delta: float) -> void:
	if Input.is_action_pressed("right") and player.scroll:
		for i in buildingList:
			i.position.x -= 200 * delta
			if i.position.x < -400:
				i.queue_free()
				buildingList.erase(i)
				new_building()
	
	for i in buildingList:
		if i.current_health <= 0:
			i.queue_free()
			buildingList.erase(i)
			new_building()
			hud.update_power(10)
			hud.update_score(100)
	
	missile_timer += delta
	if missile_timer > missile_timer_max:
		new_missile()
		missile_timer = 0
	

func new_missile():
	var spawn_location = Vector2()
	if randi_range(1,2) == 1:
		spawn_location.x = -10
	else:
		spawn_location.x = 1930
	spawn_location.y = randi_range(0, 300)
	
	var enemy = missile.instantiate()
	enemy.position = spawn_location
	enemy.setDirection(player.position)
	add_child(enemy)

func new_building():
	var distance
	var build
	var minDistance
	if !buildingList:
		minDistance = 910
	else:
		minDistance = buildingList[len(buildingList) - 1].position.x
	distance = randi_range(400, 1200)
	build = building.instantiate()
	add_child(build)
	buildingList.append(build)
	build.position.y = 810
	build.position.x = minDistance + distance
