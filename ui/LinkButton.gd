extends MarginContainer

export var link: String

func _on_TextureButton_pressed():
	OS.shell_open(link)
