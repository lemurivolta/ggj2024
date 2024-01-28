extends Control

signal start_game
signal instruction


func _on_start_button_pressed():
	start_game.emit()


func _on_info_button_pressed():
	instruction.emit()
