extends RoomChunk

var startingLocation = 0
export (PackedScene) var objective_scene

func _ready():
	
	
	add_child(load("res://UI.tscn").instance())
	var player = preload("res://Player.tscn").instance()
	print(Global.lastDirection)
	if(Global.lastDirection == "Right"):
		player.position = Vector2 (-150, Global.lastPosition.y)
	else:
		player.position = Vector2 (650, Global.lastPosition.y)
	add_child(player)
	$UI/Position.text = "Current Room: " +  str(Global.curPos)
	
	if Global.metadata[Global.curPos[0]][ Global.curPos[1]][1]:
		var objective = preload("res://Objective.tscn").instance()	
		objective.position = Vector2 (250, 75)
		add_child(objective)

	
	
func _on_TransitionRight_body_entered(body):
	Global.lastPosition = body.global_position
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
			

func _on_TransitionLeft_body_entered(body):
	Global.lastPosition = body.global_position
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
			

