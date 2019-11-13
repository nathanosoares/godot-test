extends ProgressBar

func _ready():
	pass


func _on_Control_loading_game_level_progress_update(progress):
	set_value(progress * 100)
	pass # Replace with function body.
