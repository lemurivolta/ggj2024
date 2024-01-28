extends Node2D

@export var sprites_happy: Array[Sprite2D]
@export var sprites_enraged: Array[Sprite2D]
@export var random_rotation_radians: float = PI / 6

@onready var happy_particles: GPUParticles2D = %HappyParticles2D
@onready var enraged_particles: GPUParticles2D = %GrrParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.tickle.connect(_on_tickle)
	GlobalBus.feedback.connect(_on_feedback)
	GlobalBus.happy.connect(_reset_pleasure_lever)
	GlobalBus.enraged.connect(_reset_pleasure_lever)

var _last_pleasure_level = 0
var is_happier = false
var is_sadder = false
func _reset_pleasure_lever():
	_last_pleasure_level = 0
	is_happier = false
	is_sadder = false

func _on_tickle(pleasure):
	is_happier = pleasure > _last_pleasure_level
	is_sadder = pleasure < _last_pleasure_level
	_last_pleasure_level = pleasure
	_update_sprites(GlobalBus.happy_threshold, 0, GlobalBus.happy_threshold, sprites_happy)
	_update_sprites(GlobalBus.enraged_threshold, GlobalBus.enraged_threshold, 0, sprites_enraged)
	_on_particles_timer_timeout()

func _update_sprites(threshold: float, min_value: float, max_value: float, sprites: Array[Sprite2D]):
	var level = clamp(GlobalBus.current_pleasure, min_value, max_value)
	var num_enabled = ceil(level / threshold * sprites.size())
	for i in sprites.size():
		sprites[i].visible = i < num_enabled
		sprites[i].rotation = \
			randf() * random_rotation_radians - (random_rotation_radians / 2)


func _on_particles_timer_timeout():
	print("particles timer")
	if is_happier && not happy_particles.emitting:
		print("happier")
		GlobalBus.feedback.emit(true)
	if is_sadder && not enraged_particles.emitting:
		print("sadder")
		GlobalBus.feedback.emit(false)


func _on_feedback(positive: bool):
	if positive:
		happy_particles.restart()
		happy_particles.emitting = true
	else:
		enraged_particles.restart()
		enraged_particles.emitting = true
