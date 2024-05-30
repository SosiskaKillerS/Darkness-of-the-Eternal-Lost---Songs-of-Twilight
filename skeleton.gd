extends CharacterBody2D

var chase = false
var player = null 

func _on_agr_zone_body_entered(body):
	player = body
	chase = true 



func _on_agr_zone_body_shape_exited(body):
	player = null
	chase = false
