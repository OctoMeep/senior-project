extends "res://waves/Wave.gd"

func _ready():
	needed = 5
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Dasher", Vector2(64, 64), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(448, 128), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(screen_size.x / 2, screen_size.y / 2), true).add_drops(get_standard_drops())
	spawn("Gunner", Vector2(192, 224), true).add_drops(get_standard_drops())
	spawn("Gunner", Vector2(272, 48), true).add_drops(get_standard_drops())
