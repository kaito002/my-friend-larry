extends CharacterBody3D
class_name Player

const MAX_LARRY_CHARGE_LAUNCH = 4

const SPEED = 5.0
const DASH_VELOCITY = 300
const JUMP_VELOCITY = 4.5
const SENSITIVITY := 0.1

signal larry_fired()

@onready var head: Node3D = $head
@onready var camera: Camera3D = $head/camera
@onready var launch_larry_ray: RayCast3D = $head/larry_launch_ray
@onready var hud: PlayerHUD = $HUD

const larry_ref = preload("res://larry/larry.tscn")

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var _pressed_time: float = 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input( event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		head.rotate_x(deg_to_rad(event.relative.y * SENSITIVITY * -1))
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -65, 70)
		rotate_y(deg_to_rad(event.relative.x * SENSITIVITY * -1))

func _process(delta):
	_charging_launch(delta)
	
func _charging_launch(delta):
	if (hud.get_bullets_count() <= 0): return
	if (Input.is_action_pressed('launch_larry')):
		if (_pressed_time < MAX_LARRY_CHARGE_LAUNCH):
			_pressed_time += delta
		hud.add_launch_power(_pressed_time)
	if (Input.is_action_just_released('launch_larry')):
		hud.hide_launch_power()
		_fire_larry()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (camera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if (Input.is_action_just_pressed("dash")):
			velocity.x = DASH_VELOCITY * direction.x
			velocity.z = DASH_VELOCITY * direction.z
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
func _fire_larry():
	var larry = larry_ref.instantiate()
	larry.position = launch_larry_ray.global_position
	larry.transform.basis = launch_larry_ray.transform.basis
	larry.rotate_x(deg_to_rad(-90))
	var larry_run_direction = (launch_larry_ray.global_position - global_position).normalized()
	larry.initialize(larry_run_direction, self, roundi(_pressed_time))
	_pressed_time = 0.0
	hud.add_bullet(-1)
	get_parent().add_child(larry)
	emit_signal("larry_fired")
