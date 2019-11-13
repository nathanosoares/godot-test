extends KinematicBody

const DEFAULT_SPEED = 8.0
const GRAVITY = Vector3.DOWN * 35

var speed = DEFAULT_SPEED
var jump_speed = 10
var last_jump = 0
var last_translation

var velocity = Vector3()

func resetTranslation():	
	velocity = Vector3(0, 0, 0)
	translation = Vector3(0, 6, 0)

func _ready():
	last_translation = translation

func _physics_process(delta):	
	velocity += GRAVITY * delta;
	
	if is_on_floor():
		if Input.is_key_pressed(KEY_SHIFT):
			speed = DEFAULT_SPEED * 1.8
		else:
			speed = DEFAULT_SPEED
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			velocity.x = 0
		elif Input.is_action_pressed("ui_right"):
			velocity.x = 1 * speed
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -(1 * speed)
		else:
			velocity.x = lerp(velocity.x, 0, .05 / (speed / DEFAULT_SPEED))
	
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			velocity.z = 0
		elif Input.is_action_pressed("ui_down"):
			velocity.z = 1 * speed
		elif Input.is_action_pressed("ui_up"):
			velocity.z = -(1 * speed)
		else:
			velocity.z = lerp(velocity.z, 0, .05 / (speed / DEFAULT_SPEED))
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = jump_speed
		last_jump = velocity.y
	elif last_jump > 0 and is_on_floor():
		velocity.y = lerp(last_jump, 0, 0.3)
		last_jump = velocity.y

	move_and_slide(velocity, Vector3.UP)
	
	if last_translation.x - translation.x != 0:
		$MeshInstance.rotate_z(-lerp(translation.x - last_translation.x, 0, .1))
	if last_translation.z - translation.z != 0:
		$MeshInstance.rotate_x(lerp(translation.z - last_translation.z, 0, .1))
	last_translation = translation
	
	if translation.y < -5:
		resetTranslation()

func _on_enemy_body_entered(body):
	if body == self:
		
		resetTranslation()
