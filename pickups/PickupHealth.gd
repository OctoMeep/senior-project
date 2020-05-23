extends "res://pickups/Pickup.gd"

func apply_on_contact(player):
	player.heal(5)
	queue_free()
