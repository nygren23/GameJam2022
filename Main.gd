extends RoomChunk


var timer
export (PackedScene) var objective_scene

var currentPosition = [0,0]

func _ready():
	$UI/Position.text = "Current Room: " +  str(Global.curPos)
	

func _on_Area2D_body_entered(body):
	
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
	
	"""
	if Global.metadata[Global.curPos[0]][ Global.curPos[1]][1]:
		var objective = objective_scene.instance()
		get_parent().add_child(objective)
		objective.position = $ObjectSpawn.global_position
	"""
		
