extends TextureProgress


func _process(delta):
	var time_left = get_parent().voting_timer.get_time_left()
	self.value = time_left * 100
	$Label.text = "Round  " + str(NeededValues.round_count + 1) + " / 12"
