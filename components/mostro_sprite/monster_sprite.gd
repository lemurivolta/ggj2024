extends Node2D


@onready var head : Sprite2D = $head
@onready var body : Sprite2D = $body
@onready var legs : Sprite2D = $legs

@export var sprites_head: Array[Texture]
@export var sprites_head_open: Array[Texture]

@export var sprites_body: Array[Texture]
@export var sprites_legs: Array[Texture]

@export var names_head: Array[String]
@export var names_body: Array[String]
@export var names_legs: Array[String]

var head_index : int

var rnd = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var rnd_head : int = rnd.randi_range(0, sprites_head.size() - 1)
	var rnd_body : int = rnd.randi_range(0, sprites_body.size() - 1)
	var rnd_legs : int = rnd.randi_range(0, sprites_legs.size() - 1)
	
	head.texture = sprites_head[rnd_head]
	body.texture = sprites_body[rnd_body]
	legs.texture = sprites_legs[rnd_legs]
	
	GlobalBus.set_name.emit(names_head[rnd_head], names_body[rnd_body], names_legs[rnd_legs])
