extends Node3D

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var door_button: WorldButton = $door_button
@onready var elevator_button: WorldButton = $elevator_button
@onready var door: Door = $door
@onready var capsule_spawn: CapsuleLarrySpawnPoint = $capsule_larry_spawn_point
@onready var player: Player = $player
@onready var pause_menu: PauseMenu = $pause_menu
@onready var elevator = $elevator
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	door_button.connect('pressed', door.open_door)
	door_button.connect('released', door.close_door)
	
	elevator_button.connect('pressed', elevator.elevate)
	elevator_button.connect('released', elevator.release)
	
	capsule_spawn.spawn()
	player.connect("larry_fired", capsule_spawn.spawn)
	
	pause_menu.connect('menu_showed', _on_menu_showed)
	pause_menu.connect('menu_hided', _on_menu_hided)
	pause_menu.connect('restart', _on_restart)
	
func _on_restart():
	var level_01 = load("res://levels/level_01/level_01.tscn").instantiate()
	navigator.replace(level_01)

func _on_menu_showed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_menu_hided():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
