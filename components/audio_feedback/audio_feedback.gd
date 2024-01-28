extends Node

var laughter_players: Array[AudioStreamPlayer]
var growl_players: Array[AudioStreamPlayer]
var head_index : int

func _ready():
	laughter_players.assign(%LaughterPlayers.get_children())
	growl_players.assign(%GrowlPlayers.get_children())
	GlobalBus.feedback.connect(_on_feedback)
	GlobalBus.set_head.connect(on_head_setted)
	
func _on_feedback(positive: bool):
	print(Time.get_date_string_from_system(), "playing!", positive)
	if positive:
		laughter_players[head_index].play()
	else:
		growl_players[head_index].play()
		
func _rand_from_array(arr: Array):
	return arr[randi() % arr.size()]

func on_head_setted (_head_index:int):
	head_index = _head_index
	
