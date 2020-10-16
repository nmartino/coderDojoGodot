extends Area2D

tool
export (PackedScene) var balas

export (float,0,2,0.1) var Cad 

onready var cadencia = $cadencia
onready var contenedor = $contenedor

var raton = Vector2()

func _ready():
	cadencia.wait_time = Cad
	cadencia.one_shot = true
	pass

func _process(delta):
	raton = get_local_mouse_position()
	pass

func _input(event):
	if event.is_action_pressed("disparo"):
		if cadencia.time_left == 0:
			disparar()
			cadencia.start()

func disparar():
	var a = balas.instance()
	var dir = cartesian2polar(raton.x,raton.y)
	var pos = $Sprite/mira.get_global_position()
	contenedor.add_child(a)
	a.iniciar(pos, dir.y)
	print(pos,get_position())


