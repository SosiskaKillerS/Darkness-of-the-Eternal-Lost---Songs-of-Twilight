extends Panel

var ItemSwordtoothpick = preload("res://toothpick_sword.tscn") 
var item = null 
func _ready():
	if randi() % 2 == 0:
		item = ItemSwordtoothpick.instantiate()
		add_child(item)

