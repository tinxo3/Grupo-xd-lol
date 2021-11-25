extends Area
func _on_pad_body_entered(body):
	if body.get_name() == "Player":
		body.velocidad()
