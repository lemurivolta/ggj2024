extends Control

signal on_info_closed



func _on_back_button_pressed():
	on_info_closed.emit()
