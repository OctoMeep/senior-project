extends "res://waves/Wave.gd"

func _ready():
	needed = 2
	yield(get_tree().create_timer(1.0, false), "timeout")
	spawn("Dasher", Vector2(screen_size.x / 4, screen_size.y / 2), true)
	spawn("Dasher", Vector2(screen_size.x * 3 / 4, screen_size.y / 2), true)
