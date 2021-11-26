extends Control

func _ready():
	$Titulo/anititulo.play("anititulo")
	$Santiago/anisantiago.play("anisantiago")
	$Martin/animartin.play("animartin")
	$Nicolas/aninicolas.play("aninicolas")
	$Juan/anijuan.play("anijuan")
	$Lorenzo/anilorenzo.play("anilorenzo")


func _on_ReturnMainMenu_pressed():
	get_tree().change_scene("res://UI/Menuprincipal.tscn")
