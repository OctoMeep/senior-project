extends "res://waves/Wave.gd"

func _ready():
	needed = 1
	yield(get_tree().create_timer(1.0, false), "timeout")
	spawn("Sniper", Vector2(screen_size.x / 2, screen_size.y / 2), true).add_drops([{
		"chance": 1.0,
		"drop": PickupHealth.instance()
	}])
