extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://sprite_Darkness of the Eternal Lost - Songs of Twilight/items_sprite/toothpick sword.png")
	else:
		$TextureRect.texture = load("res://sprite_Darkness of the Eternal Lost - Songs of Twilight/UI - design/cursor 2.png")	

