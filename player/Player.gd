extends KinematicBody2D

export var speed: int
var screen_size
export var max_health = 10
var health = max_health

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
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

func hit(damage):
	if $InvulTimer.is_stopped():
		health -= damage
		if health <= 0:
			die()
		$InvulTimer.start()
	
func die():
	get_tree().quit(0)
