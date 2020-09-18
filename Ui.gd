extends Node


func _ready():
	pass
	
	
var MainScene = load("res://MainScene.tscn").instance()


func _on_Play_pressed():
	$CanvasLayer/Play.hide()
	add_child(MainScene)
	pass


func _on_PlayAgain_pressed():
	MainScene.queue_free()
	NeededValues.reset()
	get_tree().set_pause(false)
	MainScene = load("res://MainScene.tscn").instance()
	$CanvasLayer/PlayAgain.hide()
	add_child(MainScene)

