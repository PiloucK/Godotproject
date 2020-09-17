extends Node2D

var round_results = [[0,-1,0,2], [-1,0,1,1], [-1,-1,0,-1],[1,1,1,0]]
var total_score = [0, 0, 0, 0]

onready var voting_timer = $VotingTimer


func _ready():
	voting_timer.set_wait_time(5)
	voting_timer.start()



func _on_VotingTimer_timeout():
	var i = 0
	var j = 0
	print("timeout for voting settings")
	compute_round_results()
	while i < 4:
		j = 0
		print(total_score[i])
		while j < 4:
			print(round_results[i][j])
			j += 1
		i += 1
	
func compute_round_results():
	var i = 0
	var j = 0

	while i < 4:
		j = i
		while j < 4:
			if round_results[i][j] < round_results[j][i]: #You cheat
				round_results[i][j] = 3
				round_results[j][i] = -1
			elif round_results[i][j] > round_results[j][i]: #They cheated
				round_results[i][j] = -1
				round_results[j][i] = 3
			elif (round_results[i][j] == 1) && (round_results[j][i] == 1): #Cooperation
				round_results[i][j] = 2
				round_results[i][j] = 2
			elif (round_results[i][j] == -1) && (round_results[j][i] == -1): #Both cheat
				round_results[i][j] = 0
				round_results[i][j] = 0
			j += 1
		i += 1

func compute_total_score():
	var i = 0
	var j = 0
	while (i < 4):
		j = 0
		while (j < 4):
			total_score[i] += round_results[i][j]
			j += 1
		i += 1
