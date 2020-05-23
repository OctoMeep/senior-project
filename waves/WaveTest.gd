extends "res://waves/Wave.gd"

func start():
	spawn("PickupWeapon", Vector2(500, 500)).set_weapon_type("Shotgun")
	yield(get_tree().create_timer(20.0), "timeout")
	spawn("Dasher", Vector2(100, 100))
	yield(get_tree().create_timer(1.0), "timeout")
	spawn("Gunner", Vector2(1000, 1000))
