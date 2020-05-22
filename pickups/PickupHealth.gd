extends "res://pickups/Pickup.gd"

func apply(player):
	player.heal(5)
	queue_free()
