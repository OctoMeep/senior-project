extends Node2D

export var levels = {}
export var first_level = ""

func _ready():
	$CanvasLayer/HUD.init($Player)
	load_level(first_level)

func load_level(level):
	call_deferred("_deferred_load_level", level)
	
func _deferred_load_level(level):
	print($Player)
	if has_node("Level"):
		$Level.free()
	var new_level = levels[level].instance()
	new_level.player = $Player
	new_level.connect("done", self, "load_level")
	new_level.connect("messaged", $CanvasLayer/HUD, "message")
	add_child_below_node($Player, new_level)
	print(get_children())
	$Player.position = $Level/StartPoint.position
	
func win():
	print("GG")
