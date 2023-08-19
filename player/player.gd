extends CharacterBody3D
class_name Player

const SPEED = 5.0
const DASH_VELOCITY = 300
const JUMP_VELOCITY = 4.5
const SENSITIVITY := 0.1


@onready var head: Node3D = $head
@onready var camera: Camera3D = $head/camera
@onready var launch_larry_ray: RayCast3D = $head/larry_launch_ray
@onready var hud: PlayerHUD = $HUD

const larry_ref = preload("res://larry/larry.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input( event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		# Rotates the view vertically
		head.rotate_x(deg_to_rad(event.relative.y * SENSITIVITY * -1))
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -65, 70)
		rotate_y(deg_to_rad(event.relative.x * SENSITIVITY * -1))

func _process(_delta):
	if (Input.is_action_just_pressed('launch_larry')):
		_fire_larry()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
	if (hud.get_bullets_count() <= 0): return
	
	var larry = larry_ref.instantiate()
	larry.position = launch_larry_ray.global_position
	larry.transform.basis = launch_larry_ray.transform.basis
	larry.rotate_x(deg_to_rad(-90))
	var larry_run_direction = (launch_larry_ray.global_position - global_position).normalized()
	larry.initialize(larry_run_direction, self)
	hud.add_bullet(-1)
	get_parent().add_child(larry)
