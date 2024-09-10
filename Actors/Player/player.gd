extends CharacterBody2D

@export var projectile_scene: Resource
@export var move_speed: float = 300.0;

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		var new_projectile = projectile_scene.instantiate()
		get_parent().add_child(new_projectile)
		
		var projectile_forward = Vector2.from_angle(rotation)
		new_projectile.fire(projectile_forward, 2000.0)
		new_projectile.position = $ProjectileRefPoint.global_position;

func _physics_process(delta: float) -> void:
	look_at(get_viewport().get_mouse_position())
	
	velocity = Input.get_vector("left", "right", "up", "down") * move_speed;
	
	move_and_slide()
	
	
