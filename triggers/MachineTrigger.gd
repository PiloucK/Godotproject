extends Area2D

signal in_use_range(machine_name)
signal out_use_range

func _on_MachineTrigger_body_entered(PlayerCollision):
	var machine_name = get_name()
	emit_signal("in_use_range", machine_name)

func _on_MachineTrigger_body_exited(PlayerCollision):
	emit_signal("out_use_range")
