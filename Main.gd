extends Node2D

export var levels = {}
export var first_level = ""

func _ready():
	load_level(first_level)

func load_level(level):
	print($Player)
	if has_node("Level"):
		$Level.queue_free()
	var new_level = levels[level].instance()
	new_level.player = $Player
	add_child(new_level)
	$Player.position = $Level/StartPoint.position
	$Level.connect("done", self, "load_level")
	
