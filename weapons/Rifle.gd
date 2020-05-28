extends "res://weapons/Weapon.gd"

const Bullet = preload("res://attacks/Bullet.tscn")

func shoot():
	var bullet = Bullet.instance()
	get_tree().get_current_scene().add_child(bullet)
	bullet.position = $StartPoint.global_position
	bullet.rotation = rotation + rand_range(-PI / 24, PI / 24) # Slight spread
	bullet.speed = 250
	bullet.set_target("enemy")
	bullet.damage = 2
	bullet.add_collision_exception_with(self.get_parent())
