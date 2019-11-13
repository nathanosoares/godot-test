extends Control

signal loading_game_level_progress_update

var state : GameState = null

var current_scene
var queue
var loading_game_level = false
var game_level_is_ready = false

func set_new_scene(scene_resource):
	current_scene = scene_resource.instance()
	get_node("/root").add_child(current_scene)

func _ready():
	queue = preload("res://scripts/resource_queue.gd").new()
	queue.start()

func _process(delta):
	if !game_level_is_ready and loading_game_level:
		if queue.is_ready("res://scenes/game_level/GameLevelScene.tscn"):
			game_level_is_ready = true
			emit_signal("loading_game_level_progress_update", 1)
			set_new_scene(queue.get_resource("res://scenes/game_level/GameLevelScene.tscn"))
			hide()
		else:
			var progress = queue.get_progress("res://scenes/game_level/GameLevelScene.tscn")
			emit_signal("loading_game_level_progress_update", progress)

func _on_StartButton_pressed():
	if !loading_game_level:
		loading_game_level = true
		queue.queue_resource("res://scenes/game_level/GameLevelScene.tscn", true)
"""
	if state.current_state == state.LevelState.STARTING:
		get_tree().change_scene("res://scenes/game_level/GameLevelScene.tscn")
		return

	match state.current_state:
		state.LevelState.ENDED:
			#TODO resetar jogo
			pass

	get_tree().paused = false
	state.current_state = state.LevelState.PLAYING
"""
