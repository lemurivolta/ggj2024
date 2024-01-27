extends Node2D

@export var flip_duration: float

func flip_away():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale:x", 0, flip_duration)
	tween.tween_callback(self.queue_free)
