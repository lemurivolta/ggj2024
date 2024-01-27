extends Node2D


func _ready():
	GlobalBus.set_name.connect(set_monster_name)

func set_monster_name(part1: String, part2: String, part3: String):
	%Part1.text = part1
	%Part2.text = part2.to_lower()
	%Part3.text = part3.to_lower()
