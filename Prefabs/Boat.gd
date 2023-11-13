extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var interaction_area:InteractionArea = $InteractionArea

@onready var player = get_tree().get_first_node_in_group("player")

@export var SPEED = 50.0

var is_riding: bool = false

const STAND_IN_BOAT_OFFSET = 10

func  _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _physics_process(_delta):
	# Add the gravity.
	
	if is_riding:
		player.global_position.x = self.global_position.x
		player.global_position.y = self.global_position.y - STAND_IN_BOAT_OFFSET
		var input_direction = Vector2(
			Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left"),
			Input.get_action_raw_strength("down") - Input.get_action_raw_strength("up")
		)

		velocity = input_direction * SPEED
		
		if(velocity.x > 0):
			sprite_2d.flip_h = false;
		else:
			sprite_2d.flip_h = true;
			
		move_and_slide()
		
func _on_interact():
	player.is_inside_boat = !player.is_inside_boat 
	player.global_position = self.global_position
	is_riding = !is_riding
	print("Jumped in the boat")

