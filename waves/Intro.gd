extends "res://waves/Wave.gd"


func _ready():
	needed = 1
	yield(get_tree().create_timer(5.0), "timeout")
	spawn("Dasher", Vector2(100, 100), true)
