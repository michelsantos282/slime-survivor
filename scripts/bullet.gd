extends Area2D

var travelled_distance = 0
@export var range = 1200
@export var bullet_speed = 600.0

func _physics_process(delta: float) -> void:
	#Vai em frente com base na sua rotação
	var direction = Vector2(Vector2.RIGHT.rotated(rotation))
	#Nós precisamos colocar o delta aqui nesse pq estamos mexendo diretamente
	#No exemplo do player ou mob, não precisamos pq a move_and_slide faz isso
	position += direction * bullet_speed * delta
	travelled_distance += bullet_speed * delta
	
	if travelled_distance > 1200:
		queue_free()
	
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
	
