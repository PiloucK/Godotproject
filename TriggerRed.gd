extends Area2D

var total_coin

func _ready():
	total_coin = 10

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		if  total_coin > 0:
			total_coin -= 1
		print(total_coin)
