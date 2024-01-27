extends Node

@onready var timer : Timer = $Timer
@onready var prog_bar : TextureProgressBar = $TextureProgressBar 

@export var time : float

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = time
	prog_bar.max_value = timer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	prog_bar.value = prog_bar.max_value - timer.time_left 


func _on_timer_timeout():
	pass # Replace with function body.
