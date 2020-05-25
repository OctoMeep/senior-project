extends "res://weapons/Weapon.gd"

var Instant = preload("res://attacks/Instant.tscn")

func shoot():
	var attack = Instant.instance()
	add_child(attack)
	attack.position = $StartPoint.position
	attack.set_target("enemy")
	attack.set_lifetime(0.2)
	attack.damage = 3
