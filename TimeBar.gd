extends TextureProgress


var timer_steps = [0, 16, 25, 34, 43, 52, 60, 69, 78, 87, 97]


func _process(delta):
	var time_left = get_parent().voting_timer.get_time_left()
	self.value = time_left * 100
	$Label.text = "Round  " + str(NeededValues.round_count + 1) + " / 12"
