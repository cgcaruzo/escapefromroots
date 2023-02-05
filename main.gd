extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var time_to_win = 30
export (int) var time_end = 5
var light_distance
var won = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$WinTimer.wait_time = time_to_win
	$WinTimer.start()
	$EndTimer.wait_time = time_end
	$EndLight.position = $EndLight/Positions/Begin.position
	light_distance = $EndLight/Positions/Begin.position.x - $EndLight/Positions/End.position.x

func _process(delta):
#	print($WinTimer.time_left)
	if won:
		$EndLight.position.x -= delta * 150
		$Player.run_speed = 90
		$BigRoots.run_speed = 60


func _on_WinTimer_timeout():
	win()

func win():
	won = true
	$Obstacle.queue_free()
	$EndTimer.start()
	print("YOU WIN")
#	


func _on_EndTimer_timeout():
	get_tree().change_scene("res://win.tscn")
