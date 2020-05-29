extends "res://enemies/Enemy.gd"

enum State {CHASING, DASHING}
var state = State.CHASING
var chasing_speed := 75
var velocity: Vector2

func _ready():
	max_health = 5
	health = 5
	contact_dmg = 3

func move_and_attack(delta):
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
				velocity *= 0.96 # Slow down each frame
				if (velocity.length() < 25): # Stop when very slow 
					$AnimatedSprite.play("walking")
					state = State.CHASING
				move_and_slide(velocity)
	$AnimatedSprite.flip_h = velocity.x < 0 # Turn in movement direction
