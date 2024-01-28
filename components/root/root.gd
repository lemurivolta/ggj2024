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
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 0, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)

func _on_enraged():
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 1, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)
	scale_tweener.set_ease(Tween.EASE_OUT)
	tween.tween_callback(main.queue_free)

#func _menu_to_top():
	#menu.z_index = 1
