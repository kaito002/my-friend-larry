extends Control
class_name VictoryMenu

@onready var navigator: Navigator = get_tree().root.get_node("/root/main/navigator")
@onready var back_btn: TextureButton = $BackBtn
func _ready():
	back_btn.connect('pressed', _on_back_pressed)

func _on_back_pressed():
	var main_menu = load("res://main/main_menu.tscn").instantiate()
	navigator.replace(main_menu)

func show_menu():
	visible = true;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func hide_menu():
	visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
