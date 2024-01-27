extends Area2D

@export var mouse_min_velocity : Vector2 = Vector2(200,200)

var pleasure : float

var is_mouse_clicked : bool

var my_delta : float

var rnd = RandomNumberGenerator.new()

var pleasurometer : float
var max_pleasure : float

func _ready():
	if rnd.randf_range(0, 1) > 0.3:
		pleasure = -1
	else:
		pleasure = 1


func _physics_process(delta):
	if Input.is_action_pressed("click"):
		is_mouse_clicked = true
	else:
		is_mouse_clicked = false
	my_delta = delta


func _on_input_event(viewport, event, shape_idx):
	
	if pleasurometer >= max_pleasure:
		return

	if is_mouse_clicked && event is InputEventMouseMotion:
		
		var mouse_vel = event.velocity.length()

		var mouse_threshold = mouse_min_velocity.length()

		#print(str(mouse_vel) + " | " + str(mouse_threshold))

		if mouse_vel >= mouse_threshold:
			print("AHAHA " + str(rnd.randf_range(-10.0, 10.0)))
		
		GlobalBus.tickle.emit(pleasure * my_delta)
		pleasurometer += pleasure * my_delta
