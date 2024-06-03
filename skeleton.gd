extends CharacterBody2D
var chase = false 


func _on_agr_zone_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://skeleton_battle.tscn")



func _on_agr_zone_body_shape_exited(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://game.tscn")
