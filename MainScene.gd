extends Node2D

onready var voting_timer = $VotingTimer
onready var round_results = get_node("/root/NeededValues").round_results
onready var total_score = get_node("/root/NeededValues").total_score

func _ready():
	voting_timer.set_wait_time(5)
	voting_timer.start()

func _on_VotingTimer_timeout():
<<<<<<< Updated upstream
	var i = 0
	var j = 0
=======
#	action_matrix[0][0] = 2
	purple_to_green = 5
	print(action_matrix[0][0])
>>>>>>> Stashed changes
	print("timeout for voting settings")
	compute_round_results()
	compute_total_score()
	while i < 4:
		j = 0
		print("Total score:")
		print(total_score[i])
		print("Round player score:")
		while j < 4:
			print(round_results[i][j])
			j += 1
		i += 1
	reset_matrix()
	
func reset_matrix():
	var i = 0
	var j = 0
	while i < 4:
		j = 0
		while j < 4:
			round_results[i][j] = -1
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
				round_results[j][i] = 2
			elif (round_results[i][j] == -1) && (round_results[j][i] == -1): #Both cheat
				round_results[i][j] = 0
				round_results[j][i] = 0
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
