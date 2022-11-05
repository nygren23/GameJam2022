extends Node2D

onready var player = $Player

func _ready():
	pass
	
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://HorizontalRoom.tscn")
