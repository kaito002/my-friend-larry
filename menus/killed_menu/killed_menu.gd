extends Control
class_name KilledMenu

@export var level_path: String

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var try_again_btn: TextureButton = $GreyPanel/TryAgainBtn

func _ready():
	try_again_btn.connect('pressed', _on_try_again_pressed)
	
func _on_try_again_pressed():
	var level = load(level_path).instantiate()
	navigator.replace(level)
	
func show_menu():
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
