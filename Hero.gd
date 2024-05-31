extends CharacterBody2D

@export var speed = 400 # Скорость персонажа

@onready var animation_player = $AnimationPlayer #чтобы удобней писать 

func get_input(): # Функция, чтобы получить направление
	var input_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = input_direction * speed # скорость = скорость * направление движения 
func player_animation_update(): # функция для анимации передвижения персонажа 
	if velocity.length() == 0: # Если скорость = 0 возвращает анимацию на первый кадр 
		animation_player.stop() # Остановка анимации персонажа
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up" 
	
		animation_player.play("walk"+direction) # проигрыватель который примет строчку "walk"+направление

func pause_game():
	if Input.is_action_pressed("ui_end"):
		get_tree().paused = true
		$Pause_Menu.visible = true
	
func _physics_process(delta): # Осуществление
	get_input()
	move_and_slide()
	player_animation_update()
	pause_game()
