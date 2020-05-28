extends KinematicBody2D

signal killed

const Drops = preload("res://drops/Drops.tscn")
const Explosion = preload("res://enemies/Explosion.tscn")

var max_health := 10
var health := 10
var contact_dmg := 1
var player: KinematicBody2D
var drops: Node2D
var level: Node
var dead: bool

func _physics_process(delta):
	if not $StartTimer.is_stopped(): # Create a brief delay before an enemy starts moving so the player does not get instantly shot by a new enemy
		return
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
	$HitSound.play()
	if health <= 0 and not dead:
		dead = true # This prevents kills from being counted twice if an enemy takes damage from multiple sources at once
		die()

func die():
	get_tree().get_current_scene().add_child(Explosion.instance()) # Death effect must be in a separate node as this one is destroyed immediately when killed
	emit_signal("killed")
	if drops != null:
		drops.drop()
	queue_free()
