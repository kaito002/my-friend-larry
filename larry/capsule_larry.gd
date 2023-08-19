extends Node3D

func _on_player_touch(body):
	if (body is Player):
		$AnimationPlayer.stop()
		queue_free()
