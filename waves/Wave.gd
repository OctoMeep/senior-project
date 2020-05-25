extends Node

signal done

var player
var kills = 0
var needed
var level

var entity_types = {
	"Dasher": preload("res://enemies/Dasher.tscn"),
	"Gunner": preload("res://enemies/Gunner.tscn"),
	"Sniper": preload("res://enemies/Sniper.tscn"),
	"PickupHealth": preload("res://pickups/PickupHealth.tscn"),
	"PickupWeapon": preload("res://pickups/PickupWeapon.tscn")
}

func spawn(type, pos, count):
	var entity = entity_types[type].instance()
	entity.global_position = pos
	if "player" in entity:
		entity.player = player
	if count:
		entity.connect("killed", self, "update_kills")
	add_child(entity)
	return entity

func update_kills():
	print("updating")
	kills += 1
	if kills == needed:
		emit_signal("done")
