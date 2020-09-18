extends Node2D

onready var voting_timer = $VotingTimer
onready var round_results = get_node("/root/NeededValues").round_results
onready var total_score = get_node("/root/NeededValues").total_score

func _ready():
	$RecapWindow/VesrusWindowSpriteGreen.sprite_on_window()
	$RecapWindow/VesrusWindowSpriteBlue.sprite_on_window()
	$RecapWindow/VesrusWindowSpritePurple.sprite_on_window()
	voting_timer.set_wait_time(15)
	voting_timer.start()
	$PlayerScoreWindow/CurrentScore.text = str(total_score[0])

func _on_VotingTimer_timeout():
	NeededValues.round_count += 1
	print("ROUND!!!!!!:")
	print(NeededValues.round_count)
	var i = 0
	var j = 0
	$YSort/BlueBot.do_bot_trades(1)
	$YSort/BlueBot.do_bot_trades(2)
	$YSort/BlueBot.do_bot_trades(3)
	move_players()
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
	$RecapWindow/VesrusWindowSpriteGreen.sprite_on_window()
	$RecapWindow/VesrusWindowSpriteBlue.sprite_on_window()
	$RecapWindow/VesrusWindowSpritePurple.sprite_on_window()
	$RecapWindow.update_window_results()
	$PlayerScoreWindow/CurrentScore.text = str(total_score[0])
	reset_matrix()
	
	
func move_players():
	$YSort/BlueBot.position = $BlueSpawn.position
	$YSort/Player.position = $RedSpawn.position
	$YSort/GreenBot.position = $GreenSpawn.position
	$YSort/PurpleBot.position = $PurpleSpawn.position
	
func reset_matrix():
	var i = 0
	var j = 0
	while i < 4:
		j = 0
		while j < 4:
			round_results[i][j] = 0
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
			elif (round_results[i][j] == 1): #Cooperation
				round_results[i][j] = 2
				round_results[j][i] = 2
			elif (round_results[i][j] == 0): #Both cheat
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
