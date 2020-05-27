extends "res://weapons/Weapon.gd"

var Bullet = preload("res://attacks/Bullet.tscn")

func shoot():
	for i in 5:
		var bullet = Bullet.instance()
		get_tree().get_current_scene().add_child(bullet)
		bullet.position = $StartPoint.global_position
		bullet.rotation = rotation + rand_range(-PI / 8, PI / 8)
		bullet.speed = rand_range(150, 200)
		bullet.set_target("enemy")
		bullet.damage = 1
		bullet.set_lifetime(0.2)
		bullet.add_collision_exception_with(self.get_parent())
		
