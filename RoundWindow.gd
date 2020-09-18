extends Node2D

func show_round_sign():
	$RoundSign.show()
	$Timer.set_wait_time(1)
	$Timer.start()
	$AudioStreamPlayer2D.play()

func _on_Timer_timeout():
	$RoundSign.hide()
