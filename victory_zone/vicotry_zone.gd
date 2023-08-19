extends CSGCylinder3D

signal victory()

func _on_player_entered(_body: Node3D):
	emit_signal('victory')
	print('victory')
