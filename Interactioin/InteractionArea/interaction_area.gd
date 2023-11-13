extends Area2D

class_name InteractionArea

@export var action_name:String = "Interact"

var interact: Callable = func():
	pass
	
# Called when the node enters the scene tree for the first time.

func _on_body_entered(_body):
	print("Something eneted an area")
	InteractionManager.register_area(self)


func _on_body_exited(_body):
	InteractionManager.unregister_area(self)
