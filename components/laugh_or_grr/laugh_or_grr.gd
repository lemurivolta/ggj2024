extends Node2D

@export var sprites_happy: Array[Sprite2D]
@export var random_rotation_radians: float = PI / 6

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.tickle.connect(_on_tickle)


func _on_tickle(_pleasure):
	var happy_level = clamp(GlobalBus.current_pleasure, 0, GlobalBus.happy_threshold)
	var num_happy_enabled = \
		ceil(happy_level / GlobalBus.happy_threshold * sprites_happy.size())
	for i in sprites_happy.size():
		sprites_happy[i].visible = i < num_happy_enabled
		sprites_happy[i].rotation = \
			randf() * random_rotation_radians - (random_rotation_radians / 2)
