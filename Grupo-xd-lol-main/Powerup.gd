extends Area



func _on_Spatial_body_entered(body):
	if "Player" in body.name:
		body.doble_powerup()
