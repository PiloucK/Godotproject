extends Area2D

export var presence = false

func _on_MachineTrigger_body_entered(PlayerCollision):
	presence = true

func _on_MachineTrigger_body_exited(body):
	presence = false
