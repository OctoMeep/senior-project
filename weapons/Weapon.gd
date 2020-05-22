extends Node2D

export (PackedScene) var Bullet
export var bullet_speed = 1000
export var bullet_damage = 1

func _physics_process(delta):
	look_at(get_global_mouse_position())
	$AnimatedSprite.flip_v = rotation > PI / 2 and rotation < 3 * PI / 2
	if Input.is_action_pressed("shoot") and $ShootTimer.is_stopped():
		$ShootTimer.start()
		shoot()

func shoot():
	print("bruh")
