extends Node2D

export var levels := {}
export var first_level := ""

func _ready():
	$CanvasLayer/HUD.init($PlayerLayer/Player)
	load_level(first_level)

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause(): # This also handles the PauseButton's pressed event. 
	if get_tree().paused:
		get_tree().paused = false
		$CanvasLayer/PauseMenu.hide()
	else:
		get_tree().paused = true
		$CanvasLayer/PauseMenu.show()
				
func load_level(level):
	call_deferred("_deferred_load_level", level)
	
func _deferred_load_level(level):
	if has_node("Level"):
		$Level.free() # queue_free() not needed because this is already deferred
	var new_level = levels[level].instance()
	new_level.player = $PlayerLayer/Player
	new_level.connect("done", self, "load_level")
	new_level.connect("messaged", $CanvasLayer/HUD, "message")
	add_child(new_level)
	$PlayerLayer/Player.position = $Level/StartPoint.position
	$PlayerLayer/Player.level = new_level
	$PlayerLayer/Player.update_weapon()
