extends "res://waves/Wave.gd"

func _ready():
	needed = 1
	yield(get_tree().create_timer(1.0), "timeout")
	message("Thank God my shift is finally over. I can't wait to get home and-\n(WASD to move.)", 5)
	yield(get_tree().create_timer(5.0), "timeout")
	var enemy = spawn("Dasher", Vector2(screen_size.x / 2, screen_size.y / 4), true)
	enemy.add_drops([{
		"chance": 1.0,
		"drop": PickupHealth.instance()
	}])
	enemy.get_node("StartTimer").wait_time = 5.0
	message("What's this robot doing here? The warehouse is closed, these guys shouldn't be up and about!", 5)
	yield(get_tree().create_timer(5.0), "timeout")
	message("Woah!\n(LEFT CLICK to use your tazer.)", 3)
