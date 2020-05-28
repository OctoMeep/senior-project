extends ColorRect

signal resumed

func _on_ResumeButton_pressed():
	emit_signal("resumed")
