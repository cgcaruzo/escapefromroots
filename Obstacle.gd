extends Area2D

var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	# Mover el obstáculo hacia la izquierda
	position.x -= speed * delta

	# Reiniciar la posición si se sale de la pantalla
	if position.x < -40:
		position.x = 1100
		position.y = 475
 

