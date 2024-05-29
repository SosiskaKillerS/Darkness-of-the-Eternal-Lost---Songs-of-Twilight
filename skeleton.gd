extends CharacterBody2D

var chase = false

func _on_agr_zone_body_entered(body):
	if body.name("Player"):
		chase = true 
		
