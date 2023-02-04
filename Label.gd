extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../Player")

func _process(delta):
	text = str(player.hp)
	set_text("HP: " + text)
