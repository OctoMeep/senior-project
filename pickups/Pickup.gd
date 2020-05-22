extends Area2D

func _on_Area2D_body_entered(body):
	var player = body.get_parent()
	if player.is_in_group("player"):
		apply(player)

func apply(player):
	print("Collected!")
