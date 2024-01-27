extends Node2D


@onready var head : Sprite2D = $head
@onready var body : Sprite2D = $body
@onready var legs : Sprite2D = $legs

@export var sprites_head: Array[Texture]
@export var sprites_body: Array[Texture]
@export var sprites_legs: Array[Texture]


# Called when the node enters the scene tree for the first time.
func _ready():
	head.texture = sprites_head.pick_random()
	body.texture = sprites_body.pick_random()
	legs.texture = sprites_legs.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
