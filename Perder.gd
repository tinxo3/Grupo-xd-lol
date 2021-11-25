extends Area



func _ready():
	pass 





func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://UI/GameOverLVL1.tscn")
	
