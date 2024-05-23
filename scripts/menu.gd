extends Node2D
var play
func _ready():
	play = true
	if not Musicmenu.playing:
		Musicmenu.get_node("kommunizm").stop()
		Musicmenu.get_node("tolk").stop()
		Musicmenu.play()

func _on_quit_pressed():
	get_tree().quit()


	
	


func _on_rules_pressed():
	get_tree().change_scene_to_file("res://scenes/rules.tscn")





func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels.tscn")


func _on_music_pressed():
	if play == true:
		for i in range(AudioServer.get_bus_count()):
			AudioServer.set_bus_volume_db(i, -90)
			$musicstop.visible = true
			play = false
	else:
		for i in range(AudioServer.get_bus_count()):
			AudioServer.set_bus_volume_db(i, 0)
			$musicstop.visible = false
			play = true
