extends "res://pickups/Pickup.gd"

var weapon_type := "Rifle"

func _ready():
	$AnimatedSprite.play(weapon_type)

func set_weapon_type(type):
	weapon_type = type
	$AnimatedSprite.play(weapon_type)

func apply_on_interact(player):
	if player.off_weapon == null or player.off_weapon == "": # The player only has one weapon
		player.off_weapon = player.main_weapon
		player.main_weapon = weapon_type
		player.update_weapon()
		queue_free()
	else: # The player has two weapons
		var old_type = player.main_weapon
		player.main_weapon = weapon_type
		player.update_weapon()
		set_weapon_type(old_type) # The replaced weapon is now held by the pickup
