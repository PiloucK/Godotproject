extends CanvasLayer

var use_trigger = "none"
var player

func _ready():
	for i in get_tree().get_nodes_in_group("TradeTriggers"):
		i.connect("in_use_range", self, "_on_TradeTrigger_in_use_range")
		i.connect("out_use_range", self, "_on_TradeTrigger_out_use_range")

func _on_TradeTrigger_in_use_range(player_name):
	player = player_name
	var trade_icon = load("res://icon.png")
	get_node("MapSceneControls/UseTrigger/TriggerIcon").set_texture(trade_icon)
	use_trigger = "cooperate"

func _on_TradeTrigger_out_use_range():
	get_node("MapSceneControls/UseTrigger/TriggerIcon").texture = null
	use_trigger = "none"

func _input(event):
	if event.is_action_pressed("cooperate"):
		if use_trigger == "cooperate":
			print("cooperate")
			print(player)
