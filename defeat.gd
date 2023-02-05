extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		get_tree().change_scene("res://main.tscn")

	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://title.tscn")
