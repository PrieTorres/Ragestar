extends CanvasLayer

func update_score(score):
	$ScoreLabel.text = str(score)
	
func update_timer(time):
	$Relogio.text = str(time)
