extends "res://weapons/Weapon.gd"

var Bullet = preload("res://attacks/Bullet.tscn")

func shoot():
	var bullet = Bullet.instance()
	get_tree().get_current_scene().add_child(bullet)
	bullet.position = $StartPoint.global_position
	bullet.rotation = rotation
	bullet.speed = 250
	bullet.set_target("enemy")
	bullet.damage = 2
	
