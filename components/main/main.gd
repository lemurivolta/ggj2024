extends Node

@export var page_scene: PackedScene
@export var monster_scene: PackedScene

var curr_page

## Called when the node enters the scene tree for the first time.
func _ready():
	GlobalBus.happy.connect(_on_happy)
	add_page()


func add_page():
	var monster = monster_scene.instantiate()
	var page = page_scene.instantiate()
	page.add_child(monster)
	add_child(page)
	curr_page = page


func _on_happy():
	print("next page!")
	var prev_page = curr_page
	add_page()
	prev_page.flip_away()
	move_child(curr_page, 0)
