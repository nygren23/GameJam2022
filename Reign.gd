extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if (Global.timer_time_left < 2000 && Global.timer_time_left > 1200 && Global.curPos[0] == 2):
		position = Vector2(500, (Global.timer_time_left - 1200)/8000 * (8300))
	elif (Global.timer_time_left < 1200 && Global.timer_time_left > 500 && Global.curPos[0] == 1):
		position = Vector2(500, (Global.timer_time_left - 500)/7000 * (8300))
	elif (Global.timer_time_left < 500 && Global.curPos[0] == 0):
		position = Vector2(500, (Global.timer_time_left)/5000 * (8300))


func _on_Area2D_area_entered(area):
	Global.youLose = true
	print("GetFucked")
