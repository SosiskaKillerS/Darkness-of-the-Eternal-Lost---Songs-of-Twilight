extends CharacterBody2D
var chase = false 
@onready var battle = $"../Battle_with_skeleton/SkeletonBattle"

func _on_agr_zone_body_entered(body):
	if body.name == "Player":
		battle.show()
