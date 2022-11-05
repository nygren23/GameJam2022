extends Node2D

var globalstats = GlobalStats.new()
var currentPosition = [0,0]

func _ready():
	$UI/Label.text = "Current Room: [" +  str(currentPosition[0]) + ", " + str(currentPosition[1]) + "]"
	
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://CrossRoom.tscn")
 
