extends Node2D

func _ready():
	print("made it to room 2")
	add_child(load("res://Player.tscn").instance())

func _on_Area2D_body_entered(body):
	print("area entered")
	get_tree().change_scene("res://Main.tscn")
