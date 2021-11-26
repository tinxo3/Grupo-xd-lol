extends Node
var musica = load("res://Assets/cancion menu.mp3")

func play_music():
	$music.stream = musica
	$music.play()
