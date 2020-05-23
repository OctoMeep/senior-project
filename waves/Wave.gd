extends Node

var player

var entity_types = {
	"Dasher": preload("res://enemies/Dasher.tscn"),
	"Gunner": preload("res://enemies/Gunner.tscn"),
	"PickupHealth": preload("res://pickups/PickupHealth.tscn"),
	"PickupWeapon": preload("res://pickups/PickupWeapon.tscn"),
	"Box": preload("res://terrain/Box.tscn")
}

func spawn(type, pos):
	var entity = entity_types[type].instance()
	entity.global_position = pos
	if "player" in entity:
		entity.player = player
	add_child(entity)
	return entity
