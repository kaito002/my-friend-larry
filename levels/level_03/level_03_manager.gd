extends Node3D

@onready var spawn_capsule =$map/capsule_larry_spawn_point
@onready var door: Door = $map/door
@onready var button: WorldButton = $map/world_button
@onready var killed_menu: KilledMenu = $killed_menu
@onready var barry: Barry = $barry
@onready var player: Player = $player
@onready var orange_btn: WorldButton = $map/world_button2
@onready var orange_door: Door = $map/door2
@onready var victory_menu: VictoryMenu = $victory_menu
@onready var victory_zone: VictoryZone = $map/victory_zone

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	spawn_capsule.spawn()
	button.connect('pressed', door.open_door)
	button.connect('released', door.close_door)
	barry.connect("kill_player", killed_menu.show_menu)
	player.connect("larry_fired", spawn_capsule.spawn)
	orange_btn.connect('pressed', orange_door.open_door)
	orange_btn.connect('released', orange_door.close_door)
	victory_zone.connect('victory', victory_menu.show_menu)
