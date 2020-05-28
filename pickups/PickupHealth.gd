extends "res://pickups/Pickup.gd"

func apply_on_contact(player):
	$Sound.play()
	player.heal(5)
	queue_free()
