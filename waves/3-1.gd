extends "res://waves/Wave.gd"

func _ready():
	needed = 4
	message("(You can only carry two weapons at once. Picking up a weapon swaps it for the one you are holding. Choose wisely which weapons you take)", 10)
	yield(get_tree().create_timer(10.0), "timeout")
	spawn("Dasher", Vector2(48, 112), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(64, 224), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(256, 128), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(384, 56), true).add_drops(get_standard_drops())
