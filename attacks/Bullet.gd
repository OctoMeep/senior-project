extends Area2D

var speed
var target
var damage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group(target):
		body.hit(damage)
		queue_free()
	elif body.is_in_group("wall"):
		queue_free()

func set_target(t):
	target = t
	$AnimatedSprite.play(target)

func set_lifetime(lifetime):
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()


func _on_LifeTimer_timeout():
	queue_free()
