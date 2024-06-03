extends Control


func _on_continue_game_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_new_game_pressed():
	pass


func _on_options_pressed():
	pass


func _on_authors_pressed():
	get_tree().change_scene_to_file("res://authors.tscn")


func _on_quit_pressed():
	get_tree().quit()
