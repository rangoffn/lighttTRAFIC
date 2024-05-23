extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.unlocklevel2 == true:
		$lock.visible = false
		$level2.visible = true
	else:
		$lock.visible = true
		$level2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_inf_pressed():
	get_tree().change_scene_to_file("res://scenes/levelinf.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_lock_pressed():
	pass # Replace with function body.
