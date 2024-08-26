extends CharacterBody2D


const SPEED = 270.0 #velocidade do
const JUMP_VELOCITY = -400.0 #velocidade de pulo

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #variavel de gravidade
var estapulando = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor(): 
		velocity.y += gravity * delta #gravidade de acordo com altura

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY #velocidade de pulo
		estapulando = true
		
	elif is_on_floor() :
		estapulando = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor():
		if  estapulando:
			
			$AnimatedSprite2D.play("jump")
	
		elif direction !=0:
		
			$AnimatedSprite2D.play("run")
		
		elif direction == 0:
			$AnimatedSprite2D.play("idle")
			velocity.x = direction * SPEED #direçao do boneco
			$AnimatedSprite2D.scale.x = direction
		if !estapulando:
			$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) #velocidade de acordo com o movimento
		$AnimatedSprite2D.play("idle")
	move_and_slide()
	
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("fall")
	
