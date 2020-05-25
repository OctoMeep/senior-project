extends "res://waves/Wave.gd"

var Drops = preload("res://drops/Drops.tscn")
var PickupHealth = preload("res://pickups/PickupHealth.tscn")

func _ready():
	needed = 1
	yield(get_tree().create_timer(5.0), "timeout")
	var drops = Drops.instance()
	drops.table = [{
		"chance": 1.0,
		"drop": PickupHealth.instance()
	}]
	drops.level = level
	spawn("Dasher", Vector2(100, 100), true).add_drops(drops)
