extends Node2D

var buildingList = []
var building = preload("res://Scenes/buildings/Skyscraper.tscn")
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
