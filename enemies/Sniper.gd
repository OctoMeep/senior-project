extends "res://enemies/Enemy.gd"

var Laser = preload("res://weapons/Laser.tscn")

enum State {CHASING, CHARGING, SHOOTING}
var state = State.CHARGING
var chasing_speed = 300
var velocity
var target_pos

func _ready():
	$ChargeTimer.start()
	target_pos = Vector2(player.position.x, player.position.y)
	shoot("none", $ChargeTimer.time_left)

func _physics_process(delta):
	match state:
#		State.CHASING:
#			if position.distance_to(player.position) < 600:
#				state = State.SHOOTING
#			else:
#				velocity = position.direction_to(player.position).normalized() * chasing_speed
#				move_and_slide(velocity)
		State.CHARGING:
			if $ChargeTimer.is_stopped():
				$ShootTimer.start()
				shoot("player", 1.0)
				state = State.SHOOTING
		State.SHOOTING:
#			if position.distance_to(player.position) >= 600:
#				state = State.CHASING
			if $ShootTimer.is_stopped():
				$ChargeTimer.start()
				target_pos = Vector2(player.position.x, player.position.y)
				shoot("none", $ChargeTimer.time_left)
				state = State.CHARGING
	do_contact_damage()

func shoot(target, lifetime):
	$RayCast2D.rotation = PI / 2 + position.angle_to_point(target_pos)
	$RayCast2D.force_raycast_update()
	var end = $RayCast2D.get_collision_point()
	print(end)
	print($RayCast2D.get_collider())
	var laser = Laser.instance()
	laser.length = global_position.distance_to(end)
	laser.position = position
	laser.rotation = PI + position.angle_to_point(target_pos)
	laser.set_target(target)
	laser.damage = 2
	get_tree().get_current_scene().add_child(laser)

