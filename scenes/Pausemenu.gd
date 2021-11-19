extends Control

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		visible = true
		get_tree().paused = true


func _on_Continue_button_pressed():
	hide()
	get_tree().paused = false


func _on_ExitGame_button_pressed():
	get_tree().paused = false
	get_tree().quit()
