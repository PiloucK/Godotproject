extends Node2D

func show_total_score_window():
	var total_score = NeededValues.total_score
	var ranking = total_score
	var i = 0
	$RedFace.hide()
	$GreenFace.hide()
	$BlueFace.hide()
	$PurpleFace.hide()
	var best_score = ranking[0]
	var p = 0
	i += 1
	while i < 4:
		if (ranking[i] > best_score):
			if get_parent().score_table[i] == 0:
				best_score = ranking[i]
				p = i
		i += 1
	if get_parent().score_table[p] == 0:
		if p == 0:
			$RedFace.show()
		elif p == 1:
			$GreenFace.show()
		elif p == 2:
			$BlueFace.show()
		elif p == 3:
			$PurpleFace.show()
		get_parent().score_table[p] = 1
		$Score.text = str(best_score)
