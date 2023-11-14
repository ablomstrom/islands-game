extends Node2D


@onready var player = get_tree().get_first_node_in_group("player")
@onready var boat = get_tree().get_first_node_in_group("boat")

@onready var un_mount_area = $UnMountArea
@onready var mount_area = $MountArea

@onready var player_unmount_location = $PlayerUnmountLocation

var canInteract = true

@onready var cooldown = $Cooldown

func  _ready():
	$Cooldown.connect("Cooldown", _on_cooldown_timeout)
	pass

func _process(delta):
	pass

func _on_mount_area_body_entered(body):
	if canInteract:
		canInteract = false
		if !player.is_inside_boat:
			boat.is_riding = !boat.is_riding
			player.is_inside_boat = !player.is_inside_boat 
			player.global_position = boat.global_position
		pass # Replace with function body.


func _on_un_mount_area_body_entered(body):
	if canInteract:
		canInteract = false
		if player.is_inside_boat:
			boat.is_riding = !boat.is_riding
			player.is_inside_boat = !player.is_inside_boat 
			player.global_position = player_unmount_location.global_position


func _on_cooldown_timeout():
	canInteract = true
	pass # Replace with function body.
