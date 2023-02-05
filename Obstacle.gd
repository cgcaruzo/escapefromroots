extends Area2D

var speed = 400
var collided = false
onready var sprites_children = $Sprites.get_children()
onready var sprites_lenght = $Sprites.get_child_count()

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_position()
	generate_sprite()
	pass # Replace with function body.


func _process(delta):

	# Mover el obstáculo hacia la izquierda
	position.x -= speed * delta

	# Reiniciar la posición si se sale de la pantalla
	if position.x < -40:
		generate_position()
		generate_sprite()
		print(position.y)
		position.x = 1100
		collided = false
 
func generate_sprite():
	var randomSpriteIndex = randi() % sprites_lenght
	$Sprite.texture = sprites_children[randomSpriteIndex].texture
	$Sprite.region_rect = sprites_children[randomSpriteIndex].region_rect

func generate_position():
	var randomPosition = randi() % 2
	
#		print(randomPosition)
	if randomPosition == 0:
		position.y = $Spawners/BottomSpawner.global_position.y
		$Sprite.flip_v = false
#			$Sprite.material.set_shader_param("offset", Vector2(-5,8))
	else:
		position.y = $Spawners/TopSpawner.global_position.y	
		$Sprite.flip_v = true
#			$Sprite.material.set_shader_param("offset", Vector2(5,-8))
