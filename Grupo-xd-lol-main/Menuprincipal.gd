extends Control


func _ready():
	$VBoxContainer/Start.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	get_tree().change_scene("res://scenes/Optionsmenu.tscn")
