extends RayCast

func _ready():
	set_as_toplevel(true)

func _process(delta):
	global_transform.origin = get_parent().global_transform.origin
