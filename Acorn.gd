extends RigidBody2D

onready var player = get_node("/root/Main/Player")
onready var main = get_node("/root/Main")

func _process(delta):
	#if the game or round ends then the acorns despawn
	pass

func _on_Area2D_area_entered(area):
	queue_free()
	player.acorns += 1

