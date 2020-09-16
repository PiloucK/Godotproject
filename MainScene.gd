extends Node2D


onready var voting_timer = $VotingTimer


func _ready():
	voting_timer.set_wait_time(15)
	voting_timer.start()


func _on_VotingTimer_timeout():
	print("timeout for voting settings")
