extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if (Global.timer_time_left < 2500 && !$AudioStreamPlayer2D.is_playing()):
		$AudioStreamPlayer2D.play(Global.musicStart/100)
	elif(Global.timer_time_left < 2500):
		Global.musicStart += delta * 100;
	if (Global.timer_time_left < 2500 && Global.timer_time_left > 1500 && Global.curPos[0] == 2):
		position = Vector2(500, (Global.timer_time_left - 1200)/10000 * (8300))
	elif (Global.timer_time_left < 1500 && Global.timer_time_left > 700 && Global.curPos[0] == 1):
		position = Vector2(500, (Global.timer_time_left - 500)/8000 * (8300))
	elif (Global.timer_time_left < 500 && Global.curPos[0] == 0):
		position = Vector2(500, (Global.timer_time_left)/5000 * (8300))


func _on_Area2D_area_entered(area):
	Global.youLose = true
	print("GetFucked")
