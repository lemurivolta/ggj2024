extends Node2D

@export var sprites_happy: Array[Sprite2D]
@export var sprites_enraged: Array[Sprite2D]
@export var random_rotation_radians: float = PI / 6

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.tickle.connect(_on_tickle)


func _on_tickle(_pleasure):
	_update_sprites(GlobalBus.happy_threshold, 0, GlobalBus.happy_threshold, sprites_happy)
	_update_sprites(GlobalBus.enraged_threshold, GlobalBus.enraged_threshold, 0, sprites_enraged)

func _update_sprites(threshold: float, min: float, max: float, sprites: Array[Sprite2D]):
	var level = clamp(GlobalBus.current_pleasure, min, max)
	var num_enabled = ceil(level / threshold * sprites.size())
	for i in sprites.size():
		sprites[i].visible = i < num_enabled
		sprites[i].rotation = \
			randf() * random_rotation_radians - (random_rotation_radians / 2)
