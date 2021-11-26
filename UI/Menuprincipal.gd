extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()
	$AnimationPlayer.play("fade_in")
	MusicController.play_music()
func _on_Start_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()



func _on_Options_pressed():
	get_tree().change_scene("res://UI/OptionsMenu.tscn")


func _on_About_pressed():
	get_tree().change_scene("res://UI/About.tscn")
