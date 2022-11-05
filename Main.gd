extends Node2D

onready var camera = $Camera2D
onready var player = $Player

func _onready():
	pass
	
func _process(delta):
	pass
	#camera.set_position(player.get_position())

func _on_Button_pressed():
	print("area entered")
	get_tree().change_scene("res://Room2.tscn")


func _on_Area2D_body_entered(body):
	print("area entered")
	get_tree().change_scene("res://Room2.tscn")
