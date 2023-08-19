extends Node3D
class_name WorldButton

@onready var animator: AnimationPlayer = $button/AnimationPlayer

signal pressed()
signal released()

var _entered_bodies: Array[Node3D] = []

func _on_player_entered(body: Node3D):
	if (_entered_bodies.size() == 0):
		animator.play("pressed")
		emit_signal("pressed")
		print('pressed')
	_entered_bodies.push_back(body)

func _on_player_exited(node: Node3D):
	_entered_bodies.erase(node)
	if (_entered_bodies.size() == 0):
		animator.play_backwards("pressed")
		emit_signal("released")
		print('released')
