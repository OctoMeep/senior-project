extends "res://waves/Wave.gd"

func _ready():
	needed = 6
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Sniper", Vector2(screen_size.x / 4, screen_size.y / 2), true).add_drops(get_standard_drops())
	spawn("Sniper", Vector2(screen_size.x * 3 / 4, screen_size.y / 2), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(200, 24), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(280, 248), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(184, screen_size.y / 2), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(296, screen_size.y / 2), true).add_drops(get_standard_drops())
