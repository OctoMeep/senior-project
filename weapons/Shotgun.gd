extends "res://weapons/Weapon.gd"

func shoot():
	for i in 5:
		var bullet = Bullet.instance()
		get_tree().get_current_scene().add_child(bullet)
		bullet.position = $StartPoint.global_position
		bullet.rotation = rotation + rand_range(-PI / 8, PI / 8)
		bullet.speed = rand_range(600, 800)
		bullet.target = "enemy"
		bullet.damage = 1
		bullet.set_lifetime(0.2)
		
