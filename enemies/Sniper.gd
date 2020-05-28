extends "res://enemies/Enemy.gd"

const Laser = preload("res://attacks/Laser.tscn")

enum State {CHARGING, SHOOTING}
var state = State.CHARGING
var chasing_speed := 300
var target_pos: Vector2

func _ready():
	max_health = 20
	health = 20
	$ChargeTimer.start()
	target_pos = Vector2(player.position.x, player.position.y)
	shoot("none", $ChargeTimer.time_left)

func _physics_process(delta):
	if not $StartTimer.is_stopped():
		return
	match state:
		State.CHARGING:
			if $ChargeTimer.is_stopped():
				$ShootTimer.start()
				shoot("player", 1.0)
				state = State.SHOOTING
		State.SHOOTING:
			if $ShootTimer.is_stopped():
				$ChargeTimer.start()
				target_pos = Vector2(player.position.x, player.position.y)
				shoot("none", $ChargeTimer.time_left)
				state = State.CHARGING
	$AnimatedSprite.flip_h = player.global_position.x < global_position.x # Turn towards player
	do_contact_damage()

func shoot(target, lifetime):
	$RayCast2D.rotation = PI / 2 + position.angle_to_point(target_pos)
	$RayCast2D.force_raycast_update()
	var end = $RayCast2D.get_collision_point()
	var laser = Laser.instance()
	laser.length = global_position.distance_to(end)
	laser.position = position
	laser.rotation = PI + position.angle_to_point(target_pos)
	laser.set_target(target)
	laser.damage = 1
	get_tree().get_current_scene().add_child(laser)

