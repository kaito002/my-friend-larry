extends Node3D

@onready var button: WorldButton = $world_button
@onready var door: Door = $door

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	button.connect('pressed', door.open_door)
	button.connect('released', door.close_door)
