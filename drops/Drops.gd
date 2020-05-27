extends Node2D

var table = []
var level

func drop():
	for entry in table:
		var roll = randf()
		if roll <= entry.chance:
			var drop = entry.drop
			level.add_child(drop)
			drop.position = Vector2(
				get_parent().global_position.x + rand_range(-10, 10),
				get_parent().global_position.y + rand_range(-10, 10)
			)
