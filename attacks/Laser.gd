extends Area2D

var target: String
var damage: float
var lifetime := 1.0
var length: float
var count := -1
var next: Area2D
var done := false

func _ready():
	if count == -1: # First in the chain
		print(length)
		if target != "none":
			$Sound.play()
		get_tree().create_timer(lifetime).connect("timeout", self, "queue_free") # Only the first segment needs to be manually freed as all the others are its children
		count = ceil(length / 6) # 6 is the length of a segment. It would be better to avoid hardcoding this
	if count != 0:
		next = duplicate(7)
		next.position = $NextPoint.position
		next.rotation = 0
		next.damage = damage
		next.count = count - 1
		next.set_target(target)
		add_child(next)

func _physics_process(delta):
	if not done: # Do this only on the first frame. Must be done this way because get_overlapping_bodies doesn't work in _ready
		for body in get_overlapping_bodies():
			if body.is_in_group(target) and "is_lasered" in body:
				if not body.is_lasered: # Prevent multiple segments hitting the same target
					body.hit(damage)
					body.is_lasered = true
				
	done = true

func set_target(t):
	target = t
	$AnimatedSprite.play(target)
