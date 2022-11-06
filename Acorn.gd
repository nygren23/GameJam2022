extends RigidBody2D

onready var player = get_node("/root/Main/Player")
onready var main = get_node("/root/Main")

func _process(delta):
	#if the game or round ends then the acorns despawn
	pass






func _on_Area2D_body_entered(body):
	Global.objectiveGet = true
	queue_free()
