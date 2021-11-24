extends Control


func _on_CheckBox_toggled(button_pressed):
	Globals.set_fullscreen(button_pressed)


func _on_Button_pressed():
	get_tree().change_scene("res://UI/Menuprincipal.tscn")


func _on_HSlider_value_changed(value):
	Globals.set_master_volume(value)
	pass # Replace with function body.
