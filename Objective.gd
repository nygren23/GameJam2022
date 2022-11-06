extends RigidBody2D

onready var player = get_node("/root/Main/Player")
onready var main = get_node("/root/Main")

func _process(delta):
	#if the game or round ends then the acorns despawn
	#if(main.getSafe()):
	#	queue_free()
	pass

func _on_Area2D_area_entered(area):
	print("Hi mom. I here")
	Global.objectiveGet = true
	queue_free()



func _on_Area2D_body_entered(body):
	Global.objectiveGet = true
	queue_free()
