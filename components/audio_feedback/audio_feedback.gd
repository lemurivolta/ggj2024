extends Node

var laughter_players: Array[AudioStreamPlayer]
var growl_players: Array[AudioStreamPlayer]

func _ready():
	laughter_players.assign(%LaughterPlayers.get_children())
	growl_players.assign(%GrowlPlayers.get_children())
	GlobalBus.feedback.connect(_on_feedback)
	
func _on_feedback(positive: bool):
	if positive:
		_rand_from_array(laughter_players).play()
	else:
		_rand_from_array(growl_players).play()
		
func _rand_from_array(arr: Array):
	return arr[randi() % arr.size()]
