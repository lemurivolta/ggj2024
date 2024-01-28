extends Node2D

@export var main_scene: PackedScene
@export var gameover_scene: PackedScene
@export var instruction_scene: PackedScene
@export var menu: Control
var main: Node
var info : Node
var gameover: Node

func _ready():
	GlobalBus.enraged.connect(_on_enraged)

func _on_menu_start_game():
	# "start" clicked: instantiate main scene and flip the menu page away
	main = main_scene.instantiate()
	add_child(main)
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 0, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)

func _on_enraged():
	# game over: instantiate credits scene, flip it in, and remove main
	gameover = gameover_scene.instantiate()
	gameover.continue_to_menu.connect(_on_finish)
	add_child(gameover)
	move_child(gameover, 0)
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(main, "scale:x", 0, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(main.queue_free)
	
func _on_finish():
	# quit back to main menu
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 1, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)
	scale_tweener.set_ease(Tween.EASE_OUT)
	tween.tween_callback(gameover.queue_free)
	GlobalBus.reset()
	

func _on_start_menu_instruction():
	# "instructions" clicked: instantiate instruction scene and flip the menu page away
	info = instruction_scene.instantiate()
	add_child(info)
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 0, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)
	
	info.on_info_closed.connect(on_info_closed)
	
func on_info_closed():
	var tween: Tween = get_tree().create_tween()
	var scale_tweener: PropertyTweener = tween.tween_property(menu, "scale:x", 1, 1)
	scale_tweener.set_trans(Tween.TRANS_CUBIC)
	scale_tweener.set_ease(Tween.EASE_OUT)
	tween.tween_callback(info.queue_free)
