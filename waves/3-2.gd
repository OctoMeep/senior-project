extends "res://waves/Wave.gd"

func _ready():
	needed = 6
	yield(get_tree().create_timer(1.0, false), "timeout")
	spawn("Gunner", Vector2(48, 32), true).add_drops(get_standard_drops())
	spawn("Gunner", Vector2(256, 64), true).add_drops(get_standard_drops())
	spawn("Gunner", Vector2(416, 224), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(40, 216), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(80, 216), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(384, 64), true).add_drops(get_standard_drops())
