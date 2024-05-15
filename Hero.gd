extends CharacterBody2D

@export var speed = 400 # Скорость персонажа

func get_input(): # Функция, чтобы получить направление
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta): # Осущенствленеие и сглаживание перемещения 
	get_input()
	move_and_slide()

