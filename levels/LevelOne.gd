extends "res://levels/Level.gd"

func _ready():
	waves = [
		preload("res://waves/Intro.tscn"),
		preload("res://waves/Dashers.tscn")
	]
	run_wave()
