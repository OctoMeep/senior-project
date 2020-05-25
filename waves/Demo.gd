extends "res://waves/Wave.gd"

func _ready():
	needed = 3
	spawn("Dasher", Vector2(100, 100), true)
	spawn("Gunner", Vector2(200, 100), true)
	spawn("Sniper", Vector2(300, 100), true)
