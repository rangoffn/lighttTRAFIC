extends Node

var config = ConfigFile.new()

# Путь к файлу сохранения
var save_path = "user://save.cfg"

func save_game():
	config.set_value("game_data", "high_score", Global.high_score)
	config.set_value("game_data", "unlocklevel2", Global.unlocklevel2)
	
	var error = config.save(save_path)
	if error != OK:
		print("Failed to save game data: ", error)
	else:
		print("Game data saved successfully.")

func load_game():
	var error = config.load(save_path)
	if error != OK:
		print("Failed to load game data: ", error)
	else:
		if config.has_section_key("game_data", "high_score"):
			Global.high_score = config.get_value("game_data", "high_score")
		if config.has_section_key("game_data", "unlocklevel2"):
			Global.unlocklevel2 = config.get_value("game_data", "unlocklevel2")
		print("Game data loaded successfully.")

func _ready():
	load_game()
