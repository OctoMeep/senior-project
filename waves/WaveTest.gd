extends "res://waves/Wave.gd"

func start():
	spawn("Box", Vector2(500, 500))
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Dasher", Vector2(100, 100))
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Sniper", Vector2(1000, 900))
