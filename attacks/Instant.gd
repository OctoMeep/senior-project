extends Area2D

var target: String
var damage: float
var done := false

func _physics_process(delta):
	if not done:
		for body in get_overlapping_bodies():
			if body.is_in_group(target):
				body.hit(damage)
				done = true

func set_target(t):
	target = t
	$AnimatedSprite.play(target)

func set_lifetime(lifetime):
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()


func _on_LifeTimer_timeout():
	queue_free()
