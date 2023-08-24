extends Node3D

@onready var purple_button: WorldButton = $purple_button
@onready var especial_door_animator: AnimationPlayer = $especial_door/door_animator
@onready var pause_menu: PauseMenu = $pause_menu
@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var victory_zone: VictoryZone = $victory_zone
@onready var victory_menu: VictoryMenu = $victory_menu

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	purple_button.connect('pressed', func (): especial_door_animator.play("open"))
	purple_button.connect('released', func (): especial_door_animator.play_backwards("open"))
	victory_zone.connect('victory', victory_menu.show_menu)
	
func _restart_level():
	var level_02 = load('res://levels/level_02/level_02.tscn').instantiate()
	navigator.replace(level_02)
