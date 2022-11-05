extends RoomChunk

func _ready():
	add_child(load("res://UI.tscn").instance())
	add_child(load("res://Player.tscn").instance())
	$Player.position = $CenterSpawn.global_position



func _on_TransitionLeft_body_entered(body):
	print("collided with left transition")
	get_tree().change_scene("res://HorizontalRoom.tscn")
	globalstats.setHPos(-1)

func _on_TransitionRight_body_entered(body):
	print("collided with right transition")
	get_tree().change_scene("res://HorizontalRoom.tscn")
	globalstats.setHPos(1)
	
func _on_TransitionDown_body_entered(body):
	print("collided with down transition")
	get_tree().change_scene("res://VerticalRoom.tscn")
	globalstats.setVPos(1)

func _on_TransitionUp_body_entered(body):
	print("collided with up transition")
	get_tree().change_scene("res://VerticalRoom.tscn")
	globalstats.setVPos(-1)
