extends RoomChunk

func _ready():
	add_child(load("res://UI.tscn").instance())
	add_child(load("res://Player.tscn").instance())

func _on_TransitionUp_body_entered(body):
	get_tree().change_scene("res://Main.tscn")


func _on_TransitionDown_body_entered(body):
	get_tree().change_scene("res://HorizontalRoom.tscn")
	
