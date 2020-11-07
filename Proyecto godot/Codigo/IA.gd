extends Node2D

export var rapidez = 50

signal cambio_estado(nuevo_estado)


var origen = Vector2()
var destino = Vector2(0,0)
var velocidad = Vector2()

enum estado{
	PATRULLA,
	ATAQUE
}

onready var ZonaDeteccion = $ZonaDeteccion

var estado_actual = estado.PATRULLA setget set_estado
var jugador 
var movimiento = false

func _ready():
	pass

func _process(delta):
	var zombie = self.get_parent()
	var zombie_pos = zombie.get_position()
	match estado_actual:
		estado.PATRULLA:
			rapidez = 50
			if movimiento:
				zombie.position += velocidad * rapidez * delta
				if abs(-zombie_pos.length()+destino.length())<2:
					movimiento = false
					velocidad = Vector2()
					$Timer.start()
		estado.ATAQUE:
			rapidez = 75
			velocidad = (jugador.global_position - self.global_position).normalized()
			zombie.position += velocidad * rapidez * delta
			pass


func set_estado(nuevo_estado):
	if nuevo_estado == estado_actual:
		return
	
	estado_actual = nuevo_estado
	emit_signal("cambio_estado", estado_actual)


func _on_ZonaDeteccion_body_entered(body):
	if body.is_in_group("jugador"):
		set_estado(estado.ATAQUE)
		jugador = body
	pass 

func _on_Timer_timeout():
	movimiento = true
	origen.x = global_position.x
	origen.y = global_position.y
	destino.x = global_position.x + rand_range(-200,200)
	destino.y = global_position.y + rand_range(-200,200)
	velocidad = (destino - origen)
	velocidad = velocidad.normalized()
	pass 

