extends CanvasLayer



func _on_RestartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/Level.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().change_scene("res://UI/Menuprincipal.tscn")
