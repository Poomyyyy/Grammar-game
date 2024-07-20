extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	#print("di " , direction)
	if direction == 1:
		if position.x >= 420:
			#print("L")
			direction = 0
		velocity.x = direction * SPEED 
	elif direction == -1:
		if position.x <= 5:
			#print("R")
			direction = 0
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	
	move_and_slide()
