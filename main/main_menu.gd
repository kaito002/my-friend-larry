extends Node
class_name MainMenu

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var level_01_btn: TextureButton = $ui/level_01_btn

func _ready():
	level_01_btn.connect('pressed', _go_to_level_01)

func _go_to_level_01():
	var level_01 = preload("res://levels/level_01/level_01.tscn").instantiate()
	navigator.replace(level_01)
