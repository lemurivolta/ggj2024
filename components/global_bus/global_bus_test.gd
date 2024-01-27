extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.enraged.connect(_on_enraged)
	GlobalBus.happy.connect(_on_happy)



func _on_button_pressed():
	GlobalBus.tickle.emit(1)


func _on_button_2_pressed():
	GlobalBus.tickle.emit(-1)

func _on_enraged():
	print("ENRAGED!")
	
func _on_happy():
	print("HAPPY!")
