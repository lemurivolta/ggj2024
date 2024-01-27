extends Node2D

var name_set: bool = false

func _ready():
	GlobalBus.set_name.connect(set_monster_name)

func set_monster_name(part1: String, part2: String, part3: String):
	if name_set:
		return
	%Part1.text = part1
	%Part2.text = part2.to_lower()
	%Part3.text = part3.to_lower()
	name_set = true
