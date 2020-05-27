extends KinematicBody2D

signal killed

var Drops = preload("res://drops/Drops.tscn")

var max_health = 10
var health = 10
var contact_dmg = 1
var player
var drops
var level

func _ready():
	set_physics_process(false)
	yield(get_tree().create_timer(0.5), "timeout")
	set_physics_process(true)


func _physics_process(delta):
	do_contact_damage()

func do_contact_damage():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider == null:
			continue # Avoids a crash when the colliding object is destroyed during collision. Not sure why this happens despite the use of queue_free
		if (collision.collider.is_in_group("player")):
			collision.collider.hit(contact_dmg)

func add_drops(table):
	drops = Drops.instance()
	drops.table = table
	drops.level = level
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
