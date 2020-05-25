extends KinematicBody2D

signal killed

var max_health = 10
var health = 10
var contact_dmg = 1
var player
var drops

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	do_contact_damage()

func do_contact_damage():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.is_in_group("player")):
			collision.collider.hit(contact_dmg)

func add_drops(d):
	drops = d
	add_child(drops)

func hit(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	emit_signal("killed")
	if drops != null:
		drops.drop()
	queue_free()
