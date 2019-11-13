extends Node

class_name Entity

var handle: Spatial

func _init(handle: Spatial):
	self.handle = handle

func teleport(position: Vector3):
	self.handle.translation = position