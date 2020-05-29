extends Node2D

var level = Node

func _physics_process(delta):
	look_at(get_global_mouse_position())
	# rotation increases/decreases continuously if the weapon spins in circles so we need to do all this to lock it to a range of [0, 2 PI]
	var rot = fmod(rotation, 2 * PI) 
	if rot < 0:
		rot += 2 * PI
	$AnimatedSprite.flip_v = rot > PI / 2 and rot < 3 * PI / 2
	if Input.is_action_pressed("shoot") and $ShootTimer.is_stopped():
		$ShootTimer.start()
		shoot()

func shoot():
	print("bruh")
