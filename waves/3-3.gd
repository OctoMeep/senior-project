extends "res://waves/Wave.gd"

var PickupWeapon = preload("res://pickups/PickupWeapon.tscn")

func _ready():
	needed = 4
	yield(get_tree().create_timer(1.0), "timeout")
	var pickup = PickupWeapon.instance()
	pickup.weapon_type = "SniperRifle"
	spawn("Sniper", Vector2(screen_size.x / 2, screen_size / 2), true).add_drops([{
		"chance": 1.0,
		"drop": pickup
	}])
	spawn("Dasher", Vector2(48, 32), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(80, 216), true).add_drops(get_standard_drops())
	spawn("Dasher", Vector2(384, 64), true).add_drops(get_standard_drops())
