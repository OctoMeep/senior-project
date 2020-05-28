extends "res://waves/Wave.gd"

const PickupWeapon = preload("res://pickups/PickupWeapon.tscn")

func _ready():
	needed = 1
	var enemy = spawn("Crate", Vector2(48, 40), true)
	var pickup = PickupWeapon.instance()
	pickup.set_weapon_type("Shotgun")
	enemy.add_drops([{
		"chance": 1.0,
		"drop": pickup
	}])
