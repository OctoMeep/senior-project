extends Button

func _on_ExitButton_pressed():
	if OS.window_fullscreen:
		OS.window_fullscreen = false
	get_tree().quit(0)
