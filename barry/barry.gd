extends CharacterBody3D
class_name Barry

const SPEED = 8.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var target: Node3D
var should_run: bool = true

signal kill_player()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if (target == null): return
	
	look_at(target.position)
	rotation.x = 0
	
	var direction = (target.global_position - global_position).normalized()
	
	if direction && should_run:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_player_entered(body):
	if (body is Player || body is Larry):
		should_run = true
		target = body


func _on_killing_zone_body_entered(body):
	if (body is Player or body is Larry):
		should_run = false
	if (body is Player):
		emit_signal('kill_player')


func _on_killing_zone_body_exited(body):
	should_run = true
