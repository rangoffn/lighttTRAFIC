extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_level_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_repeat_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")




func _on_infinity_pressed():
	get_tree().change_scene_to_file("res://scenes/levelinf.tscn")


func _on_repeat_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
