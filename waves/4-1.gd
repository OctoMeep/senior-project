extends "res://waves/Wave.gd"

func _ready():
	needed = 6
	yield(get_tree().create_timer(1.0, false), "timeout")
	spawn("Dasher", Vector2(232, 24), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(246, 40), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(232, 56), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(246, 72), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(232, 88), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(246, 104), true).add_drops(get_standard_drops())
