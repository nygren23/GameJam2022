extends KinematicBody2D

var speed = 300
var screen_size = Vector2(1024,600)

var velocity = Vector2.ZERO
var bulletPath = preload('res://Bullet.tscn')

onready var _animation_player = $AnimationPlayer
onready var _sprite = $Position2D/Sprite
onready var _pos_2d = $Position2D

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		if !Global.player_using_lift:
			velocity.x += 50
			_animation_player.play("Walking")
			_pos_2d.scale.x = 1
	elif Input.is_action_pressed("move_left"):
		if !Global.player_using_lift:
			velocity.x -= 50
			_animation_player.play("Walking")
			_pos_2d.scale.x = -1
	elif Input.is_action_pressed("move_down"):
		if Global.player_using_lift:
			velocity.y += 50
	elif Input.is_action_pressed("move_up"):
		if Global.player_using_lift:
			velocity.y -= 50
	else:
		_sprite.set_frame(0)
		_animation_player.stop()
	if Input.is_action_just_pressed("spacebar"):
		shoot()
	if Input.is_action_just_pressed("interact") && Global.player_on_lift:
		Global.player_using_lift = !Global.player_using_lift
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

