extends Camera2D

onready var jugador = get_node("/root/nivel/Jugador")

func _ready():
	pass

func _process(delta):
	position = jugador.position
	pass
