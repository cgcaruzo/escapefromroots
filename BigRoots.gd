extends Area2D

export (int) var run_speed = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position.x += run_speed *delta


func _on_BigRoots_body_entered(body):
	pass
