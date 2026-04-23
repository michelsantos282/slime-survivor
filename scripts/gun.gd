extends Area2D

var enemies_around:= false

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		enemies_around = true
		var target = enemies_in_range[0]
		look_at(target.global_position)
	else:
		enemies_around = false
		
		
func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	if enemies_around:
		shoot()
	
