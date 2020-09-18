extends Node

var round_results = [[0, 0, 0, 0], [ 0, 0, 0, 0], [ 0, 0, 0, 0],[ 0, 0, 0, 0]]
var total_score = [10, 10, 10, 10]
var round_count = 0

var per_turn_income = 2

func reset():
	round_results = [[0, 0, 0, 0], [ 0, 0, 0, 0], [ 0, 0, 0, 0],[ 0, 0, 0, 0]]
	total_score = [10, 10, 10, 10]
	round_count = 0
