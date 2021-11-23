extends Control


func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()



func _on_Options_pressed():
	get_tree().change_scene("res://scenes/OptionsMenu.tscn")
