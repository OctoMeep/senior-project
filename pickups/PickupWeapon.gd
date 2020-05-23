extends "res://pickups/Pickup.gd"

var weapon_type = "Rifle"

func set_weapon_type(type):
	weapon_type = type
	$AnimatedSprite.play(weapon_type)

func apply_on_interact(player):
	print(player)
	var old_type = player.main_weapon
	player.main_weapon = weapon_type
	player.update_weapon()
	weapon_type = old_type
