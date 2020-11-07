extends Node2D

export (PackedScene) var zombies

onready var areaSpawn = $Area2D
onready var formaSpawn = $Area2D/CollisionShape2D
onready var contenedor = $contenedor

var centerpos
var positionInArea = Vector2()

func _ready():
	pass 

func _process(delta):
	pass

func crear_zombie():
	centerpos = formaSpawn.position + areaSpawn.position
	var size = formaSpawn.shape.extents
	positionInArea.x = (randf()*size.x) - (size.x/2) + centerpos.x
	positionInArea.y = (randf()*size.y) - (size.y/2) + centerpos.y
	var zombie = zombies.instance()
	zombie.position = positionInArea
	contenedor.add_child(zombie)


func _on_Timer_timeout():
	crear_zombie()
