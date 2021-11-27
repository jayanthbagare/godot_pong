extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_Left_body_entered(body):
	$Ball.position = Vector2(get_viewport().size.x/2,get_viewport().size.y/2)
	OpponentScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountDowntimer.start()
	$CountDownLabel.visible = true


func _on_Right_body_entered(body):
	$Ball.position = Vector2(get_viewport().size.x/2,get_viewport().size.y/2)
	PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountDowntimer.start()
	$CountDownLabel.visible = true

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountDownLabel.text = str(int($CountDowntimer.time_left))


func _on_CountDowntimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountDownLabel.visible = false
