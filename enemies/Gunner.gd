extends "res://enemies/Enemy.gd"

var Bullet = preload("res://attacks/Bullet.tscn")

enum State {CHASING, SHOOTING}
var state = State.CHASING
var chasing_speed = 75
var velocity

func _physics_process(delta):
	match state:
		State.CHASING:
			if position.distance_to(player.position) < 150:
				$AnimatedSprite.play("default")
				state = State.SHOOTING
			else:
				velocity = position.direction_to(player.position).normalized() * chasing_speed
				move_and_slide(velocity)
		State.SHOOTING:
			if position.distance_to(player.position) >= 150:
				$AnimatedSprite.play("walking")
				state = State.CHASING
			elif $ShootTimer.is_stopped():
				shoot()
				$ShootTimer.start()
	do_contact_damage()

func shoot():
	var bullet = Bullet.instance()
	get_tree().get_current_scene().add_child(bullet)
	bullet.position = position
	bullet.rotation = PI + position.angle_to_point(player.position)
	bullet.speed = 250
	bullet.set_target("player")
	bullet.damage = 2

