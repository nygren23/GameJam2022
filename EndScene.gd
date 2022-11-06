extends Node2D



func _on_Button_pressed():
	Global.reset_level()
	get_tree().change_scene("res://StartScreen.tscn")
