extends Area

export (String) var escena

func _on_Portal_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(res://levels/Level1.tscn)
	pass # Replace with function body.
