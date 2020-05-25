extends Node

signal done

export var waves = []

var wave_num = 0
var wave
var player

func _ready():
	print(player)
	run_wave()

func run_wave():
	if wave != null:
		remove_child(wave)
	wave = waves[wave_num].instance()
	wave.level = self
	wave.player = player
	add_child(wave)
	wave.connect("done", self, "next_wave")

func next_wave():
	if wave_num == waves.size() - 1:
		finish()
	else:
		wave_num += 1
		run_wave()

func finish():
	for node in get_children():
		if "active" in node:
			node.active = true

func leave(next_level):
	print(next_level)
	emit_signal("done", next_level)
