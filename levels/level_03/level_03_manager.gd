extends Node3D

@onready var spawn_capsule =$map/capsule_larry_spawn_point
@onready var door: Door = $map/door
@onready var button: WorldButton = $map/world_button

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	spawn_capsule.spawn()
	button.connect('pressed', door.open_door)
	button.connect('released', door.close_door)
