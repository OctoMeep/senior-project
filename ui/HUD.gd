extends MarginContainer

func init(player):
	$VBoxContainer/HBoxContainer/MarginContainer/TextureProgress.max_value = player.max_health
	$VBoxContainer/HBoxContainer/MarginContainer/TextureProgress.value = player.health
	player.connect("health_update", self, "update_health")

func update_health(health):
	print(health)
	$VBoxContainer/HBoxContainer/MarginContainer/TextureProgress.value = health

func message(text, duration):
	print(text)
	$VBoxContainer/MarginContainer/MessageLabel.text = text
	$VBoxContainer/MarginContainer/MessageLabel.show()
	yield(get_tree().create_timer(duration, false), "timeout")
	print($VBoxContainer/MarginContainer/MessageLabel.text)
	$VBoxContainer/MarginContainer/MessageLabel.hide()
