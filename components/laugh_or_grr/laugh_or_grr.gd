extends Node2D

@export var sprites_happy: Array[Sprite2D]
@export var sprites_enraged: Array[Sprite2D]
@export var random_rotation_radians: float = PI / 6

@onready var particles_timer: Timer = %ParticlesTimer
@onready var happy_particles: GPUParticles2D = %HappyParticles2D
@onready var enraged_particles: GPUParticles2D = %GrrParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.tickle.connect(_on_tickle)

func _on_tickle(_pleasure):
	_update_sprites(GlobalBus.happy_threshold, 0, GlobalBus.happy_threshold, sprites_happy)
	_update_sprites(GlobalBus.enraged_threshold, GlobalBus.enraged_threshold, 0, sprites_enraged)
	#if particles_timer.is_stopped():
	_on_particles_timer_timeout()
		#particles_timer.start()

func _update_sprites(threshold: float, min: float, max: float, sprites: Array[Sprite2D]):
	var level = clamp(GlobalBus.current_pleasure, min, max)
	var num_enabled = ceil(level / threshold * sprites.size())
	for i in sprites.size():
		sprites[i].visible = i < num_enabled
		sprites[i].rotation = \
			randf() * random_rotation_radians - (random_rotation_radians / 2)


func _on_particles_timer_timeout():
	if GlobalBus.current_pleasure > 0 && not happy_particles.emitting:
		happy_particles.restart()
		happy_particles.emitting = true
	if GlobalBus.current_pleasure < 0 && not enraged_particles.emitting:
		enraged_particles.restart()
		enraged_particles.emitting = true


