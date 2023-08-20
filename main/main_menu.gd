extends Node
class_name MainMenu

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var tutorial_btn: TextureButton = $ui/tutorial_btn
@onready var level_01_btn: TextureButton = $ui/level_01_btn

func _ready():
	level_01_btn.connect('pressed', _go_to_level_01)
	tutorial_btn.connect('pressed', _go_to_tutorial)
	
func _go_to_tutorial():
	var tutorial = preload("res://levels/tutorial/tutorial.tscn").instantiate()
	navigator.replace(tutorial)

func _go_to_level_01():
	var level_01 = preload("res://levels/level_01/level_01.tscn").instantiate()
	navigator.replace(level_01)
