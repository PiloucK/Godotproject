extends Area2D

signal in_use_range(player_color)
signal out_use_range

func _on_MachineTrigger_body_entered(PlayerCollision):
	var player_color = get_name()
	emit_signal("in_use_range", player_color)

func _on_MachineTrigger_body_exited(PlayerCollision):
	emit_signal("out_use_range")
