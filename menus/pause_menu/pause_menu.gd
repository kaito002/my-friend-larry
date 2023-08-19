extends Control
class_name PauseMenu

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var restart_level_btn: TextureButton = $menu/restart_level_btn
@onready var back_to_menu_btn: TextureButton = $menu/back_to_main_menu_btn

const main_menu_ref = preload("res://main/main_menu.tscn")

signal menu_showed()
signal menu_hided()
signal restart()

func _ready():
	restart_level_btn.connect('pressed', _restart_level)
	back_to_menu_btn.connect('pressed', _to_main_menu)

func _to_main_menu():
	var main_menu = main_menu_ref.instantiate()
	navigator.replace(main_menu)

func _restart_level():
	emit_signal('restart')

func _process(_delta):
	if (Input.is_action_just_pressed('launch_menu')):
		visible = !visible
		if (visible):
			emit_signal('menu_showed')
		else:
			emit_signal('menu_hided')
