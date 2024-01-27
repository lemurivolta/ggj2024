extends Node2D



func _on_button_asmodeus_pressed():
	GlobalBus.set_name.emit("As", "mo", "deus")


func _on_button_frankenstein_pressed():
	GlobalBus.set_name.emit("Fran", "ken", "stein")
