extends Button

var level : GameLevelScript = null

func _ready():
	level = get_node("/root/Level")

func _process(delta):
	match level.current_state:
		level.LevelState.PAUSED:
			text = "Continuar"
		level.LevelState.STARTING:
			text = "Iniciar"
		level.LevelState.ENDED:
			text = "Novo jogo"
