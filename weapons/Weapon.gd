extends Node2D

func _physics_process(delta):
	look_at(get_global_mouse_position())
	$AnimatedSprite.flip_v = rotation > PI / 2 and rotation < 3 * PI / 2
	if Input.is_action_pressed("shoot") and $ShootTimer.is_stopped():
		$ShootTimer.start()
		shoot()

func shoot():
	print("bruh")
