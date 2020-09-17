extends Node2D

func update_window_results():
	display_green_result()
	display_blue_result()
	display_purple_result()

func display_green_result():
	if NeededValues.round_results[0][1] == 3:
		$VSGreenResult.text = "+3"
	elif NeededValues.round_results[0][1] == 2:
		$VSGreenResult.text = "+2"
	elif NeededValues.round_results[0][1] == 0:
		$VSGreenResult.text = "0"
	elif NeededValues.round_results[0][1] == -1:
		$VSGreenResult.text = "-1"

func display_blue_result():
	if NeededValues.round_results[0][2] == 3:
		$VSBlueResult.text = "+3"
	elif NeededValues.round_results[0][2] == 2:
		$VSBlueResult.text = "+2"
	elif NeededValues.round_results[0][2] == 0:
		$VSBlueResult.text = "0"
	elif NeededValues.round_results[0][2] == -1:
		$VSBlueResult.text = "-1"

func display_purple_result():
	if NeededValues.round_results[0][3] == 3:
		$VSPurpleResult.text = "+3"
	elif NeededValues.round_results[0][3] == 2:
		$VSPurpleResult.text = "+2"
	elif NeededValues.round_results[0][3] == 0:
		$VSPurpleResult.text = "0"
	elif NeededValues.round_results[0][3] == -1:
		$VSPurpleResult.text = "-1"
