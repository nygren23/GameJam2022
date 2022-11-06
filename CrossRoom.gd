extends RoomChunk

export (PackedScene) var objective_scene
var interact_listen = false
var player

func _ready():
	add_child(load("res://UI.tscn").instance())
	
	player = preload("res://Player.tscn").instance()
	print(Global.lastDirection)
	if(Global.lastDirection == "Up"):
		player.position = Vector2 (Global.lastPosition.x, 300)
	elif(Global.lastDirection == "Left"):
		player.position = Vector2 (650, Global.lastPosition.y)
	elif(Global.lastDirection == "Right"):
		player.position = Vector2 (-150, Global.lastPosition.y)
	else:
		player.position = Vector2(Global.lastPosition.x, -150)
	add_child(player)
	
	if Global.metadata[Global.curPos[0]][ Global.curPos[1]][1]:
		var objective = preload("res://Objective.tscn").instance()	
		objective.position = Vector2 (250, 100)
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
		$Lift.visible = false
	$Lift.visible = true
	$Lift.set_collision_layer(2)
	$Lift.set_collision_mask(2)
	
	
	$UI/Position.text = "Current Room: " +  str(Global.curPos)

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
	

var velocity = Vector2.ZERO
var speed = 300

func _physics_process(delta):
	if Global.player_using_lift:
		$Lift.position.y = player.position.y+260

func _on_Area2D_body_entered(body):
	$UI/Lift_Prompt.show()
	Global.player_on_lift = true
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	$UI/Lift_Prompt.hide()
	Global.player_on_lift = false
	pass # Replace with function body.
