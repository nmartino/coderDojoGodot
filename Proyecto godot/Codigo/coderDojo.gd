extends KinematicBody2D

var speed = 200
var posicion_mouse
var velocidad = Vector2()

func get_input():
	velocidad = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocidad.x = velocidad.x + 1
	if Input.is_action_pressed("ui_left"):
		velocidad.x = velocidad.x - 1
	if Input.is_action_pressed("ui_up"):
		velocidad.y = velocidad.y - 1
	if Input.is_action_pressed("ui_down"):
		velocidad.y = velocidad.y + 1
	velocidad = velocidad.normalized() * speed

func _physics_process(delta):
	get_input()
	velocidad = move_and_slide(velocidad)
