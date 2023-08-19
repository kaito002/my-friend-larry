extends Node3D

@onready var door_button: WorldButton = $world_button2
@onready var door: Door = $door
@onready var capsule_spawn: CapsuleLarrySpawnPoint = $capsule_larry_spawn_point
@onready var player: Player = $player
@onready var pause_menu: PauseMenu = $pause_menu
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	door_button.connect('pressed', door.open_door)
	door_button.connect('released', door.close_door)
	capsule_spawn.spawn()
	player.connect("larry_fired", capsule_spawn.spawn)
	
	pause_menu.connect('menu_showed', _on_menu_showed)
	pause_menu.connect('menu_hided', _on_menu_hided)
	
func _on_menu_showed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_menu_hided():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
