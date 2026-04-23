extends CharacterBody2D

signal health_depleted

@export var speed := 500.0
@export var health = 100.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = direction * speed

	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_REATE = 5.0
	
	var enemies_touching = %HurtBox.get_overlapping_bodies()
	
	if enemies_touching.size() > 0:
		health -= DAMAGE_REATE * enemies_touching.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
		pass
		
	move_and_slide()
