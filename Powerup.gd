extends Area
func _on_Spatial_body_entered(body):
	if body.get_name() == "Player":
		body.doble_powerup()
