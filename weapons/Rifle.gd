extends "res://weapons/Weapon.gd"

func shoot():
	var bullet = Bullet.instance()
	get_tree().get_current_scene().add_child(bullet)
	bullet.position = $StartPoint.global_position
	bullet.rotation = rotation
	bullet.speed = bullet_speed
	bullet.set_target("enemy")
	bullet.damage = bullet_damage
	
