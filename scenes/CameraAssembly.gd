extends Position3D


export var target_path : NodePath
onready var target = get_node(target_path)
onready var offset = target.transform.origin - transform.origin

func _process(delta):
	transform.origin = target.transform.origin + offset
