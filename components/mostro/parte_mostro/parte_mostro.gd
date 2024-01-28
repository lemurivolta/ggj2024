extends Area2D

@export var mouse_min_velocity : Vector2 = Vector2(200,200)

var pleasure : float

var is_mouse_clicked : bool = false
var was_mouse_clicked : bool = false

var my_delta : float

var rnd = RandomNumberGenerator.new()

var pleasurometer : float
@export var max_pleasure : float = 2

func _ready():
	if rnd.randf_range(0, 1) > 0.4:
		pleasure = -1
	else:
		pleasure = 1


func _physics_process(delta):
	
	was_mouse_clicked = is_mouse_clicked
	
	if Input.is_action_pressed("click"):
		is_mouse_clicked = true
	else:
		is_mouse_clicked = false
	my_delta = delta
	
	if was_mouse_clicked == false && is_mouse_clicked == true:
		GlobalBus.interaction.emit(true)
	elif was_mouse_clicked == true && is_mouse_clicked == false:
		GlobalBus.interaction.emit(false)


func _on_input_event(_viewport, event, _shape_idx):
	
	if pleasure > 1 && pleasurometer >= max_pleasure:
		return

	if is_mouse_clicked && event is InputEventMouseMotion:
		
		var mouse_vel = event.velocity.length()

		var mouse_threshold = mouse_min_velocity.length()

		#print(str(mouse_vel) + " | " + str(mouse_threshold))

		#if mouse_vel >= mouse_threshold:
			#print("AHAHA " + str(pleasurometer))#+ str(rnd.randf_range(-10.0, 10.0)))
		
		if GlobalBus.tickle_enabled:
			GlobalBus.tickle.emit(pleasure * my_delta)
		pleasurometer += abs(pleasure) * my_delta
