extends Node2D

@export var flip_duration: float

func flip_away():
	GlobalBus.tickle_enabled = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale:x", 0, flip_duration)
	tween.tween_callback(self.queue_free)
	tween.tween_callback(self._re_enable_tickle)
	
func _re_enable_tickle():
	GlobalBus.tickle_enabled = true
