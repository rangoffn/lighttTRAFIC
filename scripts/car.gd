extends CharacterBody2D
var turnright = 0
var forward = 1
var direction = 0
var stop = false # ( чтоб в друг друга не вьезжали )
var crash = 0
var speed
var cardie = false
#var previousPosition = Vector2()
var selected_animation
var selected_animation_plus_s

var animation_names 
var random_animation_index
var car_colour = 0         #random skin on car
func _ready():
	randomize()
	animation_names = ["car1", "car2", "car3", "car4"]
	random_animation_index = randi() % animation_names.size()
	selected_animation = animation_names[random_animation_index]
	selected_animation_plus_s = selected_animation + "s"
	get_node("AnimatedSprite2D").play(selected_animation)
	var playanim = false

func _process(_delta):
	if cardie == false:
		if stop == false:
			selected_animation = animation_names[random_animation_index]
			if Global.infinity == true or Global.level2 == true: 
				speed = 3 * _delta * 80 + Global.score/100
			else: speed = 3 * _delta * 60 + Global.score/200
			if car_colour == 0:
				get_node("AnimatedSprite2D").play(selected_animation)
				match direction:
					0: #вверх
						if turnright == 0:
							position.y -= speed
						if turnright == 1:
							position.x +=  speed 
					1: #слева направо
						if turnright == 0:
							position.x -= -speed
						if turnright == 1:
							position.y +=  speed 
					2: #справа налево
						if turnright == 0:
							position.x -= speed
						if turnright == 1:
							position.y +=  -speed 
					3: #вниз
						if turnright == 0:
							position.y += speed
						if turnright == 1:
							position.x +=  -speed 
			else:
					get_node("AnimatedSprite2D").play(selected_animation_plus_s)
		else:
				get_node("AnimatedSprite2D").play(selected_animation_plus_s)
	if Global.count_crash == 3:
		await get_node("AnimatedSprite2D").animation_finished
		queue_free()


func _on_detect_car_body_entered(body):# ( чтоб в друг друга не вьезжали )
	if body.is_in_group("cars") or body.is_in_group("bus"):
		stop = true
		if crash == 1:
			cardie = true
			Global.count_crash += 1
			get_node("AnimatedSprite2D").play("death")
			await get_node("AnimatedSprite2D").animation_finished
			self.queue_free()
func _on_detect_car_body_exited(body):#
	if body.is_in_group("cars") or body.is_in_group("bus"):
		var timer = get_tree().create_timer(0.3)  # Создаем таймер на 1 секунду
		await timer.timeout  # Ждем сигнала от таймера
		stop = false
		if crash == 1:
			cardie = true
			get_node("AnimatedSprite2D").play("death")
			await get_node("AnimatedSprite2D").animation_finished
			self.queue_free()




