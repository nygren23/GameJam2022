extends RoomChunk

func _ready():
	add_child(load("res://UI.tscn").instance())
	add_child(load("res://Player.tscn").instance())

func _on_TransitionRight_body_entered(body):
	var currentPosition = getCurPos()
	if currentPosition[1]+1 < GlobalStats.getDimensions()-1:
		decideNextRoom(currentPosition[0], currentPosition[1]+1)
	else:
		print("At the edge of the map")

func _on_TransitionLeft_body_entered(body):
	get_tree().change_scene("res://VerticalRoom.tscn")

