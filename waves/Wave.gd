extends Node2D

signal done
signal messaged

const PickupHealth = preload("res://pickups/PickupHealth.tscn")

var player: KinematicBody2D
var kills := 0
var needed: int
var level: Node

var screen_size: Vector2

func _ready():
	 screen_size = get_viewport_rect().size # Makes it more convenient to spawn enemies at the center of the screen etc

var entity_types = {
	"Dasher": preload("res://enemies/Dasher.tscn"),
	"Gunner": preload("res://enemies/Gunner.tscn"),
	"Sniper": preload("res://enemies/Sniper.tscn"),
	"Crate": preload("res://enemies/Crate.tscn"),
	"PickupHealth": preload("res://pickups/PickupHealth.tscn"),
	"PickupWeapon": preload("res://pickups/PickupWeapon.tscn")
}

func spawn(type, pos, count):
	var entity = entity_types[type].instance()
	entity.global_position = pos
	if "player" in entity: # = If this is an enemy (needs to target the player)
		entity.player = player
	if "level" in entity: # = If this is an enemy (needs a level to attach drops to)
		entity.level = level
	if count:
		entity.connect("killed", self, "update_kills")
	add_child(entity)
	return entity

func message(text, duration):
	emit_signal("messaged", text, duration)

func update_kills():
	kills += 1
	if kills == needed:
		finalize()
		emit_signal("done")
		
func get_standard_drops(): # This is returned by a function and not stored as a constant to pass by value instead of reference
	return [{ # The most commonly used drops, included here for convenience
		"chance": 0.2,
		"drop": PickupHealth.instance()
	}]

func finalize(): # Can be used to show a message etc after the wave is cleared
	pass
