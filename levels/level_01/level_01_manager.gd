extends Node3D

@onready var door_button: WorldButton = $world_button2
@onready var door: Door = $door
@onready var capsule_spawn: CapsuleLarrySpawnPoint = $capsule_larry_spawn_point
@onready var player: Player = $player
# Called when the node enters the scene tree for the first time.
func _ready():
	door_button.connect('pressed', door.open_door)
	door_button.connect('released', door.close_door)
	capsule_spawn.spawn()
	player.connect("larry_fired", capsule_spawn.spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
