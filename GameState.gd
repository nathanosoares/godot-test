extends Node

class_name GameState

enum LevelState {
	STARTING, PLAYING, PAUSED, ENDED
}

var current_state = LevelState.STARTING

func _ready():
	pass
