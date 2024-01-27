extends Node2D

func set_num_parts(num: int):
	if num == 2:
		%DoppiaParte.visible = true
	elif num == 3:
		%TriplaParte.visible = true
	else:
		print("errore: supportate solo 2 o 3 parti, non ", num)
