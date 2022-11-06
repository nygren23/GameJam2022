extends RoomChunk

export (PackedScene) var objective_scene

func _ready():
	add_child(load("res://UI.tscn").instance())
	var player = preload("res://Player.tscn").instance()
	print(Global.lastDirection)
	if(Global.lastDirection == "Up"):
		player.position = Vector2 (Global.lastPosition.x, 200)
	else:
		player.position = Vector2 (Global.lastPosition.x, 000)
	add_child(player)
	$UI/Position.text = "Current Room: " +  str(Global.curPos)
	

func _on_TransitionUp_body_entered(body):
	Global.lastPosition = body.global_position
	Global.lastDirection = "Up"
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

func _on_TransitionDown_body_entered(body):
	Global.lastPosition = body.global_position
	Global.lastDirection = "Down"
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
	
	
