extends Node2D

var per_turn_income = 2
onready var voting_timer = $VotingTimer

func _ready():
	voting_timer.set_wait_time(10)
	voting_timer.start()


func _on_VotingTimer_timeout():
	pass # Replace with function body.
