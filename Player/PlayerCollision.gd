extends KinematicBody2D

const MAX_SPEED = 100
var treasure = 10
var velocity = Vector2.ZERO
enum {
	MOVE,
	PLAY
}

var state = MOVE
onready var animation_player = $AnimationPlayer

func	 _ready():
	animation_player = $AnimationPlayer

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		PLAY:
			change_machine()
			
func	 change_machine():
	pass

			
func move_state(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animation_player.play("GoUp")
		else:
			animation_player.play("IdleLeft")
		velocity = input_vector.normalized() * MAX_SPEED
	else:
		velocity = Vector2.ZERO
# move_and_slide helps avoid sticky collision
# but still slows it down a bit somtimes, that s why
# we set velocity here (which is returned by the function)
	velocity = move_and_slide(velocity)
	
	#if Input.is_action_just_pressed("")
