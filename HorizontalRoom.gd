extends RoomChunk

export var currentPosition = [0,0] #GlobalStats.getCurPos()

func _ready():
	add_child(load("res://UI.tscn").instance())
	add_child(load("res://Player.tscn").instance())
	$UI/Label.text = "Current Room: [" +  str(currentPosition[0]) + ", " + str(currentPosition[1]) + "]"
	
func _on_TransitionRight_body_entered(body):
	if currentPosition[1]+1 < globalstats.getDimensions():
		decideNextRoom([currentPosition[0], currentPosition[1]+1])
	else:
		print("At the edge of the map")
		
	get_tree().change_scene("res://HorizontalRoom.tscn")

func _on_TransitionLeft_body_entered(body):
	get_tree().change_scene("res://VerticalRoom.tscn")

