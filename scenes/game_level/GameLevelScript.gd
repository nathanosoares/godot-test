extends Spatial

class_name GameLevelScript

func _ready():
	var entity = get_node("/root/EntityLibrary").spawn(EntityLibrary.types.pig)
	entity.teleport(Vector3(0, 2, 0))
	
	

func _process(delta):
	#if Input.is_action_pressed("ui_cancel"):
	#	if current_state == LevelState.PLAYING:
	#		get_tree().paused = true
	#		current_state = LevelState.PAUSED
	pass
