extends KinematicBody2D

signal health_update

export var speed: int
var screen_size
export var max_health = 10
var health = max_health

var weapon_types = {
	"Rifle": preload("res://weapons/Rifle.tscn"),
	"Shotgun": preload("res://weapons/Shotgun.tscn"),
	"SniperRifle": preload("res://weapons/SniperRifle.tscn")
}

var main_weapon = "Rifle"
var off_weapon = "SniperRifle"
var weapon

func _ready():
	screen_size = get_viewport_rect().size
	weapon = weapon_types[main_weapon].instance()
	add_child(weapon)


func _physics_process(delta):
	if Input.is_action_just_pressed("switch") and off_weapon != null:
		var temp = main_weapon
		main_weapon = off_weapon
		off_weapon = temp
		update_weapon()
	
	var velocity = Vector2()
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	move_and_slide(velocity.normalized() * speed)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.is_in_group("enemy")):
			hit(collision.collider.contact_dmg)

func update_weapon():
	weapon.queue_free()
	weapon = weapon_types[main_weapon].instance()
	add_child(weapon)

func hit(damage):
	if $InvulTimer.is_stopped():
		health -= damage
		emit_signal("health_update", health)
		if health <= 0:
			die()
		$InvulTimer.start()

func heal(amount):
	health = clamp(health + amount, 0, max_health)
	emit_signal("health_update", health)
	
func die():
	get_tree().quit(0)
