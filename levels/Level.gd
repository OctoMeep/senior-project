extends Node

signal done
signal messaged

export var waves = []

var wave_num := 0
var wave: Node2D
var player: KinematicBody2D

func _ready():
	for node in get_children():
		if node.has_method("activate"): # = If this is a door
			node.connect("level_done", get_parent(), "load_level")
	run_wave()

func run_wave():
	if wave != null:
		remove_child(wave)
	wave = waves[wave_num].instance()
	wave.level = self
	wave.player = player
	wave.connect("done", self, "next_wave")
	wave.connect("messaged", self, "message")
	add_child(wave)
	
func next_wave():
	if wave_num == waves.size() - 1:
		finish()
	else:
		wave_num += 1
		run_wave()

func finish():
	print("finished")
	for node in get_children():
		if node.has_method("activate"): # = If this is a door
			node.activate()

func message(text, duration):
	emit_signal("messaged", text, duration)
