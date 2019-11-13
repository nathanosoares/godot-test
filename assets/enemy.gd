extends Area

var last_translation

func _ready():
	last_translation = translation

func _physics_process(delta):	
	if last_translation.x - translation.x != 0:
		$enemyMash.rotate_z(-lerp(translation.x - last_translation.x, 0, .1))
	if last_translation.z - translation.z != 0:
		$enemyMash.rotate_x(lerp(translation.z - last_translation.z, 0, .1))
	
	last_translation = translation
	
func body_entered(body: Node):
	print("body_entered")