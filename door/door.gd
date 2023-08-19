extends Node3D
class_name Door

@onready var animator: AnimationPlayer = $AnimationPlayer

func open_door():
	animator.play("open")

func close_door():
	animator.play_backwards("open")
