extends Node3D
class_name Tutorial

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var capsule_spawn: CapsuleLarrySpawnPoint = $capsule_larry_spawn_point
@onready var pause_menu: PauseMenu = $pause_menu
@onready var door_button: WorldButton = $door_button
@onready var door: Door = $door
@onready var player: Player = $player

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pause_menu.connect('menu_showed', _on_menu_showed)
	pause_menu.connect('menu_hided', _on_menu_hided)
	pause_menu.connect('restart', _on_restart)
	door_button.connect('pressed', door.open_door)
	door_button.connect('released', door.close_door)
	player.connect('larry_fired', capsule_spawn.spawn)
	capsule_spawn.spawn()

func _on_menu_showed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_menu_hided():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_restart():
	var tutorial = load("res://levels/tutorial/tutorial.tscn").instantiate()
	navigator.replace(tutorial)

