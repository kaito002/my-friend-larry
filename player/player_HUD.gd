extends Control
class_name PlayerHUD

@export var larry_bullets := 1

@onready var bullets_container: HBoxContainer = $container/bullets_container
@onready var launch_power_progress: TextureProgressBar = $launch_power_progress

const bullet_ref = preload("res://player/larry_bullet.tscn")

func _ready():
	_draw_bullets()

func _draw_bullets():
	for i in bullets_container.get_child_count():
		bullets_container.remove_child(bullets_container.get_child(0))
		
	for i in larry_bullets:
		var bullet = bullet_ref.instantiate()
		bullets_container.add_child(bullet)

func add_launch_power(power: float):
	if (!launch_power_progress.visible):
		launch_power_progress.visible = true
	launch_power_progress.value = power
	
func hide_launch_power():
	launch_power_progress.visible = false

func add_bullet(count: int)-> void:
	larry_bullets += count
	_draw_bullets()

func get_bullets_count() -> int:
	return larry_bullets
	
func _touch_extra_bullet(_area: Area3D):
	add_bullet(1)
