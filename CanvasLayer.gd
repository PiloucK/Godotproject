extends CanvasLayer

var to_trade


func _ready():
	for i in get_tree().get_nodes_in_group("TradeTriggers"):
		i.connect("in_use_range", self, "_on_TradeTrigger_in_use_range")
		i.connect("out_use_range", self, "_on_TradeTrigger_out_use_range")

func _on_TradeTrigger_in_use_range(machine_name):
	to_trade = machine_name
#	NeededValues.treasure += 1
#	print(NeededValues.treasure)
	var trade_icon = load("res://icon.png")
	get_node("MapSceneControls/UseTrigger/TriggerIcon").set_texture(trade_icon)

func _on_TradeTrigger_out_use_range():
	get_node("MapSceneControls/UseTrigger/TriggerIcon").texture = null

func _input(event):
	if event.is_action_pressed("cooperate"):
		if to_trade.ends_with("Green"):
			NeededValues.round_results[0][1] *= -1
			print(NeededValues.red_to_green)
		if to_trade.ends_with("Blue"):
			NeededValues.round_results[0][2] *= -1
			print(NeededValues.red_to_blue)
		if to_trade.ends_with("Purple"):
			NeededValues.round_results[0][3] *= -1
			print(NeededValues.red_to_purple)
