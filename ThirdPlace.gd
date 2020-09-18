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
	var second_best = ranking[0]
	var p = 0
	var p2 = 0
	i += 1
	while i < 4:
		if (ranking[i] < best_score):
			if get_parent().score_table[p] == 0:
				second_best = best_score
				p2 = p
			best_score = ranking[i]
			p = i
		else:
			if get_parent().score_table[i] == 0:
				second_best = ranking[i]
				p2 = i
		i += 1
	print(p2)
	if get_parent().score_table[p2] == 0:
		if p2 == 0:
			$RedFace.show()
		elif p2 == 1:
			$GreenFace.show()
		elif p2 == 2:
			$BlueFace.show()
		elif p2 == 3:
			$PurpleFace.show()
		get_parent().score_table[p2] = 1
		$Score.text = str(second_best)
