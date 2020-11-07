extends KinematicBody2D

onready var ia = $IA

export var vida = 100

func _ready():
	randomize()
	pass

func hit(danio):
	vida = vida - danio
	if vida <= 0:
		queue_free()
