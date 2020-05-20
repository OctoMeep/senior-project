extends Node

var player

var entity_types = {
	"Dasher": preload("res://enemies/Dasher.tscn"),
	"Gunner": preload("res://enemies/Gunner.tscn")
}

func spawn(type, pos):
	var entity = entity_types[type].instance()
	entity.global_position = pos
	entity.player = player
	add_child(entity)
