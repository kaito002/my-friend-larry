extends Node3D
class_name CapsuleLarrySpawnPoint

const capsule_larry_ref = preload("res://larry/capsule_larry.tscn")

func spawn():
	var capsule = capsule_larry_ref.instantiate()
	capsule.scale = Vector3(0.4, 0.4, 0.4)
	capsule.position = position + Vector3(0, 1.2, 0)
	add_child(capsule)
