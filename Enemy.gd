extends KinematicBody2D

var max_health = 10
var health = 10
var contact_dmg = 1

func _ready():
	pass # Replace with function body.


func _process(delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.is_in_group("player")):
			collision.collider.hit(contact_dmg)

func hit(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
