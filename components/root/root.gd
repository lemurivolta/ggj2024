extends Node2D

@export var main_scene: PackedScene
@export var menu: Control

func _on_menu_start_game():
	var ms = main_scene.instantiate()
	add_child(ms)
	var tween: Tween = get_tree().create_tween()
	var pt: PropertyTweener = tween.tween_property(menu, "scale:x", 0, 1)
