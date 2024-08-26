extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal morreu
var is_takingdamage 
var estapulando
var tomoudano
var direction

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		estapulando = true


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !is_takingdamage:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and !is_takingdamage:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		
	move_and_slide()
	
func _tomoudano():
		print("morreu")
		emit_signal("morreu")
		is_takingdamage = true
		$AnimatedSprite2D.play("hitanim")
		await $AnimatedSprite2D.animation_finished
		is_takingdamage = true
		
		if !tomoudano:
			if is_on_floor():
				if estapulando:
					$AnimatedSprite2D.play("jump")
				elif direction !=0:  		
					$AnimatedSprite2D.play("run")
				elif direction ==0:
					$AnimatedSprite2D.play("idle")
			else:
				if velocity.y < 0:
					$AnimatedSprite2D.play("jump")
				else:
					$AnimatedSprite2D.play("fall")
					
					
			
			
		
