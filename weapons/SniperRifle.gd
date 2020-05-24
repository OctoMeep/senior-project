extends "res://weapons/Weapon.gd"

var Laser = preload("res://weapons/Laser.tscn")

func shoot():
	var end = $RayCast2D.get_collision_point()
	var laser = Laser.instance()
	laser.lifetime = 0.3
	laser.length = $StartPoint.global_position.distance_to(end)
	laser.position = $StartPoint.global_position
	laser.rotation = rotation
	laser.set_target("enemy")
	laser.damage = 3
	get_tree().get_current_scene().add_child(laser)
