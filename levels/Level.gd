extends Node

signal done

export var waves = []

var wave_num = 0
var wave
onready var player = $Player

func _ready():
	print(waves)
	run_wave()

func run_wave():
	if wave != null:
		remove_child(wave)
	wave = waves[wave_num].instance()
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
	emit_signal("done")
