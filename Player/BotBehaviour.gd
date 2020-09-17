extends KinematicBody2D

const MAX_SPEED = 100
var velocity = Vector2.ZERO

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")
onready var round_results = get_node("/root/NeededValues").round_results


func	 _ready():
	animation_player = $AnimationPlayer


func _physics_process(delta):
	move_state(delta)
	
	
func do_bot_trades(id):
	var i = id
	var j = 0
	while j < 4:
		round_results[i][j] = randi() % 2
		j += 1


var x_lock = 0
var y_lock = 0
var last_x = 0
var last_y = 0
var move_lock = 0

func move_state(delta):
	var input_vector = Vector2.ZERO
	
	if move_lock == 0:
		move_lock = randi() % 5 + 1
		if move_lock < 2:
			move_lock = 1
		if x_lock < 0:
			input_vector.x = randi() % 2 - randi() % 2
			x_lock = randi() % 20 + 1 
			last_x = input_vector.x
		else:
			input_vector.x = last_x
		if y_lock < 0:
			input_vector.y = randi() % 2 - randi() % 2
			y_lock = randi() % 20 + 1
			last_y = input_vector.y
		else:
			input_vector.y = last_y
	else:
		input_vector.x = last_x
		input_vector.y = last_y
	x_lock -= 1
	y_lock -= 1
	move_lock -= 1
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Move/blend_position", input_vector)
		animation_state.travel("Move")
		velocity = input_vector.normalized() * MAX_SPEED
	else:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO
# move_and_slide helps avoid sticky collision
# but still slows it down a bit somtimes, that s why
# we set velocity here (which is returned by the function)
	velocity = move_and_slide(velocity)
	
	#if Input.is_action_just_pressed("")
