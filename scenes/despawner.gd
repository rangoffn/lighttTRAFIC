extends Node2D

func _on_area_2d_body_entered(body):
	Global.score += 1
	
	body.queue_free()
	if Global.infinity == true and Global.high_score < Global.score:
		Global.high_score = Global.score
	Save.save_game()
	
