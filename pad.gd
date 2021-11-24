extends Area


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_pad_body_exited(body):
	if body.get_name() == "Player":
		body.velocidad()
		print("velocidad!")
