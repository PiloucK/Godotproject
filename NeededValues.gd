extends Node

var round_results = [[-1,-1,-1,-1], [-1,-1,-1,-1], [-1,-1,-1,-1],[-1,-1,-1,-1]]
var total_score = [0, 0, 0, 0]

var per_turn_income = 2

var red_treasure = 10

#var red_trades = {to_blue = -1, to_purple = -1, to_green = -1}
var red_to_blue = -1
var red_to_purple = -1
var red_to_green = -1

var blue_to_red = -1
var blue_to_green = -1
var blue_to_purple = -1

var green_to_blue = -1
var green_to_red = -1
var green_to_purple = -1

var purple_to_blue = -1
var purple_to_red = -1
var purple_to_green = -1

var action_matrix = [4][4] # = [[0,0,0], [0,0,0], [0,0, 0], [0,0,0]]
