extends "res://waves/Wave.gd"


func _ready():
	needed = 2
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Dasher", Vector2(50, 100), true)
	spawn("Dasher", Vector2(150, 100), true)
