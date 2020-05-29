extends "res://weapons/Weapon.gd"

const Instant = preload("res://attacks/Instant.tscn")

func shoot():
	var attack = Instant.instance()
	add_child(attack)
	attack.position = $StartPoint.position
	attack.set_target("enemy")
	attack.set_lifetime(0.25)
	attack.damage = 2
