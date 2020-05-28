extends Area2D

signal level_done

export var next_level := ""
export var is_exit := false
var active := false

func activate():
	if next_level != "" or is_exit:
		active = true

func _on_Area2D_body_entered(body):
	if active:
		if is_exit:
			get_tree().change_scene("res://ui/VictoryScreen.tscn")
		else:
			emit_signal("level_done", next_level)
