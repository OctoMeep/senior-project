extends ColorRect

signal resumed

func _on_ResumeButton_pressed(): # Included in this script instead of the button's to avoid having to pass the signal through multiple nodes
	emit_signal("resumed")
