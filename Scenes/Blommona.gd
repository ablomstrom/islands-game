extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var interaction_area:InteractionArea = $InteractionArea

func  _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("Luktar Skit")
