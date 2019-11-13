extends Node

class_name EntityLibrary

const types = {
	enemy = {
		scene = preload("res://scripts/entities/enemy/enemy.tscn") 
	},
	pig = {
		scene = preload("res://scripts/entities/pig/Pig.tscn") 
	}
}

func spawn(type) -> Entity:	
	var area = type.scene.instance()
	var entity =  Entity.new(area)
	print("pre %s" % area.name)
	add_child(area)
	print("pos %s" % area.name)
	return entity