extends KinematicBody2D

export (int) var run_speed = 5
export (int) var jump_speed = -900
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var hp = 3

func get_input():
	velocity.x = 0
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity.x += run_speed
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))

func on_loseHp():
	hp -= 1

func _on_Obstacle_body_entered(body):
	print("CHOCA")
	if (body.get_name() == 'Player'):
		velocity.x = -1000
		velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_BigRoots_body_entered(body):
	if (body.get_name() == 'Player'):
		print("YOU LOSE")
		get_tree().change_scene("res://title.tscn")
