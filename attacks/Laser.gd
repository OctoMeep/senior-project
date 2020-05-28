extends Area2D

var target: String
var damage: float
var lifetime := 1.0
var length: float
var count: int
var next: Area2D
var done := false

func _ready():
	if count == null: # First in the chain
		$Sound.play()
		get_tree().create_timer(lifetime).connect("timeout", self, "queue_free")
		count = ceil(length / 5)
	if count != 0:
		next = duplicate(7)
		next.position = $NextPoint.position
		next.rotation = 0
		next.damage = damage
		next.count = count - 1
		next.set_target(target)
		add_child(next)

func _physics_process(delta):
	if not done:
		for body in get_overlapping_bodies():
			if body.is_in_group(target):
				body.hit(damage)
	done = true

func set_target(t):
	target = t
	$AnimatedSprite.play(target)
