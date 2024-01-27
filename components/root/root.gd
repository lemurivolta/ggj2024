extends Node2D

@export var main_scene: PackedScene
@export var menu: Control
var main: Node

func _ready():
	GlobalBus.enraged.connect(_on_enraged)

func _on_menu_start_game():
	main = main_scene.instantiate()
	add_child(main)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(menu, "scale:x", 0, 1)

func _on_enraged():
	menu.z_index = 0
	menu.scale.x = 1
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(main, "scale:x", 0, 1)
	tween.tween_callback(main.queue_free)
	tween.tween_callback(_menu_to_top)

func _menu_to_top():
	menu.z_index = 1
