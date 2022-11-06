extends Node2D


func _on_Level_Select_pressed():
	$L1.show()
	$L2.show()
	$L3.show()
	$Back.show()
	$Title.hide()
	$"Level Select".hide()
	$By.hide()


func _on_Back_pressed():
	$L1.hide()
	$L2.hide()
	$L3.hide()
	$Back.hide()
	$Title.show()
	$By.show()
	$"Level Select".show()


func _on_L1_pressed():
	Global.level = 1
	get_tree().change_scene("res://Main.tscn")
