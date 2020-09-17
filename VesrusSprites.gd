extends Node2D

var row = 0
var column = 1

func sprite_on_window():
	var my_round_results = NeededValues.round_results[row][column]
	$Collaborate.hide()
	$YouCheat.hide()
	$TheyCheat.hide()
	$BothCheat.hide()
	if NeededValues.round_count == 0:
		pass
	elif my_round_results == 3:
		$YouCheat.show()
	elif my_round_results == 2:
		$Collaborate.show()
	elif my_round_results == 0:
		$BothCheat.show()
	elif my_round_results == -1:
		$TheyCheat.show()
