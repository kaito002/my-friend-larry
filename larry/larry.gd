extends CharacterBody3D
class_name Larry

@onready var countdown_text: Label3D = $head/countdown
@onready var head: Node3D = $head

const SPEED = 9.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var _direction: Vector3
var _player: Player

var _time_to_live = 15.0
var _time_to_run = 0

func initialize(direction: Vector3, player: Player, time_to_run: int):
	_player = player
	_direction = direction
	_time_to_run = time_to_run
	
func _ready():
	get_tree().create_timer(_time_to_run).connect('timeout', _on_run_timeout)
	get_tree().create_timer(_time_to_live).connect('timeout', _on_life_timeout)
	
func _process(delta):
	_time_to_live -= delta;
	countdown_text.text = "{0}".format([roundi(_time_to_live)])
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
