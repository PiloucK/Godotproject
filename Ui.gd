extends Node


func _ready():
	pass
	
	
var MainScene = load("res://MainScene.tscn").instance()


func _on_Play_pressed():
	$CanvasLayer/Play.hide()
#	$CanvasLayer/PlayAgain.hide()
	add_child(MainScene)
	pass


func _on_PlayAgain_pressed():
	MainScene.queue_free()
	MainScene = load("res://MainScene.tscn").instance()
	add_child(MainScene)
