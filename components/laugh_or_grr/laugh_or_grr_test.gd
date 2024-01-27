extends Node2D


func _on_button_more_pleasure_pressed():
	GlobalBus.tickle.emit(0.3)


func _on_button_less_pleasure_pressed():
	GlobalBus.tickle.emit(-0.3)
