extends Area2D

var speed = 400
var collided = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	# Mover el obstáculo hacia la izquierda
	position.x -= speed * delta

	# Reiniciar la posición si se sale de la pantalla
	if position.x < -40:
		var randomPosition = randi() % 2
#		print(randomPosition)
		if randomPosition == 0:
			position.y = $Spawners/BottomSpawner.global_position.y
		else:
			position.y = $Spawners/TopSpawner.global_position.y	
		print(position.y)
		position.x = 1100
		collided = false
 

