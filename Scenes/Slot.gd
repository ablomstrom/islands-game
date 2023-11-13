extends Panel


# Called when the node enters the scene tree for the first time.

var ItemClass = preload("res://Prefabs/Chicken/chicken_item.tscn")
var item = null

func _ready():
	if randi() % 2 == 0:
		item = ItemClass.instantiate()
		add_child(item)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
