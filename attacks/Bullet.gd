extends KinematicBody2D

var speed
var target
var damage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var collision = move_and_collide(Vector2.RIGHT.rotated(rotation) * speed * delta)
	if collision != null:
		if collision.collider.is_in_group(target):
			collision.collider.hit(damage)
		queue_free()

func set_target(t):
	target = t
	$AnimatedSprite.play(target)

func set_lifetime(lifetime):
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()


func _on_LifeTimer_timeout():
	queue_free()
