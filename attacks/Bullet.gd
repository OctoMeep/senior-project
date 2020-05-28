extends KinematicBody2D

var speed: float
var target: String
var damage: float
var play_sound := true

# Called when the node enters the scene tree for the first time.
func _ready():
	if play_sound:
		$Sound.play()

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
