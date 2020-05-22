extends Node

func _ready():
	$HUD.init($Player)
	$WaveTest.player = $Player
	$WaveTest.start()
