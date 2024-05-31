extends Node
@onready var pause_menu = $"../CanvasLayer/Pause Menu"
var game_paused = false

func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		game_paused = !game_paused
	
	if game_paused == true:
		get_tree().paused  = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide() 


func _on_resume_pressed():
	game_paused = !game_paused

func _on_exit_pressed():
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://main_menu.tscn")
