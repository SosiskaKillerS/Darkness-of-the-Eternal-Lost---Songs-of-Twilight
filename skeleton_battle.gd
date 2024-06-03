extends Control

signal textbox_closed
func _ready():
	$TextBox.hide()
	$ActionPanel.hide()	
	
	display_text("Somebody wants ice cream !")
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
	get_tree().change_scene_to_file("res://game.tscn")
	
