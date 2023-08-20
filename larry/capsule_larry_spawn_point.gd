extends Node3D
class_name CapsuleLarrySpawnPoint

const capsule_larry_ref = preload("res://larry/capsule_larry.tscn")

func spawn():
	var capsule = capsule_larry_ref.instantiate()
	capsule.scale = Vector3(0.4, 0.4, 0.4)
	capsule.position.y = 1.2
	add_child(capsule)
