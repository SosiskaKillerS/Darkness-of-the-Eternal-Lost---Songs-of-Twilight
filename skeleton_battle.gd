extends Control

@onready var battle = $"."
@onready var player = $"../../Player/Player"

@export var enemy : Resource


signal textbox_closed

var current_player_health = 0
var current_enemy_health = 0
var is_defending = false 
var skeleton_stamina = 0




func _ready():
	set_health($SkeletonContainer/ProgressBar, enemy.health, enemy.health) 
	set_health($PlayerPanel/PlayerData/ProgressBar, State.health, State.max_health)
	current_player_health = State.health
	current_enemy_health = enemy.health 
	$TextBox.hide()
	$ActionPanel.hide()
	display_text("It was looked better from afar...")
	await textbox_closed
	$ActionPanel.show() 
	
func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "%d/%d" % [health, max_health]

func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $TextBox.visible:
		$TextBox.hide() 
		emit_signal("textbox_closed")
func display_text(text):
	$TextBox.show()
	$TextBox/Text.text = text
	
func enemy_turn():
	$ActionPanel.hide()
	if is_defending == true and skeleton_stamina!=2:
		is_defending = false 
		display_text("Successful parry!")
		await textbox_closed
		skeleton_stamina+=1
	elif skeleton_stamina == 2:
		is_defending = false 
		display_text("No moves from skeleton ... ")
		await textbox_closed
		skeleton_stamina = 0
	else:
		skeleton_stamina+=1
		display_text("The rumble of bones, the grace of a strike.")
		await textbox_closed
		display_text("in the dance of the RPG skeleton...")
		await textbox_closed
		display_text("every step is your last!")
		await textbox_closed
		current_player_health = max(0,current_player_health - enemy.damage)
		set_health($PlayerPanel/PlayerData/ProgressBar, current_player_health, State.max_health)
		$hit_wave.show()
		$AnimationPlayer.play("get_hite")
		await $AnimationPlayer.animation_finished
		$hit_wave.hide()
		display_text("Skeleton deal you 1 damage ... ")
		await textbox_closed
		
	$ActionPanel.show()
	
	
func _on_run_button_pressed():
	$ActionPanel.hide()
	display_text("You understand that it is time to run.")
	await textbox_closed
	player.position = Vector2(924,-1225)
	battle.hide()
	$ActionPanel.show()
	set_health($SkeletonContainer/ProgressBar, enemy.health, enemy.health)
	set_health($PlayerPanel/PlayerData/ProgressBar, State.health, State.max_health)
	
func _on_fight_button_pressed():
	$ActionPanel.hide()
	display_text("Bazz... hum,hum ... hum!.")
	await textbox_closed
	
	current_enemy_health = max(0,current_enemy_health - State.damage)
	set_health($SkeletonContainer/ProgressBar, current_enemy_health, enemy.health)
	$AnimationPlayer.play("enemy_damage")
	await $AnimationPlayer.animation_finished
	
	if State.damage == 1:
		display_text("It's not damage, it's more like a tickle.")
		await textbox_closed
		display_text("You deal 1 damage ... looser")
		await textbox_closed
	else:
		display_text("Incredable, you make %d damage!" % State.damage)
		await textbox_closed
	$ActionPanel.show()
	enemy_turn()


func _on_block_button_pressed():
	$ActionPanel.hide()
	is_defending = true 
	display_text("As Han Solo once said")
	await textbox_closed
	display_text("'Don't worry, I always have a plan'")
	await textbox_closed
	$ActionPanel.show()
	enemy_turn()
	
