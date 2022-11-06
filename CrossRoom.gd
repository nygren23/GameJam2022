extends RoomChunk

export (PackedScene) var objective_scene

func _ready():
	add_child(load("res://UI.tscn").instance())
	
	var player = preload("res://Player.tscn").instance()
	print(Global.lastDirection)
	if(Global.lastDirection == "Up"):
		player.position = Vector2 (300, 300)
	elif(Global.lastDirection == "Left"):
		player.position = Vector2 (650, 150)
	elif(Global.lastDirection == "Right"):
		player.position = Vector2 (-150, -120)
	else:
		player.position = Vector2(300, -150)
	add_child(player)
	
	if Global.metadata[Global.curPos[0]][ Global.curPos[1]][1]:
		var objective = preload("res://Objective.tscn").instance()	
		objective.position = Vector2 (250, 75)
		add_child(objective)
	
	var blockedRoomString = Global.metadata[Global.curPos[0]][Global.curPos[1]][2]
	if(blockedRoomString[0] == '1'):
		$Left.visible = true
		$Left.set_collision_layer(2)
		$Left.set_collision_mask(2)
	if(blockedRoomString[1] == '1'):
		$Right.visible = true
		$Right.set_collision_layer(2)
		$Right.set_collision_mask(2)
	if(blockedRoomString[2] == '1'):
		$Top.visible = true
		$Top.set_collision_layer(2)
		$Top.set_collision_mask(2)
	if(blockedRoomString[3] == '1'):
		$Bottom.visible = true
		$Bottom.set_collision_layer(2)
		$Bottom.set_collision_mask(2)
	
	
	$UI/Position.text = "Current Room: " +  str(Global.curPos)

func _on_TransitionLeft_body_entered(body):
	Global.lastDirection = "Left"
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
	Global.lastDirection = "Right"
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

func _on_TransitionUp_body_entered(body):
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
	
