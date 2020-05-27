extends Node2D

export var levels = {}
export var first_level = ""

func _ready():
	$CanvasLayer/HUD.init($Player)
	load_level(first_level)

func load_level(level):
	call_deferred("load_level_actually", level)
	
func load_level_actually(level):
	print($Player)
	if has_node("Level"):
		$Level.queue_free()
	var new_level = levels[level].instance()
	new_level.player = $Player
	new_level.connect("done", self, "load_level")
	new_level.connect("messaged", $CanvasLayer/HUD, "message")
	add_child_below_node($Player, new_level)
	print(get_children())
	$Player.position = $Level/StartPoint.position
	
