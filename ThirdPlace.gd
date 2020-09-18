extends Node2D

func show_total_score_window():
	var total_score = NeededValues.total_score
	var ranking = total_score
	ranking.sort()
	ranking.invert()
	var i = 0
	$RedFace.hide()
	$GreenFace.hide()
	$BlueFace.hide()
	$PurpleFace.hide()
	while i < 4:
		if ranking[2] == total_score[i]:
			if get_parent().score_table[i] == 0:
				if i == 0:
					$RedFace.show()
					get_parent().score_table[0] = 1
				elif i == 1:
					$GreenFace.show()
					get_parent().score_table[1] = 1
				elif i == 2:
					$BlueFace.show()
					get_parent().score_table[2] = 1
				elif i == 3:
					$PurpleFace.show()
					get_parent().score_table[3] = 1
				$Score.text = str(ranking[i])
				break
		i += 1
