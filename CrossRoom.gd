extends RoomChunk

func _ready():
	add_child(load("res://UI.tscn").instance())
	add_child(load("res://Player.tscn").instance())
	$Player.position = $CenterSpawn.global_position

func _on_TransitionLeft_body_entered(body):
	match decideNextRoom([Global.curPos[0], Global.curPos[1]-1]):
		null:
			print("did not match next room")
			pass
		"H":
			Global.curPos[1] -= 1
			print("matched H")
			get_tree().change_scene("res://HorizontalRoom.tscn")
		"V":
			Global.curPos[1] -= 1
			print("matched V")
			get_tree().change_scene("res://VerticalRoom.tscn")
		"X":
			Global.curPos[1] -= 1
			print("matched X")
			get_tree().change_scene("res://CrossRoom.tscn")
		"M":
			Global.curPos[1] -= 1
			print("matched M")
			get_tree().change_scene("res://Main.tscn")
	
func _on_TransitionRight_body_entered(body):
	match decideNextRoom([Global.curPos[0], Global.curPos[1]+1]):
		null:
			print("did not match next room")
			pass
		"H":
			Global.curPos[1] += 1
			print("matched H")
			get_tree().change_scene("res://HorizontalRoom.tscn")
		"V":
			Global.curPos[1] += 1
			print("matched V")
			get_tree().change_scene("res://VerticalRoom.tscn")
		"X":
			Global.curPos[1] += 1
			print("matched X")
			get_tree().change_scene("res://CrossRoom.tscn")
		"M":
			Global.curPos[1] += 1
			print("matched M")
			get_tree().change_scene("res://Main.tscn")
	
func _on_TransitionDown_body_entered(body):
	match decideNextRoom([Global.curPos[0]+1, Global.curPos[1]]):
		null:
			print("did not match next room")
			pass
		"H":
			Global.curPos[0] += 1
			print("matched H")
			get_tree().change_scene("res://HorizontalRoom.tscn")
		"V":
			Global.curPos[0] += 1
			print("matched V")
			get_tree().change_scene("res://VerticalRoom.tscn")
		"X":
			Global.curPos[0] += 1
			print("matched X")
			get_tree().change_scene("res://CrossRoom.tscn")
		"M":
			Global.curPos[0] += 1
			print("matched M")
			get_tree().change_scene("res://Main.tscn")

func _on_TransitionUp_body_entered(body):
	match decideNextRoom([Global.curPos[0]-1, Global.curPos[1]]):
		null:
			print("did not match next room")
			pass
		"H":
			Global.curPos[0] -= 1
			print("matched H")
			get_tree().change_scene("res://HorizontalRoom.tscn")
		"V":
			Global.curPos[0] -= 1
			print("matched V")
			get_tree().change_scene("res://VerticalRoom.tscn")
		"X":
			Global.curPos[0] -= 1
			print("matched X")
			get_tree().change_scene("res://CrossRoom.tscn")
		"M":
			Global.curPos[0] -= 1
			print("matched M")
			get_tree().change_scene("res://Main.tscn")