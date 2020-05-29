extends KinematicBody2D

signal health_update

export var speed: int
var screen_size: Vector2
export var max_health := 10
var health := max_health
var is_lasered = false
var level: Node

var weapon_types = {
	"Melee": preload("res://weapons/Melee.tscn"),
	"Rifle": preload("res://weapons/Rifle.tscn"),
	"Shotgun": preload("res://weapons/Shotgun.tscn"),
	"SniperRifle": preload("res://weapons/SniperRifle.tscn")
}

export (String) var main_weapon = "Melee"
export (String) var off_weapon
var weapon

func _ready():
	screen_size = get_viewport_rect().size
	weapon = weapon_types[main_weapon].instance()
	add_child(weapon)


func _physics_process(delta):
	is_lasered = false
	$AnimatedSprite.flip_h = get_global_mouse_position().x < global_position.x
	
	# Weapon switching
	
	if Input.is_action_just_pressed("switch") and off_weapon != null and off_weapon != "":
		var temp = main_weapon
		main_weapon = off_weapon
		off_weapon = temp
		update_weapon()
	
	# Movement
	
	var velocity = Vector2()
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() == 0:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("walking")
	
	move_and_slide(velocity.normalized() * speed)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# Contact damage
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.is_in_group("enemy")):
			hit(collision.collider.contact_dmg)

func update_weapon():
	weapon.queue_free()
	weapon = weapon_types[main_weapon].instance()
	add_child(weapon)
	weapon.level = level

func hit(damage):
	if damage <= 0:
		return
	if $InvulTimer.is_stopped():
		$HitSound.play()
		health -= damage
		emit_signal("health_update", health)
		if health <= 0:
			die()
		$InvulTimer.start()

func heal(amount):
	$HealSound.play()
	health = clamp(health + amount, 0, max_health)
	emit_signal("health_update", health)
	
func die():
	print("rip")
	get_tree().change_scene("res://ui/DeathScreen.tscn")
