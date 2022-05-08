extends KinematicBody2D

var velocity = Vector2() # Vetor vazio
var move_speed = 480
var gravity = 1200
var jump_force = -720

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	#print(move_direction)
	
	velocity.y += move_speed * delta
	#print(velocity.y)
	velocity.x = move_speed * move_direction
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_force /3
		
	move_and_slide(velocity)

func _ready():
	pass
