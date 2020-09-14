extends Area2D

var presence

func _on_MachineTrigger_body_entered(PlayerCollision):
	presence = true

func _on_MachineTrigger_body_exited(body):
	presence = false

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		if presence == true:
			if $Labelt.text == "Groot":
				$Label.text = "Hello"
			else:
				$Label.text = "Groot"
