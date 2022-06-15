extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -500
var is_grounded # Verifica se está no chão
onready var raycasts = $raycasts

func _physics_process(delta):	
	velocity.y += move_speed * delta
	
	_get_input()

	velocity = move_and_slide(velocity)
	
	is_grounded = _check_is_grounded()
	
	_set_animation()

func _get_input():
	velocity.x = 0
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	
	if move_direction != 0:
		$texture.scale.x = move_direction

func _input(event: InputEvent):
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force / 2

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

func _set_animation():
	var anim = "idle"
	
	#if !is_grounded:
	#	anim = "jump"
	if velocity.x != 0:
		anim = "run"
	else:
		anim = "idle"
		
	if $anim.assigned_animation != anim:
		print("teste")
		$anim.play(anim)

func _ready():
	pass
