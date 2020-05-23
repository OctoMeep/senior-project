extends Area2D

var player

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		apply_on_contact(body)

func _input(event):
	if event.is_action_pressed("interact") and overlaps_body(player):
		apply_on_interact(player)

func apply_on_contact(player):
	pass

func apply_on_interact(player):
	pass
