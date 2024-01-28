extends Node2D

@onready var happy_monsters_label: Label = %HappyMonstersLabel

signal continue_to_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	happy_monsters_label.text = happy_monsters_label.text.replace( \
		"{n}", str(GlobalBus.num_happy_monsters))


func _on_button_pressed():
	continue_to_menu.emit()
