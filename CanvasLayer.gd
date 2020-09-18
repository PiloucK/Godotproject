extends CanvasLayer

var to_trade


func _ready():
	for i in get_tree().get_nodes_in_group("TradeTriggers"):
		i.connect("in_use_range", self, "_on_TradeTrigger_in_use_range")
		i.connect("out_use_range", self, "_on_TradeTrigger_out_use_range")


func _on_TradeTrigger_in_use_range(machine_name):
	to_trade = machine_name
	show_the_icon(machine_name)


func show_the_icon(machine_name):
	if machine_name.ends_with("Green"):
		if NeededValues.round_results[0][1] == 0:
			get_node("MapSceneControls/BetrayIcon").show()
		else:
			get_node("MapSceneControls/CollabIcon").show()
	if machine_name.ends_with("Blue"):
		if NeededValues.round_results[0][2] == 0:
			get_node("MapSceneControls/BetrayIcon").show()
		else:
			get_node("MapSceneControls/CollabIcon").show()
	if machine_name.ends_with("Purple"):
		if NeededValues.round_results[0][3] == 0:
			get_node("MapSceneControls/BetrayIcon").show()
		else:
			get_node("MapSceneControls/CollabIcon").show()


func _on_TradeTrigger_out_use_range():
	get_node("MapSceneControls/CollabIcon").hide()
	get_node("MapSceneControls/BetrayIcon").hide()

func _input(event):
	if event.is_action_pressed("cooperate"):
		$MapSceneControls/AudioStreamPlayer2D.play()
		if to_trade.ends_with("Green"):
			if NeededValues.round_results[0][1] == 0:
				NeededValues.round_results[0][1] = 1
				get_node("MapSceneControls/BetrayIcon").hide()
				get_node("MapSceneControls/CollabIcon").show()
			else:
				NeededValues.round_results[0][1] = 0
				get_node("MapSceneControls/BetrayIcon").show()
				get_node("MapSceneControls/CollabIcon").hide()
		if to_trade.ends_with("Blue"):
			if NeededValues.round_results[0][2] == 0:
				NeededValues.round_results[0][2] = 1
				get_node("MapSceneControls/BetrayIcon").hide()
				get_node("MapSceneControls/CollabIcon").show()
			else:
				NeededValues.round_results[0][2] = 0
				get_node("MapSceneControls/BetrayIcon").show()
				get_node("MapSceneControls/CollabIcon").hide()
		if to_trade.ends_with("Purple"):
			if NeededValues.round_results[0][3] == 0:
				NeededValues.round_results[0][3] = 1
				get_node("MapSceneControls/BetrayIcon").hide()
				get_node("MapSceneControls/CollabIcon").show()
			else:
				NeededValues.round_results[0][3] = 0
				get_node("MapSceneControls/BetrayIcon").show()
				get_node("MapSceneControls/CollabIcon").hide()
