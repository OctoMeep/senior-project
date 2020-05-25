extends Area2D

signal level_done

export var next_level = ""
var active = false

func _on_Area2D_body_entered(body):
	if active:
		emit_signal("level_done", next_level)
