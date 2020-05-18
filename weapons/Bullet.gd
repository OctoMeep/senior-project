extends Area2D

var speed = 800
var target = "enemy"
var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group(target):
		body.hit(damage)
		queue_free()

func set_lifetime(lifetime):
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()


func _on_LifeTimer_timeout():
	queue_free()
