extends Node

var score : = 0

const config_path = "user://settings.cfg"
var config

func _ready():
	config = ConfigFile.new()
	if config.load(config_path) != OK:
		print("Error loading config")
		config.set_value("graphics", "fullscreen", false)
		config.save(config_path)
	else:
		print("Config loaded")
		set_fullscreen(config.get_value("graphics", "fullscreen", false))

func set_fullscreen(enabled: bool):
	OS.window_fullscreen = enabled

func set_master_volume(volume: float):
	AudioServer.set_bus_volume_db(0, linear2db(volume / 100))
	config.set_value("audio", "master_volume", volume)
	config.save(config_path)
