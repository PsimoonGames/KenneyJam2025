extends Node2D

var buildingList = []
var building = preload("res://Scenes/buildings/Skyscraper.tscn")
var enemy_missile = preload("res://Scenes/enemy_missiles.tscn")
var friendly_missile = preload("res://Scenes/friendly_missile.tscn")
var missile_timer_max = 5
var missile_timer = 0
var shoot_missile_timer = 0
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
	
	shoot_missile_timer += delta
	PlayerStats.game_timer += delta
	
	if PlayerStats.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")

#spawning enemy missiles
func new_missile():
	var spawn_location = Vector2()
	if randi_range(1,2) == 1:
		spawn_location.x = -10
	else:
		spawn_location.x = 1930
	spawn_location.y = randi_range(0, 400)
	
	var enemy = enemy_missile.instantiate()
	enemy.position = spawn_location
	enemy.setDirection(player.position)
	add_child(enemy)
	
	if missile_timer_max > 0.3:
		missile_timer_max -= 0.005

#spawns new building
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

#for player shooting missile
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if shoot_missile_timer >= PlayerStats.fireRate:
			var friendly = friendly_missile.instantiate()
			friendly.position = player.position
			friendly.setDirection(event.position)
			add_child(friendly)
			shoot_missile_timer = 0
