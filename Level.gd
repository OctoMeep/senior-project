extends Node

func _ready():
	$WaveTest.player = $Player
	$WaveTest.start()
