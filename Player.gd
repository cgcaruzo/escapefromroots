extends KinematicBody2D

export (int) var run_speed = 5
export (int) var jump_speed = -700
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var hp = 2

func _ready():
	randomize()

func get_input():
	velocity.x = 0
	var jump = Input.is_action_just_pressed('ui_up')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
		$AnimationPlayer.play("jump")
		var sound = get_node("jump")
		
		sound.play()

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
	var obstacle = get_parent().get_node("Obstacle")
	if (body.get_name() == 'Player' and !obstacle.collided):
		on_loseHp()
		obstacle.collided = true
		velocity.x = -2000
		velocity = move_and_slide(velocity, Vector2(0, -1))
		var sound = get_node("hit1")
		sound.play()
		if hp == 0:
			game_over()
			pass

func game_over():
	var sound = get_node("dead")
	sound.play()
	get_tree().change_scene("res://title.tscn")
	

func _on_BigRoots_body_entered(body):
	if (body.get_name() == 'Player'):
		print("YOU LOSE")
		get_tree().change_scene("res://title.tscn")
