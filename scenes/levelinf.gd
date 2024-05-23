extends Node2D

var scene_to_spawn = preload("res://scenes/car.tscn")
var spawn_index = 0
var body_in = 0
var body_in2 = 0
var body_in3 = 0
var body_in4 = 0
var body_in5 = 0
var body_in6 = 0
var body_in7 = 0
var body_in8 = 0
var last_crash_count = -1



func _ready(): 
	$pause3.visible = false
	Musicmenu.stop()
	Musicmenu.get_node("kommunizm").play()
	$looser.visible = false
	get_tree().paused = false
	Global.infinity = true
	Global.level2 = false
	randomize()
	schedule_next_spawn()
	var random_spawn_time = 1
	$Timer.wait_time = random_spawn_time
	$Timer.start()
	Global.score = 0

func _on_timer_timeout():
	spawn_object(spawn_index)
	spawn_index +=1
	if spawn_index < 8:
		var random_spawn_time = 1
		$Timer.wait_time = random_spawn_time
		$Timer.start()
	else:
		spawn_index = 0
	
func spawn_object(index):
	var object = scene_to_spawn.instantiate()
	call_deferred("add_child",object)
	match index:
		0:
			object.position = Vector2(48, 1000)
			object.direction = 0
		1:
			object.position = Vector2(-1408, 170)
			object.rotate(1.5708)
			object.direction = 1
		2:
			object.position = Vector2(170, 1000)
			object.direction = 0
		3:
			object.position = Vector2(1408, -170)
			object.rotate(-1.5708)
			object.direction = 2

		4:
			object.position = Vector2(1408, -48)
			object.rotate(-1.5708)
			object.direction = 2
		5:
			object.position = Vector2(-1408, 48)
			object.rotate(1.5708)
			object.direction = 1
		6:
			object.position = Vector2(-48, -1000)
			object.rotate(3.14159)
			object.direction = 3
		7:
			object.position = Vector2(-170, -1000)
			object.rotate(3.14159)
			object.direction = 3
	
func schedule_next_spawn():
	var random_spawn_time = 0.7
	$Timer.wait_time = random_spawn_time
	$Timer.start()
	

func _process(delta):
	if Global.count_crash != last_crash_count:  # Проверяем, изменилось ли значение
		match Global.count_crash:
			0:
				get_node("health").play("3health")
			1:
				get_node("health").play("2health")
			2:
				get_node("2health").play("1health")
			3:
				get_node("1health").play("0health")
				await get_node("1health").animation_finished
				get_node("nt").play("ntt")
		last_crash_count = Global.count_crash



func _on_nt_animation_finished():
	get_tree().paused = true
	$looser.visible = true




func _on_menu_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	Global.infinity = false
	



func _on_dead_line_body_entered(body):
	if body.is_in_group("cars"):
		body_in +=1
	if body_in >= 5:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout

func _on_dead_line_body_exited(body):
	if body.is_in_group("cars"):
		body_in -=1

func _on_dead_line_2_body_entered(body):
	if body.is_in_group("cars"):
		body_in2 +=1
	if body_in2 >= 5:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout

func _on_dead_line_2_body_exited(body):
	if body.is_in_group("cars"):
		body_in2 -=1

func _on_dead_line_3_body_entered(body):
	if body.is_in_group("cars"):
		body_in3 +=1
	if body_in3 >= 5:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout
func _on_dead_line_3_body_exited(body):
	if body.is_in_group("cars"):
		body_in3 -=1

func _on_dead_line_4_body_entered(body):
	if body.is_in_group("cars"):
		body_in4 +=1
	if body_in4 >= 5:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout
func _on_dead_line_4_body_exited(body):
	if body.is_in_group("cars"):
		body_in4 -=1

func _on_dead_line_5_body_entered(body):
	if body.is_in_group("cars"):
		body_in5 +=1
	if body_in5 >= 8:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout
func _on_dead_line_5_body_exited(body):
	if body.is_in_group("cars"):
		body_in5 -=1

func _on_dead_line_6_body_entered(body):
	if body.is_in_group("cars"):
		body_in6 +=1
	if body_in6 >= 8:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout
func _on_dead_line_6_body_exited(body):
	if body.is_in_group("cars"):
		body_in6 -=1

func _on_dead_line_7_body_entered(body):
	if body.is_in_group("cars"):
		body_in7 +=1
	if body_in7 >= 8:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout
func _on_dead_line_7_body_exited(body):
	if body.is_in_group("cars"):
		body_in7 -=1


func _on_dead_line_8_body_entered(body):
	if body.is_in_group("cars"):
		body_in8 +=1
	if body_in8 >= 8:
		get_node("traffline").play("traff_line")
		Global.count_crash += 1
		var timer = get_tree().create_timer(5)
		await timer.timeout

func _on_dead_line_8_body_exited(body):
	if body.is_in_group("cars"):
		body_in8 -=1





func _on_pause_pressed():
	get_tree().paused = !get_tree().paused
	if get_tree().paused == true:
		get_node("pause2").play("stop")
		$pause3.visible = true
	else: 
		get_node("pause2").play("play")
		$pause3.visible = false



