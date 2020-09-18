extends Node2D

func show_total_score_window():
	var total_score = NeededValues.total_score()
	var ranking = total_score.sort()
	var i = 0
	$RedFace.hide()
	$GreenFace.hide()
	$BlueFace.hide()
	$PurpleFace.hide()
	while i < 4:
		if ranking[0] == total_score[i]:
			if i == 0:
				$RedFace.show()
			elif i == 1:
				$GreenFace.show()
			elif i == 2:
				$BlueFace.show()
			elif i == 3:
				$PurpleFace.show()
			$Score.text = str(ranking[i])
			break
		i += 1
