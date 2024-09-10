extends Area2D

var velocity: Vector2 = Vector2(0, 0)

func fire(forward: Vector2, speed: float) -> void:
	velocity = forward * speed;
	look_at(position + forward);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += velocity * delta


func _on_time_to_live_timeout() -> void:
	queue_free()
