extends KinematicBody2D

var speed = 400
var screen_size = Vector2(1024,600)

var velocity = Vector2.ZERO
var bulletPath = preload('res://Bullet.tscn')


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("spacebar"):
		shoot()
	velocity = velocity.normalized() * speed

#shoots a bullet where ever the mouse is.
func shoot():
	$gunsound.play()
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	bullet.position = $Position2D.global_position

func _physics_process(delta):
	if(Global.youLose):
		queue_free()
		get_tree().change_scene("res://EndScene.tscn")
	get_input()
	velocity = move_and_slide(velocity)

