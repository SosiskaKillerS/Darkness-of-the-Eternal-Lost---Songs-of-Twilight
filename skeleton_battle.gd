extends Control
@onready var battle = $"."
@onready var player = $"../../Player/Player"
signal textbox_closed
func _ready():
	$TextBox.hide()
	$ActionPanel.hide()	
	
	display_text("It was looked better from afar...")
	await textbox_closed
	$ActionPanel.show() 
func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $TextBox.visible:
		$TextBox.hide() 
		emit_signal("textbox_closed")
func display_text(text):
	$TextBox.show()
	$TextBox/Text.text = text

func _on_run_button_pressed():
	display_text("You understand that it is time to run.")
	await textbox_closed
	player.position = Vector2(924,-1225)
	battle.hide()
	
	
