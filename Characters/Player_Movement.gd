extends CharacterBody2D


@export var SPEED = 100.0

func _physics_process(_delta):
	# Add the gravity.
	var input_direction = Vector2(
		Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left"),
		Input.get_action_raw_strength("down") - Input.get_action_raw_strength("up")
	)

	velocity = input_direction * SPEED
	
	move_and_slide()
