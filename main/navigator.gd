extends Node
class_name Navigator

@onready var content: Node = $content

func replace(node: Node):
	var previous_node = content.get_child(0)
	content.add_child(node)
	previous_node.queue_free()
