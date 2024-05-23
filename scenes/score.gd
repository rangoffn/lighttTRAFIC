extends Label

func _process(_delta):
	self.text = "Очки: " + str(Global.score) + "\n" + "Рекорд: " + str(Global.high_score)

