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
	Global.map = Global.map1
	Global.metadata = Global.metadata1
	Global.mainLocation = Global.mainLocation1
	Global.dimensions = [Global.map.size(), Global.map[0].size()]
	Global.curPos = [Global.mainLocation[0], Global.mainLocation[1]]
	get_tree().change_scene("res://Main.tscn")
	
func _on_L2_pressed():
	Global.level = 2
	Global.timer_time_left = 3500
	Global.map = Global.map2
	Global.metadata = Global.metadata2
	Global.mainLocation = Global.mainLocation2
	Global.dimensions = [Global.map.size(), Global.map[0].size()]
	Global.curPos = [Global.mainLocation[0], Global.mainLocation[1]]
	get_tree().change_scene("res://Main.tscn")
