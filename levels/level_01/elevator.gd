extends CSGBox3D

@onready var animator: AnimationPlayer = $AnimationPlayer

func elevate():
	animator.play("elevate")
	
func release():
	animator.play_backwards("elevate")
