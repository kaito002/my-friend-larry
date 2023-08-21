extends Node
class_name MainMenu

@onready var navigator: Navigator = get_tree().root.get_node('/root/main/navigator')
@onready var tutorial_btn: TextureButton = $ui/tutorial_btn
@onready var level_01_btn: TextureButton = $ui/level_01_btn
@onready var level_02_btn: TextureButton = $ui/level_02_btn

func _ready():
	tutorial_btn.connect('pressed', _go_to_tutorial)
	level_01_btn.connect('pressed', _go_to_level_01)
	level_02_btn.connect('pressed', _got_to_level_02)
	
func _go_to_tutorial():
	var tutorial = load("res://levels/tutorial/tutorial.tscn").instantiate()
	navigator.replace(tutorial)

func _go_to_level_01():
	var level_01 = load("res://levels/level_01/level_01.tscn").instantiate()
	navigator.replace(level_01)
	
func _got_to_level_02():
	var level_02 = load("res://levels/level_02/level_02.tscn").instantiate()
	navigator.replace(level_02)
