extends CharacterBody3D

@onready var countdown_text: Label3D = $head/countdown
@onready var head: Node3D = $head

const SPEED = 10.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var _direction: Vector3
var _player: Player

var time_to_live = 10.0

func initialize(direction: Vector3, player: Player):
	_player = player
	_direction = direction
	
func _ready():
	get_tree().create_timer(3).connect('timeout', _on_run_timeout)
	get_tree().create_timer(time_to_live).connect('timeout', _on_life_timeout)
	
func _process(delta):
	time_to_live -= delta;
	countdown_text.text = "{0}".format([roundi(time_to_live)])
	head.look_at(_player.position)

func _on_run_timeout():
	_direction = Vector3.ZERO
	
func _on_life_timeout():
	queue_free()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	velocity.x = _direction.x * SPEED
	velocity.z = _direction.z * SPEED

	move_and_slide()
