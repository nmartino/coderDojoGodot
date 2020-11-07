extends KinematicBody2D

export var rapidez = 200
var velocidad = Vector2(1,0)

var danio setget set_danio, get_danio

func _ready():
	pass

func iniciar(posicion, dir):
	global_position = posicion
	rotation = dir
	velocidad = velocidad.rotated(dir)

func _physics_process(delta):
	var choque = move_and_collide(velocidad * rapidez * delta)
	if choque:
		if choque.collider.has_method("hit"):
			queue_free()
			choque.collider.hit(danio)

func set_danio(valor):
	danio = valor

func get_danio():
	return danio

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
