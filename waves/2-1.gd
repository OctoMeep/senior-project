extends "res://waves/Wave.gd"

func _ready():
	needed = 2
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Gunner", Vector2(64, 64), true).add_drops(get_standard_drops())
	spawn("Gunner", Vector2(448, 128), true).add_drops(get_standard_drops())
