extends KinematicBody2D

const MAX_SPEED = 100
var velocity = Vector2.ZERO

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

func	 _ready():
	animation_player = $AnimationPlayer

func _physics_process(delta):
			move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = 
	input_vector.y = 
	
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
