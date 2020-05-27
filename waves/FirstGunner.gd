extends "res://waves/Wave.gd"

var PickupWeapon = preload("res://pickups/PickupWeapon.tscn")

func _ready():
	needed = 1
	yield(get_tree().create_timer(1.0), "timeout")
	var enemy = spawn("Gunner", Vector2(screen_size.x / 2, screen_size.y / 4), true)
	var pickup = PickupWeapon.instance()
	pickup.weapon_type = "Rifle"
	enemy.get_node("ShootTimer").wait_time = 1.0
	enemy.bullet_speed = 150
	enemy.add_drops([{
		"chance": 1.0,
		"drop": pickup
	}])
