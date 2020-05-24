extends "res://enemies/Enemy.gd"

enum State {CHASING, DASHING}
var state = State.CHASING
var chasing_speed = 75
var velocity

func _ready():
	contact_dmg = 3

func _physics_process(delta):
	match state:
		State.CHASING:
			velocity = position.direction_to(player.position).normalized() 
			if position.distance_to(player.position) < 75:
				velocity *= 225
				state = State.DASHING
				$AnimatedSprite.play("dashing")
				$ChargeTimer.start()
			else:
				velocity *= chasing_speed
				move_and_slide(velocity)
		State.DASHING:
			if $ChargeTimer.is_stopped():
				velocity *= 0.96
				if (velocity.length() < 25):
					$AnimatedSprite.play("walking")
					state = State.CHASING
				move_and_slide(velocity)
	do_contact_damage()

