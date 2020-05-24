extends "res://waves/Wave.gd"

func start():
	spawn("Gunner", Vector2(125, 125))
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Dasher", Vector2(25, 25))
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Sniper", Vector2(200, 200))
