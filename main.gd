extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var time_to_win = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	$WinTimer.wait_time = time_to_win
	$WinTimer.start()

func _process(delta):
#	print($WinTimer.time_left)
	pass

func _on_WinTimer_timeout():
	win()

func win():
	print("YOU WIN")
	get_tree().change_scene("res://title.tscn")
