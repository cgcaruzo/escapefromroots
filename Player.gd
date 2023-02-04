extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -900
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
