extends Node2D

func _ready():
	$Sound.play()

func _on_Sound_finished():
	queue_free()
