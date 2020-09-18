extends Node2D

var score_table = [0, 0, 0, 0]


func show_total_score_window():
	score_table = [0, 0, 0, 0]
	$FirstPlace.show_total_score_window()
	$SecondPlace.show_total_score_window()
	$ThirdPlace.show_total_score_window()
	$ForthPlace.show_total_score_window()
	$Window.show()
