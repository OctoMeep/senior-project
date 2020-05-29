extends "res://weapons/Weapon.gd"

const Bullet = preload("res://attacks/Bullet.tscn")

func shoot():
	for i in 5:
		var bullet = Bullet.instance()
		bullet.play_sound = false # Playing 5 bullet sounds at once is too loud
		print(level)
		level.add_child(bullet)
		bullet.position = $StartPoint.global_position
		bullet.rotation = rotation + rand_range(-PI / 8, PI / 8) # Large spread
		bullet.speed = rand_range(200, 250)
		bullet.set_target("enemy")
		bullet.damage = 1
		bullet.set_lifetime(0.2)
		bullet.add_collision_exception_with(self.get_parent())
		$Sound.play()
		
