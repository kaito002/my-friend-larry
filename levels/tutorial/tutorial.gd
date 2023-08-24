extends Node3D
class_name Tutorial

@onready var capsule_spawn: CapsuleLarrySpawnPoint = $capsule_larry_spawn_point
@onready var door_button: WorldButton = $door_button
@onready var door: Door = $door
@onready var player: Player = $player
@onready var victory_zone: VictoryZone = $victory_zone
@onready var victory_menu: VictoryMenu = $victory_menu

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	door_button.connect('pressed', door.open_door)
	door_button.connect('released', door.close_door)
	player.connect('larry_fired', capsule_spawn.spawn)
	victory_zone.connect('victory', victory_menu.show_menu)
	capsule_spawn.spawn()
