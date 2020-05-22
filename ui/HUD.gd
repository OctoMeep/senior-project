extends MarginContainer

func init(player):
	$HBoxContainer/TextureProgress.max_value = player.max_health
	$HBoxContainer/TextureProgress.value = player.health
	player.connect("health_update", self, "update_health")

func update_health(health):
	print(health)
	$HBoxContainer/TextureProgress.value = health
