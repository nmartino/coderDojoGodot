extends KinematicBody2D

export var rapidez = 200
var velocidad = Vector2(1,0)

func _ready():
	pass

func iniciar(posicion, dir):
	global_position = posicion
	rotation = dir
	velocidad = velocidad.rotated(dir)
	print(position)

func _physics_process(delta):
	move_and_collide(velocidad * rapidez * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
