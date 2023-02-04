extends Area2D

export (int) var run_speed = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var screen_width = OS.window_size.x
	var percentage = 1
	if position.x != 0:
		percentage = (position.x / screen_width) * 100 
	if percentage < 15:
		position.x += run_speed *delta


func _on_BigRoots_body_entered(body):
	if (body.get_name() == 'Player'):
		print("You loose")
		get_tree().paused = 1
