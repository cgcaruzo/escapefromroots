extends KinematicBody2D

export (int) var run_speed = 5
export (int) var jump_speed = -700
export (int) var gravity = 1200
export (int) var hp = 2

var velocity = Vector2()
var jumping = false
var crouching = false


func _ready():
	randomize()

func get_input():
	velocity.x = 0
	var jump = Input.is_action_just_pressed('ui_up')
	var crouch = Input.is_action_just_pressed('ui_down')

	if jump and is_on_floor() and !crouching:
		jumping = true
		velocity.y = jump_speed
		$AnimationPlayer.play("jump")
		var sound = get_node("jump")
		
		sound.play()
	
	if crouch and !jumping:
		crouching = true
		$AnimationPlayer.play("crouch")

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
	get_tree().change_scene("res://defeat.tscn")
	

func _on_BigRoots_body_entered(body):
	if (body.get_name() == 'Player'):
		print("YOU LOSE")
		get_tree().change_scene("res://defeat.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "jump":
		$AnimationPlayer.play("run")
	
	if anim_name == "crouch":
		crouching = false
		$AnimationPlayer.play("run")

